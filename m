Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0A6A0813
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A30310EB55;
	Thu, 23 Feb 2023 12:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB7210EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:06:52 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f16so10556376ljq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 04:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yok0nZYCkQzxSnQH2ARjVTx35nRR0F5PEOqTZ3qXsIg=;
 b=fjK9mQMHjiJBcH8lJSmhfwJ1guQBiffFrAHUEesmbGMfPi/qxDnZpY3mWklZQR2i5E
 9ZmXJQTOXcr7O0tCcKP+Erhi3ddwYBq213n6EZGB9LST6IfqqthXYvFXKB9iyrBGpc3w
 RTZJX8bVzX7Og3UDQme1cZPCp7Gg2KEKLewRMAu2I63yiU0zycPPZEkXo6NpB0UApNDr
 SojQ830IEskj/eMyJ3+3uYh6Apx97KNjqpHUp9YZx33s8MUEoArR7hOh+yb2q3nvHQIS
 IRo7XbwDrgSIVRLBrH91OEJm3E/WeMws0yKA0yXdjwOAKj6X4qwtiOalRU3SymRuNIzb
 OOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yok0nZYCkQzxSnQH2ARjVTx35nRR0F5PEOqTZ3qXsIg=;
 b=UmxQJaPY9QDS5Ff9hfoGIZxi7UjTozh8fYeR9UP1IXX6XVxXFbSvwRD5DjzExsgPzs
 7K904XptKZaZ2WxMCVrjLIrIjuj42hX463GQRu5gzECREMJbmJSiPXYjnOHb1VBMW6Xd
 TwY/MrC3Z6UQ0lWSF266GiLsq2irM3+mM0a3+v3X3laNmylh9/2xi8D18NVIrzctUHKs
 d1sEQ2Xh4YqK8aD3xfwq+o9fVyBQI4/XMKQCqWcC08QIcX+fUUjQcYg/ccdv6U2SRzPq
 j4IjXnVy+dhbV/SkD5iL7YATZVQ8B2ny263BDkYEbaLtZWDNn0E74nkqh6o1xoe/g0iN
 cwFg==
X-Gm-Message-State: AO0yUKWNE5Sq/HHTQsOjoK6RJXqKks7iI0t+hCpjQIPxHfrsRH5zH4iq
 H1pkk6Ehd4paC305XAvmyOJvBQ==
X-Google-Smtp-Source: AK7set9+muLeS8omBNFXVt2ooyArZ9d0ehG53aDdyK1AO7H7lGgWfu/kVblTx/Iozx6yBlLtZMmIpQ==
X-Received: by 2002:a2e:9c83:0:b0:294:6b6b:a107 with SMTP id
 x3-20020a2e9c83000000b002946b6ba107mr4037985lji.11.1677154010724; 
 Thu, 23 Feb 2023 04:06:50 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:06:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:38 +0100
Subject: [PATCH v3 04/15] drm/msm/a6xx: Extend and explain UBWC config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-4-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=3668;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ZV6EzEXHb+xbzACmaZ/VhfWA/cvjDBSL9a0mYvB+qs0=;
 b=U8fHI/+kFCvPN7Wm7L36lKFckvIw+eIRkpTnbaEaoxftwLkSrzu/4cRmFI28a+6RxntgwF57AOFJ
 1wiSJ9CMC3+J6psEFNrwSJbYv2TK08N8snTCel/+DC1oT+KlmbL+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename lower_bit to hbb_lo and explain what it signifies.
Add explanations (wherever possible to other tunables).

Sort the variable definition and assignment alphabetically.

Port setting min_access_length, ubwc_mode and hbb_hi from downstream.
Set default values for all of the tunables to zero, as they should be.

Values were validated against downstream and will be fixed up in
separate commits so as not to make this one even more messy.

A618 remains untouched (left at hw defaults) in this patch.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 55 ++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c5f5d0bb3fdc..bdae341e0a7c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -786,39 +786,74 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	u32 lower_bit = 2;
+	/* Unknown, introduced with A640/680 */
 	u32 amsbc = 0;
+	/*
+	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
+	 * We then subtract 13 from it (13 is the minimum value allowed by hw) and
+	 * write the lowest two bits of the remaining value as hbb_lo and the
+	 * one above it as hbb_hi to the hardware. The default values (when HBB is
+	 * not specified) are 0, 0.
+	 */
+	u32 hbb_hi = 0;
+	u32 hbb_lo = 0;
+	/* Whether the minimum access length is 64 bits */
+	u32 min_acc_len = 0;
+	/* Unknown, introduced with A650 family, related to UBWC mode/ver 4 */
 	u32 rgb565_predicator = 0;
+	/* Unknown, introduced with A650 family */
 	u32 uavflagprd_inv = 0;
+	/* Entirely magic, per-GPU-gen value */
+	u32 ubwc_mode = 0;
 
 	/* a618 is using the hw default values */
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
-	if (adreno_is_a640_family(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu)) {
+		/* HBB = 14 */
+		hbb_lo = 1;
+	}
+
+	if (adreno_is_a630(adreno_gpu)) {
+		/* HBB = 15 */
+		hbb_lo = 2;
+	}
+
+	if (adreno_is_a640_family(adreno_gpu)) {
 		amsbc = 1;
+		/* HBB = 15 */
+		hbb_lo = 2;
+	}
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
-		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
-		lower_bit = 3;
 		amsbc = 1;
+		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
+		/* HBB = 16 */
+		hbb_lo = 3;
 		rgb565_predicator = 1;
 		uavflagprd_inv = 2;
 	}
 
 	if (adreno_is_7c3(adreno_gpu)) {
-		lower_bit = 1;
 		amsbc = 1;
+		/* HBB is unset in downstream DTS, defaulting to 0 */
 		rgb565_predicator = 1;
 		uavflagprd_inv = 2;
 	}
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
-		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
-		uavflagprd_inv << 4 | lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
+		  rgb565_predicator << 11 | hbb_hi << 10 | amsbc << 4 |
+		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
+		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
+		  uavflagprd_inv << 4 | min_acc_len << 3 |
+		  hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | hbb_lo << 21);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)

-- 
2.39.2

