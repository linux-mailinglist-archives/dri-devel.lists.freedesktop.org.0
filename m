Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDw+D0kwdmmjNAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 16:01:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84A81198
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 16:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB0910E00C;
	Sun, 25 Jan 2026 15:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="CLO1r7It";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 621 seconds by postgrey-1.36 at gabe;
 Sun, 25 Jan 2026 15:01:23 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7BD10E363
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-953a8a3ca9; t=1769353282;
 bh=rOGP7UcPFOGad0f/xvjJ+4/KSJ9iHcKWcUrF380Qrn4=;
 b=CLO1r7ItiTd/eV/uPqMPPBrruwSd8j+PYnd50nt6hXDDlSx9O6tuFIW8Q6RE+G2ON8380iMhR
 2NAw0Gkc80Vzk+ac031ncyowD09Eu2JZNnCuFa7c9jd7EwtlM4TI4CQN8VQxXO5ftOvoA4Y+HaW
 LQg5WDLJrruCbrLRJSrxKSmI61iGxmqrjKOAb6NeKL1SRr5cjlzSoBBG2wEt7SpQ3ZSNHqbAWNQ
 Qxuy+h3x1Hdw3PuCgj1IEhqZTp1qCT+WInR7B1pqqQRZhSXbYmsN3gZbcmkABp3PTpNBbGond4+
 /Kh8J+OavE8GhwPGZviYbNSHE2cvHUD0BVjJo7cAMJFg==
X-Forward-Email-ID: 69762dd474849d2b7c8340e7
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.5.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: dri-devel@lists.freedesktop.org
Cc: Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH] drm/edid: use cea_db struct to parse CTA VCDB
Date: Sun, 25 Jan 2026 09:50:38 -0500
Message-ID: <20260125145038.10992-1-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.51.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ubuntu.com:+]
X-Rspamd-Queue-Id: AE84A81198
X-Rspamd-Action: no action

Converts the VCDB parser to use the cea_db struct instead of passing a
u8 pointer.

Set the data type and update the indexes to point to the data of the
data block.

Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/gpu/drm/drm_edid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 26bb7710a..376a5b3cc 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6096,14 +6096,14 @@ static void parse_cta_y420vdb(struct drm_connector *connector,
 	}
 }
 
-static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
+static void parse_cta_vcdb(struct drm_connector *connector, const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] CEA VCDB 0x%02x\n",
-		    connector->base.id, connector->name, db[2]);
+		    connector->base.id, connector->name, db->data[1]);
 
-	if (db[2] & EDID_CEA_VCDB_QS)
+	if (db->data[1] & EDID_CEA_VCDB_QS)
 		info->rgb_quant_range_selectable = true;
 }
 
@@ -6454,7 +6454,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 		else if (cea_db_is_y420vdb(db))
 			parse_cta_y420vdb(connector, db);
 		else if (cea_db_is_vcdb(db))
-			drm_parse_vcdb(connector, data);
+			parse_cta_vcdb(connector, db);
 		else if (cea_db_is_hdmi_hdr_metadata_block(db))
 			drm_parse_hdr_metadata_block(connector, data);
 		else if (cea_db_tag(db) == CTA_DB_VIDEO)
-- 
2.51.0

