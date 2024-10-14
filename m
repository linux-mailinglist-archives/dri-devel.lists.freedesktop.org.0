Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32AE99C451
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854DC10E3EB;
	Mon, 14 Oct 2024 08:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QVwl+vo8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="edLodEwS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QVwl+vo8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="edLodEwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602A010E3DE;
 Mon, 14 Oct 2024 08:57:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFB1C1FDAC;
 Mon, 14 Oct 2024 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=APIj4fMrWbbiNnt7H0miSXHdBsLTFcVx6KLBVhSu/3E=;
 b=QVwl+vo8sUjoqZjixMSY8sV9WidEu0ZVW00riwIlrBNfnlzZfQ/J3OAFaIc8s9dOM3dARh
 RdVkVodYCHmBvvJCuBmb30+b6915axkSVQ+S8jNp4HZ6P3QXaQtPWswFiQyMf6ZBkj2LZY
 l8fLpgFrntzRMTxjzeL8IzqwcZKeLVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=APIj4fMrWbbiNnt7H0miSXHdBsLTFcVx6KLBVhSu/3E=;
 b=edLodEwSqKy0BDQEcUvNW1qtR4zX987R9r5yfZvTn5AeepGrHZNPO1qLhYAHIx82dDt3FJ
 JcbhZPfYprSwTgCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=APIj4fMrWbbiNnt7H0miSXHdBsLTFcVx6KLBVhSu/3E=;
 b=QVwl+vo8sUjoqZjixMSY8sV9WidEu0ZVW00riwIlrBNfnlzZfQ/J3OAFaIc8s9dOM3dARh
 RdVkVodYCHmBvvJCuBmb30+b6915axkSVQ+S8jNp4HZ6P3QXaQtPWswFiQyMf6ZBkj2LZY
 l8fLpgFrntzRMTxjzeL8IzqwcZKeLVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=APIj4fMrWbbiNnt7H0miSXHdBsLTFcVx6KLBVhSu/3E=;
 b=edLodEwSqKy0BDQEcUvNW1qtR4zX987R9r5yfZvTn5AeepGrHZNPO1qLhYAHIx82dDt3FJ
 JcbhZPfYprSwTgCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6EF713A42;
 Mon, 14 Oct 2024 08:57:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UKB+JwrdDGfXfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Oct 2024 08:57:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v4 04/12] drm/fbdev: Select fbdev I/O helpers from modules
 that require them
Date: Mon, 14 Oct 2024 10:55:18 +0200
Message-ID: <20241014085740.582287-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241014085740.582287-1-tzimmermann@suse.de>
References: <20241014085740.582287-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,intel.com:email];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[10]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
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

Fbdev emulation for SHMEM and TTM requires helpers from the fbdev
subsystem. Select them from the modules that use them instead of the
core DRM module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index db2e206a117c..88c4837d070c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -11,7 +11,6 @@ menuconfig DRM
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
 	select FB_CORE if DRM_FBDEV_EMULATION
-	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select HDMI
 	select I2C
 	select DMA_SHARED_BUFFER
@@ -332,6 +331,7 @@ config DRM_TTM_HELPER
 	tristate
 	depends on DRM
 	select DRM_TTM
+	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Helpers for ttm-based gem objects
 
@@ -345,6 +345,7 @@ config DRM_GEM_DMA_HELPER
 config DRM_GEM_SHMEM_HELPER
 	tristate
 	depends on DRM && MMU
+	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM shmem helper functions
 
-- 
2.46.0

