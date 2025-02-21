Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1234A3F874
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F8C10EAAA;
	Fri, 21 Feb 2025 15:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PdPOfVSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B67010EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:15 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-abad214f9c9so37889266b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151513; x=1740756313; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aig57uYJrFI1rR0Npc+LI3qdVee6ZxW9yHVBFNwtitI=;
 b=PdPOfVSQ4h3cTirWUkmtEcH1ffjmOlY2RYm4o854NMmUY2qSCnGY5dBaGefGK6lH7q
 T0XdMNVfFTtEJCDDSV7B8aBnnNr5ydTxgh7q2lOYok53KJYqNggD5L8gqLPL6DjiUMLl
 x1kZSf1jT/jzBeqW22FoVM8EaRbKnmQqmZGQqBSAtQcEgAr2hZke9YTQHQhEvtht5MPO
 7rkSoZYzCRFL/JoKaprkui4vKLxDjWANvmP6Z/5JNNvw5ly7Mx+C92+No7a8skAD1SAe
 xaVfbH/Pr6x0ikVU59GjLMx0iNYh7fxZKPrWaCjC/11WymeTue+6xrM8Jyo89Rulbq2d
 uYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151513; x=1740756313;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aig57uYJrFI1rR0Npc+LI3qdVee6ZxW9yHVBFNwtitI=;
 b=ibJiEsekF4Pgm5ah8LPGTkPfNWZC4MrrkZcpxxDVvyj1hTeUEvBuoZKnV4NOT6BGMG
 0Aanw6nqFwXuu7jPVieyw9kU3TbrOoW3PdO+NtLFigjqGnm3P2Qoj5aOyty3q3XKwgi2
 bP/gixGuRiAqm1ZdS6XzHmWVQhbmlljACEpS4pVCil3H8JFUDzSlDghjBS9yZJ23Qxe9
 gnCg9VP0qg41dWLtPYSVEl78X0t99ihDwygteaYWg4X9JVk54Qp6f/6iLudyjEikz7lt
 b5PEgA48yRv5M+AuQKvvKNHNneszzOJzBrvmAm73NZ8HYbqpchVGLObQ50rMI+of3WAR
 K4mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA8TXfNQ11B7HqDpKddohK2MiWZfwsmRpj9cKd0YAeClftbjwX1EEwTdoDY1rIeCbLNt8RHcYqqh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy7hEsaKVzsdwuO11rDESxmJRoAD+2iNfDMmsrAWFevEG0/ysz
 iwKvVgOfdnlFed+AcQcoSEXf8m0iRYkTQge9OnHR45lIXAB/VJ6M4DEGQ8Cl0Y4=
X-Gm-Gg: ASbGnctb71leFH2A+kbPuTe1jx4l5VxogEFhcGYjIzTaXckb2Nmf1Z926xgi+oFpRns
 VILj4ubZ33CP77Y11ZmSJtajjsSqD7iMLIuTN7N2AZqqd0ME11oFqvpwNKqw/iItF9E72YxyE1d
 jVyMocD6X0ZcAtMjV985fMPM9HuZF6/Xv3pMSbF01cllPe9OKM8gy7LYrEJ+zVJXRp1igPB16kF
 UoHshQYHv6ZUggTvfzpapqhTDq0Ep+qImjIPBjjBIco59kFrp5b4pqu3tai4oE5sMheouLtCTsG
 Wfszs0cS3wGGKMcJkG0g1k/5ot9fucGRyGhG2VF5zcvhkVy0TLh3IHFhV23nUoNEdJRjiG3PS2s
 T
X-Google-Smtp-Source: AGHT+IHdJOjKrzQzkQQRCXSbAnLH5FFessN3GeskMAbLKgYrjEA9y24pcdZQtQV3lv+cDs99o+UQfg==
X-Received: by 2002:a17:906:dc8a:b0:a9a:2afc:e4ef with SMTP id
 a640c23a62f3a-abc09a97a18mr157000566b.7.1740151513561; 
 Fri, 21 Feb 2025 07:25:13 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:22 +0100
Subject: [PATCH v3 12/21] drm/msm/dpu: Drop useless comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-12-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Rtqqvrg7pP9bsyM3YOU4Po/H2xEipMowzn5M0FXGvfw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq2+0BckVlsV5NQsH+fOOk+tgIU+W0cwtdk8
 5PAQ0lltK2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iatgAKCRDBN2bmhouD
 1989D/wNvFmmF2NaNbzyERRYlayAx59GBiMJg46dVMuecOeKpYw7e23TtYOBE9e7+w2dhIx2aUP
 J4cLUKshVRrUNa4/xJQ7R+qK5+CzhpVoZT8X8QYnQ6nevWv4GpW0L7gB2RPc80DT0lNDL7kOdeD
 CVY15jrscmSWYkScxCbl66kCdaxVMEa7cHpGcmKaZtEhwU6XSFsLHMvDOp1vlYuzDMtA0sVm8FM
 NK9lbP4oAfJZ8+rxi/0IuSpRozbwrmoOkXrO3uyxbEc9m3XFp7eZ7J21qmObzy2ThScv+QO/yIN
 6H7MRnplfjyV5QqKExYW0tYeW8c20GMFl+SmTQ/TnkVLWZV73pnkm4Z/HJgXd4ZCHoNJkQFZKjt
 cjieYatKU2V4CO8C1dB7eweIn5Qkunm57Y91nRDKWMLJIgFEuAE2PMiD4aRCEb4czTtyUOzZxEm
 A/eUZFbxkYkYMe55NEcdpybTwFeuouDPqOODoNFysGa6KBOkGtBZPqZusfjrnxEhEg0sq9N6cYG
 gtzArVSBRBjTfh75jckfEYuzK5NUaT/mfg0soWqaECcu/PbVJf6IpuqU9UvxW5bsku/BuklYAfH
 K3Dueo8PwMsy8oTnKJbqN36/Fm6wfp4wZ6iagAhFLke/sSx+MWlHfocl967zWudT6Z1UYYkPbzj
 KmVHudvaqT+tP4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
SoC because it's duplicating the actual name of structure.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 7ea424d7c1b75e06312692225f4e888e81621283..4ff29be965c39b29cf7e3b9761634b7f39ca97b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -362,8 +362,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
  * MIXER sub blocks config
  *************************************************************/
 
-/* MSM8998 */
-
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -373,8 +371,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	},
 };
 
-/* SDM845 */
-
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
@@ -384,8 +380,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	},
 };
 
-/* SC7180 */
-
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -394,8 +388,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-/* QCM2290 */
-
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */

-- 
2.43.0

