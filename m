Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D8C801ECA
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5413D10E0DE;
	Sat,  2 Dec 2023 21:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B1C10E14B
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50be08b8fd9so1661655e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553221; x=1702158021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tirbLVRWLbCAowB38PQvXffjvU5Mrx5S3hKLHOtczZo=;
 b=SFSn6SrMoXSizzKbsSua/mmjVCHfSdfPjeRFAnYQS83BpaBMUdccMuZIGBi+RKB0VW
 B2kxBhOx0D75kFg156a1GQi8jXtvDKhlfnbg3LvjOdPnzCqDe1/firBEg7M8g/Q6Yen2
 OGk2iDT1Yu0CLumnj2yozQl3BQCbZKCzm095nU1VCp2OfZG+kolu5kN244/9ljfcarC+
 v+bhxiJuBMqBXb2yR3Icunrv63AgqySb8GWbkyGCTEBuzu3JJVHl1lPBeCpa4u3TkVej
 FJ3N3dUbdYYCxY5t0mCeJnS1IE9q9IQCWk8V/5J/GFIcLr2dbpfWD07JbAIDdw497raT
 2daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553221; x=1702158021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tirbLVRWLbCAowB38PQvXffjvU5Mrx5S3hKLHOtczZo=;
 b=r/th86pKo7sRHsYrcn+ngcfoIAyLUL6XQV5CPaoWoNB14KIbzEYE6wnKMOP6RGcZj5
 qdJdZVaD3QmPE52VZlFJwpFPX7gXAF0TBVXFdoRPDNE6EaPvcMtfP2Ugl79l86MuOvoN
 7J8S9aX6qK59rX9s7Y5ta4iobLwsu/104GETliDj6oH47u6+QzyT10EJ3xCE9LOx0etu
 3OlhqsPjhOBJH011lFocb5sZk6X770zzknOUq3MS7kDVKvIPqJjaqZFoh/SFUYE6toY4
 ncdCqWddxVllaQ85WtkVnZLOwZMLeOtqPO05DA5KHdIynZ/bIcbC9M2d++KYhYpcInhz
 wWGw==
X-Gm-Message-State: AOJu0Yw+QXVBKBbMN9tGxwLVy7yaL3axGx51InbCXPR0jJWWHw9BE2LI
 9bD6eQMrwZcPboj/00TKbzOkdA==
X-Google-Smtp-Source: AGHT+IEOb0nFn1AJOzX0DGuI7MPLsWoa8ws07TqEP1Il7scskfZsZupJdUoIlhkmIgqXTE/gOum/Ig==
X-Received: by 2002:a05:6512:3c8f:b0:50b:d764:9673 with SMTP id
 h15-20020a0565123c8f00b0050bd7649673mr2481949lfv.87.1701553221549; 
 Sat, 02 Dec 2023 13:40:21 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 05/12] drm/msm/dpu: in dpu_format replace bitmap with unsigned
 long field
Date: Sun,  3 Dec 2023 00:40:09 +0300
Message-Id: <20231202214016.1257621-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using bitmap for the flags results in a clumsy syntax on test_bit,
replace it with unsigned long type and simple binary ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 16 +++++++---------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 05e82f5dd0e6..3112d85808c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -45,7 +45,7 @@ bp, flg, fm, np)                                                          \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -64,7 +64,7 @@ alpha, bp, flg, fm, np, th)                                               \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -84,7 +84,7 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -102,7 +102,7 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -121,7 +121,7 @@ flg, fm, np, th)                                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -139,7 +139,7 @@ flg, fm, np, th)                                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -158,7 +158,7 @@ flg, fm, np, th)                                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -178,7 +178,7 @@ flg, fm, np)                                                      \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -1047,7 +1047,7 @@ const struct dpu_format *dpu_get_dpu_format_ext(
 		DPU_ERROR("unsupported fmt: %4.4s modifier 0x%llX\n",
 			(char *)&format, modifier);
 	else
-		DRM_DEBUG_ATOMIC("fmt %4.4s mod 0x%llX ubwc %d yuv %d\n",
+		DRM_DEBUG_ATOMIC("fmt %4.4s mod 0x%llX ubwc %d yuv %ld\n",
 				(char *)&format, modifier,
 				DPU_FORMAT_IS_UBWC(fmt),
 				DPU_FORMAT_IS_YUV(fmt));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index ebb3f9f493c3..caa0ff2d192f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -40,23 +40,21 @@ enum dpu_format_flags {
 	DPU_FORMAT_FLAG_YUV_BIT,
 	DPU_FORMAT_FLAG_DX_BIT,
 	DPU_FORMAT_FLAG_COMPRESSED_BIT,
-	DPU_FORMAT_FLAG_BIT_MAX,
 };
 
 #define DPU_FORMAT_FLAG_YUV		BIT(DPU_FORMAT_FLAG_YUV_BIT)
 #define DPU_FORMAT_FLAG_DX		BIT(DPU_FORMAT_FLAG_DX_BIT)
 #define DPU_FORMAT_FLAG_COMPRESSED	BIT(DPU_FORMAT_FLAG_COMPRESSED_BIT)
-#define DPU_FORMAT_IS_YUV(X)		\
-	(test_bit(DPU_FORMAT_FLAG_YUV_BIT, (X)->flag))
-#define DPU_FORMAT_IS_DX(X)		\
-	(test_bit(DPU_FORMAT_FLAG_DX_BIT, (X)->flag))
+
+#define DPU_FORMAT_IS_YUV(X)		((X)->flags & DPU_FORMAT_FLAG_YUV)
+#define DPU_FORMAT_IS_DX(X)		((X)->flags & DPU_FORMAT_FLAG_DX)
 #define DPU_FORMAT_IS_LINEAR(X)		((X)->fetch_mode == MDP_FETCH_LINEAR)
 #define DPU_FORMAT_IS_TILE(X) \
 	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-			!test_bit(DPU_FORMAT_FLAG_COMPRESSED_BIT, (X)->flag))
+	 !((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
 #define DPU_FORMAT_IS_UBWC(X) \
 	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-			test_bit(DPU_FORMAT_FLAG_COMPRESSED_BIT, (X)->flag))
+	 ((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
 
 #define DPU_BLEND_FG_ALPHA_FG_CONST	(0 << 0)
 #define DPU_BLEND_FG_ALPHA_BG_CONST	(1 << 0)
@@ -325,7 +323,7 @@ enum dpu_3d_blend_mode {
  * @alpha_enable: whether the format has an alpha channel
  * @num_planes: number of planes (including meta data planes)
  * @fetch_mode: linear, tiled, or ubwc hw fetch behavior
- * @flag: usage bit flags
+ * @flags: usage bit flags
  * @tile_width: format tile width
  * @tile_height: format tile height
  */
@@ -342,7 +340,7 @@ struct dpu_format {
 	u8 alpha_enable;
 	u8 num_planes;
 	enum mdp_fetch_mode fetch_mode;
-	DECLARE_BITMAP(flag, DPU_FORMAT_FLAG_BIT_MAX);
+	unsigned long flags;
 	u16 tile_width;
 	u16 tile_height;
 };
-- 
2.39.2

