Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011174D647
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C494210E25A;
	Mon, 10 Jul 2023 13:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E34610E105;
 Mon, 10 Jul 2023 13:01:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C1E75221BF;
 Mon, 10 Jul 2023 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688994078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWWwXqFHkJoFRJnBP/tkYpxJ2fIKEgYRr4uaZT1fhPw=;
 b=wcW+A62JsRs94szzFkHpTaJQhTixZO3otUOrUYJZplkA+QV4JDqKu6Yo9vjJbT2a3yX1dG
 MUYRcQSpVlH/acY9ZiDyyP0Hfn4qTqgjJp5coIPReUxD/omNcBBEH4KKbrNWMAa+908VzB
 lFnCcJk75lFrfnlhi29kG6xDdvfNZzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688994078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWWwXqFHkJoFRJnBP/tkYpxJ2fIKEgYRr4uaZT1fhPw=;
 b=y9M6fAed/RjL42oavLcDeaRzIZv9QEthz+0WSEmwzDtiN2ptcJSQ9YxZpKcrxDn3odrNpP
 FYsso5Me7a+iAfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D5CA13A05;
 Mon, 10 Jul 2023 13:01:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IFrfGR4BrGTTFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 13:01:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from fbdev
 drivers
Date: Mon, 10 Jul 2023 14:50:13 +0200
Message-ID: <20230710130113.14563-10-tzimmermann@suse.de>
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
 Robin van der Gracht <robin@protonic.nl>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
not set it.

Flags should signal differences from the default values. After cleaning
up all occurences of FBINFO_FLAG_DEFAULT, the token can be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Robin van der Gracht <robin@protonic.nl>
---
 drivers/auxdisplay/cfag12864bfb.c | 1 -
 drivers/auxdisplay/ht16k33.c      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
index c2cab7e2b126..729845bcc803 100644
--- a/drivers/auxdisplay/cfag12864bfb.c
+++ b/drivers/auxdisplay/cfag12864bfb.c
@@ -79,7 +79,6 @@ static int cfag12864bfb_probe(struct platform_device *device)
 	info->var = cfag12864bfb_var;
 	info->pseudo_palette = NULL;
 	info->par = NULL;
-	info->flags = FBINFO_FLAG_DEFAULT;
 
 	if (register_framebuffer(info) < 0)
 		goto fballoced;
diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index edaf92b7ea77..df3f37651e45 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -646,7 +646,6 @@ static int ht16k33_fbdev_probe(struct device *dev, struct ht16k33_priv *priv,
 	fbdev->info->var = ht16k33_fb_var;
 	fbdev->info->bl_dev = bl;
 	fbdev->info->pseudo_palette = NULL;
-	fbdev->info->flags = FBINFO_FLAG_DEFAULT;
 	fbdev->info->par = priv;
 
 	err = register_framebuffer(fbdev->info);
-- 
2.41.0

