Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0488A66BD83
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C03789FA5;
	Mon, 16 Jan 2023 12:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB7010E3DF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 12:10:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 160E3677AF;
 Mon, 16 Jan 2023 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673871025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1dF61LgiW9Amemy6Bfa4NTpR0UbI24WoUHuKQ6ED4pk=;
 b=vCcQ6bFme0Pv/fDrk+hVu/NaysCYwPeg8QBViPAZipdI6HhdLmBpF5oEjXwcZdEBNP6Jro
 SVdh7dn4D3YVPJifk06ptSdvB1DBjqFKApzIDo5i2QSJcNeN2R8A+KnBkQcZAW/FfUcezy
 2L9fWBVAO5gN4XvIBNH7xJmAiiB/CmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673871025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1dF61LgiW9Amemy6Bfa4NTpR0UbI24WoUHuKQ6ED4pk=;
 b=IuQVdZ+5u7ayWiYUdSROii3wcxD1Vbg1jfulpdgfloa7HAmnIFPooG38C55zHxJilxXD18
 HReGTKW1FUkbA7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5B89138FE;
 Mon, 16 Jan 2023 12:10:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nesoN7A+xWPBEAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 12:10:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: christian.koenig@amd.com, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH] drm/ttm: Include <linux/vmalloc.h> to fix MIPS build
Date: Mon, 16 Jan 2023 13:10:23 +0100
Message-Id: <20230116121023.14245-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MIPS, vmap() and vunmap() are undeclared in ttm_bo_util.c. An
error message is shown below.

  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  ../drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_kmap_ttm':
  ../drivers/gpu/drm/ttm/ttm_bo_util.c:364:32: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
    364 |                 map->virtual = vmap(ttm->pages + start_page, num_pages,
	|                                ^~~~
	|                                kmap
  ../drivers/gpu/drm/ttm/ttm_bo_util.c:364:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    364 |                 map->virtual = vmap(ttm->pages + start_page, num_pages,
	|                              ^
  ../drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_kunmap':
  ../drivers/gpu/drm/ttm/ttm_bo_util.c:429:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
    429 |                 vunmap(map->virtual);
	|                 ^~~~~~
	|                 kunmap
  ../drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_vmap':
  ../drivers/gpu/drm/ttm/ttm_bo_util.c:509:23: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    509 |                 vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
	|                       ^

Fix this by including <linux/vmalloc.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 12017ec24d9f..8e19a40cb41d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -29,6 +29,8 @@
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
 
+#include <linux/vmalloc.h>
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
-- 
2.39.0

