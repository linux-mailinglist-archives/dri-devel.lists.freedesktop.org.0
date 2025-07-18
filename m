Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4CFB0A523
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 15:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6668010E9AA;
	Fri, 18 Jul 2025 13:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="oCAN643G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eaLHvwgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C85310E6EA;
 Fri, 18 Jul 2025 13:27:41 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1752845258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=80yt9PNGZ40066R0qjg7QPOIFgJ0BIytwbIbV0r3YLo=;
 b=oCAN643GsWhpiOlaV27hV7jYVi2ciU4EsTR4XN512a68GbM4QHhzrgzE/o5FERgoMgD55U
 zpavaDJDi4kVRgOxdXywEK2vh8i0QMj1lWseeSK2lj+rTyD1pur2ngD7s8okIt5GVHNsaN
 UOMn9rUrFyQA13mSPlEJna5A0Pt9sKYLLaMA48ifslLklDG6/DpVlL9xLgtAuWPyvAXfet
 4LmVPPCmU7lvz1ym5jJfg3HmhMtDCfxx+tFX5WOLVDPRDGbSsNFDhCOBzfYO8K4+Pdll/J
 XemtCPgBaCmye+oEXGrY8JgLvHF8YO6zHH6z3Dr+Skl0xJlQYG9lDwFCEpR3zg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1752845258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=80yt9PNGZ40066R0qjg7QPOIFgJ0BIytwbIbV0r3YLo=;
 b=eaLHvwgl4BJI9zNp6GtF6PLOadkYibJtpUyG5TOwhuxK5f7ZzjZLaVA3K8apvD0fiitzot
 zbYLnfau4jy88SAw==
Date: Fri, 18 Jul 2025 15:27:37 +0200
Subject: [PATCH v2] drm/msm: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250718-restricted-pointers-drm-v2-1-3d9f8566f927@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAMhLemgC/3WNQQ6CMBBFr0JmbU1bkRZW3sOwQDrIJNqSaSUYw
 t2tuHb5XvLfXyEiE0ZoihUYZ4oUfAZ9KKAfO39HQS4zaKnPspSlYIyJqU/oxBTIJ+QoHD+FNTc
 jT5Wph85BXk+MAy17+dpmHimmwO/9aFZf+2tWyv5tzkpIYaxC6aztXa0vD/KvxMHTcnQI7bZtH
 xH0DfHCAAAA
X-Change-ID: 20250404-restricted-pointers-drm-87b703679fad
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752845258; l=4224;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VWAH+3AGXcFzWM1iqUfxiu+KLg26t8PA+iVM7DpFyjE=;
 b=eWaz9frDehJCeSMgrLB5NPtTUy4c6S5MzkkKUGrqlpQ8KeEhwxUFESvF+038wbq8IuvOmyMGh
 /4qI74uRl8zD6c3iyOi1iKtbGEi786xLqtGBf/RNqcOmhtWOHIlNkpN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Drop already applied patches
- Link to v1: https://lore.kernel.org/r/20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 4 ++--
 drivers/gpu/drm/msm/msm_mdss.c              | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4b545448d74657aafc96e9042c7756654b4f0e7..94912b4708fb5be937f1b3898a5676f7b481bd42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -596,7 +596,7 @@ static void _dpu_crtc_complete_flip(struct drm_crtc *crtc)
 
 	spin_lock_irqsave(&dev->event_lock, flags);
 	if (dpu_crtc->event) {
-		DRM_DEBUG_VBL("%s: send event: %pK\n", dpu_crtc->name,
+		DRM_DEBUG_VBL("%s: send event: %p\n", dpu_crtc->name,
 			      dpu_crtc->event);
 		trace_dpu_crtc_complete_flip(DRMID(crtc));
 		drm_crtc_send_vblank_event(crtc, dpu_crtc->event);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 11fb1bc54fa92a5d9926addb437bc4b8f283723b..54b20faa0b697e3bf8ad81bd806adb49de98f2b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -31,14 +31,14 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	u32 base;
 
 	if (!ctx) {
-		DRM_ERROR("invalid ctx %pK\n", ctx);
+		DRM_ERROR("invalid ctx %p\n", ctx);
 		return;
 	}
 
 	base = ctx->cap->sblk->pcc.base;
 
 	if (!base) {
-		DRM_ERROR("invalid ctx %pK pcc base 0x%x\n", ctx, base);
+		DRM_ERROR("invalid ctx %p pcc base 0x%x\n", ctx, base);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 12dcb32b472497f9e59619db4e810abfbf610c7c..a306077647c317af9345eeff13082230906b5767 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1345,7 +1345,7 @@ static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
 		dpu_kms->mmio = NULL;
 		return ret;
 	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
 	dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
 						  dpu_kms->pdev,
@@ -1380,7 +1380,7 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 		dpu_kms->mmio = NULL;
 		return ret;
 	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
 	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
 	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 1f5fe7811e016909282087176a42a2349b21c9c4..39885b333910bb7aab7f72b9846f49ab16cfe5cc 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -423,7 +423,7 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	if (IS_ERR(msm_mdss->mmio))
 		return ERR_CAST(msm_mdss->mmio);
 
-	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
+	dev_dbg(&pdev->dev, "mapped mdss address space @%p\n", msm_mdss->mmio);
 
 	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
 	if (ret)

---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250404-restricted-pointers-drm-87b703679fad

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

