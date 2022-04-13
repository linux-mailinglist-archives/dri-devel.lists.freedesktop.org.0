Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF94D4FF36D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B112D10F0F9;
	Wed, 13 Apr 2022 09:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A3B10E1AF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:24:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3E881F856;
 Wed, 13 Apr 2022 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649841896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6TfRZoOGRUo3LlMuyq76o2EmErslwUNJo3163b4OjQ=;
 b=Lu7Zu52PuvSBaYdZMdpa3ST6Gh+q90gr2XK79KTYuZ+WcfUfbtjbN5rTAzQgxv05QPZ4rt
 rsPvndkJQuNyr0YlH/XfWts8OQwVzNYFGjwrcWO+ZHR9GpioG5cAQxdHL821WxdwqnCk9U
 2o9YARV1KWtgA2M0f9lpqiIehOTor3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649841896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6TfRZoOGRUo3LlMuyq76o2EmErslwUNJo3163b4OjQ=;
 b=f0BN0R8CTRpU6UJN7CfIIeySW+iPxnA29A64D/EhblK+jifh6MIfYqUrg/TPU7daB+5sCX
 5dL0F3BS0c5eGYBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 847AE13A91;
 Wed, 13 Apr 2022 09:24:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KCZ+H+iWVmI5FwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Apr 2022 09:24:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robh+dt@kernel.org, frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de,
 sam@ravnborg.org, linux@roeck-us.net, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
Date: Wed, 13 Apr 2022 11:24:54 +0200
Message-Id: <20220413092454.1073-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413092454.1073-1-tzimmermann@suse.de>
References: <20220413092454.1073-1-tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A workaround makes fbdev hot-unplugging work for framebuffers without
device. The only user for this feature was offb. As each OF framebuffer
now has an associated platform device, the workaround is no longer
needed. Remove it. Effectively reverts commit 0f525289ff0d ("fbdev: Fix
unregistering of framebuffers without device").

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index bc6ed750e915..bdd00d381bbc 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1579,14 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 			 * If it's not a platform device, at least print a warning. A
 			 * fix would add code to remove the device from the system.
 			 */
-			if (!device) {
-				/* TODO: Represent each OF framebuffer as its own
-				 * device in the device hierarchy. For now, offb
-				 * doesn't have such a device, so unregister the
-				 * framebuffer as before without warning.
-				 */
-				do_unregister_framebuffer(registered_fb[i]);
-			} else if (dev_is_platform(device)) {
+			if (dev_is_platform(device)) {
 				registered_fb[i]->forced_out = true;
 				platform_device_unregister(to_platform_device(device));
 			} else {
-- 
2.35.1

