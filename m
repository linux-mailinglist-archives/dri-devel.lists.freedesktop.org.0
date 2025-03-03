Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B56A4C3FC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 15:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DA810E449;
	Mon,  3 Mar 2025 14:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mXWcrHxA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2CIJVKmV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mXWcrHxA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2CIJVKmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483FE10E463
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 14:59:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9603A21187;
 Mon,  3 Mar 2025 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741013953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UrZcRTr8zEEPKbTmBV9ZfTAf1HqzGKGRLakjXVlYvuo=;
 b=mXWcrHxA4W+cdVoloadsg40qsnMf11thr9hzAMHPkgIfBifXyCJDSkKFIw/7mwas8BmLg0
 zwEIDAZ8/TG0NbLFQymcBnTA7yu2WwbRP/q+OJaxU/cElzNckRp5xXxmnNKONlu/hqSBNw
 qRvsT4sQ8uwpjKScM6+d0qyDO5FjMXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741013953;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UrZcRTr8zEEPKbTmBV9ZfTAf1HqzGKGRLakjXVlYvuo=;
 b=2CIJVKmVf1z21YL2KC6t+FCASYw+1Febjk12knRnx1920oqM8Vm5X3avcGQRnb1lRJspjH
 8Xt2+INYMz2Ih0Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mXWcrHxA;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2CIJVKmV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741013953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UrZcRTr8zEEPKbTmBV9ZfTAf1HqzGKGRLakjXVlYvuo=;
 b=mXWcrHxA4W+cdVoloadsg40qsnMf11thr9hzAMHPkgIfBifXyCJDSkKFIw/7mwas8BmLg0
 zwEIDAZ8/TG0NbLFQymcBnTA7yu2WwbRP/q+OJaxU/cElzNckRp5xXxmnNKONlu/hqSBNw
 qRvsT4sQ8uwpjKScM6+d0qyDO5FjMXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741013953;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UrZcRTr8zEEPKbTmBV9ZfTAf1HqzGKGRLakjXVlYvuo=;
 b=2CIJVKmVf1z21YL2KC6t+FCASYw+1Febjk12knRnx1920oqM8Vm5X3avcGQRnb1lRJspjH
 8Xt2+INYMz2Ih0Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5787813A61;
 Mon,  3 Mar 2025 14:59:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WDIWFMHDxWeZBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Mar 2025 14:59:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, simona@ffwll.ch, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/probe-helper: Do not fail from
 drmm_kms_helper_poll_init()
Date: Mon,  3 Mar 2025 15:52:58 +0100
Message-ID: <20250303145604.62962-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303145604.62962-1-tzimmermann@suse.de>
References: <20250303145604.62962-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9603A21187
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,linux.intel.com,kernel.org,gmail.com,poorly.run];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Failing to set up connector polling is not significant enough to
fail device probing. Print a warning and return nothing from the
init helper.

This only affects the managed init function. The unmanaged init
already never fails with an error.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c     |  5 +----
 drivers/gpu/drm/drm_probe_helper.c | 11 ++++++-----
 include/drm/drm_probe_helper.h     |  2 +-
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index c3b950675485..4f2543730b97 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1018,10 +1018,7 @@ int ast_mode_config_init(struct ast_device *ast)
 		return ret;
 
 	drm_mode_config_reset(dev);
-
-	ret = drmm_kms_helper_poll_init(dev);
-	if (ret)
-		return ret;
+	drmm_kms_helper_poll_init(dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 7ba16323e7c2..6b3541159c0f 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -958,15 +958,16 @@ static void drm_kms_helper_poll_init_release(struct drm_device *dev, void *res)
  * cleaned up when the DRM device goes away.
  *
  * See drm_kms_helper_poll_init() for more information.
- *
- * Returns:
- * 0 on success, or a negative errno code otherwise.
  */
-int drmm_kms_helper_poll_init(struct drm_device *dev)
+void drmm_kms_helper_poll_init(struct drm_device *dev)
 {
+	int ret;
+
 	drm_kms_helper_poll_init(dev);
 
-	return drmm_add_action_or_reset(dev, drm_kms_helper_poll_init_release, dev);
+	ret = drmm_add_action_or_reset(dev, drm_kms_helper_poll_init_release, dev);
+	if (ret)
+		drm_warn(dev, "Connector status will not be updated, error %d\n", ret);
 }
 EXPORT_SYMBOL(drmm_kms_helper_poll_init);
 
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index d6ce7b218b77..840ae5f798c2 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -17,7 +17,7 @@ int drm_helper_probe_detect(struct drm_connector *connector,
 			    struct drm_modeset_acquire_ctx *ctx,
 			    bool force);
 
-int drmm_kms_helper_poll_init(struct drm_device *dev);
+void drmm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_fini(struct drm_device *dev);
 bool drm_helper_hpd_irq_event(struct drm_device *dev);
-- 
2.48.1

