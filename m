Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC01B542F76
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 13:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6647F10F423;
	Wed,  8 Jun 2022 11:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7F10F423
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 11:51:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 754EF21C52;
 Wed,  8 Jun 2022 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654689084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4QPnueKL9b7XF4F/LEix2XxCjs3ycziQ2ovz+bGRbO8=;
 b=zLgawILFc9bn27lM1QIGo4PSyr9sMTnUH1FMndS7Q4YrqleHdZI2H6kNC5gyq8K+SGJfm4
 adBdj6G62TySqz61mJmEotW9nmtUiQlKnJNDKKB2jQOrRcQKQpNqBitfE62UE9mRXwRRUR
 i73hXdKzIvmqNojGwHx23dLg/lIbB/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654689084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4QPnueKL9b7XF4F/LEix2XxCjs3ycziQ2ovz+bGRbO8=;
 b=61OfL5VGWMR24wsptmMrJ4t+3MOut1Vara+uVuwdDMC1bEVfsvj0zUdH+3ji1xT11HsfiH
 adJA4D9qgRJCUXAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EF5213A15;
 Wed,  8 Jun 2022 11:51:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8lxjEjyNoGI9KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Jun 2022 11:51:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, jfalempe@redhat.com
Subject: [PATCH] drm/mgag200: Include <linux/vmalloc.h> for G200 BIOS code
Date: Wed,  8 Jun 2022 13:51:22 +0200
Message-Id: <20220608115122.7448-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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

After moving the vmalloc() call to another file, the rsp include
statement needs to be moved as well. Resolves a build warning on
parisc.

 drivers/gpu/drm/mgag200/mgag200_g200.c: In function
	'mgag200_g200_init_refclk':
 drivers/gpu/drm/mgag200/mgag200_g200.c:120:16: error: implicit
	declaration of function 'vmalloc'; did you mean 'kvmalloc'?
	[-Werror=implicit-function-declaration]

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 85397f6bc4ff ("drm/mgag200: Initialize each model in separate function")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Link: https://lore.kernel.org/all/202206080734.ztAvDG7O-lkp@intel.com/
---
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 1 -
 drivers/gpu/drm/mgag200/mgag200_g200.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 361eb7dffda1..73e8e4e9e54b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -8,7 +8,6 @@
 
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/vmalloc.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index 616e11391e02..674385921b7f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/pci.h>
+#include <linux/vmalloc.h>
 
 #include <drm/drm_drv.h>
 
-- 
2.36.1

