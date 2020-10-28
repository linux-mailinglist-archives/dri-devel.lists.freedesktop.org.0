Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A42E729D129
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 17:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11CF89D57;
	Wed, 28 Oct 2020 16:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37B289D57;
 Wed, 28 Oct 2020 16:56:46 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6323247F6;
 Wed, 28 Oct 2020 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603904206;
 bh=1UbPimBuFSh1HT/2Q/S4rFlh5ySh3fARABO83TbCMe4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GuSfkoTiUL6cAkwxkXE3gYb0ScrQahwxAyg769N/kRJkxTRG2ikuaRrbvjbLp5+Tr
 NasvMMswwhW6L+Y/CLkmVOe9fcYNd8xHFBIPF9WlhNqLOnymdq8I/aEI2Vs8bpNZux
 A5MpmJDUbWJ/8dx3WDJe9NWWWKX9LPHlG3qGBQog=
Date: Wed, 28 Oct 2020 17:57:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
Message-ID: <20201028165737.GB2792004@kroah.com>
References: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
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
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 nouveau@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Peter Rosin <peda@axentia.se>, George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 05:06:00PM +0100, Daniel Vetter wrote:
> So ever since syzbot discovered fbcon, we have solid proof that it's
> full of bugs. And often the solution is to just delete code and remove
> features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
> 
> Now the problem is that most modern-ish drivers really only treat
> fbcon as an dumb kernel console until userspace takes over, and Oops
> printer for some emergencies. Looking at drm drivers and the basic
> vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> acceleration:
> 
> - nouveau, seems to be enabled by default
> - omapdrm, when a DMM remapper exists using remapper rewriting for
>   y/xpanning
> - gma500, but that is getting deleted now for the GTT remapper trick,
>   and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
>   flag, so unused (and could be deleted already I think).
> 
> No other driver supportes accelerated fbcon. And fbcon is the only
> user of this accel code (it's not exposed as uapi through ioctls),
> which means we could garbage collect fairly enormous amounts of code
> if we kill this.
> 
> Plus because syzbot only runs on virtual hardware, and none of the
> drivers for that have acceleration, we'd remove a huge gap in testing.
> And there's no other even remotely comprehensive testing aside from
> syzbot.
> 
> This patch here just disables the acceleration code by always
> redrawing when scrolling. The plan is that once this has been merged
> for well over a year in released kernels, we can start to go around
> and delete a lot of code.
> 
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Peilin Ye <yepeilin.cs@gmail.com>
> Cc: George Kennedy <george.kennedy@oracle.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Peter Rosin <peda@axentia.se>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/video/fbdev/core/fbcon.c | 38 ++++++--------------------------
>  1 file changed, 7 insertions(+), 31 deletions(-)

Nice!

But I'm with Sam, delete early :)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
