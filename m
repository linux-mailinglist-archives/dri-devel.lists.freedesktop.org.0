Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4059985E3D2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E482C10E3A6;
	Wed, 21 Feb 2024 16:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RhAkr5ae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B02610E7C7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:57:02 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-42a4516ec5dso52155751cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708534621; x=1709139421;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ewyp4ShvXsbsTKDV/y4IDRAf0uOqZ7IN5JGP+ziUOHo=;
 b=RhAkr5ae8J9cl49QssYdLz7kHp8PTEcKgkO5g+ktN9fI4HFoIE45suJLmhFUk3odRl
 zrJR87uHuzd+1k5yKtPR0jZFTFfjGIgHGZVyu0LiiAHih3NJZHc5BV04PLKX6go2eK1z
 vSQODnU0T8Rn/9TPj0d1NTqdmFRZXi8Ra+ABY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708534621; x=1709139421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ewyp4ShvXsbsTKDV/y4IDRAf0uOqZ7IN5JGP+ziUOHo=;
 b=jrK3NWoWWneAaqPvUtfC6ZjGC0MPlmb3UQX5YkMYh2DdMy8eoIjN+1plYHCPJj1tqo
 K6KYhNxDl1NO+l5ziLfq5spG1BouduSy3EYknM2yDIY0P91uFQzSUU9peC/kJfQpOcWH
 PfUD73iJqIfwJvdCoVgSd5f/w/JrLm/AanDt8ZicjakVSAIXFzqpMTNOafshjgUUzCXy
 oqfFp7FyilTrjlmylQt7NbbWyK8qCu+JZyC2NhWlCCta+n8J9ZcDJd6lVON4pXiYGSZe
 Yi/xXppfNp0HeNByvUdYn8Ucb0XCLjSXVyIFAlXfJ/XWO6P2tW1a17XjQU/PGp1mx17i
 mOtw==
X-Gm-Message-State: AOJu0YznZGCw4AuJjTKgHRaYTm1CfNBLMMKad9hndWBiLRNvBHjPBbHq
 0dBG2+SGF7h1h0dGAVoyMMMxq1CWOKXaVyD5tj7TFP8yRchtnyI68C2aLq9Agg==
X-Google-Smtp-Source: AGHT+IEbyz9aRDr/D+FpIRtgYgTiDDpbYo6DXckvIkS81Eh+NamO3vbl1XBfN15Ja88kFLe04Tc1Dg==
X-Received: by 2002:ac8:5841:0:b0:42e:3d12:8c81 with SMTP id
 h1-20020ac85841000000b0042e3d128c81mr1556148qth.64.1708534621045; 
 Wed, 21 Feb 2024 08:57:01 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:5e8a:4a60:7390:1fc9])
 by smtp.gmail.com with ESMTPSA id
 x23-20020ac87317000000b0042dff5e7c3fsm3811639qto.1.2024.02.21.08.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 08:57:00 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org,
 angelogioacchino.delregno@collabora.com,
 Justin Green <greenjustin@chromium.org>
Subject: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
Date: Wed, 21 Feb 2024 11:56:43 -0500
Message-ID: <20240221165643.1679073-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
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

Add MT8188 overlay driver configuration data. This change consequently
enables 10-bit overlay support on MT8188 devices.

Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 and
BA30 overlays are confirmed to work from modetest.

Signed-off-by: Justin Green <greenjustin@chromium.org>
Tested-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2bffe4245466..696aabe124c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -635,6 +635,17 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.supports_clrfmt_ext = true,
 };
 
+static const struct mtk_disp_ovl_data mt8188_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+	.formats = mt8195_formats,
+	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.supports_clrfmt_ext = true,
+};
+
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = &mt2701_ovl_driver_data},
@@ -650,6 +661,8 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	  .data = &mt8192_ovl_2l_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-ovl",
 	  .data = &mt8195_ovl_driver_data},
+	{ .compatible = "mediatek,mt8188-disp-ovl",
+	  .data = &mt8188_ovl_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
-- 
2.44.0.rc0.258.g7320e95886-goog

