Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5397942DE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ADA10E6E8;
	Wed,  6 Sep 2023 18:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1003410E6E7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 18:12:31 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68e2ffd51f2so110728b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 11:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694023950; x=1694628750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Edgvbmd5y4jUc7RB+Rf63E6o4J7BSjl9P5UimGRUsdQ=;
 b=koHxt7D+O6BOJEKa0gWBtS92xD/mDT8aLB31iTNnl9jj91xI2I15kpZdGoLkKcgygF
 4qGX5AJ/Wh7Am9GVcEnLo1ZDV3Am2HlstODzWKJI/agnxatG173IBWSvOv9ItiVbj4Mi
 XB9m1iI+HC4AJ7YkyrS47AO0e2TAbGX1TokSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694023950; x=1694628750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Edgvbmd5y4jUc7RB+Rf63E6o4J7BSjl9P5UimGRUsdQ=;
 b=fRoKScBpEyPs+/6DsqYYuwM1AxMKH0WUFtBQ3iGpYost+r2AR3uEWNUudT0gZzNdWa
 5E2qSF0i0GPwQBacQKp7Fa2cLeYQv38mN6T2U3y63cmXYoXqQnsk6NW+OZv6Rt1DrO19
 3qqSPiAeg2N98Ed9RRQvg+0y5PWdJ6Hj8rr4EZGQQCw1Xf8JyXJo9fZn9SCJmvLfBncN
 8q/Jx3SbWqV0bUduG4CVgEktpmEkOyIouCsXy+IGXGPTtuR9SpZhrlevYlYWHSv0XEju
 iAEWizizXQNNEnMrf5saYRB7l1X4OnJyGy9Tv+1goT7mWhEDWHMwp4S/vfP7Gsr3jDTF
 17kg==
X-Gm-Message-State: AOJu0Yx738LPF23g0nMstg3OMLOw15izpToqaOEYIpzmCo4EkxdNPPWJ
 f23PdiZ0ALTZmIiSobsnBhhJ3A==
X-Google-Smtp-Source: AGHT+IH6kSrFTL9eIlfDr/vwL8Fsw7IYLh/XA+8fJSBKdMHvlaTDr5JYbfbs2SSDKsWyskvF1jKHrg==
X-Received: by 2002:a05:6a00:1786:b0:68a:3e68:f8ab with SMTP id
 s6-20020a056a00178600b0068a3e68f8abmr16812291pfg.14.1694023950511; 
 Wed, 06 Sep 2023 11:12:30 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:a404:ed4a:5a1e:3b4a])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a62e80a000000b0064fde7ae1ffsm11080552pfi.38.2023.09.06.11.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 11:12:30 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/2] drm/msm/dp: Inline dp_display_is_sink_count_zero()
Date: Wed,  6 Sep 2023 11:12:25 -0700
Message-ID: <20230906181226.2198441-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230906181226.2198441-1-swboyd@chromium.org>
References: <20230906181226.2198441-1-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function is basically a one-liner when you ignore the debug
logging. Just inline the function and drop the log to simplify the code.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 96bbf6fec2f1..2a5f1ab9a65b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -341,14 +341,6 @@ static const struct component_ops dp_display_comp_ops = {
 	.unbind = dp_display_unbind,
 };
 
-static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
-{
-	drm_dbg_dp(dp->drm_dev, "present=%#x sink_count=%d\n",
-			dp->panel->dpcd[DP_DOWNSTREAMPORT_PRESENT],
-		dp->link->sink_count);
-	return drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0;
-}
-
 static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 {
 	struct dp_display_private *dp;
@@ -507,7 +499,7 @@ static int dp_display_handle_port_ststus_changed(struct dp_display_private *dp)
 {
 	int rc = 0;
 
-	if (dp_display_is_sink_count_zero(dp)) {
+	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-- 
https://chromeos.dev

