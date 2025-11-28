Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE0C91679
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A267B10E124;
	Fri, 28 Nov 2025 09:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qY97IO6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7790510E124
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764321592;
 bh=2S3pOsGZI0odBMmyw6CAXiyo+2PeM56OXSnZaaOdcEc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qY97IO6iPvTV7jwrFJpaPavLIwNSxV6FIbGKQeou9Qg81/dj6CPsAuSQ+UQP8T/11
 KFOlarpWFS656sJdUUmomFgAwXCw0YrI4vnFuRu58f5+i1PozEaOGQaac+PzrYDQC/
 cw6SuHkWA3u0KDYbzZMSigaAuq4TdgSfO5sB2Gy982khlt5owbvFVbnhLU1KNJFh9y
 1hrdsb8GOBOgN5RzSt91ra9gSRlNPexkw6B4SdC+rE1+N5Y0e8vrgJg9t5eugifh6K
 iYHsjBiZlNDRYbLXiweybH2r+tojgN/QWupE5sQpKRZZPzfO/Vi6xuo0qreWfVNcuQ
 B58LkjwxUfC9A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B05C917E0117;
 Fri, 28 Nov 2025 10:19:51 +0100 (CET)
Date: Fri, 28 Nov 2025 10:19:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
Subject: Re: [PATCH v4 0/6] drm/panthor: Misc fixes
Message-ID: <20251128101947.3475c841@fedora>
In-Reply-To: <20251128084841.3804658-1-boris.brezillon@collabora.com>
References: <20251128084841.3804658-1-boris.brezillon@collabora.com>
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

On Fri, 28 Nov 2025 09:48:34 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> This is a set of fixes for bugs I ran into while looking at [1].
> Hopefully that's enough to recover from AS_ACTIVE bit stuck
> situations, but it'd be good to understand why the MMU block is
> completely blocked in some cases and try to come up with better
> mitigations than a full GPU reset.
> 
> This v4 is here to address a conflict caused by other panthor
> patches being merged before this one.
> 
> Regards,
> 
> Boris
> 
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/issues/57
> 
> Boris Brezillon (6):
>   drm/panthor: Always wait after sending a command to an AS
>   drm/panthor: Kill lock_region()
>   drm/panthor: Recover from panthor_gpu_flush_caches() failures
>   drm/panthor: Add support for atomic page table updates
>   drm/panthor: Make panthor_vm_[un]map_pages() more robust
>   drm/panthor: Relax a check in panthor_sched_pre_reset()

Queued to drm-misc-next.

> 
>  drivers/gpu/drm/panthor/panthor_gpu.c   |  19 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 280 +++++++++++++-----------
>  drivers/gpu/drm/panthor/panthor_sched.c |   2 -
>  3 files changed, 166 insertions(+), 135 deletions(-)
> 

