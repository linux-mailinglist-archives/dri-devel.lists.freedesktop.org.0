Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690799E3DF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 12:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6B810E560;
	Tue, 15 Oct 2024 10:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="REWVEu7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C816D10E560
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 10:30:24 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-71e625b00bcso1596356b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728988224; x=1729593024;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V2rr896UjJZIJvHhd5U5Pr+M2ve1yVZw4BPOf1jkh5k=;
 b=REWVEu7Lor1rRGpVa9vhiGarVJvvNJlRV4JvjPAZZFm/sxHlIKnqPeCckXpJbuea+W
 RANuJHGYo3fLMRiWZ6eV3xiP7jeXXu5XLuDKaBkdoGxeajtSqRAxBQiASOf+7DId9uVV
 EV73DlD8NymbqYdgJfwbjjyz9bROIyQcx7ih4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728988224; x=1729593024;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V2rr896UjJZIJvHhd5U5Pr+M2ve1yVZw4BPOf1jkh5k=;
 b=TUSdI8YCiT56j2QBCD7BWIXprGBnVBYvUnPV/iAU5qSgjgsdzW2cVhwH6goaQdpiVK
 nxcmGrCMB2dTZzsfPv3OGMJaG0zKVQfYKDLRhOE+RdCgH5Z5mduvAD5B8qAqZjL84+j0
 oOhj2u/l3N4DVdqsO/BXs/b9kqQtlNjeCDx+FpbQ6rZeF2nsN85kUQmnwt2Uy5T0AA7m
 TTiZgJ749M9XT7x1Fi7QtU3Elp+osf8sXYGuw7FLdwfNlTVc4bbMtme+kxvx/D8B3A4c
 KgrStLy+ku4ioa/n/gRaZe1x3CLMa6kZTgtW+6bWsNq2eUzk+xDPxf9PfeAYoZldGuBD
 ZtdQ==
X-Gm-Message-State: AOJu0YzITl44+9ek2bks1yMqsNtRc3xQEw5hAWOBTAx2XnLhlgA0kwyy
 y6xDk6Xdf069V9dLwOYT3nfUoP1KhZuDVZXFW+fsqo0OajGLVrPlIAfiwUOJ9PvIhP0iRhMXobB
 E0g==
X-Google-Smtp-Source: AGHT+IFkLsd54kJuLGI+OOJF3TglxLq80CdGHR32sS02YQTnE9EsV0U9q3MfLsv+EAG7yVeyofCtWw==
X-Received: by 2002:a05:6a00:4b12:b0:71e:6c65:e7c4 with SMTP id
 d2e1a72fcca58-71e6c65e883mr5595571b3a.26.1728988223751; 
 Tue, 15 Oct 2024 03:30:23 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com
 (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e77370dfdsm946011b3a.42.2024.10.15.03.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 03:30:23 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 15 Oct 2024 10:30:19 +0000
Subject: [PATCH] drm/mediatek: Fix color format MACROs in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-color-v1-1-35b01fa0a826@chromium.org>
X-B4-Tracking: v=1; b=H4sIADpEDmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0NT3eT8nPwi3VQjA9NUc9MkM5PERCWg2oKi1LTMCrA50bG1tQBJIzI
 UVwAAAA==
X-Change-ID: 20241015-color-e205e75b64aa
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dianders@chromium.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
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

In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
OVL"), some new color formats are defined in the MACROs to make the
switch statement more concise. However, there are typos in these
formats MACROs, which cause the return value to be incorrect. Fix the
typos to ensure the return value remains unchanged.

Fix: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6af9f5799487fdc0f128a9b5cbe4a..1632ac5c23d87e1cdc41013a9cf7864728dcb63b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -65,8 +65,8 @@
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
 #define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
 #define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
-#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
 #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)

---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20241015-color-e205e75b64aa

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>

