Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC271E7F3E
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 15:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCC76E8FD;
	Fri, 29 May 2020 13:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1F36E8FC;
 Fri, 29 May 2020 13:52:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8A03E2A18DE;
 Fri, 29 May 2020 14:52:57 +0100 (BST)
Date: Fri, 29 May 2020 15:52:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 0/9] shmem helper untangling
Message-ID: <20200529155254.56d2e357@collabora.com>
In-Reply-To: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 May 2020 11:35:45 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Hi all,
> 
> I've started this a while ago, with the idea to move shmem helpers over
> to dma_resv_lock. Big prep work for that was to untangle the layering
> between functions called by drivers, and functions used to implement
> drm_gem_object_funcs.
> 
> I didn't ever get to the locking part, but I think the cleanup here are
> worth it stand-alone still.
> 
> Comments, review and testing very much welcome.
> 
> Cheers, Daniel
> 
> Daniel Vetter (9):
>   drm/msm: Don't call dma_buf_vunmap without _vmap
>   drm/gem: WARN if drm_gem_get_pages is called on a private obj
>   drm/doc: Some polish for shmem helpers
>   drm/virtio: Call the right shmem helpers
>   drm/udl: Don't call get/put_pages on imported dma-buf
>   drm/shmem-helpers: Don't call get/put_pages on imported dma-buf in
>     vmap
>   drm/shmem-helpers: Redirect mmap for imported dma-buf
>   drm/shmem-helpers: Ensure get_pages is not called on imported dma-buf
>   drm/shmem-helpers: Simplify dma-buf importing

With the fix suggested on patch 9 (or something similar to initialize
pages_use_count to 1 when importing a dma-buf), this patchset seems to
work on panfrost:

Tested-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
>  Documentation/gpu/drm-kms-helpers.rst   |  12 ---
>  Documentation/gpu/drm-mm.rst            |  12 +++
>  drivers/gpu/drm/drm_gem.c               |   8 ++
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 128 ++++++++++++++----------
>  drivers/gpu/drm/msm/msm_gem.c           |   3 +-
>  drivers/gpu/drm/udl/udl_gem.c           |  22 ++--
>  drivers/gpu/drm/virtio/virtgpu_object.c |   2 +-
>  7 files changed, 111 insertions(+), 76 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
