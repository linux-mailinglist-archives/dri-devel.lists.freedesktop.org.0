Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC50765888
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A5310E5CE;
	Thu, 27 Jul 2023 16:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EAF10E5C3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:21:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5223fbd54c6so1520478a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690474871; x=1691079671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/odzKdmyEPbBzzMSszAZAD9v3Trah6OzbxWCSFaBlI=;
 b=i9LhTejNzDVakizSzY8iDoFfqGEumSNLXUQ93fQnkMdNArMRci6ea8Pk319FPhK0Bs
 xNyRWn/A8qd6YtZI5yU92e0uazWnrc3vKtn003fPENssWaquIINJVifg6OeW/sZVfHaY
 DCQ0DoGJ6GwiV1mJXxzvXZ4T/xmwXceDyjkwoYnOc5KKl8NWBLf+XOFIlyFQDnq21YZL
 5hpwyWMb4eD9W4Jhdu8xu7gphTNJNQRqKL7oeDf2w3RYM0kxqZCrvhh9ZT20o/3dlWGb
 4eNo/Q92V46OXlPWRbIZ2yRR5a7BD+hpT1M+I8DkVaYoEtMhrbBk0cDqq2mP/tqWR60o
 yUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474871; x=1691079671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/odzKdmyEPbBzzMSszAZAD9v3Trah6OzbxWCSFaBlI=;
 b=WwTkgFho8EAwqV1KL6MrDAfMXLNuHim37Rf76qURND4bXQuAIOakH1I1RQtaKMwyNq
 97afUkj3Qu8ffGmAxwMbngfKyc+NfAuYGebw72ttSOylTZNN+kSN2/5fSJyuQk24rLT8
 I2YSBqy2TI8joPA3wPeYMXOl89gX4PIpYhM5TALlLj6D727F2Y5S+eW8d0pSYvkJt9gx
 12Rxd9TKUpmHrqKIHA7uT91q3aNv2SzQ5LXxwSgZeQWztek608DsYTdn0VSvv1X9Ja9p
 Sch/RLnSoaFLvzjmAPdciSILdMv2CXym79wK629wV3twmm1Ae4Nu2NiZxSnGes0AxoiG
 35Hw==
X-Gm-Message-State: ABy/qLb7PtDzzIHKZ3kZGmAKjIif7M4ioD3xo68hjqtV832xId+9AO6s
 fbeux04tXpU570lbPs0On8pUjQ==
X-Google-Smtp-Source: APBJJlGafRM25b5sc/vyKh5ECWjQXZt/sJOqK0IPTwyP0etH8Ly6ji359kOnH4K4aPaHDaujXjYe7Q==
X-Received: by 2002:a05:6402:1810:b0:51e:5322:a642 with SMTP id
 g16-20020a056402181000b0051e5322a642mr2237347edy.27.1690474870945; 
 Thu, 27 Jul 2023 09:21:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:21:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 4/7] drm/msm/dpu: enable INTF TE operations only when
 supported by HW
Date: Thu, 27 Jul 2023 19:21:01 +0300
Message-Id: <20230727162104.1497483-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
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

The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
only INTF_1 and INTF_2 actually support tearing control. Rather than
trying to fix the DPU_INTF_TE, check for the presense of the
corresponding interrupt line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 7ca772791a73..8abdf9553f3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -557,7 +557,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 	c->ops.setup_misr = dpu_hw_intf_setup_misr;
 	c->ops.collect_misr = dpu_hw_intf_collect_misr;
 
-	if (cfg->features & BIT(DPU_INTF_TE)) {
+	if (cfg->intr_tear_rd_ptr) {
 		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
 		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
-- 
2.39.2

