Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7221FF35
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B556E9C6;
	Tue, 14 Jul 2020 20:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717106E99B;
 Tue, 14 Jul 2020 20:58:32 +0000 (UTC)
IronPort-SDR: reLc7Lx5lA8FIpZuw1aXhpLhhnmWvUKUfRwVEZr2WDrzNtWsdl6rRfM4O93R9l2C5gPR9Zrmth
 rpnZ3j57Hgyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444575"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444575"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:32 -0700
IronPort-SDR: 6rIF9qEzGse4MDNIvvREaUkS4SRVLyhH1tdcERyEynvX1UhW9WNV7lrOOiD+aO0ZJeP3ISDwb7
 aHKsgnY9fMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504168"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:31 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 26/59] drm/kmb: rebase to newer kernel version
Date: Tue, 14 Jul 2020 13:57:12 -0700
Message-Id: <1594760265-11618-27-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cleanup code

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
 drivers/gpu/drm/kmb/kmb_drv.h | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 71fdb94..78cb91b 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -282,8 +282,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver kmb_driver = {
 	.driver_features = DRIVER_GEM |
-			DRIVER_MODESET |
-			DRIVER_ATOMIC,
+			DRIVER_MODESET | DRIVER_ATOMIC,
 	.irq_handler = kmb_isr,
 	.irq_preinstall = kmb_irq_reset,
 	.irq_uninstall = kmb_irq_reset,
@@ -362,6 +361,8 @@ static int kmb_drm_bind(struct device *dev)
 	if (ret)
 		goto err_register;
 
+	drm_fbdev_generic_setup(drm, 32);
+
 	return 0;
 
 err_register:
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 586b53e..1150505 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -18,7 +18,6 @@ struct kmb_drm_private {
 	void __iomem			*msscam_mmio;
 	unsigned char			n_layers;
 	struct clk			*clk;
-	struct drm_fbdev_cma		*fbdev;
 	struct drm_crtc			crtc;
 	struct kmb_plane		*plane;
 	struct drm_atomic_state		*state;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
