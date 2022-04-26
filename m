Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F279750FC74
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5272B10F376;
	Tue, 26 Apr 2022 12:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C487F10F37F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:04:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 566921F746;
 Tue, 26 Apr 2022 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650974641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TiqGeTU88O5qp5VtpuiGdqw539o9k1ftULZNwBcfinY=;
 b=qXWZbV808igFOsDhN0QBTah36pdhAiLkaH47E8b06lVji+W7CYJuWoX16iO38T/B3NQNyd
 nc+FeVP5HTe7eMkOAVA7EB8B16Tn1u5Lw4Zz7MJMyK5gtea6gf+PWfN6M6IPQ8vkRJL/Cd
 LemEgyh8qRgYWXCAH6t4zLs1uQZy+ZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650974641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TiqGeTU88O5qp5VtpuiGdqw539o9k1ftULZNwBcfinY=;
 b=hj0hTrOY9qNy+kYnLlhcy+5Sw+Bj6vN+x8evDns7szzmgI7IDooWr35qKGX93QvykVEVFR
 zwdaKFUus6mpAdAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 294C213223;
 Tue, 26 Apr 2022 12:04:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q/XiCLHfZ2KqBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Apr 2022 12:04:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 0/5] fbdev: Decouple deferred I/O from struct page
Date: Tue, 26 Apr 2022 14:03:54 +0200
Message-Id: <20220426120359.17437-1-tzimmermann@suse.de>
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

v3:
	* rename pagelist to pagereflist (Sam)
	* use pageref->offset over page->index (Javier)
v2:
	* split off from a larger patchset [1]

[1] https://lore.kernel.org/dri-devel/20220303205839.28484-1-tzimmermann@suse.de/

Thomas Zimmermann (5):
  fbdev: Put mmap for deferred I/O into drivers
  fbdev: Track deferred-I/O pages in pageref struct
  fbdev: Refactor implementation of page_mkwrite
  fbdev: Rename pagelist to pagereflist for deferred I/O
  fbdev: Use pageref offset for deferred-I/O writeback

 drivers/gpu/drm/drm_fb_helper.c        |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  10 +-
 drivers/hid/hid-picolcd_fb.c           |   3 +-
 drivers/staging/fbtft/fbtft-core.c     |  21 ++-
 drivers/video/fbdev/broadsheetfb.c     |  27 ++--
 drivers/video/fbdev/core/fb_defio.c    | 212 +++++++++++++++++--------
 drivers/video/fbdev/core/fbmem.c       |  21 +--
 drivers/video/fbdev/hecubafb.c         |   4 +-
 drivers/video/fbdev/hyperv_fb.c        |  10 +-
 drivers/video/fbdev/metronomefb.c      |  23 ++-
 drivers/video/fbdev/sh_mobile_lcdcfb.c |  27 ++--
 drivers/video/fbdev/smscufx.c          |  13 +-
 drivers/video/fbdev/ssd1307fb.c        |   4 +-
 drivers/video/fbdev/udlfb.c            |  18 +--
 drivers/video/fbdev/xen-fbfront.c      |  10 +-
 include/drm/drm_fb_helper.h            |   3 +-
 include/linux/fb.h                     |  17 +-
 17 files changed, 264 insertions(+), 174 deletions(-)


base-commit: 0e7deff6446a4ba2c75f499a0bfa80cd6a15c129
-- 
2.36.0

