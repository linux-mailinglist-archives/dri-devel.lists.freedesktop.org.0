Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F4A50DEBF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 13:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D1010E37C;
	Mon, 25 Apr 2022 11:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3E010E378
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 11:27:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD4C3210EC;
 Mon, 25 Apr 2022 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650886072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZKrkE8FPb5LF7zYeH+H7Zv+EKkXH77NzpuOcL8LQEFE=;
 b=oGCe2gFT1Usd3JpX2IAkyOzIoil4uyBVkKndykiI8blhdrePdud6Qj8klFVoOWwNybRWHs
 w9FV23cf03rmFH4jLqoubGdw3Y4pCFHjOvz3+IUzoA1MDeFRUz3CV1nFnClvT+IZVvAXf0
 ToJD0rUoeqTcki4CP7OuX3MYcFTumkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650886072;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZKrkE8FPb5LF7zYeH+H7Zv+EKkXH77NzpuOcL8LQEFE=;
 b=4pZOcGmQ7GgsD0p0jL9Su26zzT7xzuM74vlmH+CQDzzHxvxFNTFRk18ZFhhogirmhOwI8X
 5FbfoPsAx6QXy3AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F43313AE1;
 Mon, 25 Apr 2022 11:27:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bLcUJriFZmIPUAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 11:27:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 0/3] fbdev: Decouple deferred I/O from struct page
Date: Mon, 25 Apr 2022 13:27:48 +0200
Message-Id: <20220425112751.25985-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rework the fbdev deferred-I/O to not interfere with fields of struct
page. All references from deferred-I/O code to fields in struct page
are gone. The rsp state is help in a separate pageref structure.

Version 1 of this patchset was part of a larger attempt to improve
GEM SHMEM support. [1] The patches can already be merged to resolve
a long-standing issue in the fbdev code.

[1] https://lore.kernel.org/dri-devel/20220303205839.28484-1-tzimmermann@suse.de/

Thomas Zimmermann (3):
  fbdev: Put mmap for deferred I/O into drivers
  fbdev: Track deferred-I/O pages in pageref struct
  fbdev: Refactor implementation of page_mkwrite

 drivers/gpu/drm/drm_fb_helper.c        |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |   6 +-
 drivers/hid/hid-picolcd_fb.c           |   1 +
 drivers/staging/fbtft/fbtft-core.c     |   6 +-
 drivers/video/fbdev/broadsheetfb.c     |   6 +-
 drivers/video/fbdev/core/fb_defio.c    | 213 +++++++++++++++++--------
 drivers/video/fbdev/core/fbmem.c       |  19 ++-
 drivers/video/fbdev/hecubafb.c         |   1 +
 drivers/video/fbdev/hyperv_fb.c        |   6 +-
 drivers/video/fbdev/metronomefb.c      |   6 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c |  12 +-
 drivers/video/fbdev/smscufx.c          |   8 +-
 drivers/video/fbdev/ssd1307fb.c        |   1 +
 drivers/video/fbdev/udlfb.c            |   8 +-
 drivers/video/fbdev/xen-fbfront.c      |   6 +-
 include/linux/fb.h                     |  11 +-
 16 files changed, 221 insertions(+), 99 deletions(-)


base-commit: 0e7deff6446a4ba2c75f499a0bfa80cd6a15c129
-- 
2.36.0

