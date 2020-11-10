Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84922AD955
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 15:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007FD89B96;
	Tue, 10 Nov 2020 14:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461589B96
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:55:11 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1D4D206F1;
 Tue, 10 Nov 2020 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605020111;
 bh=0XUvZ13Bc4jYJLdDib1eplfwfa0ykUyr5siWllJlDxI=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=T9dYpwHedLN0/xBVzknsB3FFIXxHWXt4zw9Lp4RzO0B12/mwzi32dOQucaEbS98Jq
 dK7FXr2G9s/qi8MtRJU6sReJvWPi2q+qibIIz4v1piYAYJ0FhMMwSWlmP0jGnopNO3
 077kzC1tBirwF+ab2QKVfAzoTVsTBy0FYNQBp0jU=
Date: Tue, 10 Nov 2020 15:56:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peilin Ye <yepeilin.cs@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 George Kennedy <george.kennedy@oracle.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/2] console: Remove dummy con_font_op() callback
 implementations
Message-ID: <X6qqCO2nqq7C2eoi@kroah.com>
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
 <20201106105058.GA2801856@kroah.com>
 <20201110124946.GF401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110124946.GF401619@phenom.ffwll.local>
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

On Tue, Nov 10, 2020 at 01:49:46PM +0100, Daniel Vetter wrote:
> On Fri, Nov 06, 2020 at 11:50:58AM +0100, Greg Kroah-Hartman wrote:
> > On Sat, Oct 31, 2020 at 03:24:41AM -0400, Peilin Ye wrote:
> > > `struct console_font` is a UAPI structure, thus ideally should not be
> > > used for kernel internal abstraction. Remove some dummy .con_font_set,
> > > .con_font_default and .con_font_copy `struct consw` callback
> > > implementations, to make it cleaner.
> > > 
> > > Patch "fbcon: Prevent global-out-of-bounds read in fbcon_copy_font()"
> > > depends on this patch, so Cc: stable.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > > ---
> > > Context: https://lore.kernel.org/lkml/CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com/
> > > 
> > >  drivers/usb/misc/sisusbvga/sisusb_con.c | 21 ---------------------
> > >  drivers/video/console/dummycon.c        | 20 --------------------
> > >  2 files changed, 41 deletions(-)
> > 
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Peilin, can you pls resend this together with all the other pending
> patches from you? I think that's better than me trying to cherry-pick the
> bits we decided to keep from random places.
> 
> Greg, ok if I just pull these in through drm-misc-next? It's a pretty bad
> hairball anyway and that avoids the tree coordination issues. Only thing
> that might get in the way is the vt font_copy removal, but that's in -rc3
> so easy to backmerge.

Yes please take them all!

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
