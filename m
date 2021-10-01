Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B17D41E7C3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 08:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C246ECEE;
	Fri,  1 Oct 2021 06:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B809E6ECEE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 06:47:45 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3853D1F452EB;
 Fri,  1 Oct 2021 07:47:44 +0100 (BST)
Date: Fri, 1 Oct 2021 08:47:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso
 <tomeu.vizoso@collabora.com>, Alyssa Rosenzweig
 <alyssa.rosenzweig@collabora.com>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panfrost: Add PANFROST_BO_NO{READ,WRITE} flags
Message-ID: <20211001084740.051e9d80@collabora.com>
In-Reply-To: <YVY2O48ckub2fc5W@maud>
References: <20210930184723.1482426-1-boris.brezillon@collabora.com>
 <YVYMWdQS/EMc23IF@maud> <20210930214030.19f63eac@collabora.com>
 <YVY2O48ckub2fc5W@maud>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 30 Sep 2021 18:12:11 -0400
Alyssa Rosenzweig <alyssa@collabora.com> wrote:

> > > > +	/* Executable implies readable */
> > > > +	if ((args->flags & PANFROST_BO_NOREAD) &&
> > > > +	    !(args->flags & PANFROST_BO_NOEXEC))
> > > > +		return -EINVAL;    
> > > 
> > > Generally, executable also implies not-writeable. Should we check that?  
> > 
> > We were allowing it until now, so doing that would break the backward
> > compat, unfortunately.  
> 
> Not a problem if you only enforce this starting with the appropriate
> UABI version, but...

I still don't see how that solves the <old-userspace,new-kernel>
situation, since old-userspace doesn't know about the new UABI, and
there's no version field on the CREATE_BO ioctl() to let the kernel
know about the UABI used by this userspace program. I mean, we could
add one, or add a new PANFROST_BO_EXTENDED_FLAGS flag to enforce this
'noexec implies nowrite' behavior, but is it really simpler than
explicitly passing the NOWRITE flag when NOEXEC is passed?

> 
> > Steve also mentioned that the DDK might use shaders modifying other
> > shaders here [1]  
> 
> What? I believe it, but what?
> 
> For the case of pilot shaders, that shouldn't require self-modifying
> code. As I understand, the DDK binds the push uniform (FAU / RMU) buffer
> as global shader memory (SSBO) and uses regular STORE instructions on
> it. That requires writability on that BO but that should be fine.

Okay.

