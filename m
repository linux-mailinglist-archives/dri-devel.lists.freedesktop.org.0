Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4F974D66E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185EE10E287;
	Mon, 10 Jul 2023 13:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279610E1FE;
 Mon, 10 Jul 2023 13:01:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0BDD7221C1;
 Mon, 10 Jul 2023 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688994082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0Gm3caehTf+DDNUO7FEiHJTJ/hpEoZRP8IUYE91TXw=;
 b=Go7brugIegGY+ZVPi6YfHKxGodhrQekZWN2V2ZK6jxPYBTjY635csao0oKFNQYWr11kMz8
 G39YnLW+q7ItBbkzh7LkyKVTEiNWztYwaEDCGYGHHmSJ6suqKc0jI7HYjJIJ0YgoIdBdUB
 y0bMj50CzUM97CeHB3sibChMwMXdKNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688994082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0Gm3caehTf+DDNUO7FEiHJTJ/hpEoZRP8IUYE91TXw=;
 b=MsqvxlT6sFr6ha7xHjLd+Ynf+kok1rNaAtXEFt/8fbacjxNPr9mpxokzH4T2unRIgadntW
 9gKaSCCViPXyQpCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFEF513A05;
 Mon, 10 Jul 2023 13:01:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qGYSKiEBrGTTFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 13:01:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 17/17] fbdev: Remove FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT
Date: Mon, 10 Jul 2023 14:50:21 +0200
Message-ID: <20230710130113.14563-18-tzimmermann@suse.de>
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
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
---
 include/linux/fb.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 1d5c13f34b09..43458f582f35 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -383,7 +383,6 @@ struct fb_tile_ops {
 #endif /* CONFIG_FB_TILEBLITTING */
 
 /* FBINFO_* = fb_info.flags bit flags */
-#define FBINFO_DEFAULT		0
 #define FBINFO_HWACCEL_DISABLED	0x0002
 	/* When FBINFO_HWACCEL_DISABLED is set:
 	 *  Hardware acceleration is turned off.  Software implementations
@@ -504,8 +503,6 @@ struct fb_info {
 	bool skip_vt_switch; /* no VT switch on suspend/resume required */
 };
 
-#define FBINFO_FLAG_DEFAULT	FBINFO_DEFAULT
-
 /* This will go away
  * fbset currently hacks in FB_ACCELF_TEXT into var.accel_flags
  * when it wants to turn the acceleration engine on.  This is
-- 
2.41.0

