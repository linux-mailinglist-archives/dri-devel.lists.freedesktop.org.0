Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC36499C468
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891EF10E414;
	Mon, 14 Oct 2024 08:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ChK650tn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ylOYwi0s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ChK650tn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ylOYwi0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EA910E3E6;
 Mon, 14 Oct 2024 08:57:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 77BEB21C39;
 Mon, 14 Oct 2024 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGxAdNivwZnKvs8ruoNAAyCpsGqPhxrSKIuroLV9TAw=;
 b=ChK650tnpPKMtmcG3RxwKO+qgrLrShyX4kQKN3TnoInaYNpoRpwnKeBh68dHRHHYtDYyzt
 4xa6w1BV199BH+8gpHdKaka5NuoCqJwB/J2prs4S6WDIWFJKGrJGEQG16bDxWaxaBY2jGV
 tGcUlG8XFsA5SyX4Io/3p7pXlkUaV2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGxAdNivwZnKvs8ruoNAAyCpsGqPhxrSKIuroLV9TAw=;
 b=ylOYwi0sfQhX+U6gHOIhVMgAO2CY28B+sbFEy61ZBtiTO9vGO+yxd4VIS0z8WzUsleMC5y
 rgfOcUpYXATlbDBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGxAdNivwZnKvs8ruoNAAyCpsGqPhxrSKIuroLV9TAw=;
 b=ChK650tnpPKMtmcG3RxwKO+qgrLrShyX4kQKN3TnoInaYNpoRpwnKeBh68dHRHHYtDYyzt
 4xa6w1BV199BH+8gpHdKaka5NuoCqJwB/J2prs4S6WDIWFJKGrJGEQG16bDxWaxaBY2jGV
 tGcUlG8XFsA5SyX4Io/3p7pXlkUaV2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGxAdNivwZnKvs8ruoNAAyCpsGqPhxrSKIuroLV9TAw=;
 b=ylOYwi0sfQhX+U6gHOIhVMgAO2CY28B+sbFEy61ZBtiTO9vGO+yxd4VIS0z8WzUsleMC5y
 rgfOcUpYXATlbDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2274C13A42;
 Mon, 14 Oct 2024 08:57:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uJYnBwzdDGfXfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Oct 2024 08:57:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v4 08/12] drm/amdgpu: Suspend and resume internal clients with
 client helpers
Date: Mon, 14 Oct 2024 10:55:22 +0200
Message-ID: <20241014085740.582287-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241014085740.582287-1-tzimmermann@suse.de>
References: <20241014085740.582287-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email,suse.de:mid]
X-Spam-Score: -3.30
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

Replace calls to drm_fb_helper_set_suspend_unlocked() with calls
to the client functions drm_client_dev_suspend() and
drm_client_dev_resume(). Any registered in-kernel client will now
receive suspend and resume events.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index fd853dc843e9..9c40d620a658 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -37,8 +37,8 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/amdgpu_drm.h>
 #include <linux/device.h>
@@ -4711,13 +4711,13 @@ int amdgpu_device_prepare(struct drm_device *dev)
  * amdgpu_device_suspend - initiate device suspend
  *
  * @dev: drm dev pointer
- * @fbcon : notify the fbdev of suspend
+ * @notify_clients: notify in-kernel DRM clients
  *
  * Puts the hw in the suspend state (all asics).
  * Returns 0 for success or an error on failure.
  * Called at driver suspend.
  */
-int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
+int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int r = 0;
@@ -4737,8 +4737,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
 		DRM_WARN("smart shift update failed\n");
 
-	if (fbcon)
-		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, true);
+	if (notify_clients)
+		drm_client_dev_suspend(adev_to_drm(adev), false);
 
 	cancel_delayed_work_sync(&adev->delayed_init_work);
 
@@ -4773,13 +4773,13 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
  * amdgpu_device_resume - initiate device resume
  *
  * @dev: drm dev pointer
- * @fbcon : notify the fbdev of resume
+ * @notify_clients: notify in-kernel DRM clients
  *
  * Bring the hw back to operating state (all asics).
  * Returns 0 for success or an error on failure.
  * Called at driver resume.
  */
-int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
+int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int r = 0;
@@ -4835,8 +4835,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
 	/* Make sure IB tests flushed */
 	flush_delayed_work(&adev->delayed_init_work);
 
-	if (fbcon)
-		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, false);
+	if (notify_clients)
+		drm_client_dev_resume(adev_to_drm(adev), false);
 
 	amdgpu_ras_resume(adev);
 
@@ -5448,7 +5448,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 				if (r)
 					goto out;
 
-				drm_fb_helper_set_suspend_unlocked(adev_to_drm(tmp_adev)->fb_helper, false);
+				drm_client_dev_resume(adev_to_drm(tmp_adev), false);
 
 				/*
 				 * The GPU enters bad state once faulty pages
@@ -5734,7 +5734,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		 */
 		amdgpu_unregister_gpu_instance(tmp_adev);
 
-		drm_fb_helper_set_suspend_unlocked(adev_to_drm(tmp_adev)->fb_helper, true);
+		drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
 
 		/* disable ras on ALL IPs */
 		if (!need_emergency_restart &&
-- 
2.46.0

