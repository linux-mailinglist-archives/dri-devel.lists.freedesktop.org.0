Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967CFB2C303
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64DC10E5D4;
	Tue, 19 Aug 2025 12:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JKMaEY3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B677C10E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:09 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so816336566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605828; x=1756210628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVmGik8S1Lubg88N013Hy9120GSgzZiOul8C7FSni6U=;
 b=JKMaEY3awmIsTmJWwctZc/1nKMy1QgfaXjFqoO76YWlso+Wf+Xn+SsD1EcmmYI5ie0
 Xte46zVADrxfNecaeoZB6CxzhMrY9WAZqIRTL6s8PCl9a8hEXPMB1Dn80w9VuQuTP+aI
 uvVNbB3bdHLpuGRm6/6OVOrwjOYoByauNNIhrJi6dwVIcj0HahxT+7A8TBoQq1MxN1dg
 lrMJC5Pw+tY6MLOSByT/VQMMLbCMrVrCjhuacSwbGYQjyoCCzc7IM8rxrr0JO70BAhdJ
 XcqDbTjW2kdtJLKuinv99GjRO++AITXlNi8RKc+q4gxqMOu5d17sAaBUBy/dKV2wPaxn
 Odkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605828; x=1756210628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xVmGik8S1Lubg88N013Hy9120GSgzZiOul8C7FSni6U=;
 b=W4dm0h4FgZ/mD0m2W3pmMkmyCAz6G4baBjzrX/RY8gpEJFC/uB/eGte2RK5TDWEjZW
 D5wH/K2bAfZh8zX1S1EzyBXYBq6epvCDamPO0Q4IrB+tN7AKwGOajPrE2hh3LkTf0UVJ
 XZRLJs34RzLnCgfWoR99V9XYZXdbzn9wKXz5Vh6WF4J6wr/HGQ+PvLjgubr4uChRMUHX
 RpZ3o99xuzqpfRlDHJC8tXmwsv/qd+hHJraMiYRqPUgb7rtlImGAF2ElNQ+s8IUGZ3uc
 BHu4O3csrt7vRkC5TyglXrdMrUaFANZNC9KRnaZx6D167FuWS7yfgo1Jk53duFCNJSrB
 UGIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULAItrgKsjd8iiSLLeHbfzNOcD0BPbGGqYjVvwfEhhxHCNVcZXn/n1mKdBHqhumzpsOgoXtDDkD24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNuzNGgSB7YJTcSw+y/nnaMM5oZd1T4bRZDDkQ6KYnknrrcSsY
 bIEAzG46pzitdRvndHpziA+SPkMUcQo/WZ4m/elgMVFLKtrxdd272N4H
X-Gm-Gg: ASbGnctQQewDrJL316iYHHuVSE18ESpu5TC2Ryx+BUKBbBl8N9YmHzKa+gkekEXGlMC
 bU8+cedDcrcLu7rn2OC9cNrCNUXk1mzKZ09b0HzTaljPbGnz7rnYxmK4yufzhvuyLL3LiYP5BQ+
 uvfG2Z4Kwj/ZQ5pYRkqEScX7wVCDC5Afs7F6dp35mk82xMJBVWe6LQyaJ7Yzymx5bqhNjsQFBL5
 mV8VjvNLfzg0zArKvybJiYXUfJyLVivnxwqJJehTkLKLFK1Qljqm37fXfLbyTrYuAxAAZ8yDY5Q
 ZE+ZcNRDQ0TAqiRLdiXhCMdlnfKOJonVryjGY5S/U9Lw8vQDs3nO2uImCFmKP7yKIaXirJ8VNvj
 kMgMTYd5s0GvNmw==
X-Google-Smtp-Source: AGHT+IGNsZPmHUgUqv/mb+jehNWgcZIV+ojA6g1QddNCsq4qKvg62r9qmL1bBHys91nwZmL1Bm8feQ==
X-Received: by 2002:a17:907:1c26:b0:af9:686a:52a7 with SMTP id
 a640c23a62f3a-afddcb895f9mr206314166b.14.1755605828049; 
 Tue, 19 Aug 2025 05:17:08 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:17:07 -0700 (PDT)
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
Subject: [PATCH v1 15/19] staging: media: tegra-video: tegra20: expand format
 support with RAW8/10 and YUV422 1X16
Date: Tue, 19 Aug 2025 15:16:27 +0300
Message-ID: <20250819121631.84280-16-clamor95@gmail.com>
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

Add support for Bayer formats (RAW8 and RAW10) and YUV422_8 1X16 versions
of existing YUV422_8 2X8.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 71 ++++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 67631e0c9ffc..b466fe7f4504 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -186,6 +186,18 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
+	/* RAW8 */
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	/* RAW10 */
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		(*yuv_input_format) = VI_INPUT_INPUT_FORMAT_BAYER;
+		break;
 	}
 }
 
@@ -220,6 +232,18 @@ static void tegra20_vi_get_output_formats(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YVU420:
 		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
+		break;
 	}
 }
 
@@ -300,6 +324,16 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
 		if (chan->vflip)
 			chan->start_offset += stride * (height - 1);
 		if (chan->hflip)
@@ -365,6 +399,19 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(OUT_1),  base);
 		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(OUT_1), base + chan->start_offset);
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(OUT_2),  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(OUT_2), base + chan->start_offset);
+		break;
 	}
 }
 
@@ -446,12 +493,15 @@ static int tegra20_chan_capture_kthread_start(void *data)
 static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 {
 	u32 output_fourcc = chan->format.pixelformat;
+	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
 	int stride_l = chan->format.bytesperline;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
-	int output_channel = OUT_1;
+	int output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+			      data_type == TEGRA_IMAGE_DT_RAW10) ?
+			      OUT_2 : OUT_1;
 	int main_output_format;
 	int yuv_output_format;
 
@@ -580,6 +630,20 @@ static const struct tegra_video_format tegra20_video_formats[] = {
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 16, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 16, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 16, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 16, YVYU),
+	/* RAW 8 */
+	TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 16, SRGGB8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 16, SGRBG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 16, SGBRG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 16, SBGGR8),
+	/* RAW 10 */
+	TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 16, SRGGB10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 16, SGRBG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 16, SGBRG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 16, SBGGR10),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
@@ -606,9 +670,12 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 {
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
+	u32 data_type = vi_chan->fmtinfo->img_dt;
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
-	int output_channel = OUT_1;
+	int output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+			      data_type == TEGRA_IMAGE_DT_RAW10) ?
+			      OUT_2 : OUT_1;
 
 	unsigned int main_input_format;
 	unsigned int yuv_input_format;
-- 
2.48.1

