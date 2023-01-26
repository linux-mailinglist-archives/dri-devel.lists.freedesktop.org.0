Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D367CFC4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADFB10E2A2;
	Thu, 26 Jan 2023 15:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942E010E294
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:25 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u21so2157145edv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqTPYHx/hvizibC2oIfeh1taRPi/dzef4/4GDfwh7Dc=;
 b=KsgaCMzJGUttXQbMZMLFzqt5edS2JcAVI4+R1nFjny115+xCxVFm9Kv/SLnAzTzI+E
 qNGehiy4EkCTNEAe1345QISl0Q0j2ZnUD78xWmYuc3+dBajuWDZyoEOqu8fLkfJa55UX
 4L9xUKNkjnZWbB0qsV1/L1rFSNzvnY9609dhOZ2MqvpLpw/JNlAvah0sQgwQdrbXehi6
 SXDrYzDh+9vZPZWsZOxiY9ybCMO5MkxhZUC4IrY4ibe581wfYo5gnT2zxP9g4ZB7mjH/
 UAqKu0fISq5b09kZoSASxmyq3l3UDjzk0S443DyTsvkuI8w+30YDo56q5TM2y/ugNCPH
 ufrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FqTPYHx/hvizibC2oIfeh1taRPi/dzef4/4GDfwh7Dc=;
 b=Cgo+ai21s6LfxuvIclCruUtyi34QO0glF4pJafyeR/LWnhWMftyLMDE19BAaz19X40
 2lyyD5O69UBSol8xQlUymcZFH1t3vtQAhACubibDfVkgxcSGnPoUCm+Gc8G0B1eI6Kny
 jos3px11X0tPQt8d6PNB+53ybtCE07pKpWrLOK842RJ2FXHxFwnRcy/OEU5P4FvrnKWG
 21eis2hW+qfcFsXfXJupwByaQGkoFOI4Gqy27uo8jEHOl8c+99DTEkhLrl6by3NhVTnq
 yV1NON9NW9I/UfpogYvBBHKJX7F3qMd+0EQuC7OnBpz8Wmg1ggif3b0TMjPjmtg9zyP3
 OZzA==
X-Gm-Message-State: AO0yUKUwGQLw/5BDmhZgi6hoQatBd0albJ6kJofbiLvFFW9RQhICGoTl
 eNQ+vdJvDcr+pfq9Bn6FruXVnQ==
X-Google-Smtp-Source: AK7set9j/7oS+bafs6ZfNNGeVHpGPgbFsEu7Z9kE7S+kC33GSD1Ulk89vyxivtHiPxAmpydf06Xfng==
X-Received: by 2002:aa7:c149:0:b0:4a0:91be:1db6 with SMTP id
 r9-20020aa7c149000000b004a091be1db6mr8227773edp.16.1674746245170; 
 Thu, 26 Jan 2023 07:17:25 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:24 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 04/14] drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw
 init
Date: Thu, 26 Jan 2023 16:16:08 +0100
Message-Id: <20230126151618.225127-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we're only deasserting REG_A6XX_RBBM_GBIF_HALT, but we also
need REG_A6XX_GBIF_HALT to be set to 0. For GMU-equipped GPUs this is
done in a6xx_bus_clear_pending_transactions(), but for the GMU-less
ones we have to do it *somewhere*. Unhalting both side by side sounds
like a good plan and it won't cause any issues if it's unnecessary.

Also, add a memory barrier to ensure it's gone through.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 22dac65cfa8c..158d6453cf3e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1004,8 +1004,12 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu))
+	if (a6xx_has_gbif(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	}
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
-- 
2.39.1

