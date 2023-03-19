Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41D6C01C3
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 13:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52B910E12C;
	Sun, 19 Mar 2023 12:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826DB10E12C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 12:55:43 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id h11so5235070ild.11
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679230542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gMuTuV/PxnF04ieD+/WbXry01J3vTyybaYMQ7rpMYzk=;
 b=JFLeHt79k0jl0YPaFxMk08tz8fIIrticmPoC6+HWmJdoiPxGXxSzC94TTHirmQobYI
 SXc4+85nu/sFJ0/HgsoJFxW7vS5ZD4O7uXJ6Li6zSKDuXG9+JhOLVYROOms+Xb0gYFHS
 hf3q/A41rZIWWqI3gx3B+IqPfKh1mPK08se5xYq9Q9axDpmH8A0W6HyLMHOJD/n+5BWt
 hsziHwm9HbMxEqCHm6iq2PpLRXt1gE9ZIyXKa1h82SkgpvqLoGNidEb9Z3IdN6aKKoBP
 RftzG8IY6V22c8ZR6/z7+xo/y6JVJK7w3FEQNNl9TIemOA6DBBAUcyv3CWsg49idNORf
 Hk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679230542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gMuTuV/PxnF04ieD+/WbXry01J3vTyybaYMQ7rpMYzk=;
 b=qlnR/IDPJVvzxVWxSAeiTLu4+QYoTYuZx6PUSTYhbidWB47bC81ivFR/l0svGWm5fM
 ZAW02RqlcPQE7rtFCLJjCrmaV7j8aZlVM84NdXkmYRft6hHlOz9jgDEiKlgKIhpze+rp
 RQ231cHAkYM5yggAO/edNeFU0o28E40KtSa1D6sMRI+zx4zVOD3bo5BISHaCW5wRpU09
 qSPabwxr3fx6dUXFIEA66RQuHVJibBsxJQqzVqVEWn03hJ5R0/8lAQAX0zjQXy0AHg91
 NC676DhtueC1Ad4HAwq4aVxIUquv05hH/KuWiCKGxZmitOUCz7aT8738IyFTC6vg379D
 G9Rw==
X-Gm-Message-State: AO0yUKW9Kmeh/tmK+yibIOHbA8IMTmsDW4Zh106H8TTrF68ILdsU1j63
 75dX+f7rNVUNGg+rVsPWGvVDK+Ms0XM=
X-Google-Smtp-Source: AK7set8VyHh9qqJa1SPElGRsWeVDUg/sleWLwqO3yN/4giWtiwTXrwDZC+ww+CQIFatT6z4eqsLHdg==
X-Received: by 2002:a05:6e02:6cb:b0:323:1362:19b2 with SMTP id
 p11-20020a056e0206cb00b00323136219b2mr2912498ils.21.1679230542265; 
 Sun, 19 Mar 2023 05:55:42 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-75-72-166-104.hsd1.mn.comcast.net.
 [75.72.166.104]) by smtp.gmail.com with ESMTPSA id
 z2-20020a056638240200b003b331f0bbdfsm2335605jat.97.2023.03.19.05.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 05:55:41 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2] drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533
 and adv7535
Date: Sun, 19 Mar 2023 07:55:24 -0500
Message-Id: <20230319125524.58803-1-aford173@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dmitry.baryshkov@linaro.org,
 Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When dynamically switching lanes was removed, the intent of the code
was to check to make sure that higher speed items used 4 lanes, but
it had the unintended consequence of removing the slower speeds for
4-lane users.

This attempts to remedy this by doing a check to see that the
max frequency doesn't exceed the chip limit, and a second
check to make sure that the max bit-rate doesn't exceed the
number of lanes * max bit rate / lane.

Fixes: 9a0cdcd6649b ("drm/bridge: adv7533: remove dynamic lane switching from adv7533 bridge")
Reviewed-by: Robert Foss <rfoss@kernel.org>
Signed-off-by: Adam Ford <aford173@gmail.com>
---

V2:  Fix whitespace in comment
     Remove TODO comment
     Add R-B from Robert.

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index fdfeadcefe80..7e3e56441aed 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -103,22 +103,19 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
 enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 					const struct drm_display_mode *mode)
 {
-	int lanes;
+	unsigned long max_lane_freq;
 	struct mipi_dsi_device *dsi = adv->dsi;
+	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
-	if (mode->clock > 80000)
-		lanes = 4;
-	else
-		lanes = 3;
-
-	/*
-	 * TODO: add support for dynamic switching of lanes
-	 * by using the bridge pre_enable() op . Till then filter
-	 * out the modes which shall need different number of lanes
-	 * than what was configured in the device tree.
-	 */
-	if (lanes != dsi->lanes)
-		return MODE_BAD;
+	/* Check max clock for either 7533 or 7535 */
+	if (mode->clock > (adv->type == ADV7533 ? 80000 : 148500))
+		return MODE_CLOCK_HIGH;
+
+	/* Check max clock for each lane */
+	max_lane_freq = (adv->type == ADV7533 ? 800000 : 891000);
+
+	if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
+		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
 }
-- 
2.34.1

