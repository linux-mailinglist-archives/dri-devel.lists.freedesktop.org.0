Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A308B2117
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 14:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E7810FF8E;
	Thu, 25 Apr 2024 12:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="m9k06peq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3309910FF8E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714046674;
 bh=GPUEj+iQ5KK8FyOHEqMenCiUS4CPb2VYRjOxanzMJ+s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m9k06peqj/rJeKJqwMG0u1J+FLohErJbyUcJAxNvceMEnmjR6kIeVq/MCidYrr8Ty
 kW8T2UrjyEAoFSiN6GlMalExh5oqSCYSJi89Tc0ZabS8khvj9kPqbxhrATQVXMSeB7
 gqnLkV118cWRohj/mHLl7fOwBu4y7q73Dlg0Dz8vYIi+550KhsM/bDzI8rXHNyP3hH
 ONFA9+pnhIMNoDKJ7SxQ5ms7I8bEtF3DizxQhph1Xuigva6P5UOC7oznEeWgyMxn5W
 9juPA2Z6BiFUCTzaD1/Y8cGNoEuFwq5IRJPM42riIXYx4Aqx3g1uacpDk4x2VqQVQu
 NIXBpmChu6U8g==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D28543780022;
 Thu, 25 Apr 2024 12:04:33 +0000 (UTC)
Date: Thu, 25 Apr 2024 14:04:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Christopher Healy <healych@amazon.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 2/3] drm/panthor: Make sure the tiler initial/max chunks
 are consistent
Message-ID: <20240425140432.17902ac6@collabora.com>
In-Reply-To: <45272508-b172-46e6-bb75-1a39d7cce37a@arm.com>
References: <20240425071837.529039-1-boris.brezillon@collabora.com>
 <20240425071837.529039-3-boris.brezillon@collabora.com>
 <f0094aef-a190-41ba-91bd-006eb0e1bf69@arm.com>
 <45272508-b172-46e6-bb75-1a39d7cce37a@arm.com>
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

On Thu, 25 Apr 2024 11:43:39 +0100
Steven Price <steven.price@arm.com> wrote:

> On 25/04/2024 10:28, Steven Price wrote:
> > On 25/04/2024 08:18, Boris Brezillon wrote:  
> >> It doesn't make sense to have a maximum number of chunks smaller than
> >> the initial number of chunks attached to the context.
> >>
> >> Fix the uAPI header to reflect the new constraint, and mention the
> >> undocumented "initial_chunk_count > 0" constraint while at it.
> >>
> >> Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> >> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> > 
> > Reviewed-by: Steven Price <steven.price@arm.com>  
> 
> Ok, I'll take that back... I've rebased (and fixed up all the out of
> tree patches) and this doesn't work when I actually test it!
> 
> >   
> >> ---
> >>  drivers/gpu/drm/panthor/panthor_heap.c | 3 +++
> >>  include/uapi/drm/panthor_drm.h         | 8 ++++++--
> >>  2 files changed, 9 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> >> index 143fa35f2e74..8728c9bb76e4 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> >> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> >> @@ -281,6 +281,9 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
> >>  	if (initial_chunk_count == 0)
> >>  		return -EINVAL;
> >>  
> >> +	if (initial_chunk_count < max_chunks)  
> 
> This should be initial_chunk_count > max_chunks. Otherwise you're
> requiring the initial chunk count to be equal *or greater* than the max
> chunks which makes no sense!

Damn it, here's what happens when you think your changes are too
trivial to be wrong...

But I swear I would have tested the whole thing before pushing to
drm-misc. :P
