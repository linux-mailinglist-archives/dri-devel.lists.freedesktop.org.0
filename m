Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B54862B2D1B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 13:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182426E90C;
	Sat, 14 Nov 2020 12:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5F46E90C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 12:21:27 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DAB920575;
 Sat, 14 Nov 2020 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605356487;
 bh=9vSUSN0CM1/We+sn3nEaPCpRvVT/nTe4ROGxQBfY8Y4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aNuqAjxYIHrOxEGvHyKyMowzratGfMsMVTmaeWALxTpLR0Q2r/fXlHY1dJOt/Uc2N
 pZWqlvlVe71Yz5EwsbpOiFGRYmTy0ypsbXz9h0A/RnvYmoUryo6XA5BPND6NX7xemG
 f4vGRu3kzI9xe5/bUuYAhB8HMrFF5yaFeXjwMjFM=
Date: Sat, 14 Nov 2020 13:22:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
Message-ID: <X6/L/lE2pA7csBwd@kroah.com>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
 <X68NFzaAuImemnqh@kroah.com> <20201114081021.GA11811@PWN>
 <X6/K/S9V7rj2hI5p@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X6/K/S9V7rj2hI5p@kroah.com>
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
Cc: dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 01:18:06PM +0100, Greg Kroah-Hartman wrote:
> On Sat, Nov 14, 2020 at 03:10:21AM -0500, Peilin Ye wrote:
> > > On Fri, Nov 13, 2020 at 10:16:33PM +0100, Daniel Vetter wrote:
> > > > On Thu, Nov 12, 2020 at 07:02:21AM -0500, Peilin Ye wrote:
> > > > > Peilin Ye (5):
> > > > >   console: Delete unused con_font_copy() callback implementations
> > > > >   console: Delete dummy con_font_set() and con_font_default() callback implementations
> > > > >   Fonts: Add charcount field to font_desc
> > > > >   parisc/sticore: Avoid hard-coding built-in font charcount
> > > > >   fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font charcount
> > > > 
> > > > Patches all look good to me, if Greg is ok with me applying the entire
> > > > pile to drm-misc-next I'll do that next week.
> > 
> > On Fri, Nov 13, 2020 at 11:47:51PM +0100, Greg Kroah-Hartman wrote:
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > Thanks for reviewing!  Questions about the last patch [5/5] though, it
> > depends on the following assumption:
> > 
> > """
> > For each console `idx`, `vc_cons[idx].d->vc_font.data` and
> > `fb_display[idx].fontdata` always point to the same buffer.
> > """
> > 
> > Is this true?  I think it is true by grepping for `fontdata`.  I also
> > noticed that fbcon.c is using `vc->vc_font.data` and `p->fontdata`
> > interchangeably, see fbcon_get_requirement():
> > 
> > 		vc = vc_cons[fg_console].d;
> > 		[...]
> > 			p = &fb_display[fg_console];
> > 			caps->x = 1 << (vc->vc_font.width - 1);
> > 					^^^^^^^^^^^
> > 			caps->y = 1 << (vc->vc_font.height - 1);
> > 					^^^^^^^^^^^
> > 			caps->len = (p->userfont) ?
> > 				FNTCHARCNT(p->fontdata) : 256;
> > 					   ^^^^^^^^^^^
> > 
> > If it is true, then what is the point of using `fontdata` in `struct
> > fbcon_display`?  Just for the `userfont` flag?  Should we delete
> > `fontdata`, when we no longer need the `userfont` flag?
> 
> Yes, after a quick look, I think your analysis here is correct.  So if
> you can delete that, it would be nice if possible.
> 
> > In this sense I think [5/5] needs more testing.  Do we have test files
> > for fbcon, or should I try to write some tests from scratch?
> 
> I don't know of any direct tests, I usually just booted into that mode
> and saw if everything looked like it did before.  There must be some
> tool that you can use to change the current font, as it seems to happen
> at boot time on some distros.  I can't remember what it's called at the
> moment...

Ah, here's a hint:
	https://wiki.archlinux.org/index.php/Linux_console#Fonts

The setfont tool should help you out here.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
