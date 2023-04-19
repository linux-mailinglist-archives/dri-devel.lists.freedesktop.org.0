Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DB6E8B38
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1000B10EBC8;
	Thu, 20 Apr 2023 07:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D788710E133
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 14:41:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f182d74658so1661855e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915318; x=1684507318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=836GTkcDRi2+2z0HJ4qWmHnCerN9xvuUtbFVbOWzfY0=;
 b=baHQi3d04LBNOBuAxmRa8A+HZi0CSATDXEXKALd54qg51/ZMXTqiy/deoAlkXb3Ns9
 T+7hwNDw6PJ6AJioYgA3neZjGdb0E+DSnI4WFeL19+FqCrQ2TFEdzEpMqcf9Zuh0+Olb
 bR6FK5w/+QNuNiosi3B6uEqaev9iIsq+N7brfgCjDtj7AK2Q8QDjIPOGPmWzeiFwc1PL
 wBpJqQpYCc1V8qtcAfOEnji2mEh9INPZjNEhYmM/fB3Cix1AhN6yPCbxq7ApO1j04GFt
 rLJrMHNshKmCbGx/jQfiDwTnDNcHtLBcmqDnULs9eYjA6+JImyz4vaF+Mqnn7ApLKuOS
 qoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915318; x=1684507318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=836GTkcDRi2+2z0HJ4qWmHnCerN9xvuUtbFVbOWzfY0=;
 b=FDBgpDXBt/RraOXCOt3ibp01BGTwFxGV6uDfag7ofO7CAc5aRDPmd5pCqAtRWNepmB
 hs9MVJnZQOK4gep9reFtHDzPrJEMfLtw2AxZCWCD9pHR4NOCbm+jupev3NXu8+91eywj
 UWXq5rlFWFho6KTFVjfAgmTtyaqcgFxyP//yHNoelIvsmsVNv0/FCiLkkiNcLbZgH3Ck
 dGgaqIDnRW9EnjS5KUAj7FxPjCCYa+z6TNe0XnVLQTGYimDYOjxNA5VoSFqu5Mbsu9Qf
 0WtiFOrAxkeecxX4/E3TInM600Q+Eh81T5r0lgpaP6RJomIQ0wj7/10vM3H+xvt9KLb1
 SR2A==
X-Gm-Message-State: AAQBX9cM1xxMsF0JhxJvPY3O3qG6kxyWRHI1X0+YcH2Hi3kwv9soY11v
 9DoHrTQrBhhUT//ZVBDmHg4F
X-Google-Smtp-Source: AKy350Z3Xuz9WufoZqxCoYxbq0Xd6W5KfFcqPnl3JWZpyOuA2xlpK+wbnSrbTuHAqTHqR57P3f6p4g==
X-Received: by 2002:a05:6000:c8:b0:2f8:e652:dc04 with SMTP id
 q8-20020a05600000c800b002f8e652dc04mr4711567wrx.45.1681915317898; 
 Wed, 19 Apr 2023 07:41:57 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:41:57 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:10 +0200
Subject: [PATCH 03/11] drm/msm/dpu: use hsync/vsync polarity set by the encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-3-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=xpOaiqpNNEOLuHJaoCWSS7YKv71vYiVAS0+zh3bWo5U=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2aYvMBvH6zGssGiiSjbchn7LFtzFExHjPPk
 Uu7xG862vKJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9mgAKCRBxA//ZuzQ0
 qwsqD/42uGbh/PrZu04lyUsR5hVCa7Xmdo0LCCazacHEC/BYFFlGvWNkhc7PsrezO3YdP7YUkAV
 odihBbhCD/J0kexfj085S9cV1BHejLPWRGLDXOkPAaHolB8DRGM7GfBKbLkvaQE6di3lIA6lJDa
 M/27C2U9iKWSa8VxVhARC5feO5zeTnJJ2khmElSSMb+ycMbEX9a4N+nRvfKN9eSW65dqzzOWR15
 Ti9QXnMq/8FsyVWim/cQvMa8pcZAd9bQvuiJveRI4qoUuil0WTmIFhrwGs+J5PSG0j85xi2LAhu
 UdgEhL4yD8b/DavQRt8bE8JCT8TlSkCv0hLJGBtmHhxKVHqLZVDpO7Xbq8JnX4hVAWQDEVFFOeb
 aU3vXMTGEpZ2/g11Bvn3aKpqdgeOXCeuvWHaBPK5K/gx3MuE/kRlhEhl30NFeQH6jyNbkNyy0xZ
 q9sGqtnNHTLzsWoxxgc16ztUfL9hpLW51GsWAR1vSqcNEfYNnZjBEeaFb5uFlouYRWNFZxuayDJ
 r4PfnBf6O1hgZ63ok55tnZAmvqXF7/mxr91e5diSyx4BTnlxuW0joKDZh11kkLcGacGdj431Tdw
 AxpGO6avO+otXYsvvZ0/H7YXwSJhlklY5/f+UMZSM6udGdxoqGVGdCpwjc3NKdsTtHizBlKtDvj
 9F8RSxj5MR9u+LA==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not override the hsync/vsync polarity passed by the encoder when
setting up intf timings. The same logic was used in both the encoder and
intf code to set the DP and DSI polarities, so those interfaces are not
impacted. However for HDMI, the polarities were overriden to static
values based on the vertical resolution, instead of using the actual
mode polarities.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 84ee2efa9c664..9f05417eb1213 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -104,7 +104,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	u32 active_h_start, active_h_end;
 	u32 active_v_start, active_v_end;
 	u32 active_hctl, display_hctl, hsync_ctl;
-	u32 polarity_ctl, den_polarity, hsync_polarity, vsync_polarity;
+	u32 polarity_ctl, den_polarity;
 	u32 panel_format;
 	u32 intf_cfg, intf_cfg2 = 0;
 	u32 display_data_hctl = 0, active_data_hctl = 0;
@@ -191,19 +191,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	}
 
 	den_polarity = 0;
-	if (ctx->cap->type == INTF_HDMI) {
-		hsync_polarity = p->yres >= 720 ? 0 : 1;
-		vsync_polarity = p->yres >= 720 ? 0 : 1;
-	} else if (ctx->cap->type == INTF_DP) {
-		hsync_polarity = p->hsync_polarity;
-		vsync_polarity = p->vsync_polarity;
-	} else {
-		hsync_polarity = 0;
-		vsync_polarity = 0;
-	}
 	polarity_ctl = (den_polarity << 2) | /*  DEN Polarity  */
-		(vsync_polarity << 1) | /* VSYNC Polarity */
-		(hsync_polarity << 0);  /* HSYNC Polarity */
+		(p->vsync_polarity << 1) | /* VSYNC Polarity */
+		(p->hsync_polarity << 0);  /* HSYNC Polarity */
 
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		panel_format = (fmt->bits[C0_G_Y] |

-- 
2.40.0

