Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3C898AA9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 17:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2021E10E655;
	Thu,  4 Apr 2024 15:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D65D10E821
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 15:09:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D1F4937CB3;
 Thu,  4 Apr 2024 15:09:00 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FCAC13A91;
 Thu,  4 Apr 2024 15:09:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id CKS1JYzCDmZ2FgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Apr 2024 15:09:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/7] drm/edid: Implement drm_probe_ddc() with
 drm_edid_probe_custom()
Date: Thu,  4 Apr 2024 17:03:18 +0200
Message-ID: <20240404150857.5520-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404150857.5520-1-tzimmermann@suse.de>
References: <20240404150857.5520-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: D1F4937CB3
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

Move the logic from drm_probe_ddc() into drm_edid_probe_custom(),
which receives the EDID read function as argument. Allows drivers
without DDC to implement similar functionality without duplicating
the code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_edid.c | 22 +++++++++++++++++++---
 include/drm/drm_edid.h     |  3 +++
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ea77577a37864..a3e9333f9177a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2608,6 +2608,24 @@ void drm_edid_free(const struct drm_edid *drm_edid)
 }
 EXPORT_SYMBOL(drm_edid_free);
 
+/**
+ * drm_edid_probe_custom() - probe DDC presence
+ * @read_block: EDID block read function
+ * @context: Private data passed to the block read function
+ *
+ * Probes for EDID data. Only reads enough data to detect the presence
+ * of the EDID channel.
+ *
+ * Return: True on success, false on failure.
+ */
+bool drm_edid_probe_custom(read_block_fn read_block, void *context)
+{
+	unsigned char out;
+
+	return (read_block(context, &out, 0, 1) == 0);
+}
+EXPORT_SYMBOL(drm_edid_probe_custom);
+
 /**
  * drm_probe_ddc() - probe DDC presence
  * @adapter: I2C adapter to probe
@@ -2617,9 +2635,7 @@ EXPORT_SYMBOL(drm_edid_free);
 bool
 drm_probe_ddc(struct i2c_adapter *adapter)
 {
-	unsigned char out;
-
-	return (drm_do_probe_ddc_edid(adapter, &out, 0, 1) == 0);
+	return drm_edid_probe_custom(drm_do_probe_ddc_edid, adapter);
 }
 EXPORT_SYMBOL(drm_probe_ddc);
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 6f65bbf655a1f..4d1797ade5f1d 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -410,6 +410,9 @@ static inline void drm_edid_decode_panel_id(u32 panel_id, char vend[4], u16 *pro
 	drm_edid_decode_mfg_id(panel_id >> 16, vend);
 }
 
+bool
+drm_edid_probe_custom(int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
+		      void *context);
 bool drm_probe_ddc(struct i2c_adapter *adapter);
 struct edid *drm_do_get_edid(struct drm_connector *connector,
 	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
-- 
2.44.0

