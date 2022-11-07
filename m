Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936061F3C5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 13:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1F710E305;
	Mon,  7 Nov 2022 12:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD0B10E305
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 12:53:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 339A31F8A3;
 Mon,  7 Nov 2022 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667825614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykA7d1SBoTj0oGKFhKCUJkXPacqxNV9gXpmVgRCk3FQ=;
 b=yG3jl7c73E7xYYKl0PcT6htm3FTxA39pQMntpcZysWwlk0Ynmfmx1z8Zk39ymOtpvbj1MI
 PGfEWlJllO7avdqH8E4xIgHSNKe5TUqPx78C92YUmoy21rBgOEdccy+DJPkjOD+tJnmoq3
 R9l2p1NyVFcxR3j49EXAu4z44D7T3TE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667825614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykA7d1SBoTj0oGKFhKCUJkXPacqxNV9gXpmVgRCk3FQ=;
 b=29YJxCOr3La+oEeWWtb/JPvm7r67Vn78HzVFBOyp0+Kl0o5dqsiqfiz7LxJ00uCyek7lUr
 As0PvbUsPXeqgQAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E70EC13ADB;
 Mon,  7 Nov 2022 12:53:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ICFzN83/aGMDRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Nov 2022 12:53:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com
Subject: [PATCH 1/3] drm/fbdev: Include <linux/vmalloc.h>
Date: Mon,  7 Nov 2022 13:53:27 +0100
Message-Id: <20221107125329.12842-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221107125329.12842-1-tzimmermann@suse.de>
References: <20221107125329.12842-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Include <linux/vmalloc.h> in fbdev emulation to get vzalloc() and
vfree() on MIPS. The error messages are shown below and bug reports
are at [1] and [2].

  drivers/gpu/drm/drm_fbdev_generic.c: In function 'drm_fbdev_cleanup':
  drivers/gpu/drm/drm_fbdev_generic.c:63:17: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
     63 |                 vfree(shadow);
        |                 ^~~~~
        |                 kvfree
  drivers/gpu/drm/drm_fbdev_generic.c: In function 'drm_fbdev_fb_probe':
  drivers/gpu/drm/drm_fbdev_generic.c:219:38: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
    219 |                 fbi->screen_buffer = vzalloc(fbi->screen_size);
        |                                      ^~~~~~~
        |                                      kvzalloc
  drivers/gpu/drm/drm_fbdev_generic.c:219:36: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    219 |                 fbi->screen_buffer = vzalloc(fbi->screen_size);

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 8ab59da26bc0 ("drm/fb-helper: Move generic fbdev emulation into separate source file")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Link: https://lore.kernel.org/dri-devel/202211060911.5U76gMtE-lkp@intel.com/T/#u # [1]
Link: https://lore.kernel.org/dri-devel/202211060331.1SoD1tAR-lkp@intel.com/T/#u # [2]
---
 drivers/gpu/drm/drm_fbdev_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 2d6083ad2e3c7..ab86956692795 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 
 #include <linux/moduleparam.h>
+#include <linux/vmalloc.h>
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-- 
2.38.0

