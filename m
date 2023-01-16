Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D866B782
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 07:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1BF10E29A;
	Mon, 16 Jan 2023 06:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4223D10E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 06:33:21 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g13so41337222lfv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 22:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WdTyFjNSHCTnewp0MKzNdeqkx+iYLJM6LU5zfOdJ2bs=;
 b=bB2jvDFklb2MaPuUh+pNzcnh7PhqhQrjP5b8Fl1/Zd6YyxI+kwfNMbgoXbQyqq8RPp
 v628xEn8jGtVJzpN10FMWKsmnQY+8aV4oAPfwPQMzleGfTqFhl6IXkTTTBPPmwVOAv6k
 xiVbVjbnWdayjd93k9Nhd/OQWulyMfZVSCB07vfs3tL0iy9vSw8EYE61d/knpiEaO6Rq
 HIfNIA1sxuD7QP3TG6JRlYP8AzS1MQ+uxO+T9ZJ8OSV8ci8tXTpSv8e+EEmhdS/f1uLN
 24h7v9ODio5/+cAh7U2lK5zeC3WWIkf5FlgSVIcUv8WQNH6RcAsLZ2MxzPMz53RLAZWz
 efwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WdTyFjNSHCTnewp0MKzNdeqkx+iYLJM6LU5zfOdJ2bs=;
 b=SioEfQ3HfzbLdtYAUEIE7C9/TYf0+ofotpQmP2o79Soi8Bx7UcyAffQp5opTEkAd4y
 rLLwf1fqJCBlrJLkIvsTuOuv1ircq5Nnh8Ffb4tO7AEMvPQYL/sCaVxOXgk9jJZQD9Iw
 KrgQzn/k1o0yA1/Jyi4Wb2HP7nOeetOO0vyBKXbZ+BWcs8WjL0lPUqBE/Fz2m+ADXBQ7
 oGGFNTcXr//xzSggpjhsTzudJsfuPAx32l0N5Anj1j/UVkgrHCIeKGK8iQj7Tonlomaz
 qKdoa7pvpzoVVbnpLv36sLEsK+IktLU00fjgn6SIJf05MLMzLbdW4qMV3ygjQ2e1k6Nu
 bptw==
X-Gm-Message-State: AFqh2koCUetbP/TVkFBeB26AoaUrmm+LcaNH25gRJIoT4DVvMiS19T6x
 SZIsJ1NQVPpNwp5bfpSOWxH3uA==
X-Google-Smtp-Source: AMrXdXuxFSGSdFGSUMXlkvI/gIyOBFUhXRO4+3tihRCCcziZQeVQxnRqiF4HYUT7mERwtTznOagLUQ==
X-Received: by 2002:a19:3841:0:b0:4a4:68b8:c2ad with SMTP id
 d1-20020a193841000000b004a468b8c2admr2608599lfj.4.1673850799561; 
 Sun, 15 Jan 2023 22:33:19 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056512348200b004b572ad14b2sm4912304lfr.251.2023.01.15.22.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 22:33:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/3] drm/msm/dpu: simplify blend configuration
Date: Mon, 16 Jan 2023 08:33:16 +0200
Message-Id: <20230116063316.728496-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
References: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
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

Rewrite dpu_hw_ctl_setup_blendstage() to use static data configuration
rather than using a switch-case. This simplifies adding support for new
pipes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 156 ++++++---------------
 1 file changed, 45 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4d70dcd46c9d..f3c15b5a2099 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -379,14 +379,37 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
 	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
 }
 
+struct ctl_blend_config {
+	int idx, shift, ext_shift;
+};
+
+static const struct ctl_blend_config ctl_blend_config[][2] = {
+	[SSPP_NONE] = { { -1 }, { -1 } },
+	[SSPP_MAX] =  { { -1 }, { -1 } },
+	[SSPP_VIG0] = { { 0, 0,  0  }, { 3, 0 } },
+	[SSPP_VIG1] = { { 0, 3,  2  }, { 3, 4 } },
+	[SSPP_VIG2] = { { 0, 6,  4  }, { 3, 8 } },
+	[SSPP_VIG3] = { { 0, 26, 6  }, { 3, 12 } },
+	[SSPP_RGB0] = { { 0, 9,  8  }, { -1 } },
+	[SSPP_RGB1] = { { 0, 12, 10 }, { -1 } },
+	[SSPP_RGB2] = { { 0, 15, 12 }, { -1 } },
+	[SSPP_RGB3] = { { 0, 29, 14 }, { -1 } },
+	[SSPP_DMA0] = { { 0, 18, 16 }, { 2, 8 } },
+	[SSPP_DMA1] = { { 0, 21, 18 }, { 2, 12 } },
+	[SSPP_DMA2] = { { 2, 0      }, { 2, 16 } },
+	[SSPP_DMA3] = { { 2, 4      }, { 2, 20 } },
+	[SSPP_DMA4] = { { 4, 0      }, { 4, 8 } },
+	[SSPP_DMA5] = { { 4, 4      }, { 4, 12 } },
+	[SSPP_CURSOR0] =  { { 1, 20 }, { -1 } },
+	[SSPP_CURSOR1] =  { { 1, 26 }, { -1 } },
+};
+
 static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 mix, ext, mix_ext;
