Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19243CECC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 18:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2E36E5A9;
	Wed, 27 Oct 2021 16:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39416E5A9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 16:34:37 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id bm16so2964542qkb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 09:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wzEz2Tw9Lfz5TOURnPsgcxiiiKcelHawM6M06oI35wU=;
 b=gcRorwC7RJAqNvB7/sLymu7rx6X+O1XtByB+a+Kn+pZd3/Iiplo/FoBRQFBCNSKabP
 bGhaHY2iEz1rZS6GpD5S/JGKwxkOVgVUQjKgrDJjALr4EG9Np8HAWWYh8aDK2Ci5NMlQ
 FacI5apkn6GWgiQ14F/p1pyfSM+jwmHgrR+dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wzEz2Tw9Lfz5TOURnPsgcxiiiKcelHawM6M06oI35wU=;
 b=M6ehVEwv/Hd8/bSvqJECEFkyDczcAPJSbabrK6zpelYS6SDN94+7Covgma9wwAY+TT
 uVRYTfW9LbWZUAKa0Am/zznUFqfPZrq8VP7W5QpwpESucV4AWj4qOyaNYI1zc/0AFq2b
 a36Y2gkJbHNWvSRKGTYQBRZP8j5HAlQagLKcZmhYkvtXzge7YusZiArwAcPMIS6FeQi8
 1cKsJGjMdXLtJ1X7v5k7JPIzcDJPI4MEPSUjNmD9rIRD6UNnxcOQbCgsRGlnhx9zq3aU
 i9KU3uDbpFYXIlKn2ZetDlLJo6a6h5m/6mGpHucQq+1SH7zr8eVbgjXjUEA8L3Huz3CV
 l6IA==
X-Gm-Message-State: AOAM533I2Hjju/UnbRhKXpGuyUASsTbsnLLu9e9zhOScPsd/vLKMDagI
 zSQQvIPHaxoDYUObB5gRd6kF9g==
X-Google-Smtp-Source: ABdhPJxG7Rr5qnj7oR0gtCLURtoKJQbXg1qgWb+ARuyyWRimCB6s7AMBNpQzrOt44941nGvLb9EdlQ==
X-Received: by 2002:a05:620a:108d:: with SMTP id
 g13mr2612236qkk.387.1635352476820; 
 Wed, 27 Oct 2021 09:34:36 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:121e:94ae:f1a6:940c])
 by smtp.gmail.com with ESMTPSA id a20sm249675qtb.15.2021.10.27.09.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 09:34:36 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Cc: seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Do not overwrite user state rotation value.
Date: Wed, 27 Oct 2021 12:34:31 -0400
Message-Id: <20211027163433.2017401-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Mark Yacoub <markyacoub@google.com>

[Why]
The rotation property must have a valid bitmask value. 0 isn't a valid
value.
The state should not be overwritten when performing an overlay value
check.

[How]
Do not overwrite state during the check.

Resolves: IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 20 +++++++-------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  5 ++---
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 86c3068894b11..2fc566964f68e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -64,7 +64,7 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
-			struct mtk_plane_state *mtk_state);
+			const struct mtk_plane_state *mtk_state);
 void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 			  struct mtk_plane_state *state,
 			  struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index ea5760f856ec6..13999564304bc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -190,19 +190,15 @@ unsigned int mtk_ovl_supported_rotations(struct device *dev)
 }
 
 int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
-			struct mtk_plane_state *mtk_state)
+			const struct mtk_plane_state *mtk_state)
 {
-	struct drm_plane_state *state = &mtk_state->base;
-	unsigned int rotation = 0;
+	const struct drm_plane_state *state = &mtk_state->base;
+	unsigned int rotation = drm_rotation_simplify(
+		state->rotation,
+		DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y);
 
-	rotation = drm_rotation_simplify(state->rotation,
-					 DRM_MODE_ROTATE_0 |
-					 DRM_MODE_REFLECT_X |
-					 DRM_MODE_REFLECT_Y);
-	rotation &= ~DRM_MODE_ROTATE_0;
-
-	/* We can only do reflection, not rotation */
-	if ((rotation & DRM_MODE_ROTATE_MASK) != 0)
+	/* We can only do reflection, not non-zero rotation */
+	if (((rotation & ~DRM_MODE_ROTATE_0) & DRM_MODE_ROTATE_MASK) != 0)
 		return -EINVAL;
 
 	/*
@@ -212,8 +208,6 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 	if (state->fb->format->is_yuv && rotation != 0)
 		return -EINVAL;
 
-	state->rotation = rotation;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 1b582262b682b..530bdd031933f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -53,9 +53,8 @@ struct mtk_ddp_comp_funcs {
 	void (*disable_vblank)(struct device *dev);
 	unsigned int (*supported_rotations)(struct device *dev);
 	unsigned int (*layer_nr)(struct device *dev);
-	int (*layer_check)(struct device *dev,
-			   unsigned int idx,
-			   struct mtk_plane_state *state);
+	int (*layer_check)(struct device *dev, unsigned int idx,
+			   const struct mtk_plane_state *state);
 	void (*layer_config)(struct device *dev, unsigned int idx,
 			     struct mtk_plane_state *state,
 			     struct cmdq_pkt *cmdq_pkt);
-- 
2.33.0.1079.g6e70778dc9-goog

