Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908E686C5D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 18:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8933110E42F;
	Wed,  1 Feb 2023 17:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42C10E42D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 17:02:27 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id h24so9543236qtr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=;
 b=nT67bw8rr56CM1gJrp7X+DVshgnEKa/ljhXldr+SD384iSPkj35RP2X96fvOeQnsgm
 T14b9hW8ntxRYCEpR8GsxRX+9r/UCUhnVOF2MAuPq1dJ/DyHInDPNZJk18PxtOhMd24s
 2r9N9Mx3zTN478qLt3UhkKbfNoV6h8c1mPRHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=;
 b=BSqB/ibrWMM8uFz21iOf2HtQOWIoddlok+gFlWjkJr2bgtEYSq8f1xum/QdHlOLmrm
 R86Tpv7bwfdQUTy2VaAdYCegxdLE/YPBUcXf6UjLIFC7f2fQDP864ZS6Z2Q0BdkuS2U0
 aWxrUqOL/ErZZndi+piv8j+nJN/ZYJ4Bie9C0u4yh6uQk0bb4zNFc5Q5ARD69ZJLZkg+
 eggGa1yGlrm0KhgOje/afSZyCEorQyXxdp8rHWVookdGRZCIOUCsUhjdRfcz8sCmWYo2
 IKpBMfJ9Jpa3xTdUrj8fKcdHjzBlzGrzdDnOyZV4LbvtdfeZa8zo/MsVvoiIDrzAXcZW
 IIBQ==
X-Gm-Message-State: AO0yUKWEdZ2M4M+yKCDCkrR69uRAmXRT783AIv1JB0CJhDFMBe7z2ooz
 fR/hJwC+PYLSgg0uBDdufPjI+w==
X-Google-Smtp-Source: AK7set+eO7ODvJ08hC6MTpYiPVvqg1nPK4IXKW7BUiehW11cQYcoERJgOYb16hSR0vDxX1XFqa0lEg==
X-Received: by 2002:ac8:7fc3:0:b0:3b0:98c3:217c with SMTP id
 b3-20020ac87fc3000000b003b098c3217cmr6229659qtk.6.1675270946173; 
 Wed, 01 Feb 2023 09:02:26 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:9334:99d8:1f91:70a])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ac8430f000000b003b646a99aa6sm5549543qtm.77.2023.02.01.09.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 09:02:25 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/mediatek: Enable AR30 and BA30 overlays on MT8195
Date: Wed,  1 Feb 2023 12:02:10 -0500
Message-Id: <20230201170210.1253505-4-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230201170210.1253505-1-greenjustin@chromium.org>
References: <20230201170210.1253505-1-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, Justin Green <greenjustin@chromium.org>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested using "modetest -P" on an MT8195 device.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index a6255e847104..7d26f7055751 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -85,6 +85,22 @@ static const u32 mt8173_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+static const u32 mt8195_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -616,8 +632,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8195_formats,
+	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.supports_clrfmt_ext = true,
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
-- 
2.39.1.456.gfc5497dd1b-goog

