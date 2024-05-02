Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097F8B9C23
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 16:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E7A10FCAD;
	Thu,  2 May 2024 14:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="vyqY51SC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2610010FA1B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 14:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714659304;
 bh=qCqtdHfmeikNteSwxNEQ8x/u5f3BO7WLuJkQZJBZCSQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vyqY51SCxmSof5SFbl/wbFXI+/0A0b1TFdP3rUIWaG2uGjy/Ms0+TKWxWS6hshrt7
 F5kJo/UMgTvmNtrRvXmyuUAQi5LFhZB6RY/WcsFvoplKa+2jrg8UpHWcVs/OIcrq6h
 NF5uU1Oq8PCEH1vU3JdWx6cc5XwpE0NDvhqWIEKxXM2CY7wYMUDOdJyEiVHyDdIpih
 GYKQNXdLFKV8R1PKXtNPereqKOGUiOEB9i7craiNr3ER2xlkJZWfP2FNqsKxaGCrjG
 stAJAyYEsokrUZoQ7iUW8332rf2qH2P/DG9g9s2dQAZzJ0Uldsmv5h9UPAUQdai1L0
 M7q8s/b8XzeMA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 69923378020A;
 Thu,  2 May 2024 14:15:04 +0000 (UTC)
Date: Thu, 2 May 2024 16:15:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Eric Smith <eric.smith@collabora.com>
Subject: Re: [PATCH v2 4/4] drm/panthor: Fix an off-by-one in the heap
 context retrieval logic
Message-ID: <20240502161503.00f4e3c9@collabora.com>
In-Reply-To: <791a81bf-323c-40dc-ab51-2d909adcb90b@arm.com>
References: <20240430112852.486424-1-boris.brezillon@collabora.com>
 <20240430112852.486424-5-boris.brezillon@collabora.com>
 <791a81bf-323c-40dc-ab51-2d909adcb90b@arm.com>
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

On Thu, 2 May 2024 15:03:51 +0100
Steven Price <steven.price@arm.com> wrote:

> On 30/04/2024 12:28, Boris Brezillon wrote:
> > ID 0 is reserved to encode 'no-tiler-heap', the heap ID range is
> > [1:MAX_HEAPS_PER_POOL], which we occasionally need to turn into an index
> > in the [0:MAX_HEAPS_PER_POOL-1] when we want to access the context object.  
> 
> This might be a silly question, but do we need ID 0 to be
> "no-tiler-heap"? Would it be easier to e.g. use a negative number for
> that situation and avoid all the off-by-one problems?
> 
> I'm struggling to find the code which needs the 0 value to be special -
> where is it exactly that we encode this "no-tiler-heap" value?

Hm, I thought we were passing the heap handle to the group creation
ioctl, but heap queue/heap association is actually done through a CS
instruction, so I guess you have a point. The only thing that makes a
bit hesitant is that handle=0 is reserved for all other kind of handles
we return, and I think I'd prefer to keep it the same for heap handles.

This being said, we could do the `+- 1` in
panthor_ioctl_tiler_heap_{create,destroy}() to keep things simple in
panthor_heap.c.
