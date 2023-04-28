Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0C6F17C1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A77C10ED15;
	Fri, 28 Apr 2023 12:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FCC10ED09
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:24:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21F4620087;
 Fri, 28 Apr 2023 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amHolSZHaVcUFO0UkCs0vi0NGTcjryrQs08HGxKJg+k=;
 b=CCysNg3/rHEKzyNjzqb3nUNM7T/FE7ECt48opY7ubBcWMrzoR5HGLR9ENqKsu6mqAFpU4u
 Me5L6kquluVmyiBgCltnckdvFfBxEf++AexdDZi/JONt+u37Uc2JnyDzy4Un0xolsjIe7j
 kQj/hDXbxq2vLs23CmJrcOH+oongiSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684697;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amHolSZHaVcUFO0UkCs0vi0NGTcjryrQs08HGxKJg+k=;
 b=fqsxn8FlnwyEWBZjejw1B4uHMg0JTqXOk5Zb9fQDXfl8YclzkXppCbKh0iFCxLC/Df8CCk
 M+kU1uN6H3Sew8AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0E0F139C3;
 Fri, 28 Apr 2023 12:24:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YOcNMhi7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 05/19] fbdev/au1200fb: Use struct fb_info.screen_buffer
Date: Fri, 28 Apr 2023 14:24:38 +0200
Message-Id: <20230428122452.4856-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428122452.4856-1-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use info->screen_buffer when reading and writing framebuffers in
system memory. It's the correct pointer for this address space.

The struct fb_info has a union to store the framebuffer memory. This can
either be info->screen_base if the framebuffer is stored in I/O memory,
or info->screen_buffer if the framebuffer is stored in system memory.

As the driver operates on the latter address space, it is wrong to use
.screen_base and .screen_buffer must be used instead. This also gets
rid of casting needed due to not using the correct data type.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/au1200fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index b6b22fa4a8a0..847f82ed52ff 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1568,7 +1568,7 @@ static int au1200fb_init_fbinfo(struct au1200fb_device *fbdev)
 	fbi->fix.mmio_len = 0;
 	fbi->fix.accel = FB_ACCEL_NONE;
 
-	fbi->screen_base = (char __iomem *) fbdev->fb_mem;
+	fbi->screen_buffer = fbdev->fb_mem;
 
 	au1200fb_update_fbinfo(fbi);
 
-- 
2.40.0

