Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88483477430
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6EF112199;
	Thu, 16 Dec 2021 14:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386A7112196;
 Thu, 16 Dec 2021 14:15:19 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 872CB1F46386;
 Thu, 16 Dec 2021 14:15:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639664117; bh=EUdp6OVQgOVcce0WCDML3AjD7s+d4fLJvihp8sH0Ya4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k/+7lmXFO9IDxzIUltmqfPz1I41OjBDEIl3ZidvNwTSiyvYNL/1ZBG7cCKZ9r8E51
 Yem2tgMmgL+v9EmxsSjmat7mWU/MNymuMU0HHKwqngkQfulurtv1qOz94zGszoFOqQ
 nXGdjGT93E9uzKI0FnJNZtHFabAdf7nzkRM/+hqSRBGASgYH+pQp82H8upEtKJyweZ
 NYkFG1Ur7SSa84/Zaz+ROOF6vxlv9dsmI4RXqAjaa9TfY31lNV9NAfW17ZaMHbBxMS
 04AjbHr1Wf5oTOUY/uoXi/upLWCkY6G8VA8wNml2Z0fCqZWLcc2HnNoww4MNdWUO5F
 80b2bTTuwb4aQ==
Date: Thu, 16 Dec 2021 15:15:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [bug report] new kvmalloc() WARN() triggered by DRM ioctls
 tracking
Message-ID: <20211216151513.14ca3e8c@collabora.com>
In-Reply-To: <8b02c4d8-cf36-6558-6e1d-9a0955483f4e@arm.com>
References: <20211216120806.GA3691@kili>
 <8b02c4d8-cf36-6558-6e1d-9a0955483f4e@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
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
Cc: lima@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steve,

On Thu, 16 Dec 2021 14:02:25 +0000
Steven Price <steven.price@arm.com> wrote:

> + Boris
> 
> On 16/12/2021 12:08, Dan Carpenter wrote:
> > Hi DRM Devs,
> > 
> > In commit 7661809d493b ("mm: don't allow oversized kvmalloc() calls")
> > from July, Linus added a WARN_ONCE() for "crazy" allocations over 2GB.
> > I have a static checker warning for this and most of the warnings are
> > from DRM ioctls.
> > 
> > drivers/gpu/drm/lima/lima_drv.c:124 lima_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/radeon/radeon_cs.c:291 radeon_cs_parser_init() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/v3d/v3d_gem.c:311 v3d_lookup_bos() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/v3d/v3d_gem.c:319 v3d_lookup_bos() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/v3d/v3d_gem.c:601 v3d_get_multisync_post_deps() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:476 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:477 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:478 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:479 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/virtio/virtgpu_ioctl.c:186 virtio_gpu_execbuffer_ioctl() warn: uncapped user size for kvmalloc() will WARN
> > drivers/gpu/drm/panfrost/panfrost_drv.c:198 panfrost_copy_in_sync() warn: uncapped user size for kvmalloc() will WARN  
> 
> I believe this one in Panfrost would be fixed by Boris's series
> reworking the submit ioctl[1].
> 
> Boris: are you planning on submitting that series soon - or is it worth
> cherry picking the rework in patch 5 to fix this issue?

Don't know when I'll get back to it, so I'd recommend cherry-picking
what you need.

Regards,

Boris
