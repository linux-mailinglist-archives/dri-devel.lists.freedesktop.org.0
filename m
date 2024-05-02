Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739578B9EE6
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1114D1125C4;
	Thu,  2 May 2024 16:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pBA9trVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E381125C4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714668745;
 bh=hMVUVERWJ+8DrMEltD3xok/HHoXL88qxQBNwHla16SI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pBA9trVA03hj1feK80RtKFZpb36orOhzJISafnm9Z4SyAbToF41D+94yiKcPE3+mp
 pXpBgPKA5OT1IVdZkcqD7bMrvtCSskESaU5PmdpRN5gClDWvahJydgzVG4EOlFAm0I
 s15H6Nolzu2dNzI7PyfH1J2tlFEvi6K8s5zpDgRAatANpC96BsdMxmFpRQ7zz4WkUT
 D9nwYODHSYp0u/ssuCMeSQknUlmRHJtSzS5mxcJN3+Jp7P3vz+vfMhZhzXrz4/JWK5
 81NdbAK0YIEx2JHx2dA7yNSKJN78FeWZgfWyOWyEae31c7bNXDSCsw9oiOLzRl4QGs
 nulwKGG9HWQ4A==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 867DB37820E1;
 Thu,  2 May 2024 16:52:24 +0000 (UTC)
Date: Thu, 2 May 2024 18:52:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Eric Smith <eric.smith@collabora.com>
Subject: Re: [PATCH v3 4/5] drm/panthor: Fix an off-by-one in the heap
 context retrieval logic
Message-ID: <20240502185223.79caf041@collabora.com>
In-Reply-To: <d2b2f36f-a2d4-4515-bc2c-24f4c1b548d3@arm.com>
References: <20240502154025.1425278-1-boris.brezillon@collabora.com>
 <20240502154025.1425278-5-boris.brezillon@collabora.com>
 <d2b2f36f-a2d4-4515-bc2c-24f4c1b548d3@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Thu, 2 May 2024 16:52:24 +0100
Steven Price <steven.price@arm.com> wrote:

> On 02/05/2024 16:40, Boris Brezillon wrote:
> > The heap ID is used to index the heap context pool, and allocating
> > in the [1:MAX_HEAPS_PER_POOL] leads to an off-by-one. This was
> > originally to avoid returning a zero heap handle, but given the handle
> > is formed with (vm_id << 16) | heap_id, with vm_id > 0, we already can't
> > end up with a valid heap handle that's zero.
> > 
> > v3:
> > - Allocate in the [0:MAX_HEAPS_PER_POOL-1] range
> > 
> > v2:
> > - New patch
> > 
> > Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> > Reported-by: Eric Smith <eric.smith@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Tested-by: Eric Smith <eric.smith@collabora.com>  
> 
> Don't we also need to change the xa_init_flags() in
> panthor_heap_pool_create()?

Uh, we should, indeed.

> 
> Steve
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_heap.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> > index 683bb94761bc..252332f5390f 100644
> > --- a/drivers/gpu/drm/panthor/panthor_heap.c
> > +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> > @@ -323,7 +323,8 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
> >  	if (!pool->vm) {
> >  		ret = -EINVAL;
> >  	} else {
> > -		ret = xa_alloc(&pool->xa, &id, heap, XA_LIMIT(1, MAX_HEAPS_PER_POOL), GFP_KERNEL);
> > +		ret = xa_alloc(&pool->xa, &id, heap,
> > +			       XA_LIMIT(0, MAX_HEAPS_PER_POOL - 1), GFP_KERNEL);
> >  		if (!ret) {
> >  			void *gpu_ctx = panthor_get_heap_ctx(pool, id);
> >    
> 

