Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B0DA673FB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B7310E46D;
	Tue, 18 Mar 2025 12:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HHJO87pV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7CA10E46D;
 Tue, 18 Mar 2025 12:36:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 336F0A44B68;
 Tue, 18 Mar 2025 12:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378ADC4CEDD;
 Tue, 18 Mar 2025 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742301418;
 bh=SJfjF8VJl5ngT74kMsrcr6AJgeo76waz96E0SWlabtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HHJO87pVbzmheUZYIr7thy63UrkYX2x72fwQfRmRLnlMsHopMNgRZAlqJfUO1wkMs
 4TILcZZE6kizvmyJQdADSn4FdVUdAgX0Ogd5xPE2bBMwShEK6yX90vc+5+LJ6PlupO
 nIFSEX1edXh4ZPxSIX9xs3KE1ZT952Hod/rwlXbYLxolF+YPTro9HMYccTqsjQfrUp
 K/I6bF4KdLq7tHJTHOx5EKhrA08baROk1fV3jJ+t504pvXKzAT3/sZ750z7E6jUiXe
 uleKiGGpnJFN0fO1k8oyazAnHc/29Dntu3PSDWikPRj210cTRxzEyEZF9Rwblm4Y4t
 +5likWZSaF5mg==
Date: Tue, 18 Mar 2025 13:36:54 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, tvrtko.ursulin@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: Try to fix amdgpu's error handling
Message-ID: <Z9lo5tUhBgRqHk4n@pollux>
References: <20250318120313.19099-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318120313.19099-1-christian.koenig@amd.com>
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

On Tue, Mar 18, 2025 at 01:03:11PM +0100, Christian König wrote:
> Hi guys,
> 
> as partially discussed on the list already amdgpu has a bug in it's gang
> submission code.
> 
> Basic problem is to add the correct dependency to the gang leader we
> need to arm the other gang members first, but that is a point of no
> return and it is possible that adding the dependencies fails with
> ENOMEM.
> 
> Try to fix that by allowing drivers to preallocate dependency slots. Not
> sure if that is a good approach, but of hand I don't see much
> alternative.

I think that's reasonable, in GPUVM we have a similar problem where we have to
preallocate in order to avoid allocations under a mutex used in the fence
signalling critical path.

Unfortunately, this even prevented us from using the maple tree, since it can't
preallocate for multiple entries ahead of time.

From my side,

Acked-by: Danilo Krummrich <dakr@kernel.org>
