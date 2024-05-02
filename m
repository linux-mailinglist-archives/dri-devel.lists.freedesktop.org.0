Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273668B9CB9
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 16:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DF510E304;
	Thu,  2 May 2024 14:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lwNaNuXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2A510E304
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 14:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714661267;
 bh=zdySfR+fYWhFBHXlODA/QCasUTB470MpHXj10sznWDU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lwNaNuXCd5ddbpzg8ETnFoTyzID5gpGiKtx0Yz7+LO9oJmQGXNSJqHTLRKJ+RAiaq
 DVbLqJnOgcykR1ewWbms+WTr7quz3KvTbbMgq6Jv7bGRdA35fpstJJR2xaLDGxX2ZO
 MDufzHmDjls3zZmMAWC0aBT6g9hDFu5Ho6zo4S9zBiYPA2d5YV2nVt2mkRDV4u2uxs
 0iEHU2bTAGk3MraBjq3gRsbTgRd7DGsbllAiEuQ2I5JcZkWo8RnjA/Jaly/H2nPZTs
 J/DWCNoyCVwPvt7fnRP5APzhqEg8oqNA0JZb5CruavXD887TykFhRwvfb+jt28mOai
 IqxQPN6Nfz2kA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C7697378001E;
 Thu,  2 May 2024 14:47:46 +0000 (UTC)
Date: Thu, 2 May 2024 16:47:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Eric Smith <eric.smith@collabora.com>
Subject: Re: [PATCH v2 4/4] drm/panthor: Fix an off-by-one in the heap
 context retrieval logic
Message-ID: <20240502164745.0f11ed7c@collabora.com>
In-Reply-To: <20240502163602.70f554b5@collabora.com>
References: <20240430112852.486424-1-boris.brezillon@collabora.com>
 <20240430112852.486424-5-boris.brezillon@collabora.com>
 <791a81bf-323c-40dc-ab51-2d909adcb90b@arm.com>
 <20240502161503.00f4e3c9@collabora.com>
 <39c22cd8-8638-45ea-8450-87a7ad13568f@arm.com>
 <20240502163602.70f554b5@collabora.com>
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

On Thu, 2 May 2024 16:36:02 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 2 May 2024 15:26:55 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
> > On 02/05/2024 15:15, Boris Brezillon wrote:  
> > > On Thu, 2 May 2024 15:03:51 +0100
> > > Steven Price <steven.price@arm.com> wrote:
> > >     
> > >> On 30/04/2024 12:28, Boris Brezillon wrote:    
> > >>> ID 0 is reserved to encode 'no-tiler-heap', the heap ID range is
> > >>> [1:MAX_HEAPS_PER_POOL], which we occasionally need to turn into an index
> > >>> in the [0:MAX_HEAPS_PER_POOL-1] when we want to access the context object.      
> > >>
> > >> This might be a silly question, but do we need ID 0 to be
> > >> "no-tiler-heap"? Would it be easier to e.g. use a negative number for
> > >> that situation and avoid all the off-by-one problems?
> > >>
> > >> I'm struggling to find the code which needs the 0 value to be special -
> > >> where is it exactly that we encode this "no-tiler-heap" value?    
> > > 
> > > Hm, I thought we were passing the heap handle to the group creation
> > > ioctl, but heap queue/heap association is actually done through a CS
> > > instruction, so I guess you have a point. The only thing that makes a
> > > bit hesitant is that handle=0 is reserved for all other kind of handles
> > > we return, and I think I'd prefer to keep it the same for heap handles.
> > > 
> > > This being said, we could do the `+- 1` in
> > > panthor_ioctl_tiler_heap_{create,destroy}() to keep things simple in
> > > panthor_heap.c.    
> > 
> > The heap handles returned to user space have the upper 16 bits encoding
> > the VM ID - so hopefully no one is doing anything crazy and splitting it
> > up to treat the lower part specially. And (unless I'm mistaken) the VM
> > IDs start from 1 so we'd still not have IDs of 0. So I don't think we
> > need the +- 1 part anywhere for tiler heaps.  
> 
> Ah, I forgot about that too. Guess we're all good with a
> [0,MAX_HEAPS_PER_POOL-1] range then.
> 
> > 
> > I'd certainly consider it a user space bug to treat the handles as
> > anything other than opaque. Really user space shouldn't be treating 0 as
> > special either: the uAPI doesn't say it's not valid. But I'd be open to
> > updating the uAPI to say 0 is invalid if there's some desire for that.  
> 
> Will do that in v3 then.

Taking that back. I don't think it needs to be enforced in the uAPI. As
you said, it's supposed to be opaque, so I'm tempted to update the
drm_panthor_tiler_heap_destroy::handle kerneldoc saying it must be
a valid handle returned by DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE instead.

It's just that making the handle non-zero is kinda nice for debugging
purposes, and as I said, this way it's consistent with other kind of
handles (GEMs, VMs, syncobjs, ...).
