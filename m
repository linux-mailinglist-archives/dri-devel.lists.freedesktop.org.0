Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E083BFA37
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA046E8C2;
	Thu,  8 Jul 2021 12:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3326E241
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:28:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x25so2233995lfu.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2NpJ7aO+Jt+ovnuoQ4df+eCNMUKTUxxJ0ApMITBvevY=;
 b=i1hA8qYn02lHN59fXryMVrsz/glZorT+uR3PeKBbNchuQuiJop0XdDuvF22k6wZPHT
 wpqBh+sKQuX9qgZPW+Iw4zSPq6S3lmrILb8Cifb1eh8uqB5zR64pGv7LEVKUlUZehjAR
 WrsewfIg1+8fVQchHHVKN4uO+LwadYEiJj8s6ylrcdue6txFA0V8ylclA45Sas/P/z6K
 WFq7GEjGtROVTGuWHhRHGs4zwZq19SXJzBPqWT498t+ANRk9GqYJ/LAfjMvuTDWzvlFG
 KR4ktG8WdWe76y2wuxkV6+A4W1DuUIbAv2L1/h4ExAmCX1A6oS7qC0Kdk/Wozpb9IZNA
 pwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2NpJ7aO+Jt+ovnuoQ4df+eCNMUKTUxxJ0ApMITBvevY=;
 b=JaKYUsXqy7qrYYg/F8Rpf2TFdmOdi84+PSn4Br9sY0LJ0WC2q5KSFT/Z0KcimICjPl
 6iZggOjfKHEvzF/30EhHKSCe0eRbx3+XBqbfPLVnI401X94g0qPp8c23BpWnfdBBc/a+
 3A8mLupbl+e8ZqfV4FrYazqqDNHSNJUAqa1Mi8yPxFXEpT9bPE14CfEhyzDq4VDrABel
 9pqH8bAocymqFoaFBmeHeoVIYV2IVIxe5qfPmg4LQUZ4uITok+qqAK/JqSUHVmWP/O1r
 XWReByrETDIXuQ/I4+WUl39k7ajdIh++RVN6OIIAmClgQXTVnzfwf/8acpey9qN/GK4E
 BkQA==
X-Gm-Message-State: AOAM530puUijtDOE1mQIiuyJl59n/Xb2cvxgAXKSS3fdb0Le5HjeWj4u
 eaixkGJQdt6InuwjeKPgsB4egQ==
X-Google-Smtp-Source: ABdhPJxKdPo5abzq8Nd+N70kOUxzlBs7fbGG/FZVL7vgsfXOXK82w0NtjUnhLKVz6ywV0P/+BiVOGA==
X-Received: by 2002:ac2:4d90:: with SMTP id g16mr12625569lfe.431.1625747329399; 
 Thu, 08 Jul 2021 05:28:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:28:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 5/7] drm/msm/dp: stop calling set_encoder_mode callback
Date: Thu,  8 Jul 2021 15:28:31 +0300
Message-Id: <20210708122833.363451-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 051c1be1de7e..70b319a8fe83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -102,8 +102,6 @@ struct dp_display_private {
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
-	bool encoder_mode_set;
-
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
@@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 }
 
 
-static void dp_display_set_encoder_mode(struct dp_display_private *dp)
-{
-	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	if (!dp->encoder_mode_set && dp->dp_display.encoder &&
-				kms->funcs->set_encoder_mode) {
-		kms->funcs->set_encoder_mode(kms,
-				dp->dp_display.encoder, false);
-
-		dp->encoder_mode_set = true;
-	}
-}
-
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
@@ -369,8 +353,6 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 	if (dp->usbpd->orientation == ORIENTATION_CC2)
 		flip = true;
 
-	dp_display_set_encoder_mode(dp);
-
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip, reset);
 	dp_aux_init(dp->aux);
-- 
2.30.2

