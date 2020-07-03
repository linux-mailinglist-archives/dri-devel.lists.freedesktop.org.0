Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE1213FEF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28246EBBB;
	Fri,  3 Jul 2020 19:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFE36EBBB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:39 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t25so33590873lji.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pG4sBLdV8sXhjJG9670kJDTdMvHOUXkksq9OtkoN0aw=;
 b=md0jMJrGaTV3NEIPKpYifFnT8UG0j1dEpQ/Y0JsrpM0TIYfVaJvT0ll7PxI90kCfcM
 GYAP8L8mnIka/CPcl4gu6uaM48kBDEmVWkXlsRFrutyp7MwvlaxG7jgwI3zbhqIr4c89
 4JTswKC9KpEEZ3u5rxgCzuVQW5dXimIeo9KhtvLMamEgNxFGHQqth+kxb9v3AtM5D6F+
 mWSAuAGbd0g8zb+M8V5fD8YqQUUNtl2DS+A83XCFKqDQUVr3lpnGvBLDTKIhBbWGTLgx
 Q2KYzJoX7/Wz7hIcUvtbCpXdQU4w3nCdHeeNbBh+oCr8LEZQbm8g/OADjHmmwVnnU+BO
 xBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pG4sBLdV8sXhjJG9670kJDTdMvHOUXkksq9OtkoN0aw=;
 b=FF2VgiQry87hXNBDtQyyw2fYGNKoZOLCwV+Dt3eDqcES0JBLucrU5DhSfH73EwTiIG
 ZFoJX0DNP6UkPpC+01Ggnly2RtnwLpHnm6v4C0qSFHldl83fwwCoX1xq7MSTopNqcVNC
 aW5FRpkMmmGJG8gxMUrQbHCdWWCPtu72uXWCC4jlPxuKa1Hda9FCmfzFIawSuBlOB7Tu
 E0TImsYqNxlI/gU7r8ajo1y9Nq3vb8oFHCfjsaxR/Q9DdhpXiubcM7F9pG8bEdSNlkQb
 hzYAm3T9OE/hd7BfWa/+rR85DooB8d62EcvluDDrztGFXEGGSxHE81FrqQX3M5KehVln
 SArQ==
X-Gm-Message-State: AOAM532LUHkszykmdTI4ENygA384r/PglmhHjTV4Oufad/gYaOGpHNwB
 USlYeOxJ4Rusl4Q1Y9x1ipVkYZBkGAw=
X-Google-Smtp-Source: ABdhPJxNYZPQVS1SAwN5aCudy3pB8pm9g8EJtDJhHHwh1KhMnvrRqIhUOIJXoj3oXV4ljo2rh4Y58A==
X-Received: by 2002:a2e:9e58:: with SMTP id g24mr8574736ljk.195.1593804277460; 
 Fri, 03 Jul 2020 12:24:37 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:37 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 12/21] drm/bridge: parade-ps8622: make connector creation
 optional
Date: Fri,  3 Jul 2020 21:24:08 +0200
Message-Id: <20200703192417.372164-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the connector creation optional to enable usage of the
parade-ps8622 bridge with the DRM bridge connector helper.

This change moves drm_helper_hpd_irq_event() call in the attach
function up before the connector creation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/parade-ps8622.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 6ab6f60b9091..54aa5270d2c9 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -459,10 +459,8 @@ static int ps8622_attach(struct drm_bridge *bridge,
 	ret = drm_bridge_attach(ps8622->bridge.encoder, ps8622->panel_bridge,
 				&ps8622->bridge, flags);
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
@@ -482,7 +480,7 @@ static int ps8622_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ps8622->connector,
 							bridge->encoder);
 
-	drm_helper_hpd_irq_event(ps8622->connector.dev);
+	drm_helper_hpd_irq_event(ps8622->bridge.dev);
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
