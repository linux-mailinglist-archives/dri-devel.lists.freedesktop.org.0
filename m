Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC932A3E0D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 08:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E686E822;
	Tue,  3 Nov 2020 07:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EFA6E822;
 Tue,  3 Nov 2020 07:53:02 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0333822384;
 Tue,  3 Nov 2020 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604389982;
 bh=jBeI1ygIVS761aJfvPTmZQO2j6AowLY8HbQheRGPKH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q/kuG9HX3HDi8eIRstpuhogWBJrsS0dSsm9WMzEUw0Kz4GKe0toWL2dAv2lADkT5m
 dubEJIG44fQxQLMCO4Dd51mouK6PaIWQ5VCr4yfxSJ2/EgaKcOgytIi4LXRhC8jv41
 M4wnvs4BYPyxq24/8OYf7KKCYw4HXdFg6n/8fHvs=
Date: Tue, 3 Nov 2020 08:53:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: do not initialise global variables to 0 or
 NULL
Message-ID: <20201103075355.GA2505796@kroah.com>
References: <20201102184147.GA42288@localhost>
 <CADnq5_OnA3T_p4pTEOpoqQ=NZyso2VFoDiOHu=+h7dKOeKHq-A@mail.gmail.com>
 <c916ae88-5933-ab06-ad32-d87f00cac21f@gmail.com>
 <20201103065324.GD75930@kroah.com>
 <c6292ea5-4559-f8e5-d10a-9acb884b2ce8@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6292ea5-4559-f8e5-d10a-9acb884b2ce8@amd.com>
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
Cc: Deepak R Varma <mh12gx2825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 09:48:25PM +0100, Christian K=F6nig wrote:
> Am 03.11.20 um 07:53 schrieb Greg KH:
> > On Mon, Nov 02, 2020 at 09:06:21PM +0100, Christian K=F6nig wrote:
> > > Am 02.11.20 um 20:43 schrieb Alex Deucher:
> > > > On Mon, Nov 2, 2020 at 1:42 PM Deepak R Varma <mh12gx2825@gmail.com=
> wrote:
> > > > > Initializing global variable to 0 or NULL is not necessary and sh=
ould
> > > > > be avoided. Issue reported by checkpatch script as:
> > > > > ERROR: do not initialise globals to 0 (or NULL).
> > > > I agree that this is technically correct, but a lot of people don't
> > > > seem to know that so we get a lot of comments about this code for t=
he
> > > > variables that are not explicitly set.  Seems less confusing to
> > > > initialize them even if it not necessary.  I don't have a particula=
rly
> > > > strong opinion on it however.
> > > Agree with Alex.
> > > =

> > > Especially for the module parameters we should have a explicit init v=
alue
> > > for documentation purposes, even when it is 0.
> > Why is this one tiny driver somehow special compared to the entire rest
> > of the kernel?  (hint, it isn't...)
> =

> And it certainly shouldn't :)
> =

> > Please follow the normal coding style rules, there's no reason to ignore
> > them unless you like to constantly reject patches like this that get
> > sent to you.
> =

> Yeah, that's a rather good point.
> =

> Not a particular strong opinion on this either, but when something global=
 is
> set to 0 people usually do this to emphases that it is important that it =
is
> zero.

Again, no, that's not what we have been doing in the kernel for the past
20+ years.  If you do not set it to anything, we all know it is
important for it to be set to 0.  Otherwise we would explicitly set it
to something else.  And if we don't care, then that too doesn't matter
so we let it be 0 by not initializing it, it doesn't matter.

I think this very change is what started the whole "kernel janitor"
movement all those years ago, because it was easily proven that this
simple change saved both time and memory.

This shouldn't even be an argument we are having anymore...

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
