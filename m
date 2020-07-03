Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB85213FF6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453146EBC2;
	Fri,  3 Jul 2020 19:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6A46EBC2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n23so38240285ljh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M88NeubDE2y5H9P6Cv7tSoKVIkco/TU4mlGIabC55e0=;
 b=vQCAWWzhjNiuTX6FMk4G0kO2kVCVSFncJlPFc5vcZ1roswR69erkojlXeVZEeGQfEI
 caJVpzrlhyRFrjRXXbzTHiOXrpS/hZjNmVAmUJCD6qaL2P0kouku068mfYSWjPol+cKk
 VOB2k0j9oNiKogB8Z0MUNEdQjvY30PdCXxyL1VUl9NSBxhZwIIUktw5KLOmn62zjOioK
 FyvmrcylmwiJoqfv5pBssh2jygaI9KWYtyKdMYeFVQ86i9CMnUXyBakvVoqT8ynnZJsp
 TfSD3RyXT3ROHfelkuep2HbQQ2ikR8CA9jD/SIbHlBUwn4TKMHh+jPucYvkFJN2t13t7
 yLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M88NeubDE2y5H9P6Cv7tSoKVIkco/TU4mlGIabC55e0=;
 b=DIAUR2qsDWVYeUcgDPkLv9RfAydZDdU3LnJQtcdfNN/YfM1K+gokBA+hEWWnAYAIIE
 eE0SJgJBZWKz+e4Es6WrxGV5iYmAMtm5jQeflpL9iWZI5tg2PifmA3ap/M2KYTEPN4WT
 q5WxTnGNuhe7KKDLuZnRz8PwYIcz53SsOfUgO1O6srR6tMBIBz1ry6H5bByNT4pzWZMt
 nGHxezGLDm8L16Z8DT6xLWh1jPoYYb/6qM9hnSvr27XO9FJ7d9eJ7kY9iqlg2ivRh7aL
 WrG9L6MZE7aYDNblyFNIXqvQt4AiGnEeeGF5xE0rawvNW8qfSATr13MA5R/EO1gxgPrW
 5mfw==
X-Gm-Message-State: AOAM532ZIyr6pV+xve43DxbJvcw+vscERzvOj71i14mT+7CBROU5RUfs
 iPqNZJXVX46DtRkYJ7fdJ2xzskcpd/4=
X-Google-Smtp-Source: ABdhPJx0dEGsLI5LgbIVQj1GUBoE6P6xS4edef0a83+d1ELGDQ80ucSFnDWDOezlkWGp+5kdZaAXBw==
X-Received: by 2002:a2e:88d0:: with SMTP id a16mr21296280ljk.213.1593804285749; 
 Fri, 03 Jul 2020 12:24:45 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:45 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 20/21] drm/bridge: nxp-ptn3460: make connector creation
 optional
Date: Fri,  3 Jul 2020 21:24:16 +0200
Message-Id: <20200703192417.372164-21-sam@ravnborg.org>
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
nxp-ptn3460 bridge with the DRM bridge connector helper.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index e253c185f94c..6a65657087f9 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -229,10 +229,8 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	if (ret < 0)
 		return ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
