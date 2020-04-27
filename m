Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D1E1B99D5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792876E0E9;
	Mon, 27 Apr 2020 08:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D238E6E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:14 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u6so16570907ljl.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pZep/jY/+EyVfLfw+h1sXnkYCb03QU2cHUNH9eRWjGo=;
 b=doMLDeyc0qTYyRN3nrWhLDiOppXdoPIoXkMcMDCOrKcLXiBBFHTBP7m2+76Q0Upb/m
 IGzt2Ke7oBNLtIZMLAbsGZ6B0UT16X8jpKqLhhxeaqWKlVeKR4UHbdQLc9DXWD5NydTu
 6Nr0eTAVUqYskOaqizmmwynK6ZCcIZFpkfDeE0QxKEC2lqIYcLQZgZQDuzNl5R3yWkfQ
 i+Q5bsPMfy0pkH8XnqHuSEFIHAruLwMtvDWidooDtO5QlPKmGC451SF7kT92mWK1H7Nq
 JWvXlvdWo8s9jTxap/+MqSfxb2/9j+ZcmHdI2UEVpJC2RJTLieY67loPRrlavFnS9Z93
 v4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pZep/jY/+EyVfLfw+h1sXnkYCb03QU2cHUNH9eRWjGo=;
 b=UtQiNtZCbNDiiN+zoErfAmRXGY+D3O5mJxcrPXbYOWHux21tsQ8mcD6x01fdse72xA
 GxlmNtGgVqHygaKWoupD8uxO/OFwyxDvapFp1K2889xRaIpFU78u5eo/l5ss7ZyvpFLp
 rA44/jCRePwayjKBrZRNcCHwrCTfKTkITu5gZCflMOokw/4VhUAmAGHyGpiR/KbTGVUS
 DD5Klr56qnRddWCSEaczJqikh73IOUU0gVHs3JxYJh35VyTuNJTMqI/g6GrFjXoYk7iX
 +wy4wSplJXCJ1Auu25bVU2bMVSn0PMKzrUdRvTHL+qOHoT9kbm6yiXLOXuAASRJGJHgi
 fNmQ==
X-Gm-Message-State: AGi0Puac+iw/w+4PBEudUb9OuC8RRy1pqW4NYRBefQxuqzDnnFiUPt0e
 wlBOsaYMywLiMtqQJmhGidvrrZXr
X-Google-Smtp-Source: APiQypJfAzHdNPxxayGFz8rgIM2UIvosJ8obtm4ukMNyp4uBEQq4XNcKVeia35Qg34I0HJ6MIYMzwA==
X-Received: by 2002:a2e:9255:: with SMTP id v21mr13607178ljg.222.1587975552955; 
 Mon, 27 Apr 2020 01:19:12 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:12 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 10/21] drm/bridge: ti-tpd12s015: make connector creation
 optional
Date: Mon, 27 Apr 2020 10:18:39 +0200
Message-Id: <20200427081850.17512-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ti-tpd12s015 do not create any connector, so ignore
the flags argument, just pass it on to the next bridge
in the chain.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/ti-tpd12s015.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index 514cbf0eac75..4f1666422ab2 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -43,9 +43,6 @@ static int tpd12s015_attach(struct drm_bridge *bridge,
 	struct tpd12s015_device *tpd = to_tpd12s015(bridge);
 	int ret;
 
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
-		return -EINVAL;
-
 	ret = drm_bridge_attach(bridge->encoder, tpd->next_bridge,
 				bridge, flags);
 	if (ret < 0)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
