Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9B213FF1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E086EBC0;
	Fri,  3 Jul 2020 19:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392E86EBBC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n23so38240048ljh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ciPmfbP4wW/UjwuM/Du28+ilIENqwL0j3RJ/7QbWQbY=;
 b=pR9bfS2jmg+IrZMDbUOmT7zOcHBA+ihIIjGlCFim93TE3UvmW3ULBzJ1GvCBhrydfj
 67J4eXno3g3ki8rNb+6NxyPT8JF3HIaeYfBEf+rCyhA12rFFJapn3HV8TNBSvB+f07VY
 5mCw4/i9MAeGzYAFzT6CfFQp3BZw411X+j82wJD5+BzQ0E2C3NYBmzK/1yz84uYuXoiJ
 azHd7irhIvGoORX3y4L7r1C/vGrkbxMiaxoPJ6He1NAGYStR5x+0OoyydtcdG4tQNMHn
 a9AAD5Qrg2HHyeO9CjdmJzggXTFFJA2GQJFPHCFYcHf3tNwaFFb+EuLu+I4ss6DVCEhY
 NmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ciPmfbP4wW/UjwuM/Du28+ilIENqwL0j3RJ/7QbWQbY=;
 b=gQ1rmln0h3GrpCnqhCRk1NT9Lzmgcv9fQvLXMUcvz88Ob0vaIEgERxrH+T6TbkKzJr
 EDJH0fpwWoRDlMQfdgxMfGd7nszWmO5c5Sd/SuKNuSt7efcl0GvJZ+y56orBhemJMaTe
 FX1hfZrM7u0v1eZlluw9GoGeVp2CrWYYbuS6t1t2CoHnDMIVPLzPQhoIsbAU3/trvltl
 GXnA/t+/4I4rEIKBysqT6NDRBltxpdKLC7aqb0w8E9T9WWKA3EgOYtoEEEbjDDt/Iin+
 PZiMHwcK75LAUsBIx4BV3ndHGkH4xUMSB0nVKFG0Tn1+MRoix12osABlZy4whFND/ShR
 A+CQ==
X-Gm-Message-State: AOAM532+MerQkQ5i/zfMJYW4jiDyD/qvzHVP8qT6Alg6p06k4/6Yr6Vv
 l+7AR8lHr10s0xen42Hy6/vU+AMk+ZQ=
X-Google-Smtp-Source: ABdhPJyaYByOPpusAyZMG7Urpuk+rq99jKcVnV6HtCbDbuBd2ya6EYPcEl1K/OE9BIYSldGeq4a5OA==
X-Received: by 2002:a2e:8016:: with SMTP id j22mr12062443ljg.405.1593804280417; 
 Fri, 03 Jul 2020 12:24:40 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 15/21] drm/bridge: megachips: enable detect bridge operation
Date: Fri,  3 Jul 2020 21:24:11 +0200
Message-Id: <20200703192417.372164-16-sam@ravnborg.org>
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
 Martin Donnelly <martin.donnelly@ge.com>, Sam Ravnborg <sam@ravnborg.org>,
 kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prepare for use in a chained bridge setup enable the
detect operation.

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
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index cf1dfbc88acf..78a9afe8f063 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -163,8 +163,8 @@ drm_connector_helper_funcs ge_b850v3_lvds_connector_helper_funcs = {
 	.mode_valid = ge_b850v3_lvds_mode_valid,
 };
 
-static enum drm_connector_status ge_b850v3_lvds_detect(
-		struct drm_connector *connector, bool force)
+static enum drm_connector_status ge_b850v3_lvds_bridge_detect(
+		struct drm_bridge *bridge)
 {
 	struct i2c_client *stdp4028_i2c =
 			ge_b850v3_lvds_ptr->stdp4028_i2c;
@@ -182,6 +182,12 @@ static enum drm_connector_status ge_b850v3_lvds_detect(
 	return connector_status_unknown;
 }
 
+static enum drm_connector_status ge_b850v3_lvds_detect(
+		struct drm_connector *connector, bool force)
+{
+	return ge_b850v3_lvds_bridge_detect(&ge_b850v3_lvds_ptr->bridge);
+}
+
 static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = ge_b850v3_lvds_detect,
@@ -263,6 +269,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
 	.attach = ge_b850v3_lvds_attach,
+	.detect = ge_b850v3_lvds_bridge_detect,
 };
 
 static int ge_b850v3_lvds_init(struct device *dev)
@@ -317,6 +324,7 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
 
 	/* drm bridge initialization */
 	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
+	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT;
 	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
