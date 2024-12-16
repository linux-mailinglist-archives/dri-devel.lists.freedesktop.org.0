Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 393FC9F2B18
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 08:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F7E10E31F;
	Mon, 16 Dec 2024 07:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="p4sTDPM3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/zozTl2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p4sTDPM3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/zozTl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6D010E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 07:45:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A7FA1F396;
 Mon, 16 Dec 2024 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734335101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15kpYJEGyM7Ba6x0+bg6oTodDawM+ZCB0XClI5EgXYE=;
 b=p4sTDPM335f7UgyTNFtvUOTyT6VUFadghW6CA1vVQUfmmWuiWCeXRJO8qHrXlEpt+h8D3z
 +EnSF1Sx4ryCS7lGNX0XF6X/GDpPvXeKAR6Y+wjVj5pG1EA47coSTjl9feh1Sjz2ajbOQs
 g55IB/bhNsBX+PqgoabpYrsPQsPui8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734335101;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15kpYJEGyM7Ba6x0+bg6oTodDawM+ZCB0XClI5EgXYE=;
 b=8/zozTl28OG62K0kTRYPhuVDgIkieak3u5s/F6cJCn+Zo5UVekb8RfiXzdVcZy3XCAZUcl
 Bo3oXZkVHJTDnxDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734335101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15kpYJEGyM7Ba6x0+bg6oTodDawM+ZCB0XClI5EgXYE=;
 b=p4sTDPM335f7UgyTNFtvUOTyT6VUFadghW6CA1vVQUfmmWuiWCeXRJO8qHrXlEpt+h8D3z
 +EnSF1Sx4ryCS7lGNX0XF6X/GDpPvXeKAR6Y+wjVj5pG1EA47coSTjl9feh1Sjz2ajbOQs
 g55IB/bhNsBX+PqgoabpYrsPQsPui8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734335101;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15kpYJEGyM7Ba6x0+bg6oTodDawM+ZCB0XClI5EgXYE=;
 b=8/zozTl28OG62K0kTRYPhuVDgIkieak3u5s/F6cJCn+Zo5UVekb8RfiXzdVcZy3XCAZUcl
 Bo3oXZkVHJTDnxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C139D13418;
 Mon, 16 Dec 2024 07:45:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CMj8LXzaX2egZAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Dec 2024 07:45:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, arnd@arndb.de, deller@gmx.de,
 jani.nikula@linux.intel.com, christophe.leroy@csgroup.eu, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/3] drm/fbdev: Select FB_CORE dependency for fbdev on DMA
 and TTM
Date: Mon, 16 Dec 2024 08:42:48 +0100
Message-ID: <20241216074450.8590-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216074450.8590-1-tzimmermann@suse.de>
References: <20241216074450.8590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,linux.intel.com,csgroup.eu,ffwll.ch,gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLykjg6e7ifkwtw7jmpw7b9yio)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

Select FB_CORE if GEM's DMA and TTM implementations support fbdev
emulation. Fixes linker errors about missing symbols from the fbdev
subsystem.

Also see [1] for a related SHMEM fix.

Fixes: dadd28d4142f ("drm/client: Add client-lib module")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/series/141411/ # 1
---
 drivers/gpu/drm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9abb41da4e3a..55ce61a46984 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -293,6 +293,7 @@ config DRM_TTM_HELPER
 	tristate
 	depends on DRM
 	select DRM_TTM
+	select FB_CORE if DRM_FBDEV_EMULATION
 	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Helpers for ttm-based gem objects
@@ -300,6 +301,7 @@ config DRM_TTM_HELPER
 config DRM_GEM_DMA_HELPER
 	tristate
 	depends on DRM
+	select FB_CORE if DRM_FBDEV_EMULATION
 	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM DMA helper functions
-- 
2.47.1

