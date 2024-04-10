Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD63089F36F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B9F113347;
	Wed, 10 Apr 2024 13:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KqVB5Vh3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hwW4GVA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A97113346
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:06:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AAA555CDA2;
 Wed, 10 Apr 2024 13:05:59 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712754359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ThzsoWjmWhZMt413jj7Iww6DAgpDtb/wivYICCyzLo=;
 b=KqVB5Vh3X93sKuGNey/M4vLf4OqBI2ctp0jTruQG/uiG/bJHLWfvm8VuQTb03eJ1dPgse6
 tJqXiieDkl7MTqfqOIp1yquVX4LQ4lOZTxqXSbZ1pxwIVQbyEHEy7uYtH/QZJPjq1VlYw6
 bL5chmjGIwEHki6N/PQpccGKIMy+E/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712754359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ThzsoWjmWhZMt413jj7Iww6DAgpDtb/wivYICCyzLo=;
 b=hwW4GVA7SlaW5zzk2+vzZFLFfglkWu+L10ai+1pr4UomutOFT54m76RJbHix/sT+5oXbM7
 gESE8x/gtDxyumBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5396313A94;
 Wed, 10 Apr 2024 13:05:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id iCMyE7eOFmYdEgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:05:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zackr@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org,
 Zack Rusin <zack.rusin@broadcom.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v2 01/43] drm/fbdev-generic: Do not set physical framebuffer
 address
Date: Wed, 10 Apr 2024 15:01:57 +0200
Message-ID: <20240410130557.31572-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410130557.31572-1-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: AAA555CDA2
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
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

Framebuffer memory is allocated via vzalloc() from non-contiguous
physical pages. The physical framebuffer start address is therefore
meaningless. Do not set it.

The value is not used within the kernel and only exported to userspace
on dedicated ARM configs. No functional change is expected.

v2:
- refer to vzalloc() in commit message (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: a5b44c4adb16 ("drm/fbdev-generic: Always use shadow buffering")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: <stable@vger.kernel.org> # v6.4+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index be357f926faec..97e579c33d84a 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -113,7 +113,6 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	/* screen */
 	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
 	info->screen_buffer = screen_buffer;
-	info->fix.smem_start = page_to_phys(vmalloc_to_page(info->screen_buffer));
 	info->fix.smem_len = screen_size;
 
 	/* deferred I/O */
-- 
2.44.0

