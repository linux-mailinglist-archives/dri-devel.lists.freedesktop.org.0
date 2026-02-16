Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI7CB+kRk2mL1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:47:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5271143710
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A898910E359;
	Mon, 16 Feb 2026 12:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="CUSRQjYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6600010E1D4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-953a8a3ca9;
 t=1771246050; bh=msdXIUEBxBcRhsmC9wGRKoCm5hTsbFSjPzXTQMJdsGE=;
 b=CUSRQjYd4hudz9Fp9ICvRSPqFp/7EPvX+axjLXM4S7KwxPKjPS0uAUkjTKTqAwQhxPsmNfnkF
 YjlZ1lgK0hjeZXzY2oepUE2BGMx2iwqhIlS+zRegoogLGdjBMYwU/0nbSXWNXpzCOOFSLY0vUFC
 G0YIzay4KyI1yqqNGHZfheeP4yE1X/stkS/rx2JCQwZsAx0Lw4HYejExxoXbW03CX/94ABtE64x
 Uu3ddeC3niKkyb9G4zXK/oVyEKZNwR7nhxhrEMEnHx38e0fsMfpQX9FwXYDmdefbCDjq230peaY
 GID/WON+LMWwrekVKTfNKFj1IsX50OTVUXTbD2Zponfw==
X-Forward-Email-ID: 699311e0cde16816033f28e0
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.10
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH 2/2] drm/radeon: remove radeon_connector_free_edid
Date: Mon, 16 Feb 2026 07:46:33 -0500
Message-ID: <20260216124633.42644-3-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216124633.42644-1-jpeisach@ubuntu.com>
References: <20260216124633.42644-1-jpeisach@ubuntu.com>
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
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jpeisach@ubuntu.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:mid,ubuntu.com:dkim,ubuntu.com:email]
X-Rspamd-Queue-Id: C5271143710
X-Rspamd-Action: no action

This is no longer necessary since we use struct drm_edid, so we can
just call drm_edid_free directly.

Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index d3a2efbcf..087c0fa9c 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -314,14 +314,6 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
 	}
 }
 
-static void radeon_connector_free_edid(struct drm_connector *connector)
-{
-	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-
-	kfree(radeon_connector->edid);
-	radeon_connector->edid = NULL;
-}
-
 static int radeon_ddc_get_modes(struct drm_connector *connector)
 {
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
@@ -895,7 +887,7 @@ static void radeon_connector_destroy(struct drm_connector *connector)
 {
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 
-	radeon_connector_free_edid(connector);
+	drm_edid_free(radeon_connector->edid);
 	kfree(radeon_connector->con_priv);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
@@ -1007,7 +999,7 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 		dret = radeon_ddc_probe(radeon_connector, false);
 	if (dret) {
 		radeon_connector->detected_by_load = false;
-		radeon_connector_free_edid(connector);
+		drm_edid_free(radeon_connector->edid);
 		radeon_connector_get_edid(connector);
 
 		if (!radeon_connector->edid) {
@@ -1022,7 +1014,7 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 			 * with a shared ddc line (often vga + hdmi)
 			 */
 			if (radeon_connector->use_digital && radeon_connector->shared_ddc) {
-				radeon_connector_free_edid(connector);
+				drm_edid_free(radeon_connector->edid);
 				ret = connector_status_disconnected;
 			} else {
 				ret = connector_status_connected;
@@ -1251,7 +1243,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 	}
 	if (dret) {
 		radeon_connector->detected_by_load = false;
-		radeon_connector_free_edid(connector);
+		drm_edid_free(radeon_connector->edid);
 		radeon_connector_get_edid(connector);
 
 		if (!radeon_connector->edid) {
@@ -1277,7 +1269,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 			 * with a shared ddc line (often vga + hdmi)
 			 */
 			if ((!radeon_connector->use_digital) && radeon_connector->shared_ddc) {
-				radeon_connector_free_edid(connector);
+				drm_edid_free(radeon_connector->edid);
 				ret = connector_status_disconnected;
 			} else {
 				ret = connector_status_connected;
@@ -1301,7 +1293,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 						if (list_connector->connector_type != DRM_MODE_CONNECTOR_VGA) {
 							/* hpd is our only option in this case */
 							if (!radeon_hpd_sense(rdev, radeon_connector->hpd.hpd)) {
-								radeon_connector_free_edid(connector);
+								drm_edid_free(radeon_connector->edid);
 								ret = connector_status_disconnected;
 							}
 						}
@@ -1635,7 +1627,7 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 		goto out;
 	}
 
-	radeon_connector_free_edid(connector);
+	drm_edid_free(radeon_connector->edid);
 
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_eDP) ||
 	    (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)) {
-- 
2.51.0

