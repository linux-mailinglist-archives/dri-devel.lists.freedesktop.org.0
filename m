Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F218721E8DF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2631C6E8F5;
	Tue, 14 Jul 2020 07:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFC86ED85
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 00:50:02 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w34so5951070qte.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EqGVPzCwYn8DVvhE6LVcxMlICfwfg+X8jSsAedeo4EE=;
 b=U07JsQqOYThoeXOWRr780uAc+xSeVG5Ar2cW1EfZkLwzYaUB5PK51LAUREfgmPCYAP
 4YiS0YP6SW6/aA81H/9eTsfxbDhsuvA1EhdyBOw/MSm2ObCVp7+mR/iQ8F4q1R73SmWf
 Mt517mt6geMZoTrpDXQxnh/U/tStBj5XEq2miOxZmgWPB6xpveggslCAAIIyXqg2Hqv/
 WkttHJ2UIwudlXHEMCqfoNp3Gr7SNhVf+BiwQ18zKYtKH/jSGwpL8NCki/C5SG+m0a3s
 0tR4xZyVstqdznLNvSu1hPddUABcGTlPLupA6vNjtuOFLT1BbsyUYoOqodO/dpwfm4lQ
 3jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EqGVPzCwYn8DVvhE6LVcxMlICfwfg+X8jSsAedeo4EE=;
 b=bPjSTzNTdB1bc1el85bJ3b4CBJMxYX7CuBA9l6Pngh/JY08bL06EF9YbpqbCKcVElX
 aHvo0sjAaWUeCPW3vnhQJBXQ+zvSjJ+m3ScH4vpCmVfPpW3/bgdBJLDTptrRnbanyRe2
 cVYdFj+FECn72rjkYmzTQIWYh3BSNurixphFgl3s1Um0pcjF490uHoJXznzwzoTlR98m
 6iFeFP529T7/b1NAxo66SDmAKIXFV270bAoJH40Qd5Y+ko30RoBlUaWgofG7Bc0bVBug
 bTPbA+SiBbRsps1lSE2aMWlwWpY+3lwBLyT2grPcdMN+kPdyORf+f5GD7HvTfXUMHdeg
 knqw==
X-Gm-Message-State: AOAM5301YeG+TqpVWtEInJNUneMK76kmOqG0cycA64QntfOVbjyb6qU4
 Evq/8et9QA6gdfNNmH9slVY5zA==
X-Google-Smtp-Source: ABdhPJxSmVlqvrmOQqW9k1e9eaGMEu+jrDNFrnt2wdbqz+Oh08gO29ccE5VKEHOh9ukddD1+rJR89A==
X-Received: by 2002:ac8:4e03:: with SMTP id c3mr73934288qtw.82.1594428601656; 
 Fri, 10 Jul 2020 17:50:01 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 17:50:01 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/msm/dpu: use right setup_blend_config for sm8150
 and sm8250
Date: Fri, 10 Jul 2020 20:47:24 -0400
Message-Id: <20200711004752.30760-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All DPU versions starting from 4.0 use the sdm845 version, so check for
that instead of checking each version individually. This chooses the right
function for sm8150 and sm8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 37becd43bd54..4b8baf71423f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -152,14 +152,13 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (IS_SDM845_TARGET(m->hwversion) || IS_SDM670_TARGET(m->hwversion)
-	    || IS_SC7180_TARGET(m->hwversion))
+	if (m->hwversion >= DPU_HW_VER_400)
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
 	else
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
 	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-};
+}
 
 static struct dpu_hw_blk_ops dpu_hw_ops;
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
