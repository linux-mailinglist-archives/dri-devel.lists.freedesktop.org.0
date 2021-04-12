Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C69F135C7A2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 15:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CED16E59F;
	Mon, 12 Apr 2021 13:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 56783 seconds by postgrey-1.36 at gabe;
 Mon, 12 Apr 2021 13:30:18 UTC
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9EE116E59F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 13:30:18 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 6059092009C; Mon, 12 Apr 2021 15:30:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 5A1BE92009B;
 Mon, 12 Apr 2021 15:30:16 +0200 (CEST)
Date: Mon, 12 Apr 2021 15:30:16 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] vt_ioctl: make VT_RESIZEX behave like VT_RESIZE
In-Reply-To: <CAKMK7uH4+SGr0=FDBiTsMg+iE1ztiuP2QBxsgcvHNhd38ocndg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2104121433040.65251@angie.orcam.me.uk>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
 <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
 <20200927092701.GA1037755@PWN>
 <4933b81b-9b1a-355b-df0e-9b31e8280ab9@i-love.sakura.ne.jp>
 <20200928175956.GF24673@neutronstar.dyndns.org>
 <100dfd3f-3415-80ae-a6cf-30d15f7ca49f@i-love.sakura.ne.jp>
 <20200929105203.GG24673@neutronstar.dyndns.org>
 <20200929165657.GS438822@phenom.ffwll.local>
 <20200929171040.GB1351851@kroah.com>
 <alpine.DEB.2.21.2104112250310.65251@angie.orcam.me.uk>
 <CAHk-=wgF8e5i+9eeGu=CgWAagTPv-9UbkG7B6bR5jDe6kkkFZQ@mail.gmail.com>
 <CAKMK7uH4+SGr0=FDBiTsMg+iE1ztiuP2QBxsgcvHNhd38ocndg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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
Cc: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg KH <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Martin Hostettler <textshell@uchuujin.de>,
 George Kennedy <george.kennedy@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021, Daniel Vetter wrote:

> > Note that it's entirely possible that things continue to work well
> > despite this warning. It's unclear to me from your email if you
> > actually see any difference (and apparently you're not able to see it
> > right now due to not being close to the machine).
> 
> Original search didn't turn up any users of VT_RESIZEX, this is the
> first. And looking at the source code I think we could outright remove
> support for VT_RESIZEX (but make it silent) and everything should keep
> working:
> 
>         /*
>          * ALWAYS do a VT_RESIZE, even if we already did a VT_RESIZEX
> on a 1.3.3 or higher kernel,
>          * until those kernel programmers make this unambiguous
>          */
> 
>        if (do_VT_RESIZE(curr_textmode->cols, curr_textmode->rows,
> resize1x1)) sresize=TRUE;
> 
>        if (check_kernel_version(1,3,3, "VT_RESIZEX"))
>          {
>            /*
>             * VDisplay must de divided by 2 for DoubleScan modes,
>             * or VT_RESIZEX will fail -- until someone fixes the kernel
>             * so it understands about doublescan modes.
>             */
>            if (do_VT_RESIZEX(curr_textmode->cols,
>                              curr_textmode->rows,
>                              curr_textmode->VDisplay /
> (MOFLG_ISSET(curr_textmode, ATTR_DOUBLESCAN) ? 2 : 1),
>                              curr_textmode->FontHeight,
>                              curr_textmode->HDisplay/8*curr_textmode->FontWidth,
>                              curr_textmode->FontWidth, resize1x1)) sresize=TRUE;
>          }
> 
> The functions are just straightforward wrappers. There's also no cvs
> repo, changelog or old releases before 2000 that would shed some light
> on why this code even exists.

 I did some archaeology then, using a local copy of the linux-mips.org 
Linux tree that has historic information imported from the old oss.sgi.com 
MIPS/Linux CVS repo.  According to that the ioctl was added with or 
shortly before 2.1.14:

commit beb116954b9b7f3bb56412b2494b562f02b864b1
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Tue Jan 7 02:33:00 1997 +0000

    Import of Linux/MIPS 2.1.14

and, importantly, it was used to set some parameters: 

		if ( vlin )
		  video_scan_lines = vlin;
		if ( clin )
		  video_font_height = clin;

used by `con_adjust_height' in drivers/char/vga.c: `video_scan_lines' to 
set the vertical display limit (so that it is a whole multiple of the new 
font height) and `video_font_height' to set the cursor scan lines in the 
CRTC.  The function was used by the PIO_FONTX and PIO_FONTRESET VT ioctls 
at that point.

 That code was moved to `vgacon_adjust_height' in drivers/video/vgacon.c 
and then drivers/video/console/vgacon.c.  The code is still there, serving 
the KDFONTOP ioctl.

 With:

commit 9736a3546de7b6a2b16ad93539e4b3ac72b385bb
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Thu Jun 5 10:06:35 2003 +0000

    Merge with Linux 2.5.66.

the parameters were moved into `struct vc_data':

 		if (vlin)
-			video_scan_lines = vlin;
+			vc->vc_scan_lines = vlin;
 		if (clin)
-			video_font_height = clin;
+			vc->vc_font.height = clin;

and this piece of code to set them only removed with the change discussed 
here.

 So without even looking at the VT, which I'll surely get to eventually, I 
conclude this change regresses font resizing (KD_FONT_OP_SET) once a new 
resolution has been set with svgatextmode.  I think this change needs to 
be reverted, especially as the problematic PIO_FONT ioctl referred has 
been since removed with commit ff2047fb755d ("vt: drop old FONT ioctls").

  Maciej
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
