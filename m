Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC77213FEB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9976EBB8;
	Fri,  3 Jul 2020 19:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F39B6EBB4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:37 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so22319820ljj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RisCUIYlCvVCA+CdEN3VYNEikSkgYtLF2Zy29I141ko=;
 b=UMjMfU6y+/Sj3L9Dc9fJp3OO4+TY9skiVDfX5AQNF66T3GY5thmKchqomDgxwqKPZG
 VHoByIAuv7aO5weuZLvuwqmUXuJ6F18eURlyvPnLtoTh4N98a0oYN6u4BPHaQI+80oTR
 anvpbwQqOJgs2T1DJcdu9IZekkjZf2JXE9jDpyOiM4g1mqkdkG9e3wK2Om4smol4P+aV
 Jf5rwVVs9jdjilQsElpGZHIdhK7lvJPvNaERQcir2pIUEDK2EbrpHxzM3O8eoPNVtLOM
 AKLKTHwOjq3LlZTif5CjpzS577tvoaWKiH7ytcKEoCgp3Zjua2FoVOk5HQTk0qCpdzr5
 KO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RisCUIYlCvVCA+CdEN3VYNEikSkgYtLF2Zy29I141ko=;
 b=AoO79N+bcP1pTtqGmXwdI7m1hMthO6XU5D7bu2L/TMEqfQDDN88DUcvF9WxfNyYz8i
 M04fJwUpbixcx1XiQDdFwEq8vKVNNloTnzmqwFNBRWFAX6TcAsXiNioqgAo3KVM0wuR5
 sPZ4OacQgjStHzKEWs5+tKurTAAeQEvHvqGIm06woYXna4zuH6hJJjjxBABxRWRDyPvo
 yiLk80xdjuEFdoJJlXM718S6gj5jREThcVnjSZlQhUSrN2qSXImSlO1WLKuNjlraCw7y
 H6313yDTAlqQBmYsHMbxi0PG6T8XHaWpJlKM3PYfYKcClz+ovgMKzHlJBeTtVyiW5nWv
 EEaw==
X-Gm-Message-State: AOAM531XKMEjCjRja1BF0eHUM1WvBRzqMDPNDHJvBJlgkWPMwlbaah/u
 8SznWjiSkGL/VUW+egumFXFg2/DCU/w=
X-Google-Smtp-Source: ABdhPJzMK50fMMrPsYVnk856Bxi5KgIc08CYpyIjuxX/jW4ExYQR89SuzqdpHeTSvyfCpdEKMgLHhA==
X-Received: by 2002:a2e:9cd8:: with SMTP id g24mr21253782ljj.245.1593804275621; 
 Fri, 03 Jul 2020 12:24:35 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:35 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 10/21] drm/bridge: ti-tpd12s015: make connector creation
 optional
Date: Fri,  3 Jul 2020 21:24:06 +0200
Message-Id: <20200703192417.372164-11-sam@ravnborg.org>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
