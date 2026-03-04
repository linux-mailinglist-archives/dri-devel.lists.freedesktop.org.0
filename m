Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKzANwLvp2mWlwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:36:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E0E1FCB1E
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FAA89AAE;
	Wed,  4 Mar 2026 08:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LYqr9+0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC0789AAE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 08:36:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 59688433E1;
 Wed,  4 Mar 2026 08:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2402C19425;
 Wed,  4 Mar 2026 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772613373;
 bh=HsjwuVHR4yhJMH1Hk9YuB2P0EXMs5wXNt0iCcKMFb8E=;
 h=From:To:Cc:Subject:Date:From;
 b=LYqr9+0R6shCqmJrpcCWnOPa3IecT1Oi+U5mMlIBcwqkNXGkEfeAqDJQ30Woq5lJF
 kvWcrRgaxOKNpHTEN3pHWvEqpIHT4EqHNiEKXHRTIuivkOwIF+Q4CuJVlwhs0OhELI
 1k/JbCEGSw73Lesa2mK+5Ep+NSiFR/Q/oPaPrP5lfFsfy+irSGwG/aDwnhJoUSrn3e
 qaCjHEcOdtV4YHZghQZFzNmwBF39AQoavKrR+ZHqsxSoxxVUHz368tXwRS8TtRSpp7
 hNdHvI8z07ZicDKnzQXfmvqLUHtwYvsFkBbfJDJ+AI62PkycdDBJkko5gnQJisk0g9
 cRXsa8aooZIbw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ayushi Makhija <quic_amakhija@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: anx7625: enforce CONFIG_USB_ROLE_SWITCH
 dependency
Date: Wed,  4 Mar 2026 09:35:52 +0100
Message-Id: <20260304083604.724519-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 23E0E1FCB1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,analogixsemi.com];
	FORGED_SENDER(0.00)[arnd@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:heikki.krogerus@linux.intel.com,m:xji@analogixsemi.com,m:arnd@arndb.de,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:quic_amakhija@quicinc.com,m:dianders@chromium.org,m:luca.ceresoli@bootlin.com,m:loic.poulain@oss.qualcomm.com,m:wenst@chromium.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[arndb.de,ideasonboard.com,kwiboo.se,gmail.com,quicinc.com,chromium.org,bootlin.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_TYPEC is enabled, but USB_ROLE_SWITCH=m, the anx7625 driver
fails to link as built-in:

aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_i2c_remove':
anx7625.c:(.text+0x6ec): undefined reference to `usb_role_switch_put'
aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_typec_set_status':
anx7625.c:(.text+0x3080): undefined reference to `usb_role_switch_set_role'
aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_i2c_probe':
anx7625.c:(.text+0x5368): undefined reference to `fwnode_usb_role_switch_get'

The problem is that both dependencies are optional in the sense of allowing
the anx7625 driver to call the exported interfaces to be used from a loadable
module, but cannot work for built-in drivers. It would be possible to handle
all nine combinations of the CONFIG_TYPEC and CONFIG_USB_ROLE_SWITCH tristate
options, but that does add a lot of complexity that seems unnecessary when
in reality any user of this driver would have both enabled anyway.

Turn both dependencies into hard 'depends on' here to only allow configurations
where it's possible to actually use them, and remove the misguided IS_REACHABLE()
check that did nothing here.

Fixes: f81455b2d332 ("drm: bridge: anx7625: implement minimal Type-C support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/bridge/analogix/Kconfig   |  3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c | 17 -----------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index f3448b0631fe..03dc7ffe824a 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -34,7 +34,8 @@ config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
 	depends on OF
-	depends on TYPEC || !TYPEC
+	depends on TYPEC
+	depends on USB_ROLE_SWITCH
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c43519097a45..ec4b24481987 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1483,7 +1483,6 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 	DRM_DEV_DEBUG_DRIVER(dev, "Secure OCM version=%02x\n", ret);
 }
 
-#if IS_REACHABLE(CONFIG_TYPEC)
 static u8 anx7625_checksum(u8 *buf, u8 len)
 {
 	u8 ret = 0;
@@ -1635,22 +1634,6 @@ static void anx7625_typec_unregister(struct anx7625_data *ctx)
 	usb_role_switch_put(ctx->role_sw);
 	typec_unregister_port(ctx->typec_port);
 }
-#else
-static void anx7625_typec_set_status(struct anx7625_data *ctx,
-				     unsigned int intr_status,
-				     unsigned int intr_vector)
-{
-}
-
-static int anx7625_typec_register(struct anx7625_data *ctx)
-{
-	return 0;
-}
-
-static void anx7625_typec_unregister(struct anx7625_data *ctx)
-{
-}
-#endif
 
 static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
 {
-- 
2.39.5

