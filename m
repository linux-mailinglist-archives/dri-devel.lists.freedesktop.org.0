Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0F623BACF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 14:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B458B6E1B9;
	Tue,  4 Aug 2020 12:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10966E1B9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 12:58:50 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 362202075A;
 Tue,  4 Aug 2020 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596545930;
 bh=5GcDtKxhBv4ldUHvEV1E+xCRSF0zyL6ugmx1l+H+odY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UD6lC1ixvriONP18vGEUxhXmLbyj9SDymf5tE5y6s4XvcPhmj++RndYdRtMCbvHtJ
 lt6CzbrJsFBSnZJlHWxSA46j8NgHvlTiVoOc6P6NGCnA7OIJjSeiGm9W1NALcIi+Ae
 /fIt1MqW/euxPAu0TGCDEdlxn7M0FkzLSgdkyMHY=
Date: Tue, 4 Aug 2020 14:58:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] vt: defer kfree() of vc_screenbuf in vc_do_resize()
Message-ID: <20200804125831.GA221149@kroah.com>
References: <1596034621-4714-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <0c9d8003-ba3f-8f2d-7c5a-56c5ca7db750@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c9d8003-ba3f-8f2d-7c5a-56c5ca7db750@i-love.sakura.ne.jp>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot <syzbot+9116ecc1978ca3a12f43@syzkaller.appspotmail.com>,
 Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 08:15:43PM +0900, Tetsuo Handa wrote:
> Do you think this approach is acceptable? Or, do we need to modify set_origin() ?
> 
> On 2020/07/29 23:57, Tetsuo Handa wrote:
> > syzbot is reporting UAF bug in set_origin() from vc_do_resize() [1], for
> > vc_do_resize() calls kfree(vc->vc_screenbuf) before calling set_origin().
> > 
> > Unfortunately, in set_origin(), vc->vc_sw->con_set_origin() might access
> > vc->vc_pos when scroll is involved in order to manipulate cursor, but
> > vc->vc_pos refers already released vc->vc_screenbuf until vc->vc_pos gets
> > updated based on the result of vc->vc_sw->con_set_origin().
> > 
> > Preserving old buffer and tolerating outdated vc members until set_origin()
> > completes would be easier than preventing vc->vc_sw->con_set_origin() from
> > accessing outdated vc members.
> > 
> > [1] https://syzkaller.appspot.com/bug?id=6649da2081e2ebdc65c0642c214b27fe91099db3
> > 
> > Reported-by: syzbot <syzbot+9116ecc1978ca3a12f43@syzkaller.appspotmail.com>
> > Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > ---
> >  drivers/tty/vt/vt.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> > index 42d8c67..c9ee8e9 100644
> > --- a/drivers/tty/vt/vt.c
> > +++ b/drivers/tty/vt/vt.c
> > @@ -1196,7 +1196,7 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
> >  	unsigned int old_rows, old_row_size, first_copied_row;
> >  	unsigned int new_cols, new_rows, new_row_size, new_screen_size;
> >  	unsigned int user;
> > -	unsigned short *newscreen;
> > +	unsigned short *oldscreen, *newscreen;
> >  	struct uni_screen *new_uniscr = NULL;
> >  
> >  	WARN_CONSOLE_UNLOCKED();
> > @@ -1294,10 +1294,11 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
> >  	if (new_scr_end > new_origin)
> >  		scr_memsetw((void *)new_origin, vc->vc_video_erase_char,
> >  			    new_scr_end - new_origin);
> > -	kfree(vc->vc_screenbuf);
> > +	oldscreen = vc->vc_screenbuf;
> >  	vc->vc_screenbuf = newscreen;
> >  	vc->vc_screenbuf_size = new_screen_size;
> >  	set_origin(vc);
> > +	kfree(oldscreen);
> >  
> >  	/* do part of a reset_terminal() */
> >  	vc->vc_top = 0;

I think what you have here is fine, as cleaning up set_orgin() might be
hard to do at this point in time.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
