Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A054C22E291
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B866E05F;
	Sun, 26 Jul 2020 20:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F0F6E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h19so14993976ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uX+TT4QWAvG80AbodGqHvsEovFQ2Bu21T/XzdAJlnuo=;
 b=TM0GiHLC8WpQHaSGzixAFzMvcLL2nLedP1jZkDz+4vbScRX/r8rwhTzNi3UNT56huV
 ox9WBSVY7C8kGJ6itKE4kh1lQvchDrGIQV6mlHd4z2gO7CxV5o0L3qAQM1OutE48+PDA
 M78j+6v8EUO9YjIw3vKVlMGWAzYIKr84yQC8MSzCnJ0p7sIdkoLBadPvTyiqmCwSDVXz
 67ktmwnkSnNsVFWW24cccHpNqbOOUw2Alu8r7NZSLocDKMNPemHnI9G2VjCarWKFKq7V
 +DpjHqi69o6Ynv5gukaL+RvuoJZbSVXKsBVNLf9PXiQ+As2ykeE9I9QE+g83XsLeYR60
 V2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uX+TT4QWAvG80AbodGqHvsEovFQ2Bu21T/XzdAJlnuo=;
 b=NsOOkUMlLLXTfgPgy+UqJK1/tGYrVrby0hDQUOt+a9PnG6gHvKUEu+hltiRonL1k0v
 bo2uWGoiT5b7IgoOS4uK/vwbelIoQXyMwLjSHL3cRmqwPnVWKcOnaWF7x4Z93gBLbblG
 iYs2Ow2ADXHMbyRSL6RuWDtLqbWFYKJgS6QZUe5mW1UlqQ1gfSmr+VKQ/qwyiFoE9QeJ
 sO+McoOIh3vGSTLp1bIcbOReEaG3cFgE4atBJd/YJeMktlWRMIUn0/IBp+8w2Nl6Td6o
 5s+QkCkZ8U2S4KASV0fb0PRtPNjb55hCJq0d2ELwEER61pF0asron4JrMjV2FPcmkNWI
 cCDg==
X-Gm-Message-State: AOAM5311fkaEMkmEf2bDYrZpKOYQ/BQpolXWpOaTye1kjqnJ8I0reDoD
 AHAEw5pLssPgz3In9l4H8f3ZYptyWJ0=
X-Google-Smtp-Source: ABdhPJystrsdc1UDD65fIekQWsqKPKij1SHfyLhUOrZucDKv7eX5xnRFvZR2FrodVJoR84OzxV8NwA==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr8992100ljj.360.1595795630648; 
 Sun, 26 Jul 2020 13:33:50 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:50 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 13/15] drm/bridge: megachips: make connector creation
 optional
Date: Sun, 26 Jul 2020 22:33:22 +0200
Message-Id: <20200726203324.3722593-14-sam@ravnborg.org>
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

Make the connector creation optional to enable usage of the
megachips-stdpxxxx-ge-b850v3-fw bridge with the DRM bridge connector
helper.

v2:
  - Set bridge.type to DRM_MODE_CONNECTOR_DisplayPort

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index f7b55dc374ac..61a24f265c7a 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -245,16 +245,6 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 {
 	struct i2c_client *stdp4028_i2c
 			= ge_b850v3_lvds_ptr->stdp4028_i2c;
-	int ret;
-
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
-	ret = ge_b850v3_lvds_create_connector(bridge);
-	if (ret)
-		return ret;
 
 	/* Configures the bridge to re-enable interrupts after each ack. */
 	i2c_smbus_write_word_data(stdp4028_i2c,
@@ -266,7 +256,10 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 				  STDP4028_DPTX_IRQ_EN_REG,
 				  STDP4028_DPTX_IRQ_CONFIG);
 
-	return 0;
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
+	return ge_b850v3_lvds_create_connector(bridge);
 }
 
 static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
@@ -327,6 +320,7 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
 	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
 	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT |
 					 DRM_BRIDGE_OP_EDID;
+	ge_b850v3_lvds_ptr->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
