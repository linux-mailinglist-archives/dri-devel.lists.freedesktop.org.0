Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I9yKqdXcWkNEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 23:48:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3D5F051
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 23:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AFE10E08E;
	Wed, 21 Jan 2026 22:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Cy3im71u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jan 2026 22:48:02 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0E110E08E;
 Wed, 21 Jan 2026 22:48:02 +0000 (UTC)
Received: from wse-pc.. (unknown [61.8.154.114])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id 62D1A2FC0052;
 Wed, 21 Jan 2026 23:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1769035187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hLbZrDz0Hrmb7n202kZRgmxmu9bjINs7CGMfMenSWS0=;
 b=Cy3im71uXo+asTdc4ajysXLnqB0HgCfHn8UamJhCPnqv9I+x5mkwpT+icagVLeRba4qach
 LHOaduGfZDZJoOl7zyhSMxXSHAD3Gy+BWvVySRzuGGzcHFWl/B1G88xX0DGMej692M/T7Y
 NPwg2AHFLyGVJt2smsYC1Cr3lPHbC/I=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Werner Sembach <wse@tuxedocomputers.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/i915/display: Add quirk to force backlight type on
 some TUXEDO devices
Date: Wed, 21 Jan 2026 23:38:55 +0100
Message-ID: <20260121223944.1104951-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tuxedocomputers.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[tuxedocomputers.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch];
	DKIM_TRACE(0.00)[tuxedocomputers.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wse@tuxedocomputers.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,tuxedocomputers.com:email,tuxedocomputers.com:dkim,tuxedocomputers.com:mid]
X-Rspamd-Queue-Id: 07A3D5F051
X-Rspamd-Action: no action

The display backlight on TUXEDO DX1708 and InsanityBook 15 v1 with panels
AUO 12701 and AUO 12701 must be forced to INTEL_DP_AUX_BACKLIGHT_ON to be
able to control the brightness.

This could already be archived via a module parameter, but this patch adds
a quirk to apply this by default on the mentioned devices.

This patch does not actually test for the exact panels as the id that is
used in the intel_dpcd_quirks list is sadly zeroed on the devices, but
afaik all these devices use try_intel_interface first anyway so all the
quirk does is to add the fallback to try_vesa_interface, so the behaviour
on the devices not needing the quirk and fallback should functionally stay
the same.

Cc: stable@vger.kernel.org
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c |  9 ++++++-
 drivers/gpu/drm/i915/display/intel_quirks.c   | 25 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 0a3a3f6a5f9d8..bbdfa142d084d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -41,6 +41,7 @@
 #include "intel_display_types.h"
 #include "intel_dp.h"
 #include "intel_dp_aux_backlight.h"
+#include "intel_quirks.h"
 
 /*
  * DP AUX registers for Intel's proprietary HDR backlight interface. We define
@@ -661,11 +662,17 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 	struct drm_device *dev = connector->base.dev;
 	struct intel_panel *panel = &connector->panel;
 	bool try_intel_interface = false, try_vesa_interface = false;
+	int enable_dpcd_backlight;
 
 	/* Check the VBT and user's module parameters to figure out which
 	 * interfaces to probe
 	 */
-	switch (display->params.enable_dpcd_backlight) {
+	enable_dpcd_backlight = display->params.enable_dpcd_backlight;
+	if (enable_dpcd_backlight == INTEL_DP_AUX_BACKLIGHT_AUTO &&
+	    intel_has_dpcd_quirk(intel_dp, QUIRK_ENABLE_DPCD_BACKLIGHT))
+		enable_dpcd_backlight = INTEL_DP_AUX_BACKLIGHT_ON;
+
+	switch (enable_dpcd_backlight) {
 	case INTEL_DP_AUX_BACKLIGHT_OFF:
 		return -ENODEV;
 	case INTEL_DP_AUX_BACKLIGHT_AUTO:
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index d2e16b79d6be1..df20930f73f75 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -86,6 +86,14 @@ static void quirk_edp_limit_rate_hbr2(struct intel_display *display)
 	drm_info(display->drm, "Applying eDP Limit rate to HBR2 quirk\n");
 }
 
+static void quirk_enable_dpcd_backlight(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	intel_set_dpcd_quirk(intel_dp, QUIRK_ENABLE_DPCD_BACKLIGHT);
+	drm_info(display->drm, "Applying Enable DPCD Backlight quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -251,7 +259,22 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x38, 0xec, 0x11),
 		.hook = quirk_fw_sync_len,
 	},
-
+	/* TUXEDO InsanityBook 15 v1 */
+	{
+		.device = 0x591b,
+		.subsystem_vendor = 0x1558,
+		.subsystem_device = 0x9501,
+		.sink_oui = SINK_OUI(0x38, 0xec, 0x11),
+		.hook = quirk_enable_dpcd_backlight,
+	},
+	/* TUXEDO DX1708 */
+	{
+		.device = 0x3e9b,
+		.subsystem_vendor = 0x1558,
+		.subsystem_device = 0x8500,
+		.sink_oui = SINK_OUI(0x38, 0xec, 0x11),
+		.hook = quirk_enable_dpcd_backlight,
+	},
 };
 
 void intel_init_quirks(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index 06da0e286c67c..686f306ab4472 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -21,6 +21,7 @@ enum intel_quirk_id {
 	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
 	QUIRK_FW_SYNC_LEN,
 	QUIRK_EDP_LIMIT_RATE_HBR2,
+	QUIRK_ENABLE_DPCD_BACKLIGHT,
 };
 
 void intel_init_quirks(struct intel_display *display);
-- 
2.43.0

