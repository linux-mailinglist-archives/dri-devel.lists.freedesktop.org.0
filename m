Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E7EA2BE00
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9AA10EA60;
	Fri,  7 Feb 2025 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629D410EA1B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 04:19:55 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id 0FEB0100FA; Fri,  7 Feb 2025 05:19:52 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH RESEND 00/13] fbdev: core: Deduplicate cfb/sys drawing fbops
Date: Fri,  7 Feb 2025 05:18:05 +0100
Message-Id: <20250207041818.4031-1-soci@c64.rulez.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 Feb 2025 08:32:02 +0000
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

In 68648ed1f58d98b8e8d994022e5e25331fbfe42a the drawing routines were
duplicated to have separate I/O and system memory versions.

Later the pixel reversing in 779121e9f17525769c04a00475fd85600c8c04eb
was only added to the I/O version and not to system.

That's unfortunate as reversing is not something only applicable for
I/O memory and I happen to need both I/O and system version now.

One option is to bring the system version up to date, but from the
maintenance perspective it's better to not have two versions in the
first place.

The drawing routines (based on the cfb version) were moved to header
files. These are now included in both cfb and sys modules. The memory
access and other minor differences were handled with a few macros.

The last patch adds a separate config option for the system version.

Zsolt Kajtar (13):
  fbdev: core: Copy cfbcopyarea to fb_copyarea
  fbdev: core: Make fb_copyarea generic
  fbdev: core: Use generic copyarea for as cfb_copyarea
  fbdev: core: Use generic copyarea for as sys_copyarea
  fbdev: core: Copy cfbfillrect to fb_fillrect
  fbdev: core: Make fb_fillrect generic
  fbdev: core: Use generic fillrect for as cfb_fillrect
  fbdev: core: Use generic fillrect for as sys_fillrect
  fbdev: core: Copy cfbimgblt to fb_imageblit
  fbdev: core: Make fb_imageblit generic
  fbdev: core: Use generic imageblit for as cfb_imageblit
  fbdev: core: Use generic imageblit for as sys_imageblit
  fbdev: core: Split CFB and SYS pixel reversing configuration

 drivers/video/fbdev/core/Kconfig        |  10 +-
 drivers/video/fbdev/core/cfbcopyarea.c  | 427 +-----------------------
 drivers/video/fbdev/core/cfbfillrect.c  | 363 +-------------------
 drivers/video/fbdev/core/cfbimgblt.c    | 358 +-------------------
 drivers/video/fbdev/core/fb_copyarea.h  | 421 +++++++++++++++++++++++
 drivers/video/fbdev/core/fb_draw.h      |   6 +-
 drivers/video/fbdev/core/fb_fillrect.h  | 359 ++++++++++++++++++++
 drivers/video/fbdev/core/fb_imageblit.h | 356 ++++++++++++++++++++
 drivers/video/fbdev/core/syscopyarea.c  | 358 +-------------------
 drivers/video/fbdev/core/sysfillrect.c  | 315 +----------------
 drivers/video/fbdev/core/sysimgblt.c    | 326 +-----------------
 11 files changed, 1208 insertions(+), 2091 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
 create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
 create mode 100644 drivers/video/fbdev/core/fb_imageblit.h

-- 
2.30.2

