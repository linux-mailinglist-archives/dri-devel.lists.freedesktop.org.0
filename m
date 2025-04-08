Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9FAA7F950
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FC310E620;
	Tue,  8 Apr 2025 09:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AlfGEawZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JDqy/Ac4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AlfGEawZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JDqy/Ac4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA5110E624
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 09:22:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 12AC021197;
 Tue,  8 Apr 2025 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744104133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93kpx/ZGI++2csJBmSbKAqr+tGDBQ3bZFA8m8yj33TE=;
 b=AlfGEawZvbP3ewqqemExCQ7PNOSaaeT3hOBzDjQFDUxrJqQtsrTBSqxnBP9CqkmDE2ZMGJ
 KDu/xS6kha6I4ofRtcBT6CCrc0b1197B7I0C2WKWpNz2nO2QaDKlUeF0Nrytq5wpnoRdZ2
 9Ki0Zra9I7fa0LRTZFAiq1RivAzXi6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744104133;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93kpx/ZGI++2csJBmSbKAqr+tGDBQ3bZFA8m8yj33TE=;
 b=JDqy/Ac4oZcPSojQ3EDtFcKIaM5U1Lfo1TDLCNyY9loJI+T73/b72OUK3HNt+mvm6FsLXb
 IfeLdiVDb3ub3pBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AlfGEawZ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="JDqy/Ac4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744104133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93kpx/ZGI++2csJBmSbKAqr+tGDBQ3bZFA8m8yj33TE=;
 b=AlfGEawZvbP3ewqqemExCQ7PNOSaaeT3hOBzDjQFDUxrJqQtsrTBSqxnBP9CqkmDE2ZMGJ
 KDu/xS6kha6I4ofRtcBT6CCrc0b1197B7I0C2WKWpNz2nO2QaDKlUeF0Nrytq5wpnoRdZ2
 9Ki0Zra9I7fa0LRTZFAiq1RivAzXi6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744104133;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93kpx/ZGI++2csJBmSbKAqr+tGDBQ3bZFA8m8yj33TE=;
 b=JDqy/Ac4oZcPSojQ3EDtFcKIaM5U1Lfo1TDLCNyY9loJI+T73/b72OUK3HNt+mvm6FsLXb
 IfeLdiVDb3ub3pBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC76513A84;
 Tue,  8 Apr 2025 09:22:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ID6tMMTq9Gf2YgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 09:22:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org, javierm@redhat.com, linux-efi@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/sysfb: efidrm: Support module builds
Date: Tue,  8 Apr 2025 11:17:05 +0200
Message-ID: <20250408091837.407401-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408091837.407401-1-tzimmermann@suse.de>
References: <20250408091837.407401-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 12AC021197
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_FIVE(0.00)[5]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Make CONFIG_DRM_EFIDRM a tristate to enable module builds.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index 5ac71d5ff8edf..9c9884c7efc6c 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -8,8 +8,8 @@ config DRM_SYSFB_HELPER
 	depends on DRM
 
 config DRM_EFIDRM
-	bool "EFI framebuffer driver"
-	depends on (DRM=y) && MMU && EFI && (!SYSFB_SIMPLEFB || COMPILE_TEST)
+	tristate "EFI framebuffer driver"
+	depends on DRM && MMU && EFI && (!SYSFB_SIMPLEFB || COMPILE_TEST)
 	select APERTURE_HELPERS
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
-- 
2.49.0

