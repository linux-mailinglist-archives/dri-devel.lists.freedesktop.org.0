Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7034903EE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5295A89168;
	Mon, 17 Jan 2022 08:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C454110E2AC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jan 2022 16:07:52 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
 id CE1DC5895B6; Sat, 15 Jan 2022 16:07:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
 sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.1
Received: from asheplyakov-rocket.. (unknown [88.147.173.226])
 by air.basealt.ru (Postfix) with ESMTPSA id C2DDF58942B;
 Sat, 15 Jan 2022 16:07:48 +0000 (UTC)
From: Alexey Sheplyakov <asheplyakov@basealt.ru>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panfrost: initial dual core group GPUs support
Date: Sat, 15 Jan 2022 20:06:58 +0400
Message-Id: <20220115160658.582646-1-asheplyakov@basealt.ru>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211223110616.2589851-1-asheplyakov@basealt.ru>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jan 2022 08:34:35 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>,
 Steven Price <steven.price@arm.com>,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On a dual core group GPUs (such as T628) fragment shading can be
performed over all cores (because a fragment shader job doesn't
need coherency between threads), however vertex shading requires
to be run on the same core group as the tiler (which always lives
in core group 0).

As a first step to support T628 power on only the first core group
(so no jobs are scheduled on the second one). This makes T628 look
like every other Midgard GPU (and throws away up to half the cores).

With this patch panfrost is able to drive T628 (r1p0) GPU on some
armv8 SoCs (in particular BE-M1000). Without the patch rendering
is horriby broken (desktop is completely unusable) and eventually
the GPU locks up (it takes from a few seconds to a couple of
minutes).

Using the second core group requires support in Mesa (and an UABI
change): the userspace should

1) set PANFROST_JD_DOESNT_NEED_COHERENCY_ON_GPU flag to opt-in
   to allowing the job to run across all cores.
2) set PANFROST_RUN_ON_SECOND_CORE_GROUP flag to allow compute
   jobs to be run on the second core group (at the moment Mesa
   does not advertise compute support on anything older than
   Mali T760)

But there's little point adding such flags until someone (myself)
steps up to do the Mesa work.

Signed-off-by: Alexey Sheplyakov <asheplyakov@basealt.ru>
Signed-off-by: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>
Tested-by: Alexey Sheplyakov <asheplyakov@basealt.ru>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 27 ++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index f8355de6e335..15cec831a99a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -320,19 +320,36 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 {
 	int ret;
 	u32 val;
+	u64 core_mask = U64_MAX;
 
 	panfrost_gpu_init_quirks(pfdev);
 
-	/* Just turn on everything for now */
-	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
+	if (pfdev->features.l2_present != 1) {
+		/*
+		 * Only support one core group now.
+		 * ~(l2_present - 1) unsets all bits in l2_present except
+		 * the bottom bit. (l2_present - 2) has all the bits in
+		 * the first core group set. AND them together to generate
+		 * a mask of cores in the first core group.
+		 */
+		core_mask = ~(pfdev->features.l2_present - 1) &
+			     (pfdev->features.l2_present - 2);
+		dev_info_once(pfdev->dev, "using only 1st core group (%lu cores from %lu)\n",
+			      hweight64(core_mask),
+			      hweight64(pfdev->features.shader_present));
+	}
+	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present & core_mask);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
-		val, val == pfdev->features.l2_present, 100, 20000);
+		val, val == (pfdev->features.l2_present & core_mask),
+		100, 20000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu L2");
 
-	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
+	gpu_write(pfdev, SHADER_PWRON_LO,
+		  pfdev->features.shader_present & core_mask);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
-		val, val == pfdev->features.shader_present, 100, 20000);
+		val, val == (pfdev->features.shader_present & core_mask),
+		100, 20000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu shader");
 
-- 
2.32.0

