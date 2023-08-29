Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B71378CC67
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEA210E483;
	Tue, 29 Aug 2023 18:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEABC10E485
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 18:47:42 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c0d0bf18d7so29365725ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693334862; x=1693939662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SP05QRX0ffgV9H75PNnPPPNwlPJBgrXfqON4q+7zQd8=;
 b=iR7CMZ2TOMm2oug+fW6PozLCKDS/FtBtnyhISmwLaudI+OQt4JkFh/4nfXqVS5T+x0
 gc6XOEmfRRN6xM1lORZsVM7CD7pKalI9P9/iQA5HtQp5fiKBNFKY3340x/G8AX0+B02N
 KIsQX062xJPxzh2NKMuJVFoQ08gASaFeSb6N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693334862; x=1693939662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SP05QRX0ffgV9H75PNnPPPNwlPJBgrXfqON4q+7zQd8=;
 b=Ch8OAIGXUxG8zVdyxZ7MDFsGqcASi7qeh4Vd5lq7yzs0jewhBHOj/jUojCD/CRdS/Q
 7n/jOJc0ikl8XSJsHPlAU8+Q8AYRe4yMmRqZWDtM/7tyPD1djfhGvIvHefr+33hGMcsL
 sjYlmiIb+ttG8Wkl7cvf9CGj7KCnQmfXytwOfZY5Awi2PYCrTSUtF4qfr8/iWrBIBh5x
 chz7TI+MXrcjhs8fYE5uc6gQPNLA4A3+gD22liGDJQOoiXRHYz6UQIYEEinqTX3Uaa6G
 Z5/ww1+oEUZNHUnIkNQVi4+3zUktcDerjbtpXS4YepvMNwVksc02lHvHVITsg9UL9HAr
 XqSA==
X-Gm-Message-State: AOJu0Yy3lRk2HMqGqePWB8hnNIEAER28VA8FP4x8TLrthRImNgd6g4nq
 CbPiunKXfRkD4FitXXO3woo88g==
X-Google-Smtp-Source: AGHT+IHGUmCHB6AjaXPnbvPgZPbqs96iezZg8UGYC+YUja3aAojoTLyujv9/gnvDjuZGMy/H54oFrA==
X-Received: by 2002:a17:903:1212:b0:1b0:3df7:5992 with SMTP id
 l18-20020a170903121200b001b03df75992mr28283828plh.32.1693334862256; 
 Tue, 29 Aug 2023 11:47:42 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d603:22a7:5e5e:d239])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001b9e86e05b7sm9697953plg.0.2023.08.29.11.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 11:47:41 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 2/7] drm/msm/dp: Use drm_dp_read_sink_count() helper
Date: Tue, 29 Aug 2023 11:47:27 -0700
Message-ID: <20230829184735.2841739-3-swboyd@chromium.org>
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

Use the common function drm_dp_read_sink_count() instead of open-coding
it. This shrinks the kernel text a tiny bit.

Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 09d4f6c38ef8..a0523b18b9e9 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -147,8 +147,8 @@ static int dp_panel_update_modes(struct drm_connector *connector,
 int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	struct drm_connector *connector)
 {
-	int rc = 0, bw_code;
-	int rlen, count;
+	int rc, bw_code;
+	int count;
 	struct dp_panel_private *panel;
 
 	if (!dp_panel || !connector) {
@@ -174,16 +174,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	}
 
 	if (dp_panel->dfp_present) {
-		rlen = drm_dp_dpcd_read(panel->aux, DP_SINK_COUNT,
-				&count, 1);
-		if (rlen == 1) {
-			count = DP_GET_SINK_COUNT(count);
-			if (!count) {
-				DRM_ERROR("no downstream ports connected\n");
-				panel->link->sink_count = 0;
-				rc = -ENOTCONN;
-				goto end;
-			}
+		count = drm_dp_read_sink_count(panel->aux);
+		if (!count) {
+			DRM_ERROR("no downstream ports connected\n");
+			panel->link->sink_count = 0;
+			return -ENOTCONN;
 		}
 	}
 
-- 
https://chromeos.dev

