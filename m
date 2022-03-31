Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD44EDD4A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B945989058;
	Thu, 31 Mar 2022 15:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1C089D7C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:39:40 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5D4B383BFA;
 Thu, 31 Mar 2022 17:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648741178;
 bh=Fg065rSfJXCBoelSqrnKwZ8WhZ1VQrd49lXu1T2O88g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IBwkrgY/zvyMxajsUHlRJOpXjqt8fXvBobagtzWrQMtJCazJUR1HAmAJHEB1+b8Br
 RB5SvpaFvIai9A/H+D8pQCaa/gbUFSwwQFvFriebIDgUCpak0pQf7AB0LolKBblIJA
 fLH6lgp9Pk40cMjztVZtFX2SwL8uxHypvGajPAqP6hLhdUVoWW8Jbo1cS2NYwGjQ1S
 igAmjN0/ig+hGtVuqrB3IRJy6VhpXoLFp6SpyFGKK9k9NMYqw8bNszwDzeb3d5u1PF
 b9RnVYZ36KIP3ByoptG0sPF2vfoyd9mYhBx2TGTq3X3mP8yLIln23rAVyD8I1shIXC
 zIuDTW2r3BrzA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND][PATCH 2/2] drm/bridge: lt9611: Add atomic_get_input_bus_fmts
Date: Thu, 31 Mar 2022 17:39:23 +0200
Message-Id: <20220331153923.14314-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331153923.14314-1-marex@denx.de>
References: <20220331153923.14314-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement .atomic_get_input_bus_fmts callback, which sets up
the input (scanout-engine-end) formats, so that those formats
can then be used in pipeline format negotiation between this
bridge and the scanout engine.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 9b3ac3794a2c..7ef8fe5abc12 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -922,6 +922,32 @@ static void lt9611_bridge_hpd_enable(struct drm_bridge *bridge)
 	lt9611_enable_hpd_interrupts(lt9611);
 }
 
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *
+lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				 struct drm_bridge_state *bridge_state,
+				 struct drm_crtc_state *crtc_state,
+				 struct drm_connector_state *conn_state,
+				 u32 output_fmt,
+				 unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	/* This is the DSI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
@@ -936,6 +962,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = lt9611_atomic_get_input_bus_fmts,
 };
 
 static int lt9611_parse_dt(struct device *dev,
-- 
2.35.1

