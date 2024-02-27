Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE32086A225
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 23:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083F410E40B;
	Tue, 27 Feb 2024 22:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ccs3Tfky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2D810E6A9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 22:08:11 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d28387db09so38797081fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 14:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709071689; x=1709676489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vQcCMyGhfzH8PgY8TmCUpxm6Vv1tc9M/NiJQlsbF4kI=;
 b=ccs3TfkyW60KxkUKm4i6B/MjqcDQgODJ1irke7ZaoUq+lIKMCzRdCYAa5dOpGZ1d38
 53GBJgJBxSimtquoh+76l3a333wJklfwOMebuBWz9BkFx53wbYxA5VTw2oLrXVArWGtU
 6Gi5mwllAJlK+TDu3vuN9FaD6AggdTYZVxICQUPjqW4FKjp3KH8UkoR6miI6LGKhlZ8w
 zuffPPl/rxH6t6lceIYuRC6oebl3bQUZ5wYy2kacQgVTznJWf+Q0aJKe5fL1AHGEAm6g
 IB2TH3E96EITSEFwJ5UJB0lc1aU3bukgiRpElWZkK42Lp542Mg3nHQbBFtBju3jYu5r5
 9hWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709071689; x=1709676489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vQcCMyGhfzH8PgY8TmCUpxm6Vv1tc9M/NiJQlsbF4kI=;
 b=bCteTdUX5oU/ZeWIpD1yV4RFvlfAshoISLHezXbFxanaI2nTxPoeKc3YOl8k14nlR1
 AmkX99HOiTCWLbUr4xy/BzUWKZp0X8VamZuhODYi9YA8w9+zuza5+rQdzQZkov7L+TsU
 9RkB4XMv7yaCoMruu/qv6o51cS81JuFeh5xjgnW78dgEJG2leur7cFaE4Da97n80gULf
 llvHFMesEiRBN4Bc137Yp1fDZkLpvDp6SRBbk6OS1OLuAcvOXiN9HXzOjCKS4mJnLDen
 ux6A92it5JeQWB9wizGuYPe/yaNl7Wn5CNpjSv9XZXtriBbSI19mhhVr0w6iJvR/dPrI
 Y67w==
X-Forwarded-Encrypted: i=1;
 AJvYcCURsHJoXnyQMiRwg8bjgCg7T9Av5WV8U2Vm3uPn61jmzpHvj5fekAF03S3k/shuY1/kEeVnJ76zcYGSa9RBzGuzY7p/KFLNhvL6lSnF4Z6T
X-Gm-Message-State: AOJu0YzLlLgqkLMDKMlC89ldo8PR/NY8+yTiG+kpkU6E7DhIKaAC2PQV
 hp4uAm30ITKVYrgwdFkdxNj7eOYf+MBCxGyTCNOORq2A0bseoJZtvq2zMZ3GbFA=
X-Google-Smtp-Source: AGHT+IH+yL8luTEsjdTKKoRDh0vC98sjxGym7Upqf/nybKJw0zX+NrxDgIIl50EzB430cRbyTNIPgw==
X-Received: by 2002:a19:f505:0:b0:512:e58c:7bf1 with SMTP id
 j5-20020a19f505000000b00512e58c7bf1mr7137757lfb.40.1709071689142; 
 Tue, 27 Feb 2024 14:08:09 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a0565123d0300b0051317bf8b39sm94466lfv.287.2024.02.27.14.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 14:08:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Johan Hovold <johan@kernel.org>
Subject: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report HPD
 status changes"
Date: Wed, 28 Feb 2024 00:08:08 +0200
Message-Id: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit e467e0bde881 ("drm/msm/dp: use
drm_bridge_hpd_notify() to report HPD status changes").

The commit changed the way how the MSM DP driver communicates
HPD-related events to the userspace. The mentioned commit made some of
the HPD events being reported earlier. This way userspace starts poking
around. It interacts in a bad way with the dp_bridge_detect and the
driver's state machine, ending up either with the very long delays
during hotplug detection or even inability of the DP driver to report
the display as connected.

A proper fix will involve redesigning of the HPD handling in the MSM DP
driver. It is underway, but it will be intrusive and can not be thought
about as a simple fix for the issue. Thus, revert the offending commit.

Fixes: e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes")
Link: https://gitlab.freedesktop.org/drm/msm/-/issues/50
Reported-by: Johan Hovold <johan@kernel.org>
Link: https://lore.kernel.org/r/Zd3YPGmrprxv-N-O@hovoldconsulting.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d37d599aec27..4c72124ffb5d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -329,10 +329,26 @@ static const struct component_ops dp_display_comp_ops = {
 	.unbind = dp_display_unbind,
 };
 
+static void dp_display_send_hpd_event(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+	struct drm_connector *connector;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	connector = dp->dp_display.connector;
+	drm_helper_hpd_irq_event(connector->dev);
+}
+
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
-	struct drm_bridge *bridge = dp->dp_display.bridge;
+	if ((hpd && dp->dp_display.link_ready) ||
+			(!hpd && !dp->dp_display.link_ready)) {
+		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
+				(hpd ? "on" : "off"));
+		return 0;
+	}
 
 	/* reset video pattern flag on disconnect */
 	if (!hpd) {
@@ -348,7 +364,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->dp_display.connector_type, hpd);
-	drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
+	dp_display_send_hpd_event(&dp->dp_display);
 
 	return 0;
 }
-- 
2.39.2

