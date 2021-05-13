Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F8037F074
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 02:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AC16E5B0;
	Thu, 13 May 2021 00:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02F116E5B0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 00:37:22 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id E2D6E92009E; Thu, 13 May 2021 02:37:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id DB98492009C;
 Thu, 13 May 2021 02:37:19 +0200 (CEST)
Date: Thu, 13 May 2021 02:37:19 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 1/3] vgacon: Record video mode changes with VT_RESIZEX
In-Reply-To: <alpine.DEB.2.21.2105090548170.2587@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2105122255280.3032@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105090548170.2587@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-fbdev@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Hostettler <textshell@uchuujin.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix an issue with VGA console font size changes made after the initial 
video text mode has been changed with a user tool like `svgatextmode' 
calling the VT_RESIZEX ioctl.  As it stands in that case the original 
screen geometry continues being used to validate further VT resizing.

Consequently when the video adapter is firstly reprogrammed from the 
original say 80x25 text mode using a 9x16 character cell (720x400 pixel 
resolution) to say 80x37 text mode and the same character cell (720x592 
pixel resolution), and secondly the CRTC character cell updated to 9x8 
(by loading a suitable font with the KD_FONT_OP_SET request of the 
KDFONTOP ioctl), the VT geometry does not get further updated from 80x37 
and only upper half of the screen is used for the VT, with the lower 
half showing rubbish corresponding to whatever happens to be there in 
the video memory that maps to that part of the screen.  Of course the 
proportions change according to text mode geometries and font sizes 
chosen.

Address the problem then, by updating the text mode geometry defaults 
rather than checking against them whenever the VT is resized via a user 
ioctl.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: e400b6ec4ede ("vt/vgacon: Check if screen resize request comes from userspace")
Cc: stable@vger.kernel.org # v2.6.24+
---
 drivers/video/console/vgacon.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

Index: linux-macro-ide/drivers/video/console/vgacon.c
===================================================================
--- linux-macro-ide.orig/drivers/video/console/vgacon.c
+++ linux-macro-ide/drivers/video/console/vgacon.c
@@ -1089,12 +1089,20 @@ static int vgacon_resize(struct vc_data
 	if ((width << 1) * height > vga_vram_size)
 		return -EINVAL;
 
+	if (user) {
+		/*
+		 * Ho ho!  Someone (svgatextmode, eh?) may have reprogrammed
+		 * the video mode!  Set the new defaults then and go away.
+		 */
+		screen_info.orig_video_cols = width;
+		screen_info.orig_video_lines = height;
+		vga_default_font_height = c->vc_font.height;
+		return 0;
+	}
 	if (width % 2 || width > screen_info.orig_video_cols ||
 	    height > (screen_info.orig_video_lines * vga_default_font_height)/
 	    c->vc_font.height)
-		/* let svgatextmode tinker with video timings and
-		   return success */
-		return (user) ? 0 : -EINVAL;
+		return -EINVAL;
 
 	if (con_is_visible(c) && !vga_is_gfx) /* who knows */
 		vgacon_doresize(c, width, height);
