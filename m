Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F896BB8F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C09210E76E;
	Wed,  4 Sep 2024 12:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Eg7bQhjl";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BIhD0Qq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0266310E752
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1725451562; x=1756987562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wniz+SsuI6wCX4+/GYWYwCSgqsJJKE8f4C0qwqIRqo=;
 b=Eg7bQhjl2B2kdtKzuurpBNR8Df+8lEN+U9aTViQrB6DgezSseecve0FT
 9mhJnSiw+433rQbypUC+rW1jAFI6oJRxINlBpoomgrtwQVehWADCxsy4y
 fYht2qmdZ6uoBfVeoLDDneNM8DmlOlIkAQcZzpnUOqjtf1oDw38hw8eGI
 1imKxcUYzwAkSVY4Kyis1MSWNTsVVtFDrmbh1SL3X/qMUyIcgNOXsQWL0
 7TRKyecn2aQU94i0H4upk4CFY1ou0O7vgneCnua9OFDywhgdp7PQmyDBC
 zOrCe1WPzdnYaS2yb58pjzh2sNgwRl6y6QxxpzPy/iZ5Y3YV8qegUvR2k Q==;
X-CSE-ConnectionGUID: PWyeOEUfQ26Pmot6NRxlYQ==
X-CSE-MsgGUID: JNNvjltyR5OhzyIgrq/67g==
X-IronPort-AV: E=Sophos;i="6.10,201,1719871200"; d="scan'208";a="38762443"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Sep 2024 14:06:01 +0200
X-CheckPoint: {66D84D29-22-5FF8EC80-F6CEE9F8}
X-MAIL-CPID: ADE970C8E52F6C1278F0055BC2A836CD_0
X-Control-Analysis: str=0001.0A782F29.66D84D29.00E6, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2E8B160024; Wed,  4 Sep 2024 14:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1725451557; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+wniz+SsuI6wCX4+/GYWYwCSgqsJJKE8f4C0qwqIRqo=;
 b=BIhD0Qq5dqLldx2+dAnbTLi0SbQY9D4vLX40CB0D6y4/aqZlaMBTNTWfRqXvSXNspidAk1
 bEiNvMt//odEf4FuEhE3ANDJHspPUhNQJERFnQ2uTbHDF5q0xu5KhKP9fci589hYDphJSN
 MPS4oDmOq+m0OOrvzKl8qmsRsGhWC/uqGztLXdN+7ZDKR0TrPtYSnBxJQIMUxDZ9nMd9Uz
 EDnegmDPt+3RtrAYNWfves3ZZYQf2/FXHBvJhCLldZuFkL4FQZ4JwVpQMvyt91zlbwiVDq
 fIddJiq0Buj9NV7Gbe9A/uo3wKPVq3lQTTWoCODJYjhYEkARCRRZaq6KG0lCPg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 1/3] drm/bridge: tc358767: Use dev_err_probe
Date: Wed,  4 Sep 2024 14:05:43 +0200
Message-Id: <20240904120546.1845856-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904120546.1845856-1-alexander.stein@ew.tq-group.com>
References: <20240904120546.1845856-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

The function calls preceding these returns can return -EPROBE_DEFER. So
use dev_err_probe to add some information to
/sys/kernel/debug/devices_deferred

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 290e2532fab19..5ef33ce33dcaa 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2298,7 +2298,8 @@ static int tc_probe_dpi_bridge_endpoint(struct tc_data *tc)
 	/* port@1 is the DPI input/output port */
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &bridge);
 	if (ret && ret != -ENODEV)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "Could not find DPI panel or bridge\n");
 
 	if (panel) {
 		bridge = devm_drm_panel_bridge_add(dev, panel);
@@ -2326,7 +2327,8 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 	/* port@2 is the output port */
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
 	if (ret && ret != -ENODEV)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "Could not find DSI panel or bridge\n");
 
 	if (panel) {
 		struct drm_bridge *panel_bridge;
@@ -2550,7 +2552,7 @@ static int tc_probe(struct i2c_client *client)
 		ret = tc_mipi_dsi_host_attach(tc);
 		if (ret) {
 			drm_bridge_remove(&tc->bridge);
-			return ret;
+			return dev_err_probe(dev, ret, "Failed to attach DSI host\n");
 		}
 	}
 
-- 
2.34.1

