Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0462874D655
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A9F10E280;
	Mon, 10 Jul 2023 13:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEBB10E15A;
 Mon, 10 Jul 2023 13:01:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D2DB1FF7D;
 Mon, 10 Jul 2023 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688994080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRUywqxs5a29120EfN3Bn9mdZmuhBJWGIOQrCKZzgUM=;
 b=VoO60JR0vkBYYJEfiXCxbto+zB8LminaUWh5RiGEeHNwD6AK72Ls2YONMYilu1NhkZ6XaV
 IZa+TpEV5wr13aGSMukVpXTcvcVZcdGouOiq2kTZA/6Y8C/KuEv5NfxafZ4fsLYMn2xTf0
 IifhIRSVlSJAXstVMXHnhHpWIrvWg8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688994080;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRUywqxs5a29120EfN3Bn9mdZmuhBJWGIOQrCKZzgUM=;
 b=PThQ3ciLwYhPhcSmsJ7eCkxPJepdaQUYwZw1Qos1hKdfhILaEyy17W+y0NcGj7wVxyKDC+
 eJEdJkBM0jXYFxBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A034913A6B;
 Mon, 10 Jul 2023 13:01:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6NgxJh8BrGTTFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 13:01:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 12/17] staging: Remove flag FBINFO_FLAG_DEFAULT from fbdev
 drivers
Date: Mon, 10 Jul 2023 14:50:16 +0200
Message-ID: <20230710130113.14563-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710130113.14563-1-tzimmermann@suse.de>
References: <20230710130113.14563-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
not set it.

Flags should signal differences from the default values. After cleaning
up all occurences of FBINFO_FLAG_DEFAULT, the token can be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
---
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 drivers/staging/sm750fb/sm750.c    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 3a4abf3bae40..eac1d570f437 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -684,7 +684,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->var.transp.offset =  0;
 	info->var.transp.length =  0;
 
-	info->flags =              FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB;
+	info->flags =              FBINFO_VIRTFB;
 
 	par = info->par;
 	par->info = info;
diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index c260f73cf570..79bcd5bd4938 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -807,7 +807,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	info->screen_base = crtc->v_screen;
 	pr_debug("screen_base vaddr = %p\n", info->screen_base);
 	info->screen_size = line_length * var->yres_virtual;
-	info->flags = FBINFO_FLAG_DEFAULT | 0;
 
 	/* set info->fix */
 	fix->type = FB_TYPE_PACKED_PIXELS;
-- 
2.41.0

