Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42F931403C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 21:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA1B6E9EB;
	Mon,  8 Feb 2021 20:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 655 seconds by postgrey-1.36 at gabe;
 Mon, 08 Feb 2021 20:20:01 UTC
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu
 [IPv6:2a01:4f9:c010:4572::81:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6916E9EA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:20:01 +0000 (UTC)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
 by hillosipuli.retiisi.eu (Postfix) with ESMTP id B3728634C87;
 Mon,  8 Feb 2021 22:08:33 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] Add %p4cc printk modifier for V4L2 and DRM fourcc codes
Date: Mon,  8 Feb 2021 22:09:00 +0200
Message-Id: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 hverkuil@xs4all.nl, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This set adds support for %p4cc printk modifier for printing V4L2 and DRM
fourcc codes. The codes are cumbersome to print manually and by adding the
modifier, this task is saved from the V4L2 and DRM frameworks as well as
related drivers. DRM actually had it handled in a way (see 3rd patch) but
the printk modifier makes printing the format easier even there. On V4L2
side it saves quite a few lines of repeating different implementations of
printing the 4cc codes.

Further work will include converting the V4L2 drivers doing the same, as
well as converting DRM drivers from drm_get_format_name() to plain %p4cc.
I left these out from this version since individual drivers are easier
changed without dealing with multiple trees.

If DRM folks would prefer to convert drivers to %p4cc directly instead I
have no problem dropping the 3rd patch. Nearly all uses in DRM are in
printk family of functions that can readily use %p4cc instead of the
current arrangement that relies on caller-allocated temporary buffer.

Since v5:

- Added V4L2 core conversion to %p4cc, as well as change the DRM
  fourcc printing function to use %p4cc.

- Add missing checkpatch.pl checks for %p4cc modifier.

Sakari Ailus (3):
  lib/vsprintf: Add support for printing V4L2 and DRM fourccs
  v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
  drm/fourcc: Switch to %p4cc format modifier

 Documentation/core-api/printk-formats.rst | 16 +++++
 drivers/gpu/drm/drm_fourcc.c              | 16 +----
 drivers/media/v4l2-core/v4l2-ioctl.c      | 85 ++++++-----------------
 lib/test_printf.c                         | 17 +++++
 lib/vsprintf.c                            | 51 ++++++++++++++
 scripts/checkpatch.pl                     |  6 +-
 6 files changed, 112 insertions(+), 79 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
