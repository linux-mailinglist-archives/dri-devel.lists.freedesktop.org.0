Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDD9880EC5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F32010F3A5;
	Wed, 20 Mar 2024 09:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zimDaALJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5NyB/ABk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zimDaALJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5NyB/ABk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6417E10E8B3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:37:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0393520BD4;
 Wed, 20 Mar 2024 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQa3KiFq+8lKXNqqKyK8SBemt/Csjbw6EirgNfp3dpQ=;
 b=zimDaALJmCVV7//bcayFpbKHfvVg0doAQTRgp872Pam7JlCRzAZhx7atJui1dukY6zLA4P
 FXHxJpRp1hdYSGuf2sjm6GH98CIDQiimusCmo6om/2NERBzIMxOHJ0sIAhxBEge/gdeJ8o
 1RQaVVGMX1iIhPM5qit+u6US2U76lP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQa3KiFq+8lKXNqqKyK8SBemt/Csjbw6EirgNfp3dpQ=;
 b=5NyB/ABkuSJMAju9SpNWxwg+aRl4zHN4S1K37wgaiAK2wA9gUZKC8/wCZOgiXf0YxMgMEC
 isAApSj06CejLWAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQa3KiFq+8lKXNqqKyK8SBemt/Csjbw6EirgNfp3dpQ=;
 b=zimDaALJmCVV7//bcayFpbKHfvVg0doAQTRgp872Pam7JlCRzAZhx7atJui1dukY6zLA4P
 FXHxJpRp1hdYSGuf2sjm6GH98CIDQiimusCmo6om/2NERBzIMxOHJ0sIAhxBEge/gdeJ8o
 1RQaVVGMX1iIhPM5qit+u6US2U76lP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQa3KiFq+8lKXNqqKyK8SBemt/Csjbw6EirgNfp3dpQ=;
 b=5NyB/ABkuSJMAju9SpNWxwg+aRl4zHN4S1K37wgaiAK2wA9gUZKC8/wCZOgiXf0YxMgMEC
 isAApSj06CejLWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B91B6136E4;
 Wed, 20 Mar 2024 09:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cJrxK2mu+mWoWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Mar 2024 09:37:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 13/13] drm/ast: Automatically clean up poll helper
Date: Wed, 20 Mar 2024 10:34:18 +0100
Message-ID: <20240320093738.6341-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320093738.6341-1-tzimmermann@suse.de>
References: <20240320093738.6341-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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

Automatically clean up the conncetor-poll thread as part of the DRM
device release. The new helper drmm_kms_helper_poll_init() provides
a shared implementation for all drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c     |  4 +++-
 drivers/gpu/drm/drm_probe_helper.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  2 ++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index a42a0956c51de..7e56a77bed635 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1905,7 +1905,9 @@ int ast_mode_config_init(struct ast_device *ast)
 
 	drm_mode_config_reset(dev);
 
-	drm_kms_helper_poll_init(dev);
+	ret = drmm_kms_helper_poll_init(dev);
+	if (ret)
+		return ret;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index b06dcc6c614e8..a39c98ceac68a 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -37,6 +37,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -944,6 +945,32 @@ void drm_kms_helper_poll_fini(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_fini);
 
+static void drm_kms_helper_poll_init_release(struct drm_device *dev, void *res)
+{
+	drm_kms_helper_poll_fini(dev);
+}
+
+/**
+ * devm_drm_kms_helper_poll_init - initialize and enable output polling
+ * @dev: drm_device
+ *
+ * This function initializes and then also enables output polling support for
+ * @dev similar to drm_kms_helper_poll_init(). Polling will automatically be
+ * cleaned up when the DRM device goes away.
+ *
+ * See drm_kms_helper_poll_init() for more information.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drmm_kms_helper_poll_init(struct drm_device *dev)
+{
+	drm_kms_helper_poll_init(dev);
+
+	return drmm_add_action_or_reset(dev, drm_kms_helper_poll_init_release, dev);
+}
+EXPORT_SYMBOL(drmm_kms_helper_poll_init);
+
 static bool check_connector_changed(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 031b044528c89..9925cff749296 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -16,6 +16,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector
 int drm_helper_probe_detect(struct drm_connector *connector,
 			    struct drm_modeset_acquire_ctx *ctx,
 			    bool force);
+
+int drmm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_fini(struct drm_device *dev);
 bool drm_helper_hpd_irq_event(struct drm_device *dev);
-- 
2.44.0

