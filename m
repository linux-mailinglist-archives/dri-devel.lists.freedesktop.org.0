Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C4E22E297
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256686E0CC;
	Sun, 26 Jul 2020 20:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB02D6E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:49 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t6so2074990ljk.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9o8t7ItYzAGUAEqtU+IrEhK6NT764az37c2FDqzuP8A=;
 b=QdsmJADYIm6qEB6VQOZjS6vGVoAA0VKMkR64isV8DE0fpf2bh8u6hA2Vc2sJrlbLJQ
 DIOmBFrRCLDY/ttsiW9vnAK5XtZwV9GaQxq92CxHOFt03VeDRaNpJ8MJUqAC0F3n83zh
 s6TBrRk5QN7Us66MV2/ke8asAe5u5wPDapCVI3MF/e3uKTXjS4lv8wtxR3uy7tBggA4s
 8eAi0PDz+kOFvAtPulQKwaXklYe9VMDhXIh0b3ES3rp+Kw2TCMEUhTB/KdhRCbF4p2RQ
 rsU+fTv3hPWJU7FnmhHI/f0wCH+79OJSBrFwKBz5y20wbKcb2gdPNazhXzd/Zmcnuo2t
 VkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9o8t7ItYzAGUAEqtU+IrEhK6NT764az37c2FDqzuP8A=;
 b=aTt42QCc4yv2Ac93okfbpRCJwdb6LORlSUC3YPlXZpZKvoGTTDRkivZOVawIVjMQcq
 OR6pMl3dq5V/jQgndbsRQKJ3ZFML4vcewohTG6Xa+SUS7x+1PNjkiqpM0IzWyiWT11F9
 fp0NRgqMFUFedQfK8o1hJFEPAKmUrzlGu2MsEu6v0qhkwY892GsToqfK1YKyYgY1pZwS
 RJiMlYIuxZk8NgOayiyxYGqyVu6VL3z3a84PUIBtrDOuFrntr+8GkJevmfjSC7alTIor
 A+zKcfyP13ri0KiZ1acAaM81Fo0XmO9NPT5s8a0BEJKnRO9CDGDGkbvb6WERyM1aZ4wR
 ITdg==
X-Gm-Message-State: AOAM532/P9TtiWU90DwlQgX9N0/zTyp6VF9lSqriJoz+A+qv/wKxWBW2
 wlLyuX+aRrlo5y6sQ/SmOeLMhddzSCI=
X-Google-Smtp-Source: ABdhPJyx3VXYYjaE2z/NLai+VQEfPci/+44N5q8cauOJbWhx4QABm5/FOP6jVSCTOY4P7+0Wa+UywA==
X-Received: by 2002:a05:651c:8c:: with SMTP id
 12mr7968963ljq.420.1595795628118; 
 Sun, 26 Jul 2020 13:33:48 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:47 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 11/15] drm/bridge: megachips: enable detect bridge operation
Date: Sun, 26 Jul 2020 22:33:20 +0200
Message-Id: <20200726203324.3722593-12-sam@ravnborg.org>
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

To prepare for use in a chained bridge setup enable the
detect operation.

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
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index cf1dfbc88acf..450dca33ea48 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -163,8 +163,7 @@ drm_connector_helper_funcs ge_b850v3_lvds_connector_helper_funcs = {
 	.mode_valid = ge_b850v3_lvds_mode_valid,
 };
 
-static enum drm_connector_status ge_b850v3_lvds_detect(
-		struct drm_connector *connector, bool force)
+static enum drm_connector_status ge_b850v3_lvds_bridge_detect(struct drm_bridge *bridge)
 {
 	struct i2c_client *stdp4028_i2c =
 			ge_b850v3_lvds_ptr->stdp4028_i2c;
@@ -182,6 +181,12 @@ static enum drm_connector_status ge_b850v3_lvds_detect(
 	return connector_status_unknown;
 }
 
+static enum drm_connector_status ge_b850v3_lvds_detect(struct drm_connector *connector,
+						       bool force)
+{
+	return ge_b850v3_lvds_bridge_detect(&ge_b850v3_lvds_ptr->bridge);
+}
+
 static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = ge_b850v3_lvds_detect,
@@ -263,6 +268,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
 	.attach = ge_b850v3_lvds_attach,
+	.detect = ge_b850v3_lvds_bridge_detect,
 };
 
 static int ge_b850v3_lvds_init(struct device *dev)
@@ -317,6 +323,7 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
 
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
