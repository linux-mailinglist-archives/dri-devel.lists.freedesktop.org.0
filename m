Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BB941E3B9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 00:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132B76E46B;
	Thu, 30 Sep 2021 22:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C1C6E46B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 22:12:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 271F71F4500E
Date: Thu, 30 Sep 2021 18:12:11 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panfrost: Add PANFROST_BO_NO{READ,WRITE} flags
Message-ID: <YVY2O48ckub2fc5W@maud>
References: <20210930184723.1482426-1-boris.brezillon@collabora.com>
 <YVYMWdQS/EMc23IF@maud> <20210930214030.19f63eac@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930214030.19f63eac@collabora.com>
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

> > > +	/* Executable implies readable */
> > > +	if ((args->flags & PANFROST_BO_NOREAD) &&
> > > +	    !(args->flags & PANFROST_BO_NOEXEC))
> > > +		return -EINVAL;  
> > 
> > Generally, executable also implies not-writeable. Should we check that?
> 
> We were allowing it until now, so doing that would break the backward
> compat, unfortunately.

Not a problem if you only enforce this starting with the appropriate
UABI version, but...

> Steve also mentioned that the DDK might use shaders modifying other
> shaders here [1]

What? I believe it, but what?

For the case of pilot shaders, that shouldn't require self-modifying
code. As I understand, the DDK binds the push uniform (FAU / RMU) buffer
as global shader memory (SSBO) and uses regular STORE instructions on
it. That requires writability on that BO but that should be fine.
