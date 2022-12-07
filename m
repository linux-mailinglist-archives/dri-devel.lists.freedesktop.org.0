Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E56064544E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 07:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0D410E0C2;
	Wed,  7 Dec 2022 06:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3867A10E0C2;
 Wed,  7 Dec 2022 06:59:34 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p24so16221234plw.1;
 Tue, 06 Dec 2022 22:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=URJLtETWn+YZV56sYZN2y9Ammv06Km5wjcz9Xfa36wA=;
 b=lBKqGEScVr/kOYKmMuclGkO9cibboL2kFQ5OW7GPQGtifD5zo2uyHZcJ6yi5AJ4YAD
 NooMxx80w9ItHZM2XHVzTUxK3+UGh+Vl+Y4H8VZYum6RJuL5jTWIQVRZ5axYjsXnrkO0
 QO0EgX2CXhC0MOZvtHfobb/n4Bg+Gu/pQ7E619gb7VORVJnKjTdeLd+i67FMj1hour71
 L7dOkmXXWUsc1YGY7Pz8hFqPGZEtn8PMoDr2VCiq6Mtwy/LUAL5tuFez/d20X06qURi2
 bGBt4UMmlvBQrUHE0RSeqwbpHOjH+Gw6HAQEc0vsN1Mbfgqdzp3bgFE3BGmo9n7b7Js9
 dJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=URJLtETWn+YZV56sYZN2y9Ammv06Km5wjcz9Xfa36wA=;
 b=vtVHElfqBuKK+AdXdot7zPpUHQ/kKIP8OABxSbHqyDmhHQQzX6k77Ss2+g9zd3BjPS
 ErWhza4iOSHgWOzEyqbOG2POW/4OCrW5Rbvp2GTMnehtnCQtFF9P5bCrQ08rULU856qf
 ix0z0SgfnOKqcX238+pw/1WXGw6GKu4SjhFL9L1MZ7ytfTkHYVavM/FbJcy0UVIZt5FZ
 O5oKotETgO0JcfEYoeQ0F1mtNHj3SDrY+s/IHhY3BakI1uqIb7E4sgYKq338W2U5g7k6
 myPRVZoLSCFrZKBddk96LJOnmNfjywfeujsfXtwRaFKFFfC4VUtnRWGeAcQFZsDOHmcQ
 +3jA==
X-Gm-Message-State: ANoB5plRXXFHcQQd07CtZLHnkXej4yDRpkNZl2CW4fo+vDvIDclgtmZV
 AJ9IfUprXhNLmluJJp2FhraDwHvbl5DWF0Nh
X-Google-Smtp-Source: AA0mqf6beKWDf3dqOMpuuZAuHED3fpDTatCs+YeGixJMzVPTqS2PO3y/S6m/UXrq7oz9e89qo+0Vxg==
X-Received: by 2002:a17:902:e8c3:b0:186:5de2:e17e with SMTP id
 v3-20020a170902e8c300b001865de2e17emr76737175plg.35.1670396373706; 
 Tue, 06 Dec 2022 22:59:33 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 18-20020a17090a001200b002086ac07041sm472055pja.44.2022.12.06.22.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 22:59:32 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dpu: Fix memory leak in
 msm_mdss_parse_data_bus_icc_path
Date: Wed,  7 Dec 2022 10:59:22 +0400
Message-Id: <20221207065922.2086368-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_icc_get() alloc resources for path1, we should release it when not
need anymore. Early return when IS_ERR_OR_NULL(path0) may leak path1.
Defer getting path1 to fix this.

Fixes: b9364eed9232 ("drm/msm/dpu: Move min BW request and full BW disable back to mdss")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- move getting path1 after error check for path0.
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e13c5c12b775..3b8d6991b04e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -46,15 +46,17 @@ struct msm_mdss {
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 					    struct msm_mdss *msm_mdss)
 {
-	struct icc_path *path0 = of_icc_get(dev, "mdp0-mem");
-	struct icc_path *path1 = of_icc_get(dev, "mdp1-mem");
+	struct icc_path *path0;
+	struct icc_path *path1;
 
+	path0 = of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
 	msm_mdss->path[0] = path0;
 	msm_mdss->num_paths = 1;
 
+	path1 = of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
 		msm_mdss->path[1] = path1;
 		msm_mdss->num_paths++;
-- 
2.25.1

