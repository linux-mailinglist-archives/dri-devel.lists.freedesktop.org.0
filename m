Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B941E3811CA
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 22:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C29E6E239;
	Fri, 14 May 2021 20:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FBDB6E239
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 20:25:55 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id F21B192009C; Fri, 14 May 2021 22:25:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id EAA2B92009B;
 Fri, 14 May 2021 22:25:53 +0200 (CEST)
Date: Fri, 14 May 2021 22:25:53 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] video: fbdev: vga16fb: fix OOB write in
 vga16fb_imageblit()
In-Reply-To: <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Colin King <colin.king@canonical.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 May 2021, Linus Torvalds wrote:

> > Currently it is impossible to control upper limit of rows/columns values
> > based on amount of memory reserved for the graphical screen, for
> > resize_screen() calls vc->vc_sw->con_resize() only if vc->vc_mode is not
> > already KD_GRAPHICS
> 
> Honestly, the saner approach would seem to be to simply error out if
> vc_mode is KD_GRAPHICS.
> 
> Doing VT_RESIZE while in KD_GRAPHICS mode seems _very_ questionable,
> and is clearly currently very buggy.

 I haven't looked into it any further beyond tracking down (again, using 
the LMO tree) the originating change as the other fix took precedence.  It 
came with:

commit 094e0a9cdbdf1e11a28dd756a6cbd750b6303d10
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Sun Jun 1 12:07:37 2003 +0000

    Merge with Linux 2.5.51

along with framebuffer console support:

+inline int resize_screen(int currcons, int width, int height)
+{
+	/* Resizes the resolution of the display adapater */
+	int err = 0;
+
+	if (vcmode != KD_GRAPHICS && sw->con_resize)
+		err = sw->con_resize(vc_cons[currcons].d, width, height);
+	return err;
+}
+

A handler for fbcon was added shortly afterwards with:

commit bab384bdbe279efd7acc2146ef13b0b0395b2a42
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Tue Jun 3 17:04:10 2003 +0000

    Merge with Linux 2.5.59.

however vgacon didn't have a handler for it until commit 28254d439b8c 
("[PATCH] vga text console and stty cols/rows") two years later only.

 Overall I think it does make sense to resize the text console at any 
time, even if the visible console (VT) chosen is in the graphics mode, as 
my understanding (and experience at least with vgacon) is that resizing 
the console applies globally across all the VTs.  So the intent of the 
original change appears valid to me, and the choice not to reprogram the 
visible console and only store the settings for a future use if it's in 
the graphics mode correct.

 Which means any bug triggered here needs to be fixed elsewhere rather 
than by making the request fail.

 NB for fbcon the usual ioctl to resize the console is FBIOPUT_VSCREENINFO 
rather than VT_RESIZEX; fbset(8) uses it, and I actually experimented with 
it and a TGA-like (SFB+) framebuffer when at my lab last time, as Linux is 
kind enough to know how to fiddle with its clockchip.  It works just fine.

  Maciej
