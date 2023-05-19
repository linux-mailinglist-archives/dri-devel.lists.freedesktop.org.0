Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED71B70984C
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 15:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B148E10E119;
	Fri, 19 May 2023 13:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2644410E226
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 13:29:24 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ad89c7a84fso36162071fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684502962; x=1687094962;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aSc4FWFPOC7I3VWo73gY6L/30rahECGBPz2uIJ+lIl8=;
 b=WhLqizIUe0ihV8op6KYQ0ETVO1lZwrmjCRYqWNskYT4M3x6dwxEX/V+1VnG7Nb1DyG
 0GQfht9+nzzHag994JeqCPRSHTLir5EovjTPlbjcFfRY8iNgvHcdzuszw76BufcbftcR
 bbHC1HS2uRbBmdWLpaTJh2akWO8ABZe2e1xPTFJxzqErbQcAe6so5wu5yVOxrFY9WYS6
 ObVRDZz6qOQIQphahTtRDSndv3iDWoRg+kodvI38/oQsEr3dj64qmjjkNty9lBu6u61o
 cRBeb+WTDxkNMdRXl1dHwkthjorYO6mk46zBmfa93w2hQ1MTh/NKgJLNzcJJvD6okzig
 HtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684502962; x=1687094962;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSc4FWFPOC7I3VWo73gY6L/30rahECGBPz2uIJ+lIl8=;
 b=eFoIR7ljcdff3mcyVzVZ/C/aAgLc6gNIQfKCpKJTODOidKrQiduQ1InIBCEFd9/2Sa
 rVEwy8A8ZfOIpPDmpzKfYgf6LsNiRjXk+bKdf9Ye5Z4wMWABcMjkGTKQfYSFTmNHbv4Z
 IcBaNLklt6eyDwRhsjjK/hcUV4BaWwmUG8joiai/YmWnjXeBCJwARcBJwcPumFdljKeL
 1seV7VIbLUgAP0DqU3mk5xK+4auOsRmWyd2iHuOzVBWVHjxq50FNrjvXBt75yHHzcZhP
 X0HjSLzaO9inStdgrm6YnCLAplpRABo5nC6TUUA7NE2FCcFtxNMqQu/cUrg0b+JnsXdq
 yf/Q==
X-Gm-Message-State: AC+VfDwB3zwZgK6zE2HFu1l2xuhgfPNs+QsFg+St7QhHR5N6W+LVYt35
 /ENL2fmJJYzspYOgMVOrDjt9xA==
X-Google-Smtp-Source: ACHHUZ6oQv/6he5gGsXdMkQwEMtJlcbnBQCVhPWcr7LRJ1ol8If4CkHMG4T72Ez2SOllmCtresWkIA==
X-Received: by 2002:a2e:87c4:0:b0:2af:164c:fe2 with SMTP id
 v4-20020a2e87c4000000b002af164c0fe2mr912523ljj.5.1684502962058; 
 Fri, 19 May 2023 06:29:22 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 06:29:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 15:29:09 +0200
Subject: [PATCH v2 4/6] drm/msm/a6xx: Ensure clean GMU state in
 a6xx_gmu_fw_start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-4-5b9daa2b2cf0@linaro.org>
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=1213;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=AafR4gmpdLdCW49giEqj+iQDIXWZqQQlcHizyhfpHRg=;
 b=pn8OzaI5Ri6hDvb1u3A6LhAH/dRqj6QnBpKwRfCAUssKQJEc/UFbcCZZluulJqAJ8z5pIPGJ3
 Tgrjt9hQs5UCewF2cCU5c8ZpISMVuhyKSrMMyazf8e/v79yi6BQEW+K
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While it's not very well understood, there is some sort of a fault
handler implemented in the GMU firmware which triggers when a certain
bit is set, resulting in the M3 core not booting up the way we expect
it to.

Write a magic value to a magic register to hopefully prevent that
from happening.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e16b4b3f8535..ea6d671e7c6c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -796,6 +796,12 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
 		(1 << 31) | (0xa << 18) | (0xa0));
 
+	/*
+	 * Snapshots toggle the NMI bit which will result in a jump to the NMI
+	 * handler instead of __main. Set the M3 config value to avoid that.
+	 */
+	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
+
 	chipid = adreno_gpu->rev.core << 24;
 	chipid |= adreno_gpu->rev.major << 16;
 	chipid |= adreno_gpu->rev.minor << 12;

-- 
2.40.1

