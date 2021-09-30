Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5141E252
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 21:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3416E3FE;
	Thu, 30 Sep 2021 19:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBF26E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 19:40:35 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 835B41F412A6;
 Thu, 30 Sep 2021 20:40:33 +0100 (BST)
Date: Thu, 30 Sep 2021 21:40:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso
 <tomeu.vizoso@collabora.com>, Alyssa Rosenzweig
 <alyssa.rosenzweig@collabora.com>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panfrost: Add PANFROST_BO_NO{READ,WRITE} flags
Message-ID: <20210930214030.19f63eac@collabora.com>
In-Reply-To: <YVYMWdQS/EMc23IF@maud>
References: <20210930184723.1482426-1-boris.brezillon@collabora.com>
 <YVYMWdQS/EMc23IF@maud>
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

On Thu, 30 Sep 2021 15:13:29 -0400
Alyssa Rosenzweig <alyssa@collabora.com> wrote:

> > +	/* Executable implies readable */
> > +	if ((args->flags & PANFROST_BO_NOREAD) &&
> > +	    !(args->flags & PANFROST_BO_NOEXEC))
> > +		return -EINVAL;  
> 
> Generally, executable also implies not-writeable. Should we check that?

We were allowing it until now, so doing that would break the backward
compat, unfortunately. Steve also mentioned that the DDK might use
shaders modifying other shaders here [1], it clearly doesn't happen in
panfrost, but I think I'd prefer to keep the existing behavior by
default, just to be safe. I'll send a patch setting the RO flag on
all executable BOs in mesa/panfrost.

[1]https://oftc.irclog.whitequark.org/panfrost/2021-09-02
