Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566A801F2F
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 23:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8315D10E029;
	Sat,  2 Dec 2023 22:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A111510E22F
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 22:42:52 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bb8ff22e6so4575798e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 14:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701556971; x=1702161771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zovWCGMEaCBXEAS5mSNY7Kpzzx6U3mmVxujhNd8FwI=;
 b=iGXUoQLTFpgPwM5TuWjsLY9HuTfr0YuqN5gQbcQnRtD5P+RTGu6tGoqW8SH7F7fAxb
 GOz3O0gkZNkrIgKPla77UGL9+9rJj0yFmjtw/GFZQ8L1wJHFCsoCq0v70YXM/ZXwfKin
 fFhbFJLX06bLH5e8/qIu93W+xBUtnSPcLpn5SvK+MyDmgL4cNVTiLz5xRbi20LRDthnJ
 puzg7mIJCdtvuoWA2nmyo7ns9UyGbplmsw7jAQ0+dkQgzPc50LsioULATeCc/wZxg80R
 Ru0EwmLRTt9kYjVSTqgAJ7mwPcHI28X9CSsLTbBBUU0p/1GxDHjyXCnzjGV7LM+D3VIF
 Obvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701556971; x=1702161771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zovWCGMEaCBXEAS5mSNY7Kpzzx6U3mmVxujhNd8FwI=;
 b=AwygKpfrRrf3qwmI6hfv+D27nTzNXqfKJbPL+ZAdUl1o1OOdDLsFTrQ/v1yrHsgws0
 6Lt/7c4el5F7JLOd+Xo6UvhwFoqqutcbx5aDdpYx/ilso6UM2wTDINQ1e+q8F19bceyP
 XgGybEdtrcgRbjbVE4b9bWlN84BJO6LLDRICctCwL4VR4RVLOTBxJIiN91TGez6WUgKx
 Q4nLcT3rzyuBS1IGzL4N5sWdOgrpFSZym8Bo43AE/chfgrTXXSBpYfNdsR5Fwr0C4PKP
 otwYmpInxdPBKMUcdlvdgFrHq3LSupi61uC6l7P2d+1GKOA2U2jyAxNrynicN/NbScZF
 P4GQ==
X-Gm-Message-State: AOJu0Ywlbai8mRUYArE59vdWvU+L1NOr4dr19Knu/cL16omVTUDSBL67
 cF/+SqH+xbSrwSCuPY5uCccSQQ==
X-Google-Smtp-Source: AGHT+IGCx/hr9NPk4n8oWXdCugVcqzn1jGMHeBV9inPV/Mf00IxYZnUA8gjKRMpAvoYKPjvV+1LA0w==
X-Received: by 2002:ac2:5989:0:b0:50b:ec8c:a293 with SMTP id
 w9-20020ac25989000000b0050bec8ca293mr471560lfn.15.1701556970837; 
 Sat, 02 Dec 2023 14:42:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a056512051400b0050bed700f5esm187015lfb.91.2023.12.02.14.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 14:42:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 3/4] drm/msm/mdss: inline msm_mdss_icc_request_bw()
Date: Sun,  3 Dec 2023 01:42:46 +0300
Message-Id: <20231202224247.1282567-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are just two places where we set the bandwidth: in the resume and
in the suspend paths. Drop the wrapping function
msm_mdss_icc_request_bw() and call icc_set_bw() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e1b208fd072e..eeca281e9d6d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -66,14 +66,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
-{
-	int i;
-
-	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
-		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
-}
-
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
@@ -227,14 +219,15 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	int ret;
+	int ret, i;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
 	 * that the interconnects are at least at a minimum amount.
 	 */
-	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -286,8 +279,12 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
+	int i;
+
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
-	msm_mdss_icc_request_bw(msm_mdss, 0);
+
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
 	return 0;
 }
-- 
2.39.2

