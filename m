Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6A66A081F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF5310EB6A;
	Thu, 23 Feb 2023 12:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD88D10EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:07:00 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f16so10556782ljq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 04:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=17Sj165m9p2RYNMuvknYM96FiMR5+0g8UyAYd2eSrwY=;
 b=OaVrt9YSvRtla+1dIiygzmlR3nNaVMFpvDn384L0qJWtksmJRQUDKCxaZZWVlQCfEC
 yVY/sTl7Z1my97KQY5cLljkTcCh5Hk1vepRrKpPNCuBfYy/njaK8cpcPLZF6P9k23RrX
 /whd3tqZjOeyigL/Piz4Tme2/HxhqOywVC7eefN9C+o45UMgCemRcIaLx7AjDucI2/fH
 aJRFbudDz7f0F7q2soV1Rqw4nVBnaf9hRuLKPWkq3Ewe+zthtl/V3DZBRagdQ3mC9+un
 yeV1cVpGh+DjODjNWd5768OSzpAJoyKiCx96d9mHeUS9JqOOLKta71LvPW/doxbxhdG2
 THaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17Sj165m9p2RYNMuvknYM96FiMR5+0g8UyAYd2eSrwY=;
 b=jmxC+qRA5nu0NvHa9rHJnIJ8HxUU1EgkOCZaI62KutWxTjRg8eAoLmqolXfNZxC5X/
 1tIafPw+qyEE87TK7o3SLP59t46c6SF687vOZQcu2DzbM/vAExbFJ53tpUjyykSiVU8h
 LE0/h+VuCWL/bYudrs6oWZFkz8NCLgrTrl4ir7v/nKvgBNyR0QfXM7CwXIeY2WN9t7JE
 ClYFb1TYpolTqzjSnvzhV5cM8SNZqqSXWjMUV61Ii+P5+Cm/UZsrGOriIg0eveaMU01f
 cLORh8XkvTXwxDX61tpbqWzmCHROVPPdmC5hM/SVg3IVuQCBArtrd7+x7p5ocXQAe1cQ
 2E6Q==
X-Gm-Message-State: AO0yUKWcMcgP49lB31/lfnyxfpBMcwx6q6I6O8Fy7QL6/JuelxxgdqCJ
 /bLtSZIs7GFtXmSvaDQj5QAB3Q==
X-Google-Smtp-Source: AK7set8MP0MVTI3jKda/9hAxOgPBZ+85qvmspDgfRoXhIC5bbZP+ZlbqQXJvF9pw2sqjfvnn59QQEQ==
X-Received: by 2002:a2e:7d08:0:b0:293:51ba:24b3 with SMTP id
 y8-20020a2e7d08000000b0029351ba24b3mr4316167ljc.41.1677154020326; 
 Thu, 23 Feb 2023 04:07:00 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:07:00 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:44 +0100
Subject: [PATCH v3 10/15] drm/msm/a6xx: Fix A680 highest bank bit value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-10-5be55a336819@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1043;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XyF/fIhqGhaqw/LSLnLQoZLpoApnz2Tm2KTMjRETKS0=;
 b=KNcnjoD9rWmy5mT4YH7OnatzxLE4iAZRwnM2y6dLWueGTxPwo3uCMS0NPrLwqJpUq5uh442AJSwo
 cgRHrMA2AlIAq7g9yAw9JnDnekIYxgGTePs30xvYuP3cIFpemrAR
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

According to the vendor sources, it's equal to 16, which makes hbb_lo
equal to 3.

Fixes: 840d10b64dad ("drm: msm: Add 680 gpu to the adreno gpu list")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b5017c56fa1b..2c4afecdd213 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -885,12 +885,18 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		hbb_lo = 2;
 	}
 
-	if (adreno_is_a640_family(adreno_gpu)) {
+	if (adreno_is_a640(adreno_gpu)) {
 		amsbc = 1;
 		/* HBB = 15 */
 		hbb_lo = 2;
 	}
 
+	if (adreno_is_a680(adreno_gpu)) {
+		amsbc = 1;
+		/* HBB = 16 */
+		hbb_lo = 3;
+	}
+
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
 		amsbc = 1;
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */

-- 
2.39.2

