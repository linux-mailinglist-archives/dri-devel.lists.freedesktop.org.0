Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005615CEB1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 00:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19E46F896;
	Thu, 13 Feb 2020 23:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA086F896;
 Thu, 13 Feb 2020 23:37:23 +0000 (UTC)
Received: from localhost (unknown [104.132.1.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD39920848;
 Thu, 13 Feb 2020 23:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581637042;
 bh=2NhaDtopTzrsYDfwgU+ewFCyARPBMcMqCqGNN+M2a0U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f68ahqDTGJMeAEVm7AxsMQlIY/bAjN3nQXy35MJAvj6CiG+lmKO2vRLp++5rjPo8F
 iB2cX0EP0/8qyXB27ii0+GdrYvJoJYApVPfbsh5iNPCvT10bioSJks5fvgpNEjZgOs
 dJ4PifwuHPr6oTjULdsgTicgbabm5U9juHKaFj04=
Date: Thu, 13 Feb 2020 15:37:22 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Nouveau] [PATCH] nouveau: no need to check return value of
 debugfs_create functions
Message-ID: <20200213233722.GA3926134@kroah.com>
References: <20200209105525.GA1620170@kroah.com>
 <fdb35aa7-7e4a-c44f-94df-bd44585d4bef@nvidia.com>
 <20200213223931.GA3877216@kroah.com>
 <CAKMK7uHO0GOA2AzAh3XzWM5p7JkxuCEhz=yA=d4pbkojA4rYUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHO0GOA2AzAh3XzWM5p7JkxuCEhz=yA=d4pbkojA4rYUA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, John Hubbard <jhubbard@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 12:30:48AM +0100, Daniel Vetter wrote:
> On Thu, Feb 13, 2020 at 11:39 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Feb 13, 2020 at 02:30:09PM -0800, John Hubbard wrote:
> > > On 2/9/20 2:55 AM, Greg Kroah-Hartman wrote:
> > > > When calling debugfs functions, there is no need to ever check the
> > > > return value.  The function can work or not, but the code logic should
> > > > never do something different based on this.
> > > >
> > >
> > > Should we follow that line of reasoning further, and simply return void
> > > from the debugfs functions--rather than playing whack-a-mole with this
> > > indefinitely?
> >
> > That is what we (well I) have been doing.  Look at all of the changes
> > that have happened to include/linux/debugfs.h over the past few
> > releases.  I'm slowly winnowing down the api to make it impossible to
> > get wrong for this type of thing, and am almost there.
> >
> > DRM is the big fish left to tackle, I have submitted some patches in the
> > past, but lots more cleanup needs to be done to get them into mergable
> > shape.  I just need to find the time...
> 
> Just to avoid duplication, Wambui (cc'ed) just started working on
> this. Expect a lot more void return values and a pile of deleted code
> rsn.

Nice!

It's not duplication if I haven't started on it :)

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
