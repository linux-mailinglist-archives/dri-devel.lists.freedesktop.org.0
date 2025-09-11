Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33CBB5318D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C8210E0D6;
	Thu, 11 Sep 2025 11:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="C6hOtEBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC5810E0D6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757591879;
 bh=pcaHstFzYxqGaTfJg3M7eqTaxmtEuy1ikYgs5QwdX2U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C6hOtEBq7MSKfaphh2bb0DqY6YAg3GQqAuP48zEjPoIzUVWKFYoNSICa5EB5Aa/Cv
 od5BczDgXxDE/OcflJ3/GYIXrMXv4zQcssG8we/Jj6EMlg0qPSrzz34J2LN/iofYGL
 +a0wqfCslHiwEvINiAJz30muYwX70TgxM1X32sl9jmI4JoRl/Boc0rmgt/yXTvpS7c
 PZTaGPzLHnerlEg7bUz8aID9p4PMgv2I95ydg/Ukbsfn9xEtg2+02CNDE6+5HilBXW
 oGLE1BklAFJsynfq6oOB/NIeisktDtjy7Ys342cxq9W+L/1k4nbpeR/dFmHUKnc+um
 RNczzzWu/j0Cw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EA6117E0100;
 Thu, 11 Sep 2025 13:57:59 +0200 (CEST)
Date: Thu, 11 Sep 2025 13:57:46 +0200
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
Message-ID: <20250911135746.1c9cdd4b@fedora>
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
