Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8468E74B74C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 21:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E1E10E5E2;
	Fri,  7 Jul 2023 19:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCFA10E5E1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 19:39:47 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so3537855e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688758785; x=1691350785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
 b=TSmNh5jSebPGeymulBDAEcubNE5cn9xQeWeeImrgx/Zzp1QzZacwkj+LIkcUCmXcoX
 UnfhUgHRj5FUcwnyNF05DlhwqEKeolRqmQdfSgfGfz/CsBfzg8iHlx8+cfmiX84bGTjz
 3Hmujaw7GS1NUQGRzsJxPAbDEHVupaEyenZnkUX7dkToVty+L2Jlqr+emV1Gms+VqrWP
 c80FOzhD48gg7JtasLqCb0zxeqc7rwvkP4hWaixVNQf4lfnkDd6ec6+yIhlIXV7Zds+4
 RzLRBcl7CSrIr1LvcDUs6tcHFqvBDzaWm+2AaAiZum0QOOrf2vV31kaEbe9oTZbCwkw8
 cTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758785; x=1691350785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
 b=Bc6GWhnsRA3qAbyXaIVhQpYQ/YYuBHagMsOQu4b45ajXmjcqGjYlHFR1NZ/zKccaW5
 0w5XEyrW2KNZnxl0UFK5P8mEH8MPo1d6D3qRn3E98PYSZQALwR55ntpEUPrWtfBgt4KB
 zufVRwqgHVFIDclPsDHb/q60G/OggqHCVoUeX+pF7ms2Jo+nSkpuMIgw04vy90iPezJ1
 tv7hIhkx4FfVS4iRkI3rHB0dx5WPvplC6O7LpmKPgxN7QFeScM4+mAc34cahECBG/+Zv
 pfVGqR7lPoDGrSQ9nXv4AvH+BmLEF7z5aXf/gtrj7Z1ZJ1/RJxiV8NOYmgDMqiDOp5Mr
 BbfQ==
X-Gm-Message-State: ABy/qLb30opD4r7JemlnEY7wf2HpXUvrY3fO34olK9VIQpdcMKazRfJ1
 lJRIZyjq3If9zJco3GQar2kdKQ==
X-Google-Smtp-Source: APBJJlF9I+uOMWU3r1bX/Qzz+m3+Ve61FTi0gpIC8FEbD7mHoduGOmKBdvKypzuq/c3Kd4tzp4L0pw==
X-Received: by 2002:a05:6512:33ce:b0:4f8:5600:9e5e with SMTP id
 d14-20020a05651233ce00b004f856009e5emr5377782lfg.47.1688758785404; 
 Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 03/11] drm/msm/dpu: core_perf: bail earlier if there are no
 ICC paths
Date: Fri,  7 Jul 2023 22:39:34 +0300
Message-Id: <20230707193942.3806526-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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

Skip bandwidth aggregation and return early if there are no interconnect
paths defined for the DPU device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 333dcfe57800..05d340aa18c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -237,11 +237,11 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
-
 	if (!kms->num_paths)
 		return 0;
 
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.39.2

