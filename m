Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB373B2C2FA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4274510E5C4;
	Tue, 19 Aug 2025 12:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="geagglRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD43C10E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:04 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-afca41c7d7fso1055559466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605823; x=1756210623; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7nPdsPtcAgjunV6X7jhJIj/ZKqq5EgnoWj7gjO7V+Y=;
 b=geagglRBFfFjl2RO881F10O3l9aqtnX+TlvO+bqqGorWstJgdjTQae75RWeHM6q7xB
 gsjoQFmgKdqSpvMZUsReCCAtSjqPOngZj/E5GbnClTq2ZW16qQ2KvIVCUsyqN6OjGNV6
 O7C85xouF5+mF55Zzgit2aNt3A8Pd80EuQ0byX7/JjZMjKRIGBFSz7D5d+KU88fXpGVY
 XN/zX/LuYa0N3wSscHmf7xh0bwOfEIpHYIUbILqrP2rwNSiaxXlXWq7M5hUr9V06+2xe
 7opUQzh1So6qtCjOrjNGAJt55dHMNOf0NI7Ej2dU0K+tSdvr+FRMYM6ksGRT94TKTlDK
 kh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605823; x=1756210623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7nPdsPtcAgjunV6X7jhJIj/ZKqq5EgnoWj7gjO7V+Y=;
 b=t60x7q+I/g351fIQ2nLDTdBTbFwsa1HfKa51BDNEI7okzKW8XMLlGTzUd9oklu8FBb
 ep6RVmX9q6aLFduzoPUKkKqYLwuNLcF9cLM91iRBVH6dtTZBaxjykhZ4RuzhTRJQvw98
 uvIqomFZWru18ysm1E3mTR9bWMsAkoRB/EWh7VelP0y7Gs60bjO1mLn1ovVwTM0Kk1zJ
 JetQQ+R4zIC8v42X4lSnOlUNzfgYlSVvLvCPAeIQPXghszrJdcuUhoj8cNmxcdcPpVif
 Dz0pBdFK/F4nOsJTV4jyVcx/LFs5pd0cD0yQlFC9RYA4l5jdP3MaY9t0uJEnfrIgmXft
 vD5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbfwIOMLQnw8gtY0PAB5ntwSCyIWjO5BtXsyx/Z904y5I0HYPbcl7sw90b1iJixjffEEWrN5L1zPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+0Ju40d0O8Jff7jGMGH+EinyBtXIDN8FuDjlDSr3r+c7aOVyp
 crgBIiASKNyxTo5hgfJd2aouD38IbNmCYltncU43xtY5CvRFqTgJYE2v
X-Gm-Gg: ASbGncugvcA8DN5UpfAsnzBanewgG6iewJpef7B2ceBQW3qEn1sGaGmOyqUoLkfBmts
 /+KdIOunA+v9c6C0WLGh+UUAJMDapn4kXSkwQcHNa3oezXtcnA0vZhi5myy48BG6cvLwz4XuDQD
 1P4LEZzKPjKSBnv6mRSnaXsl4/d2+fLfI7sdikAb0uEWgfUMgPTkQteW6S2xfv+pqIsPEueI11V
 /4ARwkf/jIb4eTYIWYZhv92meU93+9jPomeU0O7b5o67WH+KU7PDkV5JXgt2DdxyIbO25xp+h9b
 GptkKd5RbKzXoa+MF3mDxBE8/AGW8IY3tjUJe5yDAXWtm+zKrqYtj0LnCyqylQ6vYJ38MSlQ4Ic
 Vtu9WJ30rJ/k/LA==
X-Google-Smtp-Source: AGHT+IEI4wu112muy0eGgPKtJeKpcn9FInkstfnVtc9qNv6q6tgCe+us6rrc7oSTRUrJxnYtpqfh7w==
X-Received: by 2002:a17:907:86a0:b0:af7:fd29:c5e4 with SMTP id
 a640c23a62f3a-afddebca776mr252056766b.2.1755605823220; 
 Tue, 19 Aug 2025 05:17:03 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:17:02 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 12/19] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Tue, 19 Aug 2025 15:16:24 +0300
Message-ID: <20250819121631.84280-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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

Simplify format align calculations by slightly modifying supported formats
structure.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 54512d1ecf83..735611c3c47d 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -279,20 +279,8 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
-	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
-		break;
-	}
+	pix->bytesperline = DIV_ROUND_UP(pix->width * bpp, 8);
+	pix->sizeimage = pix->bytesperline * pix->height;
 }
 
 /*
@@ -575,20 +563,23 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
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
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.48.1

