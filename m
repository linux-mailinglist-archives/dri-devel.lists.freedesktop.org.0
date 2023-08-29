Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF9978CC69
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AA610E485;
	Tue, 29 Aug 2023 18:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2C610E486
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 18:47:50 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68bedc0c268so4090345b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693334869; x=1693939669;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDFi+t2HGk6Ez2m1E1bDJmYF5dLdXGiplCl4kzCCGIw=;
 b=gsCbMBR5Lecvz+ZcNZT/qBLNklHHMP4hX3WGRxf77E0eEMgtc9pldRrw0vjiYiNMim
 sX1KPPir2HF9wiexfHHP39pVxRsRl818JbRrab9L6lIOLj1EB07IpibP/WMoqW4h5RQn
 n4bt/bkcAHLxIBrRrkMgX26eG/7QXhzxKDUzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693334869; x=1693939669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDFi+t2HGk6Ez2m1E1bDJmYF5dLdXGiplCl4kzCCGIw=;
 b=IR91q4K0s4qqD29ujR561K9UVLL05FePl+i1uspCe70pJmPu9/zbXCrcE2iSy1IEG8
 Et/oy96IC9CI12Jwx2wxK36/g2yKDC4rB8uWSBUPbETUi6Wv86DzsxOC5yz6bitoowZl
 R1gzT497wzFVtfpqIDaqjmVFyvwxWpVhi1+3x2rKX7fWOEJ2jTsyeu2jiF5tEc8FFKTW
 NSrFRxSoEvJFgzyeMfxwh1lCklt1OVcdYSNE40KlOGAIOu5vSSghQPvtyO9lnDx60nRI
 vmtSt+JmyXvioGtVJP9rhOiETCB75q0p5eHYYpOXjJycwItCsgiXiUq+oJCPsBHWSZBw
 fhAQ==
X-Gm-Message-State: AOJu0YzWigANdx524Vi4DnHs7GxKqJFHz1zKnWKTtLrs6Jd47cVBXza8
 vJTsNcRpQUFU3+8ed4b0FjwvRA==
X-Google-Smtp-Source: AGHT+IG58CNBx1V/eqpVdTw/QvBwIlAZBBILyaosLO9zrBbi7Cn4JE3QPxGI+6zG/AqLakLHAjK+GQ==
X-Received: by 2002:a05:6a21:66cb:b0:138:2fb8:6b42 with SMTP id
 ze11-20020a056a2166cb00b001382fb86b42mr180543pzb.14.1693334869676; 
 Tue, 29 Aug 2023 11:47:49 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d603:22a7:5e5e:d239])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001b9e86e05b7sm9697953plg.0.2023.08.29.11.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 11:47:49 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 7/7] drm/msm/dp: Remove dp_display_is_ds_bridge()
Date: Tue, 29 Aug 2023 11:47:32 -0700
Message-ID: <20230829184735.2841739-8-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230829184735.2841739-1-swboyd@chromium.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
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

This function is simply drm_dp_is_branch() so use that instead of
open-coding it.

Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 76f13954015b..96bbf6fec2f1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -341,19 +341,12 @@ static const struct component_ops dp_display_comp_ops = {
 	.unbind = dp_display_unbind,
 };
 
-static bool dp_display_is_ds_bridge(struct dp_panel *panel)
-{
-	return (panel->dpcd[DP_DOWNSTREAMPORT_PRESENT] &
-		DP_DWN_STRM_PORT_PRESENT);
-}
-
 static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
 {
 	drm_dbg_dp(dp->drm_dev, "present=%#x sink_count=%d\n",
 			dp->panel->dpcd[DP_DOWNSTREAMPORT_PRESENT],
 		dp->link->sink_count);
-	return dp_display_is_ds_bridge(dp->panel) &&
-		(dp->link->sink_count == 0);
+	return drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0;
 }
 
 static void dp_display_send_hpd_event(struct msm_dp *dp_display)
-- 
https://chromeos.dev

