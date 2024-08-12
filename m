Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8C94E89A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936A810E0E5;
	Mon, 12 Aug 2024 08:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bz8GGHMO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v+bxQ9Kn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bz8GGHMO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v+bxQ9Kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D043D10E09E;
 Mon, 12 Aug 2024 08:30:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 68FDA2023A;
 Mon, 12 Aug 2024 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Px2v1FXMqJzUxrBA7MfzkTJJj5TkRxISAm/9dhwpvaE=;
 b=bz8GGHMO3BaEqV0XbXn0WIXrAcsPW6vP+A8iLoVMQ5JvmZZH11pEPqTYNx6tmRIEGWYRmf
 dRj4ukTDfv/s3fYrrq0r68Wr+hEMBE7GztZR2CtJjubHhEE6hvwwMxksNAjc1ruWyfF3Jf
 /Xkr7R2UwEiVfnDIoOXWASSPBXEvang=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Px2v1FXMqJzUxrBA7MfzkTJJj5TkRxISAm/9dhwpvaE=;
 b=v+bxQ9KnohP2dJ8vWiQqsGTQsRcuHBcPbL0vDEjNteB7xC6e8QDInqYVR2pFE2G2912L6F
 86vqRWnLXs3i9CBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Px2v1FXMqJzUxrBA7MfzkTJJj5TkRxISAm/9dhwpvaE=;
 b=bz8GGHMO3BaEqV0XbXn0WIXrAcsPW6vP+A8iLoVMQ5JvmZZH11pEPqTYNx6tmRIEGWYRmf
 dRj4ukTDfv/s3fYrrq0r68Wr+hEMBE7GztZR2CtJjubHhEE6hvwwMxksNAjc1ruWyfF3Jf
 /Xkr7R2UwEiVfnDIoOXWASSPBXEvang=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Px2v1FXMqJzUxrBA7MfzkTJJj5TkRxISAm/9dhwpvaE=;
 b=v+bxQ9KnohP2dJ8vWiQqsGTQsRcuHBcPbL0vDEjNteB7xC6e8QDInqYVR2pFE2G2912L6F
 86vqRWnLXs3i9CBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1410413A23;
 Mon, 12 Aug 2024 08:30:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kIu4Aw7IuWZpHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 08:30:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/9] drm/amdgpu: Do not set struct drm_driver.lastclose
Date: Mon, 12 Aug 2024 10:28:23 +0200
Message-ID: <20240812083000.337744-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812083000.337744-1-tzimmermann@suse.de>
References: <20240812083000.337744-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

Remove the implementation of struct drm_driver.lastclose. The hook
was only necessary before in-kernel DRM clients existed, but is now
obsolete. The code in amdgpu_driver_lastclose_kms() is performed by
drm_lastclose().

v2:
- update commit message

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 17 -----------------
 3 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 137a88b8de45..4baeb6519fda 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1484,7 +1484,6 @@ extern const int amdgpu_max_kms_ioctl;
 
 int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
 void amdgpu_driver_unload_kms(struct drm_device *dev);
-void amdgpu_driver_lastclose_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 094498a0964b..5dd39e6c6223 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2953,7 +2953,6 @@ static const struct drm_driver amdgpu_kms_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
-	.lastclose = amdgpu_driver_lastclose_kms,
 	.ioctls = amdgpu_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
@@ -2980,7 +2979,6 @@ const struct drm_driver amdgpu_partition_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
-	.lastclose = amdgpu_driver_lastclose_kms,
 	.ioctls = amdgpu_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 66782be5917b..0a799942343d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1269,23 +1269,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	return 0;
 }
 
-
-/*
- * Outdated mess for old drm with Xorg being in charge (void function now).
- */
-/**
- * amdgpu_driver_lastclose_kms - drm callback for last close
- *
- * @dev: drm dev pointer
- *
- * Switch vga_switcheroo state after last close (all asics).
- */
-void amdgpu_driver_lastclose_kms(struct drm_device *dev)
-{
-	drm_fb_helper_lastclose(dev);
-	vga_switcheroo_process_delayed_switch();
-}
-
 /**
  * amdgpu_driver_open_kms - drm callback for open
  *
-- 
2.46.0

