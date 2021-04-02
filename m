Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C375C352BD3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 17:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81756E0BC;
	Fri,  2 Apr 2021 15:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823FB6E0BC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 15:37:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F7DC61057;
 Fri,  2 Apr 2021 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617377846;
 bh=ioyAbsNNoGGXzGD1/C5Xleu3NV1KP8ccBCEkZhjdmsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UkgsOfG2RhojvrNREIt+ny4CmVkZ60qQovPx1i42hvMZsTYtJHpufv9bVEL9KjskX
 oDOEU4K1q3ilfG9DXHWwRUiJXQCDltpvmgeiXJUqBVOhZEfChN0ZW6898cNZc0VuaR
 BEevPTWBaTjWDCf3gV1bLL3HR0Kjmf+BJDi1GCKs=
Date: Fri, 2 Apr 2021 17:37:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Subject: Re: [PATCH] zero-fill colormap in drivers/video/fbdev/core/fbcmap.c
Message-ID: <YGc6M4jao4ZbCqzJ@kroah.com>
References: <20210331220719.1499743-1-phil@philpotter.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331220719.1499743-1-phil@philpotter.co.uk>
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
Cc: mchehab+huawei@kernel.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 11:07:19PM +0100, Phillip Potter wrote:
> Use kzalloc() rather than kmalloc() for the dynamically allocated parts
> of the colormap in fb_alloc_cmap_gfp, to prevent a leak of random kernel
> data to userspace under certain circumstances.
> 
> Fixes a KMSAN-found infoleak bug reported by syzbot at:
> https://syzkaller.appspot.com/bug?id=741578659feabd108ad9e06696f0c1f2e69c4b6e
> 
> Reported-by: syzbot+47fa9c9c648b765305b9@syzkaller.appspotmail.com
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/video/fbdev/core/fbcmap.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Daniel, want me to take this?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
