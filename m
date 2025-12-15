Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95A4CBEF93
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 17:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636F610E626;
	Mon, 15 Dec 2025 16:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 513 seconds by postgrey-1.36 at gabe;
 Mon, 15 Dec 2025 16:45:09 UTC
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch
 [185.125.25.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBB310E62C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 16:45:09 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dVQgQ4pTnz6Cy;
 Mon, 15 Dec 2025 17:36:34 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4dVQgQ0R3wzCMS; Mon, 15 Dec 2025 17:36:34 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 15 Dec 2025 17:36:14 +0100
Subject: [PATCH 1/2] accel/rocket: fix unwinding in error path in
 rocket_core_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-rocket-error-path-v1-1-eec3bf29dc3b@cherry.de>
References: <20251215-rocket-error-path-v1-0-eec3bf29dc3b@cherry.de>
In-Reply-To: <20251215-rocket-error-path-v1-0-eec3bf29dc3b@cherry.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

When rocket_job_init() is called, iommu_group_get() has already been
called, therefore we should call iommu_group_put() and make the
iommu_group pointer NULL. This aligns with what's done in
rocket_core_fini().

If pm_runtime_resume_and_get() somehow fails, not only should
rocket_job_fini() be called but we should also unwind everything done
before that, that is, disable PM, put the iommu_group, NULLify it and
then call rocket_job_fini(). This is exactly what's done in
rocket_core_fini() so let's call that function instead of duplicating
the code.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/accel/rocket/rocket_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index abe7719c1db46..b3b2fa9ba645a 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -59,8 +59,11 @@ int rocket_core_init(struct rocket_core *core)
 	core->iommu_group = iommu_group_get(dev);
 
 	err = rocket_job_init(core);
-	if (err)
+	if (err) {
+		iommu_group_put(core->iommu_group);
+		core->iommu_group = NULL;
 		return err;
+	}
 
 	pm_runtime_use_autosuspend(dev);
 
@@ -76,7 +79,7 @@ int rocket_core_init(struct rocket_core *core)
 
 	err = pm_runtime_resume_and_get(dev);
 	if (err) {
-		rocket_job_fini(core);
+		rocket_core_fini(core);
 		return err;
 	}
 

-- 
2.52.0

