Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F796F17AB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE54310ED05;
	Fri, 28 Apr 2023 12:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FA310ED02
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:24:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 03FF820086;
 Fri, 28 Apr 2023 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OpwUZ9PBUAtBursC98bI9OZ0Vwg7yJS7jiV+xlbCGAw=;
 b=er+meh0E+wel4UT5E0boEeLGASuABS8UefIEpAuGp7a+Y+hIEe1Iy9VR21oXaduTKyNyaT
 LHPwXet3oOat5NQjjhQ+u1VydeitFSjpjsDcajUDn0n22ffvbWRoRVCK6wKgZ3G2sR9b5t
 kJ+VA6Y6sHTjn/lFVjjz5CHsaSChFDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684696;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OpwUZ9PBUAtBursC98bI9OZ0Vwg7yJS7jiV+xlbCGAw=;
 b=EDDySLZzk/eW/mY7mlAOa6Yz41u/ZWgt69nGe4qPuFxf4WDawORJGJaCobnLFM70UJpOuj
 budHM7/6Pf0u6TCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB660139C3;
 Fri, 28 Apr 2023 12:24:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +CXYLBe7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 01/19] auxdisplay/cfag12864bfb: Use struct
 fb_info.screen_buffer
Date: Fri, 28 Apr 2023 14:24:34 +0200
Message-Id: <20230428122452.4856-2-tzimmermann@suse.de>
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
 drivers/auxdisplay/cfag12864bfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
index 0df474506fb9..c2cab7e2b126 100644
--- a/drivers/auxdisplay/cfag12864bfb.c
+++ b/drivers/auxdisplay/cfag12864bfb.c
@@ -72,7 +72,7 @@ static int cfag12864bfb_probe(struct platform_device *device)
 	if (!info)
 		goto none;
 
-	info->screen_base = (char __iomem *) cfag12864b_buffer;
+	info->screen_buffer = cfag12864b_buffer;
 	info->screen_size = CFAG12864B_SIZE;
 	info->fbops = &cfag12864bfb_ops;
 	info->fix = cfag12864bfb_fix;
-- 
2.40.0

