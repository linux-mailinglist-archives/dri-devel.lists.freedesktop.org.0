Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D94C40FE3
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1F310E1D1;
	Fri,  7 Nov 2025 17:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ozZPIgFr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C3510E1D1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 17:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762535676;
 bh=HWvhrA4Lqa8HSZUgOZOEMjeaxv+TjxuGCgMnzEtpqM4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ozZPIgFrLq29b3og+vuGhnSpBJUBurBAiaXBdUlLVA7yoJK0eYG3DHnyk3iAX69/p
 92r7XH3H4RWVvWwgQjjdWvvyohCoCPwtSWAamTvlDhopsDitQ6pB6vC5f3D7bRuo1K
 AjNJztvMnAcDQi4YdoFVUQHokRSP9zuWRfGjeBMUJOqObvjcwYE38kDgdftR8aDe9y
 FSrqseBwbrOW8y6HGc6xpcTzYDrtTjBRMgFl8DsV17+K6jBARoRUh/k2k8HwJcUmtO
 UyyuMxsQ8GxebjJTswuvJ0bjYA2zAJ/Xk76Krfy8j14guuj4hF7e95buum/MxiRKtE
 RhWAL2SxmUxAA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C46D017E10CA;
 Fri,  7 Nov 2025 18:14:35 +0100 (CET)
Date: Fri, 7 Nov 2025 18:14:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, Lars-Ivar
 Hesselberg Simonsen <lars-ivar.simonsen@arm.com>, kernel@collabora.com,
 Karunika Choo <karunika.choo@arm.com>
Subject: Re: [PATCH v1 2/4] drm/panthor: Add support for atomic page table
 updates
Message-ID: <20251107181430.32cf2162@fedora>
In-Reply-To: <6d6b2e09-5093-4a91-aa81-b39147515107@arm.com>
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
 <20251031154818.821054-3-boris.brezillon@collabora.com>
 <6d6b2e09-5093-4a91-aa81-b39147515107@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Fri, 7 Nov 2025 16:26:54 +0000
Steven Price <steven.price@arm.com> wrote:

> On 31/10/2025 15:48, Boris Brezillon wrote:
> > Move the lock/flush_mem operations around the gpuvm_sm_[un]map() calls
> > so we can implement true atomic page updates, where any access in the
> > locked range done by the GPU has to wait for the page table updates
> > to land before proceeding.
> > 
> > This is needed for vkQueueBindSparse(), so we can replace the dummy
> > page mapped over the entire object by actual BO backed pages in an atomic
> > way. But it's also useful to avoid "AS_ACTIVE bit stuck" failures in
> > the sm_[un]map() path, leading to gpuvm state inconsistencies.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> +CC: Karunika
> 
> The concept here looks good, but...
> 
> This is effectively undoing the changes that Karunika did in commit
> dd11c7dec74b ("drm/panthor: Make MMU cache maintenance use FLUSH_CACHES
> command"). The FLUSH_MEM/FLUSH_PT commands have been deprecated in
> Mali-Gx20, so either this needs refactoring to use the newer
> FLUSH_CACHES GPU_COMMAND.
> 
> I believe the expected ideal approach on later GPUs is:
> 
> 1. LOCK
> 2. Make page table updates
> 3. FLUSH_RANGE to GPU_COMMAND flushing the *physical* address ranges
> 4. UNLOCK
> 
> Note that on earlier GPUs we don't have FLUSH_RANGE so FLUSH_CACHES
> replaces step 3 (and is what we have upstream). But I think this is the
> reason why FLUSH_MEM/FLUSH_PT are deprecated because those work on a
> virtual address range.

Ah, right. I'll revisit the logic to have it working on newer gens.
