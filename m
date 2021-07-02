Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C659F3BA3C5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 19:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EC16E197;
	Fri,  2 Jul 2021 17:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2736E197
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 17:54:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C9B661F44FD0;
 Fri,  2 Jul 2021 18:54:47 +0100 (BST)
Date: Fri, 2 Jul 2021 19:54:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add a new ioctl to submit batches
Message-ID: <20210702195444.010bbb7b@collabora.com>
In-Reply-To: <YN9DsztrsMWY1rv+@maud>
References: <20210702143225.3347980-1-boris.brezillon@collabora.com>
 <20210702143225.3347980-6-boris.brezillon@collabora.com>
 <YN8tDD6tRF85cR4z@maud> <20210702173843.44b3e322@collabora.com>
 <YN9DsztrsMWY1rv+@maud>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Jul 2021 12:49:55 -0400
Alyssa Rosenzweig <alyssa@collabora.com> wrote:

> > > Why is there padding instead of putting point first?  
> > 
> > We can move the point field first, but we need to keep the explicit
> > padding: the struct has to be 64bit aligned because of the __u64 field
> > (which the compiler takes care of) but if we don't have an explicit
> > padding, the unused 32bits are undefined, which might cause trouble if
> > we extend the struct at some point, since we sort of expect that old
> > userspace keep this unused 32bit slot to 0, while new users set
> > non-zero values if they have to.  
> 
> Makes sense. Reordering still probably makes sense.

Actually, I can't re-order if I want the new in_syncs parser to work
with the old ioctl(), which you and Steven asked me to do :-).
