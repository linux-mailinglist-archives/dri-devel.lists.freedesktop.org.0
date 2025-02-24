Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF72A430D8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 00:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C6110E08A;
	Mon, 24 Feb 2025 23:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB44B10E038
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 21:03:07 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id C8C62100CF; Mon, 24 Feb 2025 22:02:58 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH 0/1] Refactoring of framebuffer drawing routines
Date: Mon, 24 Feb 2025 21:59:07 +0100
Message-Id: <20250224205908.26336-1-soci@c64.rulez.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 24 Feb 2025 23:28:54 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Proper refactoring of the framebuffer drawing routines. This time it's
not only the merging of duplicated code. It isn't half finished either
so the various combinations of foreign endianness, pixel reversing, bits
per pixel, cpu word sizes and byte order should work.

Added myself to look after this code. Based on the time spent on proving
it I don't expect a busy inbox. Famous last words.

Zsolt Kajtar (1):
  Refactoring of framebuffer drawing routines

 MAINTAINERS                             |  16 +
 drivers/video/fbdev/core/Kconfig        |  10 +-
 drivers/video/fbdev/core/cfbcopyarea.c  | 428 +-------------------
 drivers/video/fbdev/core/cfbfillrect.c  | 362 +----------------
 drivers/video/fbdev/core/cfbimgblt.c    | 357 +----------------
 drivers/video/fbdev/core/cfbmem.h       |  43 ++
 drivers/video/fbdev/core/fb_copyarea.h  | 405 +++++++++++++++++++
 drivers/video/fbdev/core/fb_draw.h      | 274 ++++++-------
 drivers/video/fbdev/core/fb_fillrect.h  | 280 ++++++++++++++
 drivers/video/fbdev/core/fb_imageblit.h | 495 ++++++++++++++++++++++++
 drivers/video/fbdev/core/syscopyarea.c  | 369 +-----------------
 drivers/video/fbdev/core/sysfillrect.c  | 324 +---------------
 drivers/video/fbdev/core/sysimgblt.c    | 333 +---------------
 drivers/video/fbdev/core/sysmem.h       |  39 ++
 14 files changed, 1480 insertions(+), 2255 deletions(-)
 create mode 100644 drivers/video/fbdev/core/cfbmem.h
 create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
 create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
 create mode 100644 drivers/video/fbdev/core/fb_imageblit.h
 create mode 100644 drivers/video/fbdev/core/sysmem.h

-- 
2.30.2

