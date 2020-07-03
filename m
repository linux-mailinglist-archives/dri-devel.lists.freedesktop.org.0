Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E9213FEC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF67D6EBB4;
	Fri,  3 Jul 2020 19:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377C66EBB4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:36 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t25so33590736lji.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FQnhieVsd4eVB3uyKCGQN4vwKBBwB/LJbtTCKWQkRrE=;
 b=MMNrxqdOwWH+xExZcP8P4B8ISHK6/P4/FckJXwM42G6BGC4I/U2wjM+9RvY+Oqrne3
 doSzp3O+/PgfdNo8mJNBpM2LqysK5N6sK1o7w/VUUlLYUkqBhxhcpMf1BR96N5fd/BRc
 aNSvZefp2lgczkkFceEOHEgVooAGgA9xAspGAl8PS4snh7U2N9/6/8dE1j8eZqXlJLoy
 Em4gLrhmOMtg9Rv6zNgz4h75LpW4aZpW5ZeQa70gf/k9I1eQama8epjEmJdNH94V+p98
 K2VoXdMOn58ptuRoCBbIVr+LggqqKQh+p2QgPwK85372rx8JpVGMz0lc3QiCrAbFI0MS
 Wqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FQnhieVsd4eVB3uyKCGQN4vwKBBwB/LJbtTCKWQkRrE=;
 b=m1Y2CLtlkJjEXH8xCHz70JhiEoPjD6thdqV5xow07CdGocGbWlhOEg+7+to0XQya1l
 jlIaU/Gnx1RYXyhSN5+NAvy20CnT6lCB7Z4VvfYZkaAzs/fqS9lEoP5UA4kAOfhbTMod
 SCk3KDj+uVKds2zVd6nb/+iwnlRjAxRonTVZ9P6E/pbo+hLjlNGZIFPuJ7/QSVfZPJQq
 gMbPHkNFzelN7lguQrNwR8iGV+pIkIa4ASyzOCUcZdKOr4bb82YdfL+ux0w8icU2yyz0
 sXXNgkZFRi4Qc4N2t6yp8uhXAUdka/PJsYdXhUGTm/VfUoVPyAAOyFOj5lw40fQmaZM3
 T+Rw==
X-Gm-Message-State: AOAM530F7yutwf2UZjuOgxwf4HAOgKmk366Yu7FS2xP9F5pnBSKtUSFd
 NI5VMVWyEOdnr8YGLdTcR/OLV5kdZ3I=
X-Google-Smtp-Source: ABdhPJw6fyJVeCwX3WveGpOmXlM5QBx6VyIkDKORneY3LySODLv6FMcWdDRf+qhOs2Vi70BJyJgXzA==
X-Received: by 2002:a05:651c:200f:: with SMTP id
 s15mr8019656ljo.125.1593804274493; 
 Fri, 03 Jul 2020 12:24:34 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:34 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 09/21] drm/bridge: tc358767: make connector creation
 optional
Date: Fri,  3 Jul 2020 21:24:05 +0200
Message-Id: <20200703192417.372164-10-sam@ravnborg.org>
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

Display drivers are in the new model expected to create
the connector using drm_bridge_connector_init().
Allow users of this bridge driver to support the new
model by introducing support for optional connector creation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index fb9d57967b2c..2eb00d39f619 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1421,8 +1421,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
+		return 0;
 	}
 
 	/* Create DP/eDP connector */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
