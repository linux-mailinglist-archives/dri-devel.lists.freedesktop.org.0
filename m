Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDB546DBD1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 20:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266076E0CC;
	Wed,  8 Dec 2021 19:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E336E0CC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 19:09:45 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id v22so3138766qtx.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 11:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ji1mvPknDhdOmYpOyzWQYdOGcoOMkKQYqnM5UxcNn1k=;
 b=ePGN+fQlX9ZDIDadtyh99MJ3jIvTxzM7/e+8xxksGts1MB+YbRwB7PtErJtgiJRZUj
 7sVewD/SARtWcJruveNmgDsYVgpggb3vP8zYClqZhlU008yWZTGp5bKP68sBXSVSu95O
 cbPI245hJgs0z42jAvVCw6WSxuVQe/r2Yp+To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ji1mvPknDhdOmYpOyzWQYdOGcoOMkKQYqnM5UxcNn1k=;
 b=Gfx7858NIXvUsG6At9DVDpyNHaJ3JZ7t1eTWg/aFm/yZhcdtVUpFgp2925Cslil39Q
 xaKhbnP1JP/usPCUo1S1q050SjQzG7kvsS/ITJFycxzyaoiX/0LA0zZ9vvyJDQXBR9dS
 GdyfnHbSjoC+kNXbk9qrIY/yW0K9styoGgrHIx8JvLBl/qpGwYTeVIo/sYBMynyhNwTL
 zf1oCee/fZeHi0YA+wBNXHUxIbI4Ysrj0FB5LDWYm+zutEX68OgGkdVvoZW2zWkO7DPL
 PwvYm+kXg/Vi7NrLWGAJ4oUfDxiQOpPVP1w3IhWwsuF2KTpXfQPFuWuk3Baa3HvfAnwr
 zouQ==
X-Gm-Message-State: AOAM531eB1JU5/sp3lyl8y6YZcQk3hQFWrWmZIwXY/kIDnNSUMgwXcBq
 I7fqyIqgMjxkgE0jGqag2ZmseA==
X-Google-Smtp-Source: ABdhPJwfE5wTjaJrI7YGlf6iH+HGfN7+U8y+ErYNboRLOLubGkSlxTFlPcGBO7bO0YjTYP1fRWb5Nw==
X-Received: by 2002:a05:622a:1c6:: with SMTP id
 t6mr10311770qtw.211.1638990584025; 
 Wed, 08 Dec 2021 11:09:44 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:eb6e:9a77:7a91:9461])
 by smtp.gmail.com with ESMTPSA id o21sm2142939qta.89.2021.12.08.11.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 11:09:43 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Validate the CRTC LUT size.
Date: Wed,  8 Dec 2021 14:09:13 -0500
Message-Id: <20211208190921.128702-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
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
Cc: chunkuang.hu@kernel.org, David Airlie <airlied@linux.ie>,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzungbi@google.com, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@chromium.org>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
The user space can allocate a LUT of any size. We must validate that it
is the expected MTK_LUT_SIZE.

[How]
Bring the .atomic_check function internal to mediatek driver and check
that the new CRTC state LUT size is equal to MTK_LUT_SIZE.

Fixes igt@kms_color@pipe-A-invalid-gamma-lut-sizes
Tested on Jacuzzi (MTK)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 40 +++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index f47801737b88f..82de83656d159 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -54,9 +54,47 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
 	return drm_gem_fb_create(dev, file, cmd);
 }
 
+static bool is_lut_size_expected(const struct drm_device *dev,
+				 const struct drm_property_blob *lut)
+{
+	int len;
+
+	if (!lut)
+		return true;
+
+	len = drm_color_lut_size(lut);
+	if (len != MTK_LUT_SIZE) {
+		drm_dbg_state(dev, "Invalid LUT size; got %d, expected %d\n",
+			      len, MTK_LUT_SIZE);
+		return false;
+	}
+
+	return true;
+}
+
+static int mtk_drm_atomic_check(struct drm_device *dev,
+				struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+	int ret, i;
+
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
+		if (!is_lut_size_expected(dev, new_crtc_state->degamma_lut) ||
+		    !is_lut_size_expected(dev, new_crtc_state->gamma_lut))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
 	.fb_create = mtk_drm_mode_fb_create,
-	.atomic_check = drm_atomic_helper_check,
+	.atomic_check = mtk_drm_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-- 
2.34.1.400.ga245620fadb-goog

