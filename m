Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB9B48CFC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2867810E4DA;
	Mon,  8 Sep 2025 12:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GDdS1fPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DA310E4DA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757333532;
 bh=A1nEkZqKBTKgjMS5u3/csdHzUSVuykKtfEll9i1YIcw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GDdS1fPlVlqjGWv2o5Qt8uhh3csjD7EsLoJsufaiK5kR+7SYJMgeZGxaw4qTXF7cf
 HvILRv/0iUZG9uoGhVD1oKSBNo4+aD/wOtb2ILTvxaaowMlTdXmTkO0/iXQYrFVCGU
 HNsfA1kCThqWuGka0ethtZ5HXV+LgUO4FNX+DDCEBDUZYwHNht2hxAzJPaP3GWBdlN
 6mVrm1Vx3xcoKeLvjnJFDsLW/KthdOSAhjREQ7WmXFaE+7VJyifoBKjPQpRF1KxECm
 dPOBw+Enfn0sYs6Dd7nojakXLENLIskBnhvMTbLrRsx3H/jNmRW1RxezQo1UBSFafy
 TMNSrAw3PgV8g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B695017E00A6;
 Mon,  8 Sep 2025 14:12:11 +0200 (CEST)
Date: Mon, 8 Sep 2025 14:11:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Matthew Brost"
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Steven Price"
 <steven.price@arm.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
Message-ID: <20250908141156.3dbdea0b@fedora>
In-Reply-To: <DCNDGFE7RR5Q.X3PCDW0KIX89@kernel.org>
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org>
 <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org>
 <aL1u_YxOkuj1kIq6@google.com> <20250908091140.44856fde@fedora>
 <aL6TJYRmWIkQXujj@google.com>
 <DCNAE3CJMEJ0.JH1F0MJABXQI@kernel.org>
 <20250908122002.2c80dd3a@fedora>
 <DCNDGFE7RR5Q.X3PCDW0KIX89@kernel.org>
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

On Mon, 08 Sep 2025 13:11:32 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Sep 8, 2025 at 12:20 PM CEST, Boris Brezillon wrote:
> > I'm not following. Yes there's going to be a
> > drm_gpuva_unlink_defer_put() that skips the
> >
> >         va->vm_bo = NULL;
> >         drm_gpuvm_bo_put(vm_bo);
> >
> > and adds the gpuva to a list for deferred destruction. But I'm not
> > seeing where the leak is. Once the gpuva has been put in this list,
> > there should be no existing component referring to this object, and it's
> > going to be destroyed or recycled, but not re-used as-is.  
> 
> I'm saying exactly what you say: "has to be a special unlink function" ->
> drm_gpuva_unlink_defer_put(). :)

I don't see how calling drm_gpuva_unlink() instead of
drm_gpuva_unlink_defer_put() would leak the vm_bo though. I mean, it
would certainly be wrong because you'd be calling cleanup methods that
are expected to be called with the resv lock held from the
dma-signalling path, but that's a different issue, no? Anyway, if we're
going to allow gpuva cleanup/destruction deferral, we'll either need to
do that through a different function, or through some specialization of
drm_gpuva_unlink() that does things differently based on the
immediate/non-immediate mode (or some other flag).

> 
> >> Yeah, we really want to avoid that.  
> >
> > I think I agree that we want to avoid it, but I'm not too sure about
> > the solution that involves playing with vm_bo::kref. I'm particularly
> > worried by the fact drivers can iterate the evict/extobj lists
> > directly, and can thus see objects scheduled for destruction. I know
> > there's a gpuvm_bo_is_dead() helper, and drivers should be aware of the
> > risks, but I don't feel comfortable about this.  
> 
> No, drivers can't iterate the evict/extobj lists directly; or at least this is
> not intended by GPUVM's API and if drivers do so, this is considered peeking
> into GPUVM internals, so drivers are on their own anyways.
> 
> Iterators, such as for_each_vm_bo_in_list() are not exposed to drivers.

Okay, that's a good thing. I thought Xe was doing some funky stuff with
the list...

> 
> > And since we've mentioned the possibility of having to support
> > gpuva destruction deferral too, I'm wondering it wouldn't be cleaner
> > to just go for this approach from the start (gpuva owns a ref to a
> > vm_bo, which gets released when the gpuva object is released).  

