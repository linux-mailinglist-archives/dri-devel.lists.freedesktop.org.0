Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DAA72E0C3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401D910E398;
	Tue, 13 Jun 2023 11:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0564D10E36B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC3301FD96;
 Tue, 13 Jun 2023 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tu/JKMGLiCEE+vfj8wBgGdw9lM3UZPxyBeIhMkARs8=;
 b=gD3RqIR7LLgIJf/raJmnBp1/fN4KnZuvNPMCPbw84+ze/hp19d9utOK8qOyPy48VnIqnDm
 p4Q/O2MXj8GyfgEjzadd79h+eAyWFH+jnuF/maAGpA9qzaSZIma9pBPfZcp7HKxEmaRi2M
 1YTy9q+B1aMBsXoMOOgREw3yxIRcG/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654606;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tu/JKMGLiCEE+vfj8wBgGdw9lM3UZPxyBeIhMkARs8=;
 b=z6aeGbLJOcZkJ9fjFl/1u2Rjidi8dpSypWpN8+ijK0Z9nQzVcNkG20vHx1S9jFFMEHHvCA
 JokW7PBXxayELLCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 657E213483;
 Tue, 13 Jun 2023 11:10:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0ITtF45OiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 32/38] fbdev/core: Pass Linux device to pm_vt_switch_*()
 functions
Date: Tue, 13 Jun 2023 13:07:07 +0200
Message-ID: <20230613110953.24176-33-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-sh@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass the Linux device to pm_vt_switch_*() instead of the virtual
fbdev device. Prepares fbdev for making struct fb_info.dev optional.

The type of device that is passed to the PM functions does not matter
much. It is only a token within the internal list of known devices.
The PM functions do not refer to any of the device's properties or its
type.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-pm@vger.kernel.org
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/fbmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 329d16e49a900..f91ae7d4c94d6 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1478,9 +1478,9 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 		INIT_LIST_HEAD(&fb_info->modelist);
 
 	if (fb_info->skip_vt_switch)
-		pm_vt_switch_required(fb_info->dev, false);
+		pm_vt_switch_required(fb_info->device, false);
 	else
-		pm_vt_switch_required(fb_info->dev, true);
+		pm_vt_switch_required(fb_info->device, true);
 
 	fb_var_to_videomode(&mode, &fb_info->var);
 	fb_add_videomode(&mode, &fb_info->modelist);
@@ -1520,7 +1520,7 @@ static void unlink_framebuffer(struct fb_info *fb_info)
 
 	device_destroy(fb_class, MKDEV(FB_MAJOR, i));
 
-	pm_vt_switch_unregister(fb_info->dev);
+	pm_vt_switch_unregister(fb_info->device);
 
 	unbind_console(fb_info);
 
-- 
2.41.0

