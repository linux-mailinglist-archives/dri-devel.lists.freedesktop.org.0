Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0577B1B2C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD7410E621;
	Thu, 28 Sep 2023 11:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1F310E0E3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:35:40 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-504427aae4fso12522452e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695900939; x=1696505739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6mwojS2vRgU0By0A79lo56wad98V4s7w+Z/gFSHxlY0=;
 b=hk83yfvJTKlUM/r6dgbSubQpg7OrB1OPB9/I/BD6rQ648/e5ME4b4MBceKL57Fzjeq
 ah8yLIy7WRACKzcG0JAWoKXyapiSN+JCCsEOCcgUMaHkwwt3zUXjHQeEXRr80Zgm1+Df
 bc4M7DgFRD+cXTEVduvGxUKGylPrR0XvWUjGZ5eHXKQsS0f+Jhl4es1rMSs9i61/GVUe
 aL0+R7Kp9VNoD4FyrB/0ubgRygkOqfcAjX3CH66fnwODq76Qv00ORZncYWtcHeLXIbIA
 0QQ8rIgduLoRP859lEOMz8R0tsRN8xXpX2MuXREODcPVGOsrA+ZV9TYGspjOFVMUU2sD
 8+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695900939; x=1696505739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mwojS2vRgU0By0A79lo56wad98V4s7w+Z/gFSHxlY0=;
 b=MM9P2iP5M32mnxVYBJO/Ij+QQ3FnfBw0d0l+drAp//aG0YtnmQcVclTBttqQCv80iw
 xOqgYM61PAaaJ5I1gC+eFqBHzL/0MQ643Vo4ZUfyYrQv4AWzsUkvQo97RdggNLdx7OIt
 KCTs02tGs76cUVGtnnUo4FhiM5QJ+SRTwDKXLq+h4YTp3DF2tDZlAfi5emItBBOGSB3a
 It6ruvswqkjTtmaaz2bPTEG4nBoII1hUxdHfZOgMOARTnBMKxxG2rlknuEONtl6v3akX
 z1yuajPKvZvddDqBfKzA7sJTeKHG4a/Ay6Qq1SPTO0je5dmFvpOLI0lSbG43U0lNzEb2
 autw==
X-Gm-Message-State: AOJu0YyXzYHn+7TQsOSp/GGSMSwx2Wc78hfRExesCn677t1VRbS/HP4/
 2m+cB1odovnVO/D7VocgVRPTHQ==
X-Google-Smtp-Source: AGHT+IHvXf5uuypVZ4LAbgpB3n1z9XFnN75tDbFJjU9l5WICLaMnfHsa2E/yVUF65Vdt1MyquEL71Q==
X-Received: by 2002:a05:6512:3714:b0:503:2567:c42f with SMTP id
 z20-20020a056512371400b005032567c42fmr681831lfr.0.1695900939293; 
 Thu, 28 Sep 2023 04:35:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:35:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 3/6] drm/msm/mdss: switch mdss to use devm_of_icc_get()
Date: Thu, 28 Sep 2023 14:35:32 +0300
Message-Id: <20230928113535.1217613-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
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

Stop using hand-written reset function for ICC release, use
devm_of_icc_get() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2e87dd6cb17b..75ec5e89894d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -50,14 +50,14 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	struct icc_path *path0;
 	struct icc_path *path1;
 
-	path0 = of_icc_get(dev, "mdp0-mem");
+	path0 = devm_of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
 	msm_mdss->path[0] = path0;
 	msm_mdss->num_paths = 1;
 
-	path1 = of_icc_get(dev, "mdp1-mem");
+	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
 		msm_mdss->path[1] = path1;
 		msm_mdss->num_paths++;
@@ -66,15 +66,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_put_icc_path(void *data)
-{
-	struct msm_mdss *msm_mdss = data;
-	int i;
-
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_put(msm_mdss->path[i]);
-}
-
 static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
@@ -391,9 +382,6 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
 
 	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = devm_add_action_or_reset(&pdev->dev, msm_mdss_put_icc_path, msm_mdss);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.39.2

