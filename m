Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97BA8BB5FB
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A600A11329A;
	Fri,  3 May 2024 21:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cx3RwMEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFBA113298
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:14 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1e3ca546d40so1026175ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772233; x=1715377033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTn5MbULQaeKHbflLx1nU+BRyKgxWcgq1caqQZJZ4uA=;
 b=cx3RwMEBJyWTzM4XmtrjS7X/8ZF2SpOIElAd1Xz1N29UvmhZIMSu9TPVNCTZ701I62
 E45Xbfm1pxrRzsjMEB3GNln7WMoeacCoiE7WqmiizffzK1Q4tgNVSujDWWJdJlZm4oFw
 PNjQmMGoyUfJsMC509KMNXMNj1WpLjLimACeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772233; x=1715377033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tTn5MbULQaeKHbflLx1nU+BRyKgxWcgq1caqQZJZ4uA=;
 b=wTwEvNjs9fOsaaKRaDIcu9+xyecl098ALfTRmqn2wkT884U0aLALtBJc1+x6JStf1T
 /nUtB7iWQyVwDLpH7j4CFkAdGuSx4eHJnKZ1CUKaqADS2Oc0MyAtHpdD1P5qjC24wKe6
 LXWqSpQnU7N6ADhUyZoe8hzDVdWh+40zgqjFS9XX7oxkRNZkQj5r95FRtL+Jq6+oI7VZ
 4vUH35egFPQ8FbUe8tiSUm6/iVErt0SH/0Rnqwnpk5BTnGa+bc9UL1QgoC53phy4IdRE
 293ltUmFhJjp6e/giPoKC5ACKi/RCfidTAFGG8ebzhrHeXYXvwJamttEF9mzcSGV3dHl
 L65g==
X-Gm-Message-State: AOJu0Yw84xCPUFaW4dlFhtc/BHIV71SZ0rROT8kZVQMnCdsWZ9R6t8WR
 +rrgrHcg0BzWyDG4GtZhtAl0JjaG36iil+5+vSXv4TzST7HAZLAxJMZhngzn/5Hp5fvvFsr/Iy0
 bkg==
X-Google-Smtp-Source: AGHT+IEj6p7S/rBweU0qKixBlNVALPCuJKnvCSE6LujqLm3S0J98P3JUSBEGZTwGCVPY2YIYmiJT9w==
X-Received: by 2002:a17:902:da87:b0:1e2:1915:2479 with SMTP id
 j7-20020a170902da8700b001e219152479mr4889534plx.12.1714772233439; 
 Fri, 03 May 2024 14:37:13 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:12 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Stefan Mavrodiev <stefan@olimex.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 21/48] drm/panel: olimex-lcd-olinuxino: Don't call
 unprepare+disable at remove
Date: Fri,  3 May 2024 14:33:02 -0700
Message-ID: <20240503143327.RFT.v2.21.I4c79deffb7551ecfb0378302f8dee1275fd1c060@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

Unfortunately, grepping mainline for this panel's compatible string
shows no hits, so we can't be 100% sure if the DRM modeset driver used
with this panel has been fixed. If it is found that the DRM modeset
driver hasn't been fixed then this patch could be temporarily reverted
until it is.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Stefan Mavrodiev <stefan@olimex.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 8a687d3ba236..94ae8c8270b8 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -251,9 +251,6 @@ static void lcd_olinuxino_remove(struct i2c_client *client)
 	struct lcd_olinuxino *panel = i2c_get_clientdata(client);
 
 	drm_panel_remove(&panel->panel);
-
-	drm_panel_disable(&panel->panel);
-	drm_panel_unprepare(&panel->panel);
 }
 
 static const struct of_device_id lcd_olinuxino_of_ids[] = {
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

