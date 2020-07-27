Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C3C22FE03
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1756E13F;
	Mon, 27 Jul 2020 23:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9191389916;
 Mon, 27 Jul 2020 20:50:29 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3de90000>; Mon, 27 Jul 2020 13:49:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:50:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:50:29 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:50:28 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <lukas@wunner.de>,
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>
Subject: [PATCH 4/6] i915: implement vga-switcheroo reprobe() callback
Date: Mon, 27 Jul 2020 15:51:10 -0500
Message-ID: <20200727205112.27698-5-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200727205112.27698-1-ddadap@nvidia.com>
References: <ba78cd19-45ad-b17e-5174-256cc11f36c2%40nvidia.com>
 <20200727205112.27698-1-ddadap@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595882985; bh=V2mathaNGqgFDiJfvyfvooDAgmkBeUwMk/0KmirXkFs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=lhPcB2Y8FaVcNxzkzpZm5ulYee4MQiO8rHECXIWOMeuUnLGy9a8/OYsEeOyp3ChtX
 AcmkYaZsk/09RKWjEFbsdo6wafCUerAyFtgj0ty5Zu53kajF5EOKG5DSjIL6YRfEL3
 8NSUslpta/gxiaT/GL5LG9QSkK0gtdAzqfZZNNgJvx8OwS3LSVTgBSPTrOFKRtFDse
 e0hMziWXyC4EV6+63Oa0U7TI+dm7sn3byyzV3M7vmHz4T2/YjEJ1hZ6DFhYzi6Ml/D
 xG3Mqdgg7YkJd1WgrvtPuBlpsCaxeAVxZdZzlF23ggniM8TxIwcfMEyeKXqWERoXoB
 g53YgrfP7IX5w==
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: Daniel Dadap <ddadap@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a vga-switcheroo callback for reprobing displays. Use this new
callback to retrain the link on all DP encoders after a mux switch.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/gpu/drm/i915/i915_switcheroo.c | 27 +++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_switcheroo.c b/drivers/gpu/drm/i915/i915_switcheroo.c
index ed69b5d4a375..fa388de03cf6 100644
--- a/drivers/gpu/drm/i915/i915_switcheroo.c
+++ b/drivers/gpu/drm/i915/i915_switcheroo.c
@@ -7,6 +7,8 @@
 
 #include "i915_drv.h"
 #include "i915_switcheroo.h"
+#include "display/intel_display_types.h"
+#include "display/intel_dp.h"
 
 static void i915_switcheroo_set_state(struct pci_dev *pdev,
 				      enum vga_switcheroo_state state)
@@ -46,9 +48,32 @@ static bool i915_switcheroo_can_switch(struct pci_dev *pdev)
 	return i915 && atomic_read(&i915->drm.open_count) == 0;
 }
 
+static void i915_switcheroo_reprobe(struct pci_dev *pdev)
+{
+	struct drm_i915_private *i915 = pdev_to_i915(pdev);
+	struct intel_encoder *encoder;
+
+	for_each_intel_dp(&i915->drm, encoder) {
+		int ret = -EDEADLK;
+		struct drm_modeset_acquire_ctx ctx;
+
+		drm_modeset_acquire_init(&ctx, 0);
+
+		while (ret == -EDEADLK) {
+			ret = intel_dp_retrain_link(encoder, &ctx);
+
+			if (ret == -EDEADLK)
+				drm_modeset_backoff(&ctx);
+		}
+
+		drm_modeset_drop_locks(&ctx);
+		drm_modeset_acquire_fini(&ctx);
+	}
+}
+
 static const struct vga_switcheroo_client_ops i915_switcheroo_ops = {
 	.set_gpu_state = i915_switcheroo_set_state,
-	.reprobe = NULL,
+	.reprobe = i915_switcheroo_reprobe,
 	.can_switch = i915_switcheroo_can_switch,
 };
 
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
