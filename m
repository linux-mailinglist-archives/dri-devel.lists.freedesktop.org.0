Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E322E294
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9727A6E0CB;
	Sun, 26 Jul 2020 20:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB746E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:51 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r19so14981596ljn.12
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vdrEsc4W+XPqou73FvY0YPB4idkSBZDmcrkLIZSIomA=;
 b=fp/7FJQK+GjncJCImvkq68O7i42AeKS8CL1LsQ5MooruHGOeeotLCJ5JmVBhxEaG+A
 Sv9b70tUH87TbmsWZ5rC9IbTR8qE98Pg1UCW8f3gynkbgCv0u80uuwsi16/XrFamq7MD
 tAiSYA+H25+BWyg9TS2iJWr82DgtOUP7x7XXnLFKRek7gV1ylsBAVklJKIo6He/xvGLN
 Z4tSg+fzcKcwHOVzP3/9AYdHBx7aiKUx/AMSWvaaKujZ9Nnbrs8FT99vava7Dyl0Owxr
 Yid2SkOF18g7upE6yt6Nykz2f+BY5XzbftqUOJ0iejtYe9f8i3QYG0Kj2hObDdYHnBua
 TjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vdrEsc4W+XPqou73FvY0YPB4idkSBZDmcrkLIZSIomA=;
 b=P9gztl/g7b2yXlX49vMCYnKuhsP1EkcsnW4HCRiC9w8rb+i5ClbumNswXgUojGL4io
 gn0Op6d6LffVhegPXgwXoYlZK9TNlPBEtZv92rg3cYxy84lvDg3s42ptfH56mQGWpvmr
 JaOCZ5Y94eF/OZ9ByhqffudxDgnpObgcRlDd0oTg9mMOEaOjlFDBDjU/6726Dqs+P/Dx
 5F/936KzbvzkzodpvPbndtHyYZWHMIGaAyGx1xfHjx0FnxwyWvBRRYx0jLWmdiZlwhKQ
 asnCDWgNCaOvSSXcEQB6KPBXUBtQznJ2Yoye5aIL74NmtAushgI9CGR+gP45RrASUDy7
 RZbg==
X-Gm-Message-State: AOAM530vd/d4/P4N6mHLnn0Sp7RzgVSiB75AH5izbDVIrrv9VHHQV2XL
 Gs8eusBM7m6/ZqdA4pbHETuRxFPYYH0=
X-Google-Smtp-Source: ABdhPJwMj1mvzznvhxxBJj+ymEE1YTbI2Gyssb13HJfnlx8XCDG6ngXItiKpbu+gA6JXdrJdbGTW6g==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr8721901ljc.159.1595795629461; 
 Sun, 26 Jul 2020 13:33:49 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:48 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 12/15] drm/bridge: megachips: add get_edid bridge operation
Date: Sun, 26 Jul 2020 22:33:21 +0200
Message-Id: <20200726203324.3722593-13-sam@ravnborg.org>
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

To prepare for a chained bridge setup add support for the
get_edid bridge operation.
There is no need for a copy of the edid - so drop
the pointer to the copy.

v2:
  - Fix so we do not leak memory (Laurent)

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
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 31 ++++++++++---------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 450dca33ea48..f7b55dc374ac 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -61,7 +61,6 @@ struct ge_b850v3_lvds {
 	struct drm_bridge bridge;
 	struct i2c_client *stdp4028_i2c;
 	struct i2c_client *stdp2690_i2c;
-	struct edid *edid;
 };
 
 static struct ge_b850v3_lvds *ge_b850v3_lvds_ptr;
@@ -131,22 +130,26 @@ static u8 *stdp2690_get_edid(struct i2c_client *client)
 	return NULL;
 }
 
-static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
+static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
+					    struct drm_connector *connector)
 {
 	struct i2c_client *client;
-	int num_modes = 0;
 
 	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
 
-	kfree(ge_b850v3_lvds_ptr->edid);
-	ge_b850v3_lvds_ptr->edid = (struct edid *)stdp2690_get_edid(client);
+	return (struct edid *)stdp2690_get_edid(client);
+}
 
-	if (ge_b850v3_lvds_ptr->edid) {
-		drm_connector_update_edid_property(connector,
-						      ge_b850v3_lvds_ptr->edid);
-		num_modes = drm_add_edid_modes(connector,
-					       ge_b850v3_lvds_ptr->edid);
-	}
+static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
+{
+	struct edid *edid;
+	int num_modes;
+
+	edid = ge_b850v3_lvds_get_edid(&ge_b850v3_lvds_ptr->bridge, connector);
+
+	drm_connector_update_edid_property(connector, edid);
+	num_modes = drm_add_edid_modes(connector, edid);
+	kfree(edid);
 
 	return num_modes;
 }
@@ -269,6 +272,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
 	.attach = ge_b850v3_lvds_attach,
 	.detect = ge_b850v3_lvds_bridge_detect,
+	.get_edid = ge_b850v3_lvds_get_edid,
 };
 
 static int ge_b850v3_lvds_init(struct device *dev)
@@ -304,8 +308,6 @@ static void ge_b850v3_lvds_remove(void)
 
 	drm_bridge_remove(&ge_b850v3_lvds_ptr->bridge);
 
-	kfree(ge_b850v3_lvds_ptr->edid);
-
 	ge_b850v3_lvds_ptr = NULL;
 out:
 	mutex_unlock(&ge_b850v3_lvds_dev_mutex);
@@ -323,7 +325,8 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
 
 	/* drm bridge initialization */
 	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
-	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT;
+	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT |
+					 DRM_BRIDGE_OP_EDID;
 	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
