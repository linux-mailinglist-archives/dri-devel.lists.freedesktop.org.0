Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5088B1E92
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 11:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F62C11A345;
	Thu, 25 Apr 2024 09:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iUpDwuTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE29611A345
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714039020;
 bh=jcK6InA3xpX8tLu41v+SVBttzzdnZqVdT4zD+iqdz8o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iUpDwuTdr1fi/kg03aPiNbtDQMuxbfQVJGGC+XnAK5IOj8ppMUO4hvbWTRNtczHBC
 HYMm4dxxJJ2l56U7xDuylpPrjLBhzPnl09+mayPRV7FpJalJ9lZR4lE3L2YryU3gAw
 pfoznaKEn7g1aYu8fXMhY4Rpbje/8W4Zi+HD/tUIbwjUq0XubUlh8Vfo5IP7h3kZ6u
 4i+uw232GbUXCCXqZvqGq93b5Nxx7JQf2OG7Kj5kq7T4lQDwM2jzOP6Z31CG+BL53B
 oTPmjc+TpRI/kCX59jAXz8mBjBIK8BFHfZEVTFIXuxvC6qR+mmICTWArjJ5tVIwzE6
 8MuBmIH9fOd2A==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id ACD4537820FA;
 Thu, 25 Apr 2024 09:56:59 +0000 (UTC)
Date: Thu, 25 Apr 2024 11:56:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Christopher Healy <healych@amazon.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 3/3] drm/panthor: Relax the check on the tiler chunk size
Message-ID: <20240425115658.29558c20@collabora.com>
In-Reply-To: <db65e8e7-d281-4648-9895-74c5f0438894@arm.com>
References: <20240425071837.529039-1-boris.brezillon@collabora.com>
 <20240425071837.529039-4-boris.brezillon@collabora.com>
 <db65e8e7-d281-4648-9895-74c5f0438894@arm.com>
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

On Thu, 25 Apr 2024 10:28:56 +0100
Steven Price <steven.price@arm.com> wrote:

> On 25/04/2024 08:18, Boris Brezillon wrote:
> > The field used to store the chunk size if 12 bits wide, and the encoding  
> NIT:                                     ^^ is
> 
> > is chunk_size = chunk_header.chunk_size << 12, which gives us a
> > theoretical [4k:8M] range. This range is further limited by
> > implementation constraints, but those shouldn't be enforced kernel side.
> > 
> > Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> There's also a kerneldoc comment above panthor_heap_create that needs
> updating too:
> 
> > /**
> >  * panthor_heap_create() - Create a heap context
> >  * @pool: Pool to instantiate the heap context from.
> >  * @initial_chunk_count: Number of chunk allocated at initialization time.
> >  * Must be at least 1.
> >  * @chunk_size: The size of each chunk. Must be a power of two between 256k
> >  * and 2M.  
> 
> I'm also a little unsure on whether this is the right change. The
> "implementation defined" min/max in the hardware docs say 128KiB to
> 8MiB. I'm not convinced it makes sense to increase the range beyond that.
> 
> As far as I'm aware the "must be a power of 2" isn't actually a
> requirement (it's certainly not a requirement of the storage format) so
> the kernel is already being more restrictive than necessary.

Ah, I got that wrong because v9 has this must-be-a-power-of-two
constraint (which is also where the erroneous 256k:2M range came from
BTW).

Chris, I guess you'd prefer to have the power-of-two constraint relaxed
too, so we can fine-tune the chunk size.

> 
> It seems like a good idea to keep the uAPI requirements stricter than
> necessary and relax them in the future if we have a good reason (e.g.
> new hardware supports a wider range). But matching the existing hardware
> range of 128KB-8MB would obviously make sense now.

Sure, I'll restrict the range to 128k:8M as you suggest.
