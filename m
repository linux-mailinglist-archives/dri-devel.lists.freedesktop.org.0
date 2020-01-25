Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1341149FAD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A8A6EA3E;
	Mon, 27 Jan 2020 08:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 637 seconds by postgrey-1.36 at gabe;
 Sat, 25 Jan 2020 20:05:50 UTC
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5910D6E22C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 20:05:50 +0000 (UTC)
Received: from dalias by brightrain.aerifal.cx with local (Exim 3.15 #2)
 id 1ivRWN-0004pl-00; Sat, 25 Jan 2020 19:55:07 +0000
Date: Sat, 25 Jan 2020 14:55:06 -0500
From: Rich Felker <dalias@libc.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] matroxfb: add Matrox MGA-G200eW board support
Message-ID: <20200125195506.GA16638@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Rich Felker <dalias@libc.org>
--
I've had this lying around a while and figure I should send it
upsteam; it's needed to support the onboard video on my Spectre-free
Atom S1260 server board.

---
 drivers/video/fbdev/matrox/matroxfb_base.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 1a555f70923a..ff344313860c 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -1376,6 +1376,12 @@ static struct video_board vbG200 = {
 	.accelID = FB_ACCEL_MATROX_MGAG200,
 	.lowlevel = &matrox_G100
 };
+static struct video_board vbG200eW = {
+	.maxvram = 0x800000,
+	.maxdisplayable = 0x800000,
+	.accelID = FB_ACCEL_MATROX_MGAG200,
+	.lowlevel = &matrox_G100
+};
 /* from doc it looks like that accelerator can draw only to low 16MB :-( Direct accesses & displaying are OK for
    whole 32MB */
 static struct video_board vbG400 = {
@@ -1494,6 +1500,13 @@ static struct board {
 		MGA_G200,
 		&vbG200,
 		"MGA-G200 (PCI)"},
+	{PCI_VENDOR_ID_MATROX,	0x0532,	0xFF,
+		0,			0,
+		DEVF_G200,
+		250000,
+		MGA_G200,
+		&vbG200eW,
+		"MGA-G200eW (PCI)"},
 	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_AGP,	0xFF,
 		PCI_SS_VENDOR_ID_MATROX,	PCI_SS_ID_MATROX_GENERIC,
 		DEVF_G200,
@@ -2136,6 +2149,8 @@ static const struct pci_device_id matroxfb_devices[] = {
 		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
 	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_PCI,
 		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
+	{PCI_VENDOR_ID_MATROX,	0x0532,
+		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
 	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_AGP,
 		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
 	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G400,
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
