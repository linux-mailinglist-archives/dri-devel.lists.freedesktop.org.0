Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41490B531A7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A73310EADF;
	Thu, 11 Sep 2025 12:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Yqx60noG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A514D10EADD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757592062;
 bh=pcaHstFzYxqGaTfJg3M7eqTaxmtEuy1ikYgs5QwdX2U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yqx60noGx/UImP7ay1n8DUyqf7rs/kFaCgaJusroLlAFLqO8CcIh5N69BuKbit17T
 qXAPnONlwaZsTE1+cUgoTX/9k3Vp5Q2gawVmavhj28OOfEC8iIoXBeprHLDOHZ/kvd
 Glsn0+sNp1X/1VxpygOw7m0gWuhYVGou7jOa1DRHpuYC/gJ/wPrjSUNlDst4OEfa6F
 58qUWUqt9qxopEg0ZY53zPikXb2tF8FwkJyoxG9uyckcu3J+yAcjFXT+y0Ny+Y476U
 qRwLDdgEwy89fgUKKQ0R7iWUyOqHD1VwD1BD+P7EfpiBgdAOfUETZBg7G8qdefdUxP
 BYT3ExRbCJZmg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BCA3517E0C96;
 Thu, 11 Sep 2025 14:01:01 +0200 (CEST)
Date: Thu, 11 Sep 2025 14:00:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?="
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/gpuvm: add deferred vm_bo cleanup
Message-ID: <20250911140040.06885642@fedora>
In-Reply-To: <aMAuGy6Rc55mkqCW@google.com>
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
 <20250909-vmbo-defer-v2-1-9835d7349089@google.com>
 <aMAuGy6Rc55mkqCW@google.com>
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

On Tue, 9 Sep 2025 13:39:39 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Sep 09, 2025 at 01:36:22PM +0000, Alice Ryhl wrote:
> > When using GPUVM in immediate mode, it is necessary to call
> > drm_gpuvm_unlink() from the fence signalling critical path. However,
> > unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> > 
> > 1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
> >    can't do from the fence signalling critical path.
> > 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
> >    to be unsafe to call from the fence signalling critical path.
> > 
> > To solve these issues, add a deferred version of drm_gpuvm_unlink() that
> > adds the vm_bo to a deferred cleanup list, and then clean it up later.
> > 
> > The new methods take the GEMs GPUVA lock internally rather than letting
> > the caller do it because it also needs to perform an operation after
> > releasing the mutex again. This is to prevent freeing the GEM while
> > holding the mutex (more info as comments in the patch). This means that
> > the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>  
> 
> I'm not sure if we came to a conclusion on the gpuva defer stuff on v1,
> but I found a less confusing way to implement the locking. Please check
> it out.

Yep, I think I prefer this version too.
