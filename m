Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12B22E292
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5B76E071;
	Sun, 26 Jul 2020 20:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470A96E064
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x9so15023703ljc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1EBB3Ir0B1NE0wvwosVJgq3XPk7EGt/V/fFDmbYyVf4=;
 b=YXhSEqF++71SO/LJklmLBv9zd/MX4mD8laTZmfik6vIKEZ7ctkbbjJZcyCrlIO6oib
 XDYVK4PG7b58QeOKXdHkXlv5nCeUvths45VJ8IMLHH7LiZy5jNp3xCs4GM/V+Ok+u+Ie
 /eNQPt/oNfWakvL+ruxt88kXTTEE6Pwn1lLNB6U7JepvVHJaWadP+1ophU39MxJrITrP
 sSMfGHueMTEVu/CPbFGv55SHTj0+AefmawaZh/3+o0mA9YB2RshWUMx2smxazVXS8l80
 ImpT5IN1eUuEgj2wpejW6uU4uOk/s2g6x8a5RQHgbzAE/ReZ/q7uB/LjhxSRv7PWW+H6
 ka9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1EBB3Ir0B1NE0wvwosVJgq3XPk7EGt/V/fFDmbYyVf4=;
 b=eafkj1BNbu921t8VPwKX6fkE3oQxaWASjtRadp+BgFtkybMScI8Mv5YfPNcEJpf+Xd
 J28cWhsIhSuHi3blr/dXqgxqIZ2BXgBuAjLrLQeYarAlfM6b+MPfHC35YMYcZ7x+4fNm
 k+LxpIKKXGKn04UDEDP9qwswmdDrO7sxOSpNM0vViJZrOCDDdK46evIoRofWTYOiBGnN
 Fx+fv1Vhl4/ZX1aEff2nNWoKgeVzVHBS6u2UKn9h1UZKe/NgKcRf1PnGEOHggeL0Wzpr
 dMeQ8u1B6qr5wfATTzoSDABdO4IGzErqe1xuPCdVWd0HWR/Zp+O5BH69nblPWQ4xAcyU
 eRBA==
X-Gm-Message-State: AOAM531Ji1Sh2kg4igCN02FzYh9Xc3p1BME96NeuwfNlvBzb4W/Wc/Sf
 EndMjrUf4stYG0od2zRcGW6qY1hIYsE=
X-Google-Smtp-Source: ABdhPJzk4FGerqnrHIijBAH/PsM5cEHyI3MTmfsw0/sL73nUBjBeYjIMyWklGASXWg5EGI7RvLJskg==
X-Received: by 2002:a2e:81d7:: with SMTP id s23mr8340494ljg.398.1595795626572; 
 Sun, 26 Jul 2020 13:33:46 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:45 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 10/15] drm/bridge: megachips: get drm_device from bridge
Date: Sun, 26 Jul 2020 22:33:19 +0200
Message-Id: <20200726203324.3722593-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726203324.3722593-1-sam@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kbuild test robot <lkp@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix so drm_device is read from the bridge.
This is a preparation for the connector being optional.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 258e0525cdcc..cf1dfbc88acf 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -226,8 +226,8 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
 				  STDP4028_DPTX_IRQ_STS_REG,
 				  STDP4028_DPTX_IRQ_CLEAR);
 
-	if (ge_b850v3_lvds_ptr->connector.dev)
-		drm_kms_helper_hotplug_event(ge_b850v3_lvds_ptr->connector.dev);
+	if (ge_b850v3_lvds_ptr->bridge.dev)
+		drm_kms_helper_hotplug_event(ge_b850v3_lvds_ptr->bridge.dev);
 
 	return IRQ_HANDLED;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
