Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3387984E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E25112EEB;
	Tue, 12 Mar 2024 15:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cGVMvZ3D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gAnE5gzp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cGVMvZ3D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gAnE5gzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5A3112EC9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:48:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 204785D6D8;
 Tue, 12 Mar 2024 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710258527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7S25v5yiTOkgr0NdB0G0YkcSfVhgn+aBrT5pS0pWC6U=;
 b=cGVMvZ3Dx6kP/ijbjXX55JW300Jcn0J6lYlasr8lEO4GFX+hSwNsglH8NeLzuETcr1vVjk
 6nEgD7EVFYWxy0L0nROQrt/+k/r8lrz24Vt4b1VOVfg1NegeG1wq96EtxIF9s+uQJCP9Kr
 YNKmKbXCewt6SMxXx4VYVHOr/ffwTSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710258527;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7S25v5yiTOkgr0NdB0G0YkcSfVhgn+aBrT5pS0pWC6U=;
 b=gAnE5gzpwCOceAkuADEcsBF/WUqp0+Jnv+hWRmbfen0X18Yo/8+c6T+B6xh2jjwJCuOj+A
 dgWrFuagMXo0UtBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710258527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7S25v5yiTOkgr0NdB0G0YkcSfVhgn+aBrT5pS0pWC6U=;
 b=cGVMvZ3Dx6kP/ijbjXX55JW300Jcn0J6lYlasr8lEO4GFX+hSwNsglH8NeLzuETcr1vVjk
 6nEgD7EVFYWxy0L0nROQrt/+k/r8lrz24Vt4b1VOVfg1NegeG1wq96EtxIF9s+uQJCP9Kr
 YNKmKbXCewt6SMxXx4VYVHOr/ffwTSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710258527;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7S25v5yiTOkgr0NdB0G0YkcSfVhgn+aBrT5pS0pWC6U=;
 b=gAnE5gzpwCOceAkuADEcsBF/WUqp0+Jnv+hWRmbfen0X18Yo/8+c6T+B6xh2jjwJCuOj+A
 dgWrFuagMXo0UtBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9C1F1364F;
 Tue, 12 Mar 2024 15:48:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MCX/Ml558GUhPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 33/43] drm/tiny/ili9163: Use fbdev-dma
Date: Tue, 12 Mar 2024 16:45:28 +0100
Message-ID: <20240312154834.26178-34-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312154834.26178-1-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.35
X-Spamd-Result: default: False [-0.35 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.05)[60.14%]
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

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by ili9163. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/ili9163.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index bc4384d410fcc..86f9d88349015 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dbi.h>
@@ -185,7 +185,7 @@ static int ili9163_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(drm, 0);
+	drm_fbdev_dma_setup(drm, 0);
 
 	return 0;
 }
-- 
2.44.0

