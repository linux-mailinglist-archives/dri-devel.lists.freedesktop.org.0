Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AEB74D634
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5CF10E152;
	Mon, 10 Jul 2023 13:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08CD10E0FC;
 Mon, 10 Jul 2023 13:01:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 68BFA1FF7C;
 Mon, 10 Jul 2023 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688994078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTQpbLanYLjxro0UM6J8Mi7ObE6Z41CLBE4xsSVjDsc=;
 b=pX7kc4YVK+yd81bUpTHdZ1dAI63aV/ZAD+NOhEF+NEsM9Nx23ayHl5rNax0Z/F0EWGlXl3
 2okPokwUAusEzTQ6iqWWpnDXBcJhhMXjm8UJchDiztUotQjR7uZcasIIaGpk3OIca4pPWH
 oyAx1xHGmL7b/Ngqc5mRXy93Zi3ujB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688994078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTQpbLanYLjxro0UM6J8Mi7ObE6Z41CLBE4xsSVjDsc=;
 b=ibWKAz6ioqyjGlxcLtbm6ki+xAMred8GEX6JNPkq5qrp4dXI9LPOJHaLYWkxG96udj+hj7
 Q0rOMB0Eo+6t37Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 084B913A6B;
 Mon, 10 Jul 2023 13:01:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mDT7AB4BrGTTFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 13:01:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 08/17] arch/sh: Do not assign FBINFO_FLAG_DEFAULT to
 fb_videomode.flag
Date: Mon, 10 Jul 2023 14:50:12 +0200
Message-ID: <20230710130113.14563-9-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FBINFO_FLAG_DEFAULT is a flag for a framebuffer in struct fb_info.
Flags for videomodes are prefixed with FB_MODE_. FBINFO_FLAG_DEFAULT
is 0 and the static declaration already clears the memory area of
sh7763fb_videomode. So remove the assignment.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 arch/sh/boards/mach-sh7763rdp/setup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/boards/mach-sh7763rdp/setup.c b/arch/sh/boards/mach-sh7763rdp/setup.c
index 97e715e4e9b3..345f2b76c85a 100644
--- a/arch/sh/boards/mach-sh7763rdp/setup.c
+++ b/arch/sh/boards/mach-sh7763rdp/setup.c
@@ -119,7 +119,6 @@ static struct fb_videomode sh7763fb_videomode = {
 	.vsync_len = 1,
 	.sync = 0,
 	.vmode = FB_VMODE_NONINTERLACED,
-	.flag = FBINFO_FLAG_DEFAULT,
 };
 
 static struct sh7760fb_platdata sh7763fb_def_pdata = {
-- 
2.41.0

