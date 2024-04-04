Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A47898AAA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 17:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D83710E7B3;
	Thu,  4 Apr 2024 15:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF9C10E7B3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 15:09:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1583437CB4;
 Thu,  4 Apr 2024 15:09:01 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D8CB4139E8;
 Thu,  4 Apr 2024 15:09:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id IBWNM4zCDmZ2FgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Apr 2024 15:09:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/7] drm/edid: Test for EDID header in drm_edit_probe_custom()
Date: Thu,  4 Apr 2024 17:03:19 +0200
Message-ID: <20240404150857.5520-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404150857.5520-1-tzimmermann@suse.de>
References: <20240404150857.5520-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 1583437CB4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
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

EDID read functions do not validate their return data. So they might
return the required number of bytes of probing, but with invalid
data. Therefore test for the presence of an EDID header similar to
the code in edid_block_check().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_edid.c | 50 +++++++++++++++++++++++++++++---------
 include/drm/drm_edid.h     |  2 +-
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a3e9333f9177a..4e12d4b83a720 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1758,6 +1758,18 @@ static void edid_header_fix(void *edid)
 	memcpy(edid, edid_header, sizeof(edid_header));
 }
 
+static int edid_header_score(const u8 *header)
+{
+	int i, score = 0;
+
+	for (i = 0; i < sizeof(edid_header); i++) {
+		if (header[i] == edid_header[i])
+			score++;
+	}
+
+	return score;
+}
+
 /**
  * drm_edid_header_is_valid - sanity check the header of the base EDID block
  * @_edid: pointer to raw base EDID block
@@ -1769,14 +1781,8 @@ static void edid_header_fix(void *edid)
 int drm_edid_header_is_valid(const void *_edid)
 {
 	const struct edid *edid = _edid;
-	int i, score = 0;
 
-	for (i = 0; i < sizeof(edid_header); i++) {
-		if (edid->header[i] == edid_header[i])
-			score++;
-	}
-
-	return score;
+	return edid_header_score(edid->header);
 }
 EXPORT_SYMBOL(drm_edid_header_is_valid);
 
@@ -2612,17 +2618,37 @@ EXPORT_SYMBOL(drm_edid_free);
  * drm_edid_probe_custom() - probe DDC presence
  * @read_block: EDID block read function
  * @context: Private data passed to the block read function
+ * @validate: True to validate the EDID header
  *
  * Probes for EDID data. Only reads enough data to detect the presence
- * of the EDID channel.
+ * of the EDID channel. Some EDID block read functions do not fail,
+ * but return invalid data if no EDID data is available. If @validate
+ * has been specified, drm_edid_probe_custom() validates the retrieved
+ * EDID header before signalling success.
  *
  * Return: True on success, false on failure.
  */
-bool drm_edid_probe_custom(read_block_fn read_block, void *context)
+bool drm_edid_probe_custom(read_block_fn read_block, void *context, bool validate)
 {
-	unsigned char out;
+	u8 header[8] = {0, 0, 0, 0, 0, 0, 0, 0};
+	int ret;
+	size_t len = 1;
+
+	if (validate)
+		len = sizeof(header); // read full header
+
+	ret = read_block(context, header, 0, len);
+	if (ret)
+		return false;
+
+	if (validate) {
+		int score = edid_header_score(header);
+
+		if (score < clamp(edid_fixup, 0, 8))
+			return false;
+	}
 
-	return (read_block(context, &out, 0, 1) == 0);
+	return true;
 }
 EXPORT_SYMBOL(drm_edid_probe_custom);
 
@@ -2635,7 +2661,7 @@ EXPORT_SYMBOL(drm_edid_probe_custom);
 bool
 drm_probe_ddc(struct i2c_adapter *adapter)
 {
-	return drm_edid_probe_custom(drm_do_probe_ddc_edid, adapter);
+	return drm_edid_probe_custom(drm_do_probe_ddc_edid, adapter, false);
 }
 EXPORT_SYMBOL(drm_probe_ddc);
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 4d1797ade5f1d..299278c7ee1c2 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -412,7 +412,7 @@ static inline void drm_edid_decode_panel_id(u32 panel_id, char vend[4], u16 *pro
 
 bool
 drm_edid_probe_custom(int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
-		      void *context);
+		      void *context, bool validate);
 bool drm_probe_ddc(struct i2c_adapter *adapter);
 struct edid *drm_do_get_edid(struct drm_connector *connector,
 	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
-- 
2.44.0

