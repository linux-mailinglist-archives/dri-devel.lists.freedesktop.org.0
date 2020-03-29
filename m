Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA65D1970C1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 00:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1997489D56;
	Sun, 29 Mar 2020 22:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2F89D56
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 22:23:00 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id w9so6708604pjh.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 15:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zMRg/0yP9Xjy60a6h6rFBJo8CZLHExlOMPlSPckVbZw=;
 b=auvVzsF2PAUhBsqMwmVPVipZ8ae2alRiOjyFYIBalIWGSP7xNNwp/tQgbo3QBACovY
 UN67goolyTBoRVy2sxQuNXs4OH8DMquMR+kv5P3CrOcZSUZXa03f50OGeoYLk9lYw6K0
 OXz9hpmZf8XJVHOs71psXRA/x9KeJzViDbV/EhiFKd80dhJeRW+uLcGGdFH0DOgaO00H
 Rnf14q5dJxLDAXtWyQ6oUlOmx27UVhsPq2WDdKxGN8kMe4GAHC8WbtCE5/W2vbwIhQms
 mApl3AeYX3B5kGEqpK2+IdkhoucELKj0FBB9H73GE3FJwRjvca+RJvOtUyln8bO2pmKn
 pfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zMRg/0yP9Xjy60a6h6rFBJo8CZLHExlOMPlSPckVbZw=;
 b=sZUW9BwCPqiDjWpZ1Y/JACkm9yjXO12/aenrvkFxzr0PSbL/fOkCOcAKr8Kcx8YBu9
 Is8ip0vXopnnoZWZ9s99lUoaVRxnqEOkV2UysOhbJVMYZfZ7zPEn+1V0G6QT0G1EcA+D
 X1jyRxAvHL897y43JJa0Q/VOdRauAjHPkxwblTuwJilxvosUo9gDf76WgCgQrnIlx6xT
 kU/RCuNPnwrAwrmiSSyjMsFmiuCTKhhq/ia0Kng8xy2eiJnKK3vaKIt5Sg0bVQhWK19z
 fq3dCbg0WuSP7pVtLa9Fq9zgRoqxnfAIv1B72zl2RVqk0MkZ9B4rvQtfWfrove5PeyBV
 BQVg==
X-Gm-Message-State: ANhLgQ1gyc2qiAatNr/XNt3OQsjzFks11IMMA5/fiJr5v1laDwDQPaNf
 KENw35r0+6yEEUHxvmUOsZg=
X-Google-Smtp-Source: ADFU+vuRsESBPbbYj7/sBEGFFADXyyCP9QY+TCgzQXqevkGRa/Gzp3bp6Oi25VgJSvC0PE1XYx/bfg==
X-Received: by 2002:a17:90a:368f:: with SMTP id
 t15mr12898021pjb.23.1585520579653; 
 Sun, 29 Mar 2020 15:22:59 -0700 (PDT)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id mq6sm8993269pjb.38.2020.03.29.15.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 15:22:59 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Torsten Duwe <duwe@lst.de>, Maxime Ripard <maxime@cerno.tech>,
 Icenowy Zheng <icenowy@aosc.io>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: anx6345: set correct BPC for display_info of
 connector
Date: Sun, 29 Mar 2020 15:22:53 -0700
Message-Id: <20200329222253.2941405-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.25.0
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers (e.g. sun4i-drm) need this info to decide whether they
need to enable dithering. Currently driver reports what panel supports
and if panel supports 8 we don't get dithering enabled.

Hardcode BPC to 6 for now since that's the only BPC
that driver supports.

Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index d7cb10c599a3..ea5de9395662 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -494,6 +494,9 @@ static int anx6345_get_modes(struct drm_connector *connector)
 
 	num_modes += drm_add_edid_modes(connector, anx6345->edid);
 
+	/* Driver currently supports only 6bpc */
+	connector->display_info.bpc = 6;
+
 unlock:
 	if (power_off)
 		anx6345_poweroff(anx6345);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
