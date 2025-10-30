Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F0C20823
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E663B10E98C;
	Thu, 30 Oct 2025 14:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NKVwlxF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0730510E980
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833483;
 bh=Hle1Dz2VUENQEnv4hfQ9LKgKs7TijfY0t2XL872EyWM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NKVwlxF83NtkhRzNiYeXsPtGPpRYv6EhYqo9/fKpW6zjxZzXdRjCHjqhENMVwPDgB
 xMLVUNEPp5OhnMnY451xr/x8U9vpwPBAmNRrxQYxFp/RF60dzF7e60BSdmmeALZ1Ov
 6UDsB64TN1HYsxe8IIb8qbjGq18sRd8Kiv33r9/A9PXVOPTMpFV7ziBstIs3s1VtD2
 RBo/bhdQPrvs6Gl3eiRoslSutexDahau/NuTlAKHewXW5b2mYvJGI+NteNSLUqOzEl
 URF/cI/0ZV9uyHo4CEJFvdMZh8ZF+oEGh3lauQEeVuLo5OdqwYqnDWs7jX/NA/HhYy
 3KZsK1OQ7Gf9w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2847E17E1278;
 Thu, 30 Oct 2025 15:11:23 +0100 (CET)
Date: Thu, 30 Oct 2025 15:11:16 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync()
 and a drm_gem_sync() helper
Message-ID: <20251030151116.075c65fc@fedora>
In-Reply-To: <87813da2-4d97-4412-b1f2-1fde6ef6545b@suse.de>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <f89987b9-2df8-45ab-8b53-6a210a30ce50@suse.de>
 <20251016114016.12bb49cd@fedora>
 <c0f34c27-075a-49b1-be44-5b4d9c152ac7@suse.de>
 <20251016123217.01d32b85@fedora>
 <87813da2-4d97-4412-b1f2-1fde6ef6545b@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

Hi Thomas,

On Thu, 16 Oct 2025 13:42:59 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> > Honestly, I'm not too sure why this is a problem if this hook is
> > optional. If it turns out to be too simple for more complex use cases
> > others have, it can still be extended when those drivers transition to
> > this ::sync() approach, as no in-kernel API is immutable. And in the
> > meantime, we have a solution for two drivers that doesn't imply
> > duplicating a bunch of drm_prime boiler-plate that's otherwise rather
> > generic.  
> 
> The prime code you'd have to duplicate is just 10 lines, plus some small 
> per-driver code. Most of that being data-structure inits.

I went for this approach, with a few simple changes to drm_prime.c to
be able to re-use more of the prime boilerplate.

> 
> I want to point out that I'm not opposing the general idea of GEM sync, 
> but I think it should get more feedback from others. It's supposed to be 
> a generic interface after all. Hence I was asking to put all this into a 
> separate series.

New version sent, with more recipients this time. Hopefully I get some
answers to the dma_buf::{begin,end}_cpu_access() questions I have.

Regards,

Boris
