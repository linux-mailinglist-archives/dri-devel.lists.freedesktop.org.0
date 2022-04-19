Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAEC506845
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 12:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2D610E80D;
	Tue, 19 Apr 2022 10:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9995510E755
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 10:04:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 211211F750;
 Tue, 19 Apr 2022 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650362648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72MSO73iE9m6d6QcQ+RYD7uJHq/qshdsujcD80AQRJM=;
 b=qIrGCpfvcmzkt/DJmyMjcpRiB83gp2InxeVfPQxpoOBm6yrImp+SHdPFycXCH+L0/Go4C8
 xqAqGL5VxrqzQ8aa4MNUd0sLpEmpNB6MP6LuKtPqr2E//clpNRxf++RzosaofnhnLUqHbU
 3Dxm9PS5hp2XPEOYaUFqlmM+i2AR+hU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650362648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72MSO73iE9m6d6QcQ+RYD7uJHq/qshdsujcD80AQRJM=;
 b=/4wHI6KsrywOkyEaqa+m3SvpCyqaRqbDM4X9so+EOdCFjlb5vQ5NVNJPxQ67TxlWV70SER
 sNnW7IOHd/Os6oCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C39F1132E7;
 Tue, 19 Apr 2022 10:04:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6MLVLheJXmJzJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Apr 2022 10:04:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robh+dt@kernel.org, frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de,
 sam@ravnborg.org, linux@roeck-us.net, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, javierm@redhat.com
Subject: [PATCH v2 2/2] fbdev: Warn in hot-unplug workaround for framebuffers
 without device
Date: Tue, 19 Apr 2022 12:04:05 +0200
Message-Id: <20220419100405.12600-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419100405.12600-1-tzimmermann@suse.de>
References: <20220419100405.12600-1-tzimmermann@suse.de>
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
now has an associated platform device, the workaround hould no longer
be triggered. Update it with a warning and rewrite the comment. Fbdev
drivers that trigger the hot-unplug workaround really need to be fixed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fbmem.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index bc6ed750e915..84427470367b 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1577,14 +1577,12 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 			 * allocate the memory range.
 			 *
 			 * If it's not a platform device, at least print a warning. A
-			 * fix would add code to remove the device from the system.
+			 * fix would add code to remove the device from the system. For
+			 * framebuffers without any Linux device, print a warning as
+			 * well.
 			 */
 			if (!device) {
-				/* TODO: Represent each OF framebuffer as its own
-				 * device in the device hierarchy. For now, offb
-				 * doesn't have such a device, so unregister the
-				 * framebuffer as before without warning.
-				 */
+				pr_warn("fb%d: no device set\n", i);
 				do_unregister_framebuffer(registered_fb[i]);
 			} else if (dev_is_platform(device)) {
 				registered_fb[i]->forced_out = true;
-- 
2.35.1

