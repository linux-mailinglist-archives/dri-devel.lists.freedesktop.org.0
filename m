Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387D92E0C3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 09:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16DA10E977;
	Thu, 11 Jul 2024 07:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Y/URtb8v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R7oy9Srt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y/URtb8v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R7oy9Srt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAA210E977
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 07:24:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E2082190C;
 Thu, 11 Jul 2024 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720682659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aKnyS125ujoxAu87DBGHyI8sJ7JkLJJTbf5WMtrv8E=;
 b=Y/URtb8vhoCbC4km8b7En+Rm+GmTpGisDRxmOuJo9X6TgwPdsQchjE48QGpiNA/Ymue126
 DD3SdKFEIw6PpHwEHHmdMh9Xco5QIZJFTNVRx+jqnM2vRgdsdo1sH0zqOcVAPSCyvr7CJw
 cu8teECO6wP8BM66tzLv0xHZd6lO52k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720682659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aKnyS125ujoxAu87DBGHyI8sJ7JkLJJTbf5WMtrv8E=;
 b=R7oy9Srtwb7BecP1hpr7x/VMT33zJCEQMhI+1plIfpMRUbBrIXWqyve8lwpDE6ZK5zzXEK
 Cjzt4ArKgupaNkAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Y/URtb8v";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R7oy9Srt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720682659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aKnyS125ujoxAu87DBGHyI8sJ7JkLJJTbf5WMtrv8E=;
 b=Y/URtb8vhoCbC4km8b7En+Rm+GmTpGisDRxmOuJo9X6TgwPdsQchjE48QGpiNA/Ymue126
 DD3SdKFEIw6PpHwEHHmdMh9Xco5QIZJFTNVRx+jqnM2vRgdsdo1sH0zqOcVAPSCyvr7CJw
 cu8teECO6wP8BM66tzLv0xHZd6lO52k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720682659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aKnyS125ujoxAu87DBGHyI8sJ7JkLJJTbf5WMtrv8E=;
 b=R7oy9Srtwb7BecP1hpr7x/VMT33zJCEQMhI+1plIfpMRUbBrIXWqyve8lwpDE6ZK5zzXEK
 Cjzt4ArKgupaNkAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5B9E13A7B;
 Thu, 11 Jul 2024 07:24:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CET0MqKIj2bTDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Jul 2024 07:24:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 3/3] drm/mgag200: Rename BMC vidrst names
Date: Thu, 11 Jul 2024 09:23:06 +0200
Message-ID: <20240711072415.11831-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711072415.11831-1-tzimmermann@suse.de>
References: <20240711072415.11831-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCPT_COUNT_SEVEN(0.00)[8];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 1E2082190C
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

The BMC's scanout synchronization is only indirectly related to the
VIDRST functionality. Do some renaming.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_bmc.c    |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.h    | 14 +++++++-------
 drivers/gpu/drm/mgag200/mgag200_g200er.c |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_g200se.c |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 10 +++++-----
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
index 1c7aa4f36787..45e35dffb3ea 100644
--- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
@@ -14,7 +14,7 @@ static struct mgag200_bmc_connector *to_mgag200_bmc_connector(struct drm_connect
 	return container_of(connector, struct mgag200_bmc_connector, base);
 }
 
-void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
+void mgag200_bmc_stop_scanout(struct mga_device *mdev)
 {
 	u8 tmp;
 	int iter_max;
@@ -73,7 +73,7 @@ void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
 	}
 }
 
-void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
+void mgag200_bmc_start_scanout(struct mga_device *mdev)
 {
 	u8 tmp;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 4a46c8c006c8..f97eaa49b089 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -216,8 +216,8 @@ struct mgag200_device_info {
 	 */
 	unsigned long max_mem_bandwidth;
 
-	/* HW has external source (e.g., BMC) to synchronize with */
-	bool has_vidrst:1;
+	/* Synchronize scanout with BMC */
+	bool sync_bmc:1;
 
 	struct {
 		unsigned data_bit:3;
@@ -232,13 +232,13 @@ struct mgag200_device_info {
 };
 
 #define MGAG200_DEVICE_INFO_INIT(_max_hdisplay, _max_vdisplay, _max_mem_bandwidth, \
-				 _has_vidrst, _i2c_data_bit, _i2c_clock_bit, \
+				 _sync_bmc, _i2c_data_bit, _i2c_clock_bit, \
 				 _bug_no_startadd) \
 	{ \
 		.max_hdisplay = (_max_hdisplay), \
 		.max_vdisplay = (_max_vdisplay), \
 		.max_mem_bandwidth = (_max_mem_bandwidth), \
-		.has_vidrst = (_has_vidrst), \
+		.sync_bmc = (_sync_bmc), \
 		.i2c = { \
 			.data_bit = (_i2c_data_bit), \
 			.clock_bit = (_i2c_clock_bit), \
@@ -430,9 +430,9 @@ int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_avail
 /* mgag200_vga.c */
 int mgag200_vga_output_init(struct mga_device *mdev);
 
-				/* mgag200_bmc.c */
-void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
-void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
+/* mgag200_bmc.c */
+void mgag200_bmc_stop_scanout(struct mga_device *mdev);
+void mgag200_bmc_start_scanout(struct mga_device *mdev);
 int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
 
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index b3bb3e9fb0d1..737a48aa9160 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -206,8 +206,8 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_enable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_start_scanout(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 3ac0a508e2c5..8d1ccc2ad94a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -207,8 +207,8 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_enable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_start_scanout(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 7a8099eb100c..cf7f6897838f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -338,8 +338,8 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_enable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_start_scanout(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 276d5d61fe14..ec6f5e9e2d8f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -608,7 +608,7 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
 	if (ret)
 		return ret;
 
-	new_mgag200_crtc_state->set_vidrst = mdev->info->has_vidrst;
+	new_mgag200_crtc_state->set_vidrst = mdev->info->sync_bmc;
 
 	if (new_crtc_state->mode_changed) {
 		if (funcs->pixpllc_atomic_check) {
@@ -668,16 +668,16 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_enable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_start_scanout(mdev);
 }
 
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_disable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_stop_scanout(mdev);
 
 	mgag200_disable_display(mdev);
 }
-- 
2.45.2

