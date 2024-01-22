Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E365D836067
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D7E10ED62;
	Mon, 22 Jan 2024 11:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E255610ED62
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:04:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A6AACE2A30;
 Mon, 22 Jan 2024 11:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC00C433F1;
 Mon, 22 Jan 2024 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921447;
 bh=6WGGhf/BTgLnnKlxdbNPCXyuwYCekxPpegnJq4vX000=;
 h=From:To:Cc:Subject:Date:From;
 b=WuV6cvDj37O15oSjTHGuaol6bCLP78ejj/Qqj1SW7SBKckvvka5v+47PF1FXP7ypE
 z8bPKsEWzCACA0JC2QjeWs5bx4hHkyPxxpf2/rOeSXpfpDwA4EToI+diq8ckf2NpRQ
 gT3IDlQYVaCkI8ue4DJEhWrjdt4UClq0ZCqZv34eAaDCNgBrnhDszRFT/ajus6C8Pq
 IXAl0s6zN0bR928g3H2mCH46U7WbujMk9bSlgl97yrRcnon3yzPubDbl8y8xv7/78B
 DzHXQS7rE/VOJKvdmiuPb+5XWlbzGPmKIB/MRaftvwXs3cqCHcSMTXn4tikwKLJlvP
 LUNtsz4+7e+QA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 00/47] tty: vt: cleanup and documentation
Date: Mon, 22 Jan 2024 12:03:14 +0100
Message-ID: <20240122110401.7289-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Martin Hostettler <textshell@uchuujin.de>, linux-fbdev@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-parisc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Push the console code (vt.c, vt.h, console.h, ...) into a bit more
maintainable state. Especially all around consw structure and document
it.

CSI parser is also a bit cleaned up. More to follow some time in the
next round.

[v2] See respective patches for changes. The major changes:
 * vesa.h introduced
 * parameters of csi*() simplified

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: Martin Hostettler <textshell@uchuujin.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>

Jiri Slaby (SUSE) (47):

  vgacon: inline vc_scrolldelta_helper() into vgacon_scrolldelta()
  fbcon: make display_desc a static array in fbcon_startup()
  tty: vt: fix 20 vs 0x20 typo in EScsiignore
  tty: vt: expect valid vc when in tty ops
  tty: vt: pass proper pointers from tioclinux()
  tty: vt: push console lock from tioclinux() down to 2 functions
  tty: vt: pass vc_resize_user as a parameter
  tty: vt: make vc_is_sel()'s vc const
  tty: vt: define an enum for CSI+m codes
  tty: vt: use case ranges for CSI+m fg/bg colors
  tty: vt: define an enum for CSI+J codes
  tty: vt: reflow csi_J()
  use clamp() for counts in csi_?() handlers
  don't pass vc->vc_par[0] to csi_?() handlers
  tty: vt: define an enum for CSI+K codes
  tty: vt: reflow csi_K()
  tty: vt: define an enum for ascii characters
  tty: vt: remove extern from functions in selection.h
  tty: vt: make consw::con_debug_*() return void
  tty: vt: make init parameter of consw::con_init() a bool
  tty: vt: sanitize arguments of consw::con_clear()
  tty: vt: remove checks for count in consw::con_clear() implementations
  tty: vt: add con_putc() helper
  tty: vt: eliminate unneeded consw::con_putc() implementations
  tty: vt: sanitize consw::con_putc() parameters
  tty: vt: sanitize consw::con_putcs() parameters
  consoles: use if instead of switch-case in consw::con_cursor()
  fbdev/core: simplify cursor_state setting in fbcon_ops::cursor()
  tty: vt: remove CM_* constants
  tty: vt: make consw::con_switch() return a bool
  tty: vt: stop using -1 for blank mode in consw::con_blank()
  tty: vt: define a common enum for VESA blanking constants
  tty: vt: use VESA blanking constants
  tty: vt: use enum constants for VESA blanking modes
  tty: vt: make types around consw::con_blank() bool
  tty: vt: make font of consw::con_font_set() const
  tty: vt: make consw::con_font_default()'s name const
  tty: vt: change consw::con_set_origin() return type
  fbcon: remove consw::con_screen_pos()
  tty: vt: remove consw::con_screen_pos()
  tty: vt: make types of screenpos() more consistent
  fbcon: remove fbcon_getxy()
  tty: vt: remove consw::con_getxy()
  tty: vt: remove unused consw::con_flush_scrollback()
  tty: vt: document the rest of struct consw
  tty: vt: fix up kernel-doc
  Documentation: add console.rst

 Documentation/driver-api/tty/console.rst |  45 ++
 Documentation/driver-api/tty/index.rst   |   1 +
 drivers/tty/vt/selection.c               |  43 +-
 drivers/tty/vt/vt.c                      | 645 +++++++++++------------
 drivers/tty/vt/vt_ioctl.c                |   6 +-
 drivers/video/console/dummycon.c         |  38 +-
 drivers/video/console/mdacon.c           |  43 +-
 drivers/video/console/newport_con.c      |  69 +--
 drivers/video/console/sticon.c           |  79 ++-
 drivers/video/console/vgacon.c           | 152 +++---
 drivers/video/fbdev/core/bitblit.c       |  13 +-
 drivers/video/fbdev/core/fbcon.c         | 123 ++---
 drivers/video/fbdev/core/fbcon.h         |   4 +-
 drivers/video/fbdev/core/fbcon_ccw.c     |  13 +-
 drivers/video/fbdev/core/fbcon_cw.c      |  13 +-
 drivers/video/fbdev/core/fbcon_ud.c      |  13 +-
 drivers/video/fbdev/core/tileblit.c      |   4 +-
 include/linux/console.h                  | 124 +++--
 include/linux/console_struct.h           |   1 -
 include/linux/selection.h                |  56 +-
 include/linux/vt_kern.h                  |  12 +-
 include/uapi/linux/fb.h                  |   8 +-
 include/uapi/linux/vesa.h                |  18 +
 23 files changed, 755 insertions(+), 768 deletions(-)
 create mode 100644 Documentation/driver-api/tty/console.rst
 create mode 100644 include/uapi/linux/vesa.h

-- 
2.43.0

