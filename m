Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE216B2F39
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 22:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1025A10E2B7;
	Thu,  9 Mar 2023 21:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE67810E2B7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 21:05:34 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id r16so3566268qtx.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678395934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQruPEvUWXea5iv6fg4nOA01GAuR/ZB8cLPDfAhHg6M=;
 b=Ps6exi3xpI87CzQUY4hXNPGVsjZaFoqg4HGL8a1MxAqCqKlL1H8+jHtFD2GpTj36e+
 rpmphds1pfv7T/WkSa8vwmH48RssfA7nSoRFejaypkRswaUN/+PtXflJ//zhRv3Zgp9t
 cqOaLThEboUnygyl80BCIcIaFtgsn3DGskeYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678395934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQruPEvUWXea5iv6fg4nOA01GAuR/ZB8cLPDfAhHg6M=;
 b=oKNiHPUMk7vh22aWehQiow13JGzadhqtP0pQOuHVePKS7SKjiEMghyZ67NFx9OqImS
 gA7h73b5mnw8euGczAgkrmcMEDlCKJk23jk9tSp5Cfp9VF/3ZM1uj8asZ+BTkPf7SR3t
 5mfKWmvVW9Zb5eTXqS0h54qB54UB8OTCLdOc7+L7C6UbaL23h2VV97UfJvs2nqSbNXms
 84VK/cdxytqTRp3ybjzCmjFl6sbQj3XDghRhQaDoB5UBfYyA5YJJgtAgmgO+s+mVeShP
 Sf4lF1zgg9DUE3ESie3dr2ZOgauh07ay7VGvp8ys+r2q3ViLeKZsIDVse0d0mX8dipYM
 MnSg==
X-Gm-Message-State: AO0yUKUr1J+ev4ovhDpJMDZtLppYMn5FICSeNCr/bz/Yk9q7Man2xO02
 oNV40IUqFOyXgxxx4SwH8i6d5Q==
X-Google-Smtp-Source: AK7set+TqWj6nJuKc1WVAKlRbKRPSQEHg026dY/owgOMx8qMZrSMaVkii4FshfhymFINPelDj02TzQ==
X-Received: by 2002:ac8:7f4a:0:b0:3bf:dae3:bde2 with SMTP id
 g10-20020ac87f4a000000b003bfdae3bde2mr41004683qtk.36.1678395933876; 
 Thu, 09 Mar 2023 13:05:33 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:a575:2520:a8e1:989d])
 by smtp.gmail.com with ESMTPSA id
 69-20020a370548000000b007426f115a4esm14302375qkf.129.2023.03.09.13.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 13:05:33 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 3/3] drm/mediatek: Enable AR30 and BA30 overlays on MT8195
Date: Thu,  9 Mar 2023 16:04:16 -0500
Message-Id: <20230309210416.1167020-4-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230309210416.1167020-1-greenjustin@chromium.org>
References: <20230309210416.1167020-1-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, greenjustin@chromium.org,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modify the overlay driver data for MT8195 to enable bit depth control and
enable support for AR30 and BA30 framebuffer formats. This patch in
combination with the previous two patches in the series will allow MT8195
devices to scanout AR30 and BA30 framebuffers.

Tested using "modetest -P" on an MT8195 device. The test pattern displays
correctly for both AR30 and BA30 formats.

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

