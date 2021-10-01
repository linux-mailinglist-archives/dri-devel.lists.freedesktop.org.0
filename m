Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97141EC84
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 13:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF326ECD4;
	Fri,  1 Oct 2021 11:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273CF6ECD4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 11:49:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 02CF11F4552D
Date: Fri, 1 Oct 2021 07:48:53 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panfrost: Add PANFROST_BO_NO{READ,WRITE} flags
Message-ID: <YVb1pdjRGY9ytuH1@maud>
References: <20210930184723.1482426-1-boris.brezillon@collabora.com>
 <YVYMWdQS/EMc23IF@maud> <20210930214030.19f63eac@collabora.com>
 <YVY2O48ckub2fc5W@maud> <20211001084740.051e9d80@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001084740.051e9d80@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > > > +	/* Executable implies readable */
> > > > > +	if ((args->flags & PANFROST_BO_NOREAD) &&
> > > > > +	    !(args->flags & PANFROST_BO_NOEXEC))
> > > > > +		return -EINVAL;    
> > > > 
> > > > Generally, executable also implies not-writeable. Should we check that?  
> > > 
> > > We were allowing it until now, so doing that would break the backward
> > > compat, unfortunately.  
> > 
> > Not a problem if you only enforce this starting with the appropriate
> > UABI version, but...
> 
> I still don't see how that solves the <old-userspace,new-kernel>
> situation, since old-userspace doesn't know about the new UABI, and
> there's no version field on the CREATE_BO ioctl() to let the kernel
> know about the UABI used by this userspace program. I mean, we could
> add one, or add a new PANFROST_BO_EXTENDED_FLAGS flag to enforce this
> 'noexec implies nowrite' behavior, but is it really simpler than
> explicitly passing the NOWRITE flag when NOEXEC is passed?

For some reason I thought the ABI version was negotiated (it is in
kbase). Don't worry about it.

That commit is

	Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
