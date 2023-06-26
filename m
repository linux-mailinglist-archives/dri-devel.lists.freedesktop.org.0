Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C5973E0D0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB92D10E1FF;
	Mon, 26 Jun 2023 13:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C00510E1FF
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 13:38:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 99B23660714F;
 Mon, 26 Jun 2023 14:38:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687786696;
 bh=vBYauA9GXgcLvliiqis4o1X7vPKqu/3xZ9FcgbEZ/6Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=liXHteP+9ZEkJnsbdwqpFHvug7n6M75mh4WS4GrOkb+FF5miub03/4c3kMqEYQVTu
 KeaOKwIIoysNPBCTpifuwkUX2BVwOxtFRELA8B5USIXNO9cfUDlZUrSO/ADVx4hM3t
 BPS2zOkExRPBDIm9pHhdC6UaSKR3P0wkeuemmeCfCYd9MAZYZSQWYkotQxnhFDtRm2
 3VgdpIpVDXEE9P3/ssDlNmqXJAJby160kbOurt0P2F44mu3HC6XMkGABMEGhUymLby
 rY0yvY+kuy2PHpondcBspbwR5/7aTctmtrgiXTC9s22YTiIOvDJG9mwcyl6/vpzsi3
 ufrPjf0IpM4QA==
Date: Mon, 26 Jun 2023 15:38:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH 1/5] drm/panfrost: Stop using drm_gem_shmem_put_pages()
Message-ID: <20230626153813.17a03f39@collabora.com>
In-Reply-To: <2182355e-2412-fd60-fb0d-5359b43d4e0c@collabora.com>
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
 <20230626120247.1337962-2-boris.brezillon@collabora.com>
 <2182355e-2412-fd60-fb0d-5359b43d4e0c@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Jun 2023 16:20:53 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 6/26/23 15:02, Boris Brezillon wrote:
> > -err_pages:
> > -	drm_gem_shmem_put_pages(&bo->base);
> >  err_unlock:
> >  	dma_resv_unlock(obj->resv);
> > +
> > +	if (ret && pinned)
> > +		drm_gem_shmem_unpin(&bo->base);  
> 
> The drm_gem_shmem_unpin() was supposed to be used only in conjunction
> with drm_gem_shmem_pin(). I've a pending patch to enable the pin/unpin
> refcounting needed by drm-shmem shrinker, it will prohibit invocation of
> unpin without a previous pin.

That driver is a bit special in that, in the growable BO case
(AKA pin-on-demand), the driver replaces the drm_gem_shmem_pin()
implementation by a custom one (the logic in
panfrost_mmu_map_fault_addr()), but still relies on the
default implementation to release things. We do increment the
pages_use_count manually to make sure the drm_gem_shmem_unpin() is
balanced.

> 
> I'm wondering whether it will be okay to simply remove
> drm_gem_shmem_put_pages() from the Panfrost code, letting pages to be
> kept allocated in a error case. They will be freed once BO is destroyed.
> 

I'm pretty sure the implementation will then complain about unbalanced
pin/unamp (or get_pages/put_pages) if we do that. I guess one option
would be to completely bypass drm_gem_shmem_[un]pin() for growable BOs
and manage the pages separately at the panfrost_gem_object level, but
the original idea was probably to re-use some of the fields/logic we
had in drm_gem_shmem_object and make partial pinning as close as
possible to regular pinning. Another option would be to teach the shmem
about partial pinning, but I'm not sure we want to expose such a
feature.
