Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7133765B31A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 15:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1900810E343;
	Mon,  2 Jan 2023 14:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Mon, 02 Jan 2023 14:03:48 UTC
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BB510E343
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 14:03:48 +0000 (UTC)
Received: from handsomejack.molgen.mpg.de (handsomejack.molgen.mpg.de
 [141.14.17.248])
 by mx.molgen.mpg.de (Postfix) with ESMTP id 5E15B60027FC1;
 Mon,  2 Jan 2023 14:57:57 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Helge Deller <deller@gmx.de>,
	"Z. Liu" <liuzx@knownsec.com>
Subject: [PATCH] matroxfb: G200eW: Increase max memory from 1 MB to 16 MB
Date: Mon,  2 Jan 2023 14:57:30 +0100
Message-Id: <20230102135731.6487-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-fbdev@vger.kernel.org,
 Rich Felker <dalias@libc.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, it+linux-fbdev@molgen.mpg.de,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 62d89a7d49af ("video: fbdev: matroxfb: set maxvram of vbG200eW to
the same as vbG200 to avoid black screen") accidently decreases the
maximum memory size for the Matrox G200eW (102b:0532) from 8 MB to 1 MB
by missing one zero. This caused the driver initialization to fail with
the messages below, as the minimum required VRAM size is 2 MB:

     [    9.436420] matroxfb: Matrox MGA-G200eW (PCI) detected
     [    9.444502] matroxfb: cannot determine memory size
     [    9.449316] matroxfb: probe of 0000:0a:03.0 failed with error -1

So, add the missing 0 to make it the intended 16 MB. Successfully tested on
the Dell PowerEdge R910/0KYD3D, BIOS 2.10.0 08/29/2013, that the warning is
gone.

While at it, add a leading 0 to the maxdisplayable entry, so it’s aligned
properly. The value could probably also be increased from 8 MB to 16 MB, as
the G200 uses the same values, but I have not checked any datasheet.

Note, matroxfb is obsolete and superseded by the maintained DRM driver
mga200, which is used by default on most systems where both drivers are
available. Therefore, on most systems it was only a cosmetic issue.

Fixes: 62d89a7d49af ("video: fbdev: matroxfb: set maxvram of vbG200eW to the same as vbG200 to avoid black screen")
Link: https://lore.kernel.org/linux-fbdev/972999d3-b75d-5680-fcef-6e6905c52ac5@suse.de/T/#mb6953a9995ebd18acc8552f99d6db39787aec775
Cc: it+linux-fbdev@molgen.mpg.de
Cc: Z. Liu <liuzx@knownsec.com>
Cc: Rich Felker <dalias@libc.org>
Cc: stable@vger.kernel.org
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/video/fbdev/matrox/matroxfb_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 0d3cee7ae7268..a043a737ea9f7 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -1378,8 +1378,8 @@ static struct video_board vbG200 = {
 	.lowlevel = &matrox_G100
 };
 static struct video_board vbG200eW = {
-	.maxvram = 0x100000,
-	.maxdisplayable = 0x800000,
+	.maxvram = 0x1000000,
+	.maxdisplayable = 0x0800000,
 	.accelID = FB_ACCEL_MATROX_MGAG200,
 	.lowlevel = &matrox_G100
 };
-- 
2.39.0

