Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B7213FE6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAC26EBAF;
	Fri,  3 Jul 2020 19:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9588A6EBAF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:32 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n23so38239636ljh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=upzKaX2sdtPakB1l/KiuyqSYjHSkt6QVUVYFcE/BE7M=;
 b=UOoqK6IoNfYLUqo5GuwbLxLzgxJbHsNIH9iKcTVG8SpBEZrwJtbEVkMS3yJ7FD1PPo
 2ldxFeJTkB8UngqEuZj+A1yyJJFjOVE8QY50T0aio4VsIGGCd+2nABBJUv7M22RFyybW
 WMpXdpBPhdPbp/pL27BhG/wE+XTjT1pdGdEBjTM9fy/hVTPEPCRftyIPSIL4ivERBGH6
 Ni9r+L45C6kFRaTaqb0cjd2pzF6Jtk4D2C1eIu/okcO1/rAJgjjZvpreJV55C4GmvnvL
 itfhfA0ULQ7A35fx/QXyeFdsyMhZLzai/H4h3R2HUQCGVIN9+0LIolC4sc/By3Uh+Klf
 8pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=upzKaX2sdtPakB1l/KiuyqSYjHSkt6QVUVYFcE/BE7M=;
 b=oPztNo1qf1ga6NoX4+yxSpaGu/6+Iv6x7KTHb4f6deQd9bS+BNGdD1pfE0zNqxMpaS
 gBj9II0RjtOVgKaU1q0D6Mr9GGiJPTMkEAPyWeaUc0Of0UhAv7WfzvjT/a4gUzCCyWNg
 UjWR7KI84iTsR1w7docbnwKxYxMshpgyntD3/g0IT3duTnItycRG1MNl/ZFRkNgJKx6R
 3ELIzx6ZZz0+tLl3NNclmO07ys9OyUAec/JtoAmLj8yhg7vkeAZVrBww7zEhr8fJs5NI
 eRzoXR8Bj+4bu20hDy/8mWrjP4iH5i8IDJEV2nImpuqMX+spTc0HuW9cLClOSEBB3flz
 5x5w==
X-Gm-Message-State: AOAM532TXpNlSxR/3AOeDsbRn6K5I2m8tmhVlfl/KILucfpXAuyAPAN9
 Wn6BHJ5C2Gjp+Rgjmjb2zExscgr1E5A=
X-Google-Smtp-Source: ABdhPJykQR/VPfjTnrKxvUZMWgvEhBv2VxoKyPt81Wx8E8oO+NMAn8JhUa8KhMHYm3CQyp7gTqt53g==
X-Received: by 2002:a2e:9050:: with SMTP id n16mr20052513ljg.376.1593804270746; 
 Fri, 03 Jul 2020 12:24:30 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 05/21] drm/bridge: tc358764: make connector creation
 optional
Date: Fri,  3 Jul 2020 21:24:01 +0200
Message-Id: <20200703192417.372164-6-sam@ravnborg.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the connector creation optional to enable usage of the
tc358764 bridge with the DRM bridge connector helper.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358764.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index e1f052a4f53b..4477224e5079 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -337,10 +337,8 @@ static int tc358764_attach(struct drm_bridge *bridge,
 	if (ret < 0)
 		return ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	ret = drm_connector_init(drm, &ctx->connector,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
