Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFC57714B9
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD2F10E0BB;
	Sun,  6 Aug 2023 12:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B3710E089
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA471210E6;
 Sun,  6 Aug 2023 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691323768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W8ewKa8Cglzkg2nCJT59gTrQoPyG+rZHdmcSjnInUeU=;
 b=tqZN0xM7oimP87qoGiVQNoF0d2cxrhXqc9Zvj99XB0oxCTvJSow8Jm4awtBvIhYIpNwy/H
 PUESisjENRGh8Lzeg7rRsZSpIK02NXqqEBZxIYg7VzcrsbeR3ONioFhSHaoQXHoav3dJV4
 SYBha5xGucGmDcX1JYZDt83KD4vCduo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691323768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W8ewKa8Cglzkg2nCJT59gTrQoPyG+rZHdmcSjnInUeU=;
 b=fJAVl9rHOq7R40PdzRpjP1zSCUUag2rQsonL3UT1sor0LRjrHD8JpSVe0p/pyEqggN6YR4
 ThI/6CQ01Domf0CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB682139C4;
 Sun,  6 Aug 2023 12:09:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CbDuKHiNz2QvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, davem@davemloft.net
Subject: [PATCH 00/11] fbdev/sbus: Initializers for struct fb_ops
Date: Sun,  6 Aug 2023 13:58:51 +0200
Message-ID: <20230806120926.5368-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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
Cc: sparclinux@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add initializer macros for struct fb_ops of drivers that operate
on SBUS-based framebuffers. Also add a Kconfig token to select the
correct dependencies.

All drivers for SBUS-based framebuffers use the regular helpers
for framebuffers in I/O memory (fb_io_*() and cfb_*()). Each driver
provides its own implementation of mmap and ioctls around common
helpers from sbuslib.o. Patches 1 to 3 clean up the code a bit and
add a initializer macros that set up struct fb_ops correctly.

Patches 4 to 11 convert the drivers. Each patch slightly renames
the driver's mmap and ioctl functions so that it matches the name
pattern of sbuslib.o.

Like the other fbdev initializer macros, the SBUS helpers are
easily grep-able. In a later patch, they can be left to empty values
if the rsp. functionality, such as file I/O or console, has been
disabled.

There are no functional changes. The helpers set the defaults that
the drivers already use. The fb_io_*() functions that the initializer
macro sets are the defaults if struct fb_ops.fb_read or .fb_write are
NULL. After all drivers have been updated to set them explicitly, the
defaults can be dropped and the functions can be made optional.

Build-tested on sparc64.

Thomas Zimmermann (11):
  fbdev/sbus: Build sbuslib.o if CONFIG_FB_SBUS has been selected
  fbdev/sbus: Forward declare all necessary structures in header
  fbdev/sbus: Add initializer macros and Kconfig tokens for SBUS support
  fbdev/bw2: Use initializer macro for struct fb_ops
  fbdev/cg14: Use initializer macro for struct fb_ops
  fbdev/cg3: Use initializer macro for struct fb_ops
  fbdev/cg6: Use initializer macro for struct fb_ops
  fbdev/ffb: Use initializer macro for struct fb_ops
  fbdev/leo: Use initializer macro for struct fb_ops
  fbdev/p9100: Use initializer macro for struct fb_ops
  fbdev/tcx: Use initializer macro for struct fb_ops

 drivers/video/fbdev/Kconfig   | 30 ++++++++++++----------------
 drivers/video/fbdev/Makefile  | 17 ++++++++--------
 drivers/video/fbdev/bw2.c     | 17 +++++-----------
 drivers/video/fbdev/cg14.c    | 19 ++++++------------
 drivers/video/fbdev/cg3.c     | 17 +++++-----------
 drivers/video/fbdev/cg6.c     | 17 ++++++++--------
 drivers/video/fbdev/ffb.c     | 17 ++++++++--------
 drivers/video/fbdev/leo.c     | 19 ++++++------------
 drivers/video/fbdev/p9100.c   | 18 +++++------------
 drivers/video/fbdev/sbuslib.h | 37 ++++++++++++++++++++++++++++++++++-
 drivers/video/fbdev/tcx.c     | 20 ++++++-------------
 11 files changed, 106 insertions(+), 122 deletions(-)

-- 
2.41.0