-	u32 mixercfg = 0, mixercfg_ext = 0;
-	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
-	u32 mixercfg_ext4 = 0;
+	u32 mixercfg[5] = { 0 };
 	int i, j;
 	int stages;
 	int pipes_per_stage;
@@ -401,7 +424,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	else
 		pipes_per_stage = 1;
 
-	mixercfg = CTL_MIXER_BORDER_OUT; /* always set BORDER_OUT */
+	mixercfg[0] = CTL_MIXER_BORDER_OUT; /* always set BORDER_OUT */
 
 	if (!stage_cfg)
 		goto exit;
@@ -415,119 +438,30 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 		for (j = 0 ; j < pipes_per_stage; j++) {
 			enum dpu_sspp_multirect_index rect_index =
 				stage_cfg->multirect_index[i][j];
-
-			switch (stage_cfg->stage[i][j]) {
-			case SSPP_VIG0:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext3 |= mix_ext << 0;
-				} else {
-					mixercfg |= mix << 0;
-					mixercfg_ext |= ext << 0;
-				}
-				break;
-			case SSPP_VIG1:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext3 |= mix_ext << 4;
-				} else {
-					mixercfg |= mix << 3;
-					mixercfg_ext |= ext << 2;
-				}
-				break;
-			case SSPP_VIG2:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext3 |= mix_ext << 8;
-				} else {
-					mixercfg |= mix << 6;
-					mixercfg_ext |= ext << 4;
-				}
-				break;
-			case SSPP_VIG3:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext3 |= mix_ext << 12;
-				} else {
-					mixercfg |= mix << 26;
-					mixercfg_ext |= ext << 6;
-				}
-				break;
-			case SSPP_RGB0:
-				mixercfg |= mix << 9;
-				mixercfg_ext |= ext << 8;
-				break;
-			case SSPP_RGB1:
-				mixercfg |= mix << 12;
-				mixercfg_ext |= ext << 10;
-				break;
-			case SSPP_RGB2:
-				mixercfg |= mix << 15;
-				mixercfg_ext |= ext << 12;
-				break;
-			case SSPP_RGB3:
-				mixercfg |= mix << 29;
-				mixercfg_ext |= ext << 14;
-				break;
-			case SSPP_DMA0:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext2 |= mix_ext << 8;
-				} else {
-					mixercfg |= mix << 18;
-					mixercfg_ext |= ext << 16;
-				}
-				break;
-			case SSPP_DMA1:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext2 |= mix_ext << 12;
-				} else {
-					mixercfg |= mix << 21;
-					mixercfg_ext |= ext << 18;
-				}
-				break;
-			case SSPP_DMA2:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext2 |= mix_ext << 16;
-				} else {
-					mixercfg_ext2 |= mix_ext << 0;
-				}
-				break;
-			case SSPP_DMA3:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext2 |= mix_ext << 20;
-				} else {
-					mixercfg_ext2 |= mix_ext << 4;
-				}
-				break;
-			case SSPP_DMA4:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext4 |= mix_ext << 8;
-				} else {
-					mixercfg_ext4 |= mix_ext << 0;
-				}
-				break;
-			case SSPP_DMA5:
-				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext4 |= mix_ext << 12;
-				} else {
-					mixercfg_ext4 |= mix_ext << 4;
-				}
-				break;
-			case SSPP_CURSOR0:
-				mixercfg_ext |= mix_ext << 20;
-				break;
-			case SSPP_CURSOR1:
-				mixercfg_ext |= mix_ext << 26;
-				break;
-			default:
-				break;
+			enum dpu_sspp pipe = stage_cfg->stage[i][j];
+			const struct ctl_blend_config *cfg =
+				&ctl_blend_config[pipe][rect_index == DPU_SSPP_RECT_1];
+
+			/*
+			 * CTL_LAYER has 3-bit field (and extra bits in EXT register),
+			 * all EXT registers has 4-bit fields.
+			 */
+			if (cfg->idx == 0) {
+				mixercfg[0] |= mix << cfg->shift;
+				mixercfg[1] |= ext << cfg->ext_shift;
+			} else {
+				mixercfg[cfg->idx] |= mix_ext << cfg->shift;
 			}
 		}
 	}
 
 exit:
-	DPU_REG_WRITE(c, CTL_LAYER(lm), mixercfg);
-	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg_ext);
-	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg_ext2);
-	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg_ext3);
+	DPU_REG_WRITE(c, CTL_LAYER(lm), mixercfg[0]);
+	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg[1]);
+	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg[2]);
+	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg[3]);
 	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
-		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg_ext4);
+		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg[4]);
 }
 
 
-- 
2.39.0

