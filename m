Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649002B28BE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 23:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5926E875;
	Fri, 13 Nov 2020 22:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315696E875
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 22:46:55 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AC852222F;
 Fri, 13 Nov 2020 22:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605307614;
 bh=mrL0p+Bsz9/fxM2HbgiWUgT1fPwu1dJyQ2h/5u3OJNk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=NYryAWT6CwWzB1rPlCYpRNJsYOJjneOQ3BeqQ+F/7LBwWIzlj9y6vK7yK0Lw7JCDQ
 5C3PKfustD80DXUx38QvAHi7mtwK5Sbpszv1XDpSUIRqZjJLv38IclNxTHFqA1K+do
 XKIj8zbvM5EUHLzGnJZ9XyKa65Fk3N85HDbjw48Y=
Date: Fri, 13 Nov 2020 23:47:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peilin Ye <yepeilin.cs@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
Message-ID: <X68NFzaAuImemnqh@kroah.com>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113211633.GY401619@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 13, 2020 at 10:16:33PM +0100, Daniel Vetter wrote:
> On Thu, Nov 12, 2020 at 07:02:21AM -0500, Peilin Ye wrote:
> > Hi all,
> > 
> > This is a collection of some miscellaneous clean-ups for fbcon and some
> > console drivers. Since v2, I rebased them on linux-next, added some
> > Reviewed-by: tags from Daniel and Greg, and rewrote the commit messages as
> > suggested by Jiri. See [1] for v2 links.
> > 
> > It does the following:
> > 
> >   - Garbage collect KD_FONT_OP_COPY callbacks since we disabled it
> >     recently. Mark it as obsolete.
> >   - Delete dummy con_font_op() callbacks. (Reviewed by Greg)
> > 
> >   - Add a charcount field to our new font descriptor, `struct font_desc`.
> >     (Reviewed by Daniel)
> >   - Do not use a hard-coded 256 for built-in font charcount in
> >     console/sticore.c, use the new charcount field of `struct font_desc`
> >     instead. (Reviewed by Daniel)
> >   - Similarly, in fbcon.c, avoid using the magic negative-indexing macro,
> >     FNTCHARCNT(). Set `vc->vc_font.charcount` properly and always use that
> >     instead.
> > 
> > Daniel, hopefully [5/5] removes FNTCHARCNT() for ever, but I have not
> > tested it sufficiently yet. I remember you mentioned elsewhere that
> > "fbtest.c" is insufficient for framebuffer testing, then how should we
> > test it? The first 4 patches should be fine.
> > 
> > Please reference commit messages for more information. Thank you!
> > 
> > [1] v2 links:
> > 
> > 2/5: https://lore.kernel.org/lkml/c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com/
> > 3/5: https://lore.kernel.org/lkml/20201028060533.1206307-1-yepeilin.cs@gmail.com/
> > 4/5: https://lore.kernel.org/lkml/c38042bbf5c9777c84900d56c09f3c156b32af48.1603788512.git.yepeilin.cs@gmail.com/
> > 5/5: https://lore.kernel.org/lkml/20201028155139.1220549-1-yepeilin.cs@gmail.com/
> > 
> > Peilin Ye (5):
> >   console: Delete unused con_font_copy() callback implementations
> >   console: Delete dummy con_font_set() and con_font_default() callback implementations
> >   Fonts: Add charcount field to font_desc
> >   parisc/sticore: Avoid hard-coding built-in font charcount
> >   fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font charcount
> 
> Patches all look good to me, if Greg is ok with me applying the entire
> pile to drm-misc-next I'll do that next week.

Yes, please do!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
