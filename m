Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A794BFC76A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF3110E7C9;
	Wed, 22 Oct 2025 14:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i1YsY41M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FED110E7C4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:21:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4270a3464caso2988306f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142912; x=1761747712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWzzLwH6jgxXjmQF82SSMCUND+xg2EriGxgvFhDvOZc=;
 b=i1YsY41MV9y/FKVaRyxmXeoymvWqemeY50PYDGm+njipEQ4GTSZyUmULJek3rmlpCH
 cPiPR8nC5v4Emr7NXgZvytHBiDy9+c2vbqzeRQZ+evIJ+53NbH1dy6Shse5ZeJIEWIhq
 1ZQzK5bUjYA6Ei1Ws/L6GEzAR74CkB5IwpfkkZL4BB+3m6x3A2qW8fKN9w5y/qddBjpu
 1/1bsP31iiosRDob7fqQ2ojjS34ePYBgB5QtAepsVoelLpKUP9dakRVd6GDh8enoc1So
 HlkLTg6/0RV6NqoMS4mFhxcKk+YCjxHLzr9GApx/6JGzmHLvbo24X9WxfVmjCKkv7CYh
 AaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142912; x=1761747712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWzzLwH6jgxXjmQF82SSMCUND+xg2EriGxgvFhDvOZc=;
 b=QHGf/Dv5iJv3hPw0SQFNa9w1mgCrIEriNb7g/hsJbFlPAGzJXu+CFODsvJJN5eOv0U
 l2IDp3c6lnNb+jER5IEKMI4qvJBKRx8i6D7T41e1IyPojwB2Iaw4rRFIbF2nPEqj0EES
 o/hQH1syzNLEOdbQxoBFRLJWsMS1dB5qSbKlWNUoY6Zn8mGdveov6iIZt3iJZogOzZBg
 rWCMH4tUFq5d9PCnBMsRKtTXF452Pna11fpqm6LpyXLtlUvoWCFnRHikvyLdOmEKGzUz
 oU975ctNqKCO0y62X14iw/AZBFFqZzdD4xnzSSYk2vvyFoJ3oZkBHMNERhkQ7BnhLHLl
 xMhA==
X-Gm-Message-State: AOJu0Yycrox8CO//TMEhkehg2bhEiGPKlVuFaTEFfD4J2pV9jHKBXFgE
 iWqvxQwIyToncGeNncN1vV/pguU/r/LHsShTriHyKdQ55uc+SHBQKaAl
X-Gm-Gg: ASbGncsOMzjzuwZgI+m7anMQ08bw7yrz4wlP4sromgdSN+WLrc0+cSwiMWMi1Ua8m9r
 HWc+SWTGkG4Tecamo6MxMnPsSgrxWjIiNa0AA9OPnerXwi5ow5Ds8T9utZNtkFk8eH/5nSvF0Ug
 iwENYvDvJHJmclNUjFQWb5dbFJ907XVUoFVm7GtVh7eJxv0muyWxdwQ/iVcMNTAnVv7vD1/QcJt
 /wybZfhZttB5CLnZbft5r/0hfayla0AW3o00zFH8+dPwin9OQGAaTlilzg/PyDHxLEu0YEUGK/T
 bYHMO5++n0ok/8m5wTSi9S7MZDjxtnkdPtVwKoinkbFHoSrcn8THoPnPwsMNDELBZZHJ3gNKduT
 i8S0a4FeXa8QuTZcvCwTxUhSm6WgMzUQEPoR9Ob7pjY+yG+/ciqyO4d0usaAtLWQBhlY=
X-Google-Smtp-Source: AGHT+IFxEX5dT11epaReQydShPRaD3ap7YNMoGZ00ekJglzcEJYx4BxQ7S6YQXgiTMxPpQinmI9SWQ==
X-Received: by 2002:a05:6000:2087:b0:427:921:8985 with SMTP id
 ffacd0b85a97d-42709218a51mr12660456f8f.40.1761142911810; 
 Wed, 22 Oct 2025 07:21:51 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v5 16/23] staging: media: tegra-video: tegra20: adjust format
 align calculations
Date: Wed, 22 Oct 2025 17:20:44 +0300
Message-ID: <20251022142051.70400-17-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

Expand supported formats structure with data_type and bit_width fields
required for CSI support. Adjust tegra20_fmt_align by factoring out common
bytesperline and sizeimage calculation logic shared by supported planar
and non-planar formats and leaving planar-related correction under a
switch.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 39 ++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7c3ff843235d..ffaaa2bb8269 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -280,18 +280,13 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
+	pix->bytesperline = roundup(pix->width, 8) * bpp;
+	pix->sizeimage = pix->bytesperline * pix->height;
+
 	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
+		pix->sizeimage = pix->sizeimage * 3 / 2;
 		break;
 	}
 }
@@ -576,20 +571,24 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
-#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
-{							\
-	.code    = MEDIA_BUS_FMT_##MBUS_CODE,		\
-	.bpp     = BPP,					\
-	.fourcc  = V4L2_PIX_FMT_##FOURCC,		\
+#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
+{									\
+	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
+	.bit_width	= BIT_WIDTH,					\
+	.code		= MEDIA_BUS_FMT_##MBUS_CODE,			\
+	.bpp		= BPP,						\
+	.fourcc		= V4L2_PIX_FMT_##FOURCC,			\
 }
 
 static const struct tegra_video_format tegra20_video_formats[] = {
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
-	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
-	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
-	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
+	/* YUV422 */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, YVYU),
+	/* YUV420P */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.48.1

