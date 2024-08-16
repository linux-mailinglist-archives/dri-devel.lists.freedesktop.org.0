Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02285954A6E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA0910E78C;
	Fri, 16 Aug 2024 12:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EpL5aRme";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tQ7kqXM3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EpL5aRme";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tQ7kqXM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C9110E6F0;
 Fri, 16 Aug 2024 12:54:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9E47B200BE;
 Fri, 16 Aug 2024 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzqM4W0qejR0zYw9ez0+LiEUFtOktGsiJ9kajaFfmLQ=;
 b=EpL5aRmew255coLcSY+Aaex45WrzQgi1w8/8xvGzADdPm+j5HZtrrrfvw6HS49QWh6Sf98
 8X+b5AvBtj/V/PNkZkXnsMS4AciMIFHS+4Yz3smgjz+XVm1YOrjuwbk+DOjXbntclNznIm
 bVssAI7QwaXKJNsa+ocfPD/cWObq3H0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzqM4W0qejR0zYw9ez0+LiEUFtOktGsiJ9kajaFfmLQ=;
 b=tQ7kqXM3cnrYfqRc3mEIYaWGkFc2r/NQq6QCEqq6qyOAPHp6D8/RcDLnsPrmBfzEnfws+g
 OvRPbbFHcTPr8cCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzqM4W0qejR0zYw9ez0+LiEUFtOktGsiJ9kajaFfmLQ=;
 b=EpL5aRmew255coLcSY+Aaex45WrzQgi1w8/8xvGzADdPm+j5HZtrrrfvw6HS49QWh6Sf98
 8X+b5AvBtj/V/PNkZkXnsMS4AciMIFHS+4Yz3smgjz+XVm1YOrjuwbk+DOjXbntclNznIm
 bVssAI7QwaXKJNsa+ocfPD/cWObq3H0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzqM4W0qejR0zYw9ez0+LiEUFtOktGsiJ9kajaFfmLQ=;
 b=tQ7kqXM3cnrYfqRc3mEIYaWGkFc2r/NQq6QCEqq6qyOAPHp6D8/RcDLnsPrmBfzEnfws+g
 OvRPbbFHcTPr8cCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49A9413A2F;
 Fri, 16 Aug 2024 12:54:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qGeZEAlMv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Subject: [PATCH 65/86] drm/amdgpu: Run DRM default client setup
Date: Fri, 16 Aug 2024 14:23:31 +0200
Message-ID: <20240816125408.310253-66-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -7.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-7.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_TWELVE(0.00)[13]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The amdgpu driver specifies a preferred color mode depending on
the available video memory, with a default of 32. Adapt this for
the new client interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 5dd39e6c6223..7bf488708727 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -23,6 +23,7 @@
  */
 
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem.h>
@@ -2343,9 +2344,9 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	    !list_empty(&adev_to_drm(adev)->mode_config.connector_list)) {
 		/* select 8 bpp console on low vram cards */
 		if (adev->gmc.real_vram_size <= (32*1024*1024))
-			drm_fbdev_ttm_setup(adev_to_drm(adev), 8);
+			drm_client_setup(adev_to_drm(adev), drm_format_info(DRM_FORMAT_C8));
 		else
-			drm_fbdev_ttm_setup(adev_to_drm(adev), 32);
+			drm_client_setup(adev_to_drm(adev), NULL);
 	}
 
 	ret = amdgpu_debugfs_init(adev);
@@ -2957,6 +2958,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
+	DRM_FBDEV_TTM_DRIVER_OPS,
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
 #ifdef CONFIG_PROC_FS
@@ -2983,6 +2985,7 @@ const struct drm_driver amdgpu_partition_driver = {
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
+	DRM_FBDEV_TTM_DRIVER_OPS,
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
 
-- 
2.46.0

