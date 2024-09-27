Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90298875F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BF810ECC9;
	Fri, 27 Sep 2024 14:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CgncASGU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/UdvqZZ/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CgncASGU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/UdvqZZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9D910ECA3;
 Fri, 27 Sep 2024 14:42:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 437E11F82E;
 Fri, 27 Sep 2024 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CabPTOmDep4GJzSJBh0ShrFUMXAfTBzSf6TaoXgMRMg=;
 b=CgncASGUVXBB5r7Sub94G5s0u6JzdHHr4waLNB/4O8jgIF3YahTNanUw8qzXS9KslWNV8J
 bL0hTnF0hKAxO2lQGf9uTw4zSVSwaSnub5/5HnwsD7Dw/uBFlpJfh2Kz7ZZd+UK+27plma
 AFpddwzosSSX45bj5DrMzjPwaCBCD9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CabPTOmDep4GJzSJBh0ShrFUMXAfTBzSf6TaoXgMRMg=;
 b=/UdvqZZ/ohCNcOL+Fen0Aespwe2tyIdLcRxjlX94z/Qx5HKQvwrzWwtemABKgHlQu6XMB1
 ymuPdn6N8nKhMkCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CabPTOmDep4GJzSJBh0ShrFUMXAfTBzSf6TaoXgMRMg=;
 b=CgncASGUVXBB5r7Sub94G5s0u6JzdHHr4waLNB/4O8jgIF3YahTNanUw8qzXS9KslWNV8J
 bL0hTnF0hKAxO2lQGf9uTw4zSVSwaSnub5/5HnwsD7Dw/uBFlpJfh2Kz7ZZd+UK+27plma
 AFpddwzosSSX45bj5DrMzjPwaCBCD9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CabPTOmDep4GJzSJBh0ShrFUMXAfTBzSf6TaoXgMRMg=;
 b=/UdvqZZ/ohCNcOL+Fen0Aespwe2tyIdLcRxjlX94z/Qx5HKQvwrzWwtemABKgHlQu6XMB1
 ymuPdn6N8nKhMkCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01CA01386E;
 Fri, 27 Sep 2024 14:42:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0EG4OnDE9mYFKwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Sep 2024 14:42:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm: Select fbdev helpers for modules that require them
Date: Fri, 27 Sep 2024 16:37:29 +0200
Message-ID: <20240927144252.31813-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240927144252.31813-1-tzimmermann@suse.de>
References: <20240927144252.31813-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
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

Fbdev emulation for SHMEM and TTM requires helpers from the fbdev
subsystem. Select them from the modules that use them instead of the
core DRM module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1df4e627e3d3..88b2ba55fe16 100644
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

