Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5CF752296
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8717F10E1B3;
	Thu, 13 Jul 2023 13:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC28310E6A1;
 Thu, 13 Jul 2023 13:03:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 866B32218D;
 Thu, 13 Jul 2023 13:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689253428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucmT+1GLTDoqupQ1pU8mLni2ss8QN6gSt8DgqXn9pcI=;
 b=xDMQnaXrC0sbzn5vN86LIOql2HUYTjH6Rn2gk6GiGaPIgMn1wM9t8fyeFtlGeVLBKVRych
 jZEQAhl9Cz+rXv2Xmv90zXqwpGPaTq3oQTLgj7bQsU93Ut1zQKNiVkAPZOvZ8Xw/7HLAvF
 hfe8hTWSEW/ctYN/9cd4yTlUaNeyD7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689253428;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucmT+1GLTDoqupQ1pU8mLni2ss8QN6gSt8DgqXn9pcI=;
 b=PyQUJ+mjDGZPkhAsdSpBipeSRqA8G+lVO8ZMG+DvIZIx7osV1ZLdagMlZnxORWjReOpSlc
 CGnqY7btTuRhblDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CAAD13A94;
 Thu, 13 Jul 2023 13:03:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eLT2CTT2r2TVPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 13:03:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH v2 15/18] fbdev/atafb: Remove flag FBINFO_FLAG_DEFAULT
Date: Thu, 13 Jul 2023 14:58:35 +0200
Message-ID: <20230713130338.31086-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713130338.31086-1-tzimmermann@suse.de>
References: <20230713130338.31086-1-tzimmermann@suse.de>
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
 Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
fbinfo.flags has been allocated to zero by a static declaration. So do
not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/atafb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 2bc4089865e6..c4a420b791b9 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -3112,7 +3112,6 @@ static int __init atafb_probe(struct platform_device *pdev)
 #ifdef ATAFB_FALCON
 	fb_info.pseudo_palette = current_par.hw.falcon.pseudo_palette;
 #endif
-	fb_info.flags = FBINFO_FLAG_DEFAULT;
 
 	if (!fb_find_mode(&fb_info.var, &fb_info, mode_option, atafb_modedb,
 			  NUM_TOTAL_MODES, &atafb_modedb[defmode],
-- 
2.41.0

