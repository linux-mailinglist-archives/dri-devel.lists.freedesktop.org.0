Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AB14A50CA
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ECF10E475;
	Mon, 31 Jan 2022 21:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3702910E451
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:36 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso300736wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YEN1WalulXHp5psdK77RRQL6YIodekwef+OLqnVkw3U=;
 b=BXlMSbrQQm45vIk8G32qbGBElJQXMtQzu20EGflvpycDYmJI5dd/dpdizoRxFh9F6A
 Q12yPGrID201GhrqQY0R0n9gUPWn9gxBXaGIedKulXZuktfd/I9uM7X8oO7R29VT8fzx
 NV157eRcr1zgYtAH7SrPMYSIVYhCix3PV5+i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YEN1WalulXHp5psdK77RRQL6YIodekwef+OLqnVkw3U=;
 b=70DierrUv5y7sYk2iLWwchc69vHdexpIf4jcbUyp9V01vvH2KLvJ8S0hWrSD/jCN5o
 CWOPJmHcCqVC/9WARMG7aScng7y+7nAkhNNieFoo813SdMZlFcxheUvlcH4baG81r8AS
 RbnUwBsQ7vjKDSMMbL1nnJif3Xsy8K0xnrh1AFMb09yZLbr/T1I+n2vhw1LEeRQni2PK
 ldMQfIgCPaPYlT03wu2Ims8gsC51/ds4JDJn9FnHb8XY6iy5aoCTvi75F9PAMVOD2zP2
 V4XTaKNp2iP4ArKLG+22kmZhWzegKerH0XoRTcaE9PBm28T6n4i2RbKGX/ZVFP877Kxf
 x3fQ==
X-Gm-Message-State: AOAM530j0TPuOnvf6sQCgPwEQemhgs24Ybp9fwVJ2W6uwwZrb9vKSSq6
 SSHczWsxgeW68lm2S6Glph2vaNGy2NsPlQ==
X-Google-Smtp-Source: ABdhPJyB1hSzGYw1XHzZs/Ba7cdy3A7msMyTjt4I8mWUBqVQeVt4E+n2y/Bz/unKl/ZTEyvt8+HEIQ==
X-Received: by 2002:a05:600c:288:: with SMTP id
 8mr28455267wmk.25.1643663194637; 
 Mon, 31 Jan 2022 13:06:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:34 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/21] some fbcon patches, mostly locking
Date: Mon, 31 Jan 2022 22:05:31 +0100
Message-Id: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This took way longer than I hoped, but well I got lost in head-scratching
locking problems. Anyway ended up typing a pile of fbcon patches. Rough
overview:

- MAINTAINER entry for fbdev core in drm-misc, with the usual group
  maintainering

- The reverts, but with a compile time option. I looked into combining
  this with the RFC from Helge, but it looked like worse than either
  approach, so I've kept mine. I think merging either is fine, no personal
  stake here on the bikeshed color.

- The real distraction, aka a bunch of cleanups and mostly locking work
  for fbcon. I managed to ditch at least one locking FIXME from fbcon.c.

The bad news that I spent a bunch more time pondering about the bigger
locking issues in fbcon.c, and I think as-is they're unfixable. We need
the threaded printk support to land first, so that we're not adding
lock_fb_info() to all printk() contexts. Because that just cannot work.

That also means we'll likely have another fbcon regression to face, in the
form of worse oops printing ability. And that one I don't think we can fix
with clever application of #ifdef, because changing locking rules at
compile time in fundamental ways is just not a very good idea.

Anyway, testing, review, feedback and all that very much welcome, as
usual.

Cheers, Daniel

Daniel Vetter (21):
  MAINTAINERS: Add entry for fbdev core
  fbcon: Resurrect fbcon accelerated scrolling code
  fbcon: Restore fbcon scrolling acceleration
  fbcon: delete a few unneeded forward decl
  fbcon: Introduce wrapper for console->fb_info lookup
  fbcon: delete delayed loading code
  fbdev/sysfs: Fix locking
  fbcon: Use delayed work for cursor
  fbcon: Replace FBCON_FLAGS_INIT with a boolean
  fb: Delete fb_info->queue
  fbcon: Extract fbcon_open/release helpers
  fbcon: Ditch error handling for con2fb_release_oldinfo
  fbcon: move more common code into fb_open()
  fbcon: use lock_fb_info in fbcon_open/release
  fbcon: Consistently protect deferred_takeover with console_lock()
  fbcon: Move console_lock for register/unlink/unregister
  fbcon: Move more code into fbcon_release
  fbcon: untangle fbcon_exit
  fbcon: Maintain a private array of fb_info
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"
  fbdev: Make registered_fb[] private to fbmem.c

 Documentation/gpu/todo.rst              |   13 +-
 MAINTAINERS                             |    6 +
 drivers/video/console/Kconfig           |   11 +
 drivers/video/fbdev/core/bitblit.c      |   16 +
 drivers/video/fbdev/core/fbcon.c        | 1072 +++++++++++++++++------
 drivers/video/fbdev/core/fbcon.h        |   67 +-
 drivers/video/fbdev/core/fbcon_ccw.c    |   28 +-
 drivers/video/fbdev/core/fbcon_cw.c     |   28 +-
 drivers/video/fbdev/core/fbcon_rotate.h |   21 +
 drivers/video/fbdev/core/fbcon_ud.c     |   37 +-
 drivers/video/fbdev/core/fbmem.c        |   35 +-
 drivers/video/fbdev/core/fbsysfs.c      |    2 +
 drivers/video/fbdev/core/tileblit.c     |   16 +
 drivers/video/fbdev/efifb.c             |   11 -
 drivers/video/fbdev/simplefb.c          |   11 -
 drivers/video/fbdev/skeletonfb.c        |   12 +-
 include/linux/fb.h                      |   10 +-
 17 files changed, 1017 insertions(+), 379 deletions(-)

-- 
2.33.0

