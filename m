Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B880D801ECE
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01C010E0E7;
	Sat,  2 Dec 2023 21:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE0210E226
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:26 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bc053a9a7so4622419e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553225; x=1702158025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VP6tHJ9mGaAiGFKJb5YhHXoS5WIwdbuGxI10tW2QYRg=;
 b=DTwnzBh76G6V/fc4nC4OVaV26cva6KCuJlvb+Xul2ON0/bBufqQVwz2ZBTg3JtSv88
 OOim5RzWKvph4jZqYvjqLAzgJcHhJhc8MQho9z33FN/ArCXbxHTkcIl35z53Hx3VkPOq
 EU872gDqwUw6CrPcRnTOX/rOSjuK2r3p78H8g5hgXmtJGU++WCQqA0oNfoW9VJiVAbs2
 ommydrjyVuJm7dqc40wb9sLNmPy61/rYfDH6dET/uVGmAfYv3BqZGki32EL0EOw+gBNQ
 kj5b45T+308RHMWe9SbekO8uWS/npA5NVJXBwhcPUbRDB0OanoEyBz6DAct4e1StPDem
 S2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553225; x=1702158025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VP6tHJ9mGaAiGFKJb5YhHXoS5WIwdbuGxI10tW2QYRg=;
 b=f5qUwCIHiuRRLhSqbU2hgMUvrFmffztAbU+4rPbCzRP7yo4XNRcvWbhmC5C6XVLL4J
 SbsDriFzCpq/sLRKD76P+8gfJ94V96gC8mQ5o2q5GUkuFiiEVtsajX6x1a0hddrCbNZw
 N+hKA2zXUnnptzQBef9ueODTxXPSVDF9y1s12kuTSpMFmsLlTuHjAflJ2IVlwZ/AELFu
 4qNcLrrxmgxLagqB8H4HUFUxG3hCue4mBrD9Fss9lupMR81f315HzkLX+pniwEozR7qe
 tXyUogikJOCSKJkPG/ECyiN4ea7QNXJIYgOJXAhd3nxtATXi4PB8V0mXb/X+gShYXDKk
 3EgA==
X-Gm-Message-State: AOJu0YyOgnMH6y7LLjGx+QNfXaY/m9gHBzFBvZ5vXkQpPc0uA2HCVWez
 B2OS+W2oBcsPFYtvT797U9GOkA==
X-Google-Smtp-Source: AGHT+IH0BJcin6/hShEeVYXB5vZfYPCWBbgIKKN9qxdSDMDN70wpuibImh1tXOeIEYrUSg+tOKr0mA==
X-Received: by 2002:a05:6512:3a8a:b0:50a:2721:a43d with SMTP id
 q10-20020a0565123a8a00b0050a2721a43dmr1369776lfu.49.1701553224909; 
 Sat, 02 Dec 2023 13:40:24 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 09/12] drm/msm: convert msm_format::unpack_align_msb to the
 flag
Date: Sun,  3 Dec 2023 00:40:13 +0300
Message-Id: <20231202214016.1257621-10-dmitry.baryshkov@linaro.org>
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

Instead of having a u8 or bool field unpack_align_msb, convert it to the
flag, this save space in the tables and allows us to handle all booleans
in the same way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  2 +-
 drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
 4 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 419400311837..baf0fd67bf42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -43,7 +43,6 @@ bp, flg, fm, np)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
@@ -64,7 +63,6 @@ alpha, bp, flg, fm, np, th)                                               \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
@@ -86,7 +84,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
@@ -106,7 +103,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -127,7 +123,6 @@ flg, fm, np, th)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -147,11 +142,10 @@ flg, fm, np, th)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 1,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -168,11 +162,10 @@ flg, fm, np, th)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 1,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -190,7 +183,6 @@ flg, fm, np)                                                      \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f6c772df048b..c1ff70d80bdb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -263,7 +263,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		(fmt->element[1] << 8) | (fmt->element[0] << 0);
 	src_format |= ((fmt->unpack_count - 1) << 12) |
 		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
-		(fmt->unpack_align_msb << 18) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB ? 1 : 0) << 18) |
 		((fmt->bpp - 1) << 9);
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 12418256326d..1eadaabc8b25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -92,7 +92,7 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
 		(fmt->element[1] << 8)  |
 		(fmt->element[0] << 0);
 
-	dst_format |= (fmt->unpack_align_msb << 18) |
+	dst_format |= ((fmt->flags & MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB ? 1 : 0) << 18) |
 		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
 		((fmt->unpack_count - 1) << 12) |
 		((fmt->bpp - 1) << 9);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 61a4587382b5..7ea24d776a50 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -256,12 +256,14 @@ enum msm_format_flags {
 	MSM_FORMAT_FLAG_DX_BIT,
 	MSM_FORMAT_FLAG_COMPRESSED_BIT,
 	MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT,
+	MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT,
 };
 
 #define MSM_FORMAT_FLAG_YUV		BIT(MSM_FORMAT_FLAG_YUV_BIT)
 #define MSM_FORMAT_FLAG_DX		BIT(MSM_FORMAT_FLAG_DX_BIT)
 #define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
 #define MSM_FORMAT_FLAG_UNPACK_TIGHT	BIT(MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT)
+#define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
 
 /**
  * struct msm_format: defines the format configuration
@@ -270,7 +272,6 @@ enum msm_format_flags {
  * @fetch_type: how the color components are packed in pixel format
  * @chroma_sample: chroma sub-samplng type
  * @alpha_enable: whether the format has an alpha channel
- * @unpack_align_msb: unpack aligned to LSB or MSB
  * @unpack_count: number of the components to unpack
  * @bpp: bytes per pixel
  * @flags: usage bit flags
@@ -286,7 +287,6 @@ struct msm_format {
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
 	bool alpha_enable;
-	u8 unpack_align_msb;
 	u8 unpack_count;
 	u8 bpp;
 	unsigned long flags;
-- 
2.39.2

