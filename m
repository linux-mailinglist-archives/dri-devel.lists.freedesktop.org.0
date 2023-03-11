Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8356B61F9
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 00:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E3B10E249;
	Sat, 11 Mar 2023 23:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD7710E249
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 23:10:31 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id x10so5084108ill.12
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 15:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678576231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4cpvYmVBhD4fHRIrTGT44scJM9mOEe4nde0KEivzpRU=;
 b=gfSO5bw8bJbhTaMk7SEDb30z6sPp2BTZf7vL702G3PRZbzqQ2ffOBHgI/3D4wAjOqj
 781JvOIhtSsyuPqmxUXdD1TA2l/jnN/j0jJlhUPdC+1rPpsR3XKUQqaxS9MJKfu34om4
 +khfNSZKlRYCapVMhX7RWaWVL5BlUsmVsw4MHEhZADAuCrKbP0vP2GMgEKUdc4UghyIN
 WICaqEBhtikAn9A5fTQe+EqgDNPXpibxYsYDB1nbiSH1CVv+yBhLhAAJCkcZ2kFq5BTA
 +CXdiwFM7OrelhIPCtWtSFxJ2B0X5OeXKZi7PDmUI5r4XDtcsHDrhqOpfD05Mf5nu+P4
 aE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678576231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4cpvYmVBhD4fHRIrTGT44scJM9mOEe4nde0KEivzpRU=;
 b=KeR9Q5pdsqRq8/iz1hRDRTqH2XK8an+55toGA/H6qFLOgU0FzxPN25GSywMAyiDywJ
 b9sbZsnZKkd37wYCtfqiowGnQkpAhFThmkrRS+7tL8QCKzmU1GQrMSorRSQSdifIbgxD
 002kMejelo9cztNIah/vQ7q8zuO6T1DXPObzyNZAHIj3CFRyrhSDmt0smKHhJ0ONFld2
 1L3p8pg/zkS2JAnw7efYVF1BlYXWetQsQ1AQQUkrYfWQ4Fvl8vgJ6LQl9vtBdUbr36ZP
 ovTz2zRo0J8xtM4GYNtG80Fl7SF0ADj+nsVJRDDy9xg8hlOuJoPUyxXE8OrH8VjCBtv+
 p52Q==
X-Gm-Message-State: AO0yUKXFziEjZgDRxs9q88RQ2/JtaGTdedfLFvsQnlCEAvyj6aWy6PBZ
 yg1pjmsPdJ1AJzdp9g8WVPc9T8j9l08=
X-Google-Smtp-Source: AK7set8xLaf6sGCvFzp9Oq9/f/JMIaxPKVY87Tn55B/7J2yLpejE7qv7ohOneDZo8+6MZwjoiq29wQ==
X-Received: by 2002:a05:6e02:1522:b0:317:9945:6054 with SMTP id
 i2-20020a056e02152200b0031799456054mr23500135ilu.9.1678576226071; 
 Sat, 11 Mar 2023 15:10:26 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan
 ([2601:447:d001:897f:3d1b:3fae:4f25:ccd])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a02bb0b000000b003fddcf34e0csm679190jan.117.2023.03.11.15.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 15:10:25 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533 and
 adv7535
Date: Sat, 11 Mar 2023 17:10:07 -0600
Message-Id: <20230311231007.46174-1-aford173@gmail.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, quic_abhinavk@quicinc.com,
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

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index fdfeadcefe80..10a112d36945 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -103,13 +103,9 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
 enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 					const struct drm_display_mode *mode)
 {
-	int lanes;
+	unsigned long max_lane_freq;
 	struct mipi_dsi_device *dsi = adv->dsi;
-
-	if (mode->clock > 80000)
-		lanes = 4;
-	else
-		lanes = 3;
+	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
 	/*
 	 * TODO: add support for dynamic switching of lanes
@@ -117,8 +113,16 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 	 * out the modes which shall need different number of lanes
 	 * than what was configured in the device tree.
 	 */
-	if (lanes != dsi->lanes)
-		return MODE_BAD;
+
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
2.37.2

