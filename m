Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB3712600
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 13:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0D610E7EB;
	Fri, 26 May 2023 11:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8344810E1C8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 11:52:07 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f606a80d34so4896055e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 04:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685101924; x=1687693924;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=94lOxsLEFjNeUwsBx4SaU5IrAwgtw5WWI0FQECJPg/E=;
 b=QR7LsiBBs85Pai0DwtnlFfzUYDkkQShckxJbj9SwuLSADIADR2i/l3xHaMffLEBgTl
 R/k1RCTFIy/O+2RwsmkE3olt01XOPwMziGfMhCe/dpNWkAvP+C01U4YWkzYjnH+m9aUQ
 f1UK1ZLyeilbWyknk6yf94kITZErWvpbTiQmKvOvUjoniQr+HZO2HYNdBdVxQ01u58ob
 jtwXybedyR8jCAkpeP7ZtnAtJeRv7PBVjck+frZlndqi/n7wCpVBXHchYmmIZfIqT2KT
 tsnfKDqmIuOCXMRukK5a5r7NameVHM3ElYDWEqS9sRzbk/hBTAfIoTmPrTmsjLmBXhME
 PxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685101924; x=1687693924;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=94lOxsLEFjNeUwsBx4SaU5IrAwgtw5WWI0FQECJPg/E=;
 b=IV6F33EdRKTydvhN9duGaQbH8IePhv1u7z16Z7EzsOVSFsKmWgKUNV6NfdjL3znewp
 HBTyngdfex8nhP+HZtBSqR4lA9uIyy+zWubNIws+UmQ50AR7R4wrrZwRwyRNb9BQf3Fc
 yD8UIVy1XHxmo0HAd5GmhdhzA5HAAEJWdw9Y7McIp86Zo8sM5udKNreAg7OqwZ12Zn47
 8ZMuuwLw2TEsM3Y5aTiqkhd7+YfirAQ364gkEM9t9wwEVVN7awPyZruxFvOFyH0E68e0
 zvtR8oP8vfHOS/T/2cBYOCUY1uGn2Kck71xd69teq2k8cMKwwlDH7E4shAkqAo3cQvTp
 NCsQ==
X-Gm-Message-State: AC+VfDwn+zQOLYq380m9niRqVsAV4ymwx+UbzU8BPdbYJXnCLWLpHbj7
 O3WYIizMku1iqIi1ip8zAQaKqQ==
X-Google-Smtp-Source: ACHHUZ6/7YDYu2DrYFOko7cae4ceje+2MQW67ePdGrI9Wdm3un67/ARE6Gcse9uzeVtUdeAVlrmvkA==
X-Received: by 2002:adf:dcc4:0:b0:306:2b5a:d8db with SMTP id
 x4-20020adfdcc4000000b003062b5ad8dbmr1112003wrm.23.1685101923983; 
 Fri, 26 May 2023 04:52:03 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d4a4f000000b00307c0afc030sm4920185wrs.4.2023.05.26.04.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 04:52:02 -0700 (PDT)
Date: Fri, 26 May 2023 14:51:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
Message-ID: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Liu Shixin <liushixin2@huawei.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Static analysis tools complain about the -EINVAL error code being
stored in an unsigned variable.  Let's change this to match
the clk_get_rate() function which is type unsigned long and returns
zero on error.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: In v1 I change the type to int which was wrong.  This is a different
    approach.  CC the freedreno list this time too.

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..25e6a15eaf9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -979,13 +979,13 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
-u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
+unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 {
 	struct clk *clk;
 
 	clk = msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, clock_name);
 	if (!clk)
-		return -EINVAL;
+		return 0;
 
 	return clk_get_rate(clk);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..961918e5a5b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -201,6 +201,6 @@ void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
  *
  * Return: current clock rate
  */
-u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
+unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
 
 #endif /* __dpu_kms_H__ */
-- 
2.39.2

