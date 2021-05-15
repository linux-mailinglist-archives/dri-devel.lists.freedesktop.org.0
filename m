Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB53819E1
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 18:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9326E418;
	Sat, 15 May 2021 16:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5F5A6E418
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 16:32:59 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 93FDE92009C; Sat, 15 May 2021 18:32:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 8C64692009B;
 Sat, 15 May 2021 18:32:58 +0200 (CEST)
Date: Sat, 15 May 2021 18:32:58 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH v2] tty: vt: always invoke vc->vc_sw->con_resize callback
In-Reply-To: <alpine.DEB.2.21.2105151815040.3032@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2105151828380.3032@angie.orcam.me.uk>
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
 <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
 <CAHk-=wjkVAjfWrmmJnJe1_MriK9gezWCew_MU=MbQNzHbGopsQ@mail.gmail.com>
 <97f1d292-c3a8-f4d6-0651-b4f5571ecb72@i-love.sakura.ne.jp>
 <alpine.DEB.2.21.2105151815040.3032@angie.orcam.me.uk>
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
 Jiri Slaby <jirislaby@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 15 May 2021, Maciej W. Rozycki wrote:

> On Sat, 15 May 2021, Tetsuo Handa wrote:
> 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index 3406067985b1..22bb3892f6bd 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -2019,7 +2019,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
> >  			return -EINVAL;
> >  
> >  		pr_debug("resize now %ix%i\n", var.xres, var.yres);
> > -		if (con_is_visible(vc)) {
> > +		if (con_is_visible(vc) && vc->vc_mode == KD_TEXT) {
> >  			var.activate = FB_ACTIVATE_NOW |
> >  				FB_ACTIVATE_FORCE;
> >  			fb_set_var(info, &var);
> 
>  LGTM, although I'll yet try to verify it with hardware.  But it'll have 
> to wait another week or so as I'm currently away from my lab and this 
> requires physical presence.

 NB I suggest that you request your change to be backported, i.e. post v3 
with:

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org # v2.6.12+

  Maciej
