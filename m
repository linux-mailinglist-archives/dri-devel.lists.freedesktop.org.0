Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A53819C3
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 18:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E106E40F;
	Sat, 15 May 2021 16:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62D6A6E40F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 16:11:48 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 7E0E592009C; Sat, 15 May 2021 18:11:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 6F6E792009B;
 Sat, 15 May 2021 18:11:46 +0200 (CEST)
Date: Sat, 15 May 2021 18:11:46 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] video: fbdev: vga16fb: fix OOB write in
 vga16fb_imageblit()
In-Reply-To: <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2105151733090.3032@angie.orcam.me.uk>
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
 <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
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

> >  Overall I think it does make sense to resize the text console at any
> > time, even if the visible console (VT) chosen is in the graphics mode,
> 
> It might make sense, but only if we call the function to update the
> low-level data.
> 
> Not calling it, and then starting to randomly use the (wrong)
> geometry, and just limiting it so that it's all within the buffer -
> THAT does not make sense.
> 
> So I think your patch is fundamentally wrong. It basically says "let's
> use random stale incorrect data, but just make sure that the end
> result is still within the allocated buffer".

 I guess you mean Tetsuo-san's patch, right?  I haven't sent any in this 
discussion.

> My patch is at least conceptually sane.
> 
> An alternative would be to just remove the "vcmode != KD_GRAPHICS"
> check entirely, and always call con_resize() to update the low-level
> data, but honestly, that seems very likelty to break something very
> fundamentally, since it's not how any of fbcon has ever been tested,

 Umm, there isn't much to change as far as console data structures are 
concerned with a resize: obviously the width and the height, which affect 
the size of the character/attribute buffer, and maybe some cursor data 
such as the size and screen coordinates.

 For vgacon we have:

	if (con_is_visible(c) && !vga_is_gfx) /* who knows */
		vgacon_doresize(c, width, height);

in `vgacon_resize' already, following all the sanity checks, so the CRTC 
isn't poked at if `vga_is_gfx', exactly as we want.

 I can see fbcon does not have equivalent code and instead has relied on 
the KD_GRAPHICS check made by the caller.  Which I think has been a bug 
since fbcon's inception.  Instead I think `fbcon_resize' ought to make all 
the sanity checks I can see it does and only then check for KD_GRAPHICS 
and if so, then exit without poking at hardware.  Then upon exit from the 
gfx mode the `fb_set_var' call made from `fbcon_blank' will DTRT.

 I can try verifying the latter hypothesis, though my framebuffer setups 
(with DECstation hardware) have always been somewhat incomplete.  I do 
believe I have a MIPS fbdev X server binary somewhere to fiddle with, 
which should work with that TGA/SFB+ video adapter I mentioned before.

> Another alternative would be to just delay the resize to when vcmode
> is put back to text mode again. That sounds somewhat reasonable to me,
> but it's a pretty big thing.

 Methinks it works exactly like that already.  On exit from the graphics 
mode (a VT switch or gfx program termination) hardware is reprogrammed 
according to the console geometry previously set.  We just must not break 
it.

  Maciej
