Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD4213FE9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA35E6EBB5;
	Fri,  3 Jul 2020 19:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715F76EBB1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f5so22319699ljj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ilng7Kli1eWnVw7MJjFUyca35KB0/YCP9yYYScKjbC0=;
 b=TeaSiOj9gn1A0rNDXlPuQ4OTzPmhaF8BAZD7FjCGWy2+wzMKiWEuYZ02f8Ub7A9la/
 41lyDILt+r94E08GP1QeEfCczgVdSBfs9/i806mKQ790Sz3fDca+ALTjkB2CwvyvP+yv
 /B9i9LsXDt6eT5v/64k5/UKhB8LHcyJ683aTZ/7rR54ANwe5tipav27EKHvhsZaObozZ
 DYH8F1I+mOLTMLuM9B+7OPF0FWtQMzdz782s44znIqcfKuV1LH96x4Ts59ZamAV8bWcO
 gBgk9AcGBYyio1casBP8Zk2jMUnFbuxax5f73RX9JTQ19Pk6P4qNlHIHQs7KP3E3HMhv
 Wmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ilng7Kli1eWnVw7MJjFUyca35KB0/YCP9yYYScKjbC0=;
 b=D0cyhT6BtcBUS+impr6JmyVyQMk2tN09Laa1+ZUwLXfJzYv8rMv9PC5PT2Ip08bspB
 w5TtusJrHeAbS10Pe4MzXDfaIfBQkI9/W3CLtNnO0sCKM5TjMzQwEHYWFaJjE0LdiBm6
 fc+zRRFyqweDTuYm2rW5TvIA0UABZa5mhT3sqXDBfDRWCsMRzB7yvgppjuBmuprtrC2f
 lLSxrPyn4BDiXRyogA/MIirPDXE5rE/lxv13GqKh91VCHma9tsbygqwkIn7tv0eEbxnD
 m80CEDYr9RVjoc1QpnRp9kKl0Ox+0I7OPf7htYg+rvDvwFLzFfjC1rTJz+kkJwz9M5EZ
 vz/g==
X-Gm-Message-State: AOAM533QsscIC7vScnNa34lS+G5uKpPQCOb3/c9KtlLsGeABx/vOctWs
 ejlks6v9HAGpgnuxXNEtqLCYxQD9AZI=
X-Google-Smtp-Source: ABdhPJzaQy5t3p238WDml+i7GzrZK/eS/gTfJJwX+dipxppk8hHtY5iPAIb8sH8TN9MlnVNmTRzmOw==
X-Received: by 2002:a2e:9957:: with SMTP id r23mr21417154ljj.127.1593804272668; 
 Fri, 03 Jul 2020 12:24:32 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:32 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 07/21] drm/bridge: tc358767: add detect bridge operation
Date: Fri,  3 Jul 2020 21:24:03 +0200
Message-Id: <20200703192417.372164-8-sam@ravnborg.org>
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

Prepare the bridge driver for chained operation by adding
support for the detect operation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 08d483664258..85973ae728db 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1353,10 +1353,9 @@ static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
 	.get_modes = tc_connector_get_modes,
 };
 
-static enum drm_connector_status tc_connector_detect(struct drm_connector *connector,
-						     bool force)
+static enum drm_connector_status tc_bridge_detect(struct drm_bridge *bridge)
 {
-	struct tc_data *tc = connector_to_tc(connector);
+	struct tc_data *tc = bridge_to_tc(bridge);
 	bool conn;
 	u32 val;
 	int ret;
@@ -1380,6 +1379,14 @@ static enum drm_connector_status tc_connector_detect(struct drm_connector *conne
 		return connector_status_disconnected;
 }
 
+static enum drm_connector_status
+tc_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct tc_data *tc = connector_to_tc(connector);
+
+	return tc_bridge_detect(&tc->bridge);
+}
+
 static const struct drm_connector_funcs tc_connector_funcs = {
 	.detect = tc_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -1444,6 +1451,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.enable = tc_bridge_enable,
 	.disable = tc_bridge_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
+	.detect = tc_bridge_detect,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
@@ -1677,6 +1685,8 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return ret;
 
 	tc->bridge.funcs = &tc_bridge_funcs;
+	tc->bridge.ops = DRM_BRIDGE_OP_DETECT;
+
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
