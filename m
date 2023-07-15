Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A11754B0D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 20:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F9B10E18F;
	Sat, 15 Jul 2023 18:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B523510E17C;
 Sat, 15 Jul 2023 18:53:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4CF6821ADE;
 Sat, 15 Jul 2023 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689447229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AudvpgVwEo8rKBJvmUL4nJ192ctihi90m956sryfWBI=;
 b=rlx2K0DX0a7aLp8uigVFHuUAM9bV1hHZPasKhvTaGsQY9kZ/4eVtjq5LUVsKuQec422bE0
 +mB1BYcbpceDSMWz3txt2h8RHtuIAVrQd7KADTim+k1y09Q8+6PaQ2P8rkFia9UHT3opPt
 M832Ov6RomMMCW1eAKM4qqN4itU5oNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689447229;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AudvpgVwEo8rKBJvmUL4nJ192ctihi90m956sryfWBI=;
 b=sIzlOQKvsGqS4WsvShqurtnstG7hUqxBdFaIRnVCAIKCT6s48j0bu9fHlgpf1Iv5erIHnG
 p0vGP/J7dx1s/4Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBF9A13A23;
 Sat, 15 Jul 2023 18:53:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yLrPNDzrsmQCBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 15 Jul 2023 18:53:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
 dan.carpenter@linaro.org
Subject: [PATCH v4 08/18] sh: mach-sh7763rdp: Assign FB_MODE_IS_UNKNOWN to
 struct fb_videomode.flag
Date: Sat, 15 Jul 2023 20:51:50 +0200
Message-ID: <20230715185343.7193-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715185343.7193-1-tzimmermann@suse.de>
References: <20230715185343.7193-1-tzimmermann@suse.de>
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
 Sam Ravnborg <sam@ravnborg.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign FB_MODE_IS_UNKNOWN to sh7763fb_videomode.flag instead of
FBINFO_FLAG_DEFAULT. Both are 0, so the stored value does not change.

FBINFO_FLAG_DEFAULT is a flag for a framebuffer in struct fb_info.
Flags for videomodes are prefixed with FB_MODE_.

v3:
	* include board name in commit message (Adrian)
v2:
	* assign FB_MODE_IS_UNKNOWN (Adrian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 arch/sh/boards/mach-sh7763rdp/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/boards/mach-sh7763rdp/setup.c b/arch/sh/boards/mach-sh7763rdp/setup.c
index 97e715e4e9b3..e25193001ea0 100644
--- a/arch/sh/boards/mach-sh7763rdp/setup.c
+++ b/arch/sh/boards/mach-sh7763rdp/setup.c
@@ -119,7 +119,7 @@ static struct fb_videomode sh7763fb_videomode = {
 	.vsync_len = 1,
 	.sync = 0,
 	.vmode = FB_VMODE_NONINTERLACED,
-	.flag = FBINFO_FLAG_DEFAULT,
+	.flag = FB_MODE_IS_UNKNOWN,
 };
 
 static struct sh7760fb_platdata sh7763fb_def_pdata = {
-- 
2.41.0

