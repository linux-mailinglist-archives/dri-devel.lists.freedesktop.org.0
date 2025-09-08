Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF7B489EE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 12:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854F410E4BB;
	Mon,  8 Sep 2025 10:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b5fZ+QiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315D810E4B8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757326808;
 bh=iIFJ6NmZ1H1JOINY4fZdqZyuJ4VYblJcKfuSrQZN94M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b5fZ+QiPy/IPlQHqjq/UftWyBFb9U/6psv9mWA9wDT84gbfkdLr+w3eRdkDWGdZwd
 IMbi1z18YkfaltQfGH/dapMZ2cEUG2N3ZyP4k6JYJGcCSSN7IhGdFkU3cuRJJyxHGp
 zy+nptShUmMhdHOmrTLVDACNGBP4H6ogwGZ/6u7+90uckEGQoxoRq0BjrLhCbzAVoE
 OhXdc55y1hmZb1Pej1yc0fLgP3LtiqNiUhR28/oBO1ycMHHQpAKcSVuPn+2OEbh4sW
 olVBaw8Eukq6yRttYIQVfAcFTyH0pk00ZMMxkbcCkbjX/J/yxI7xfq4PKrVQDwNl2e
 x1OjUYgE/HhwA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 38FF817E0C96;
 Mon,  8 Sep 2025 12:20:08 +0200 (CEST)
Date: Mon, 8 Sep 2025 12:20:02 +0200
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
Message-ID: <20250908122002.2c80dd3a@fedora>
In-Reply-To: <DCNAE3CJMEJ0.JH1F0MJABXQI@kernel.org>
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

On Mon, 08 Sep 2025 10:47:25 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Sep 8, 2025 at 10:26 AM CEST, Alice Ryhl wrote:
> > On Mon, Sep 08, 2025 at 09:11:40AM +0200, Boris Brezillon wrote:  
> >> Hi Alice,
> >> 
> >> On Sun, 7 Sep 2025 11:39:41 +0000
> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >>   
> >> > Yeah I guess we could have unlink remove the gpuva, but then allow the
> >> > end-user to attach the gpuva to a list of gpuvas to kfree deferred. That
> >> > way, the drm_gpuva_unlink() is not deferred but any resources it has can
> >> > be.  
> >> 
> >> This ^.
> >>   
> >> > 
> >> > Of course, this approach also makes deferred gpuva cleanup somewhat
> >> > orthogonal to this patch.  
> >> 
> >> Well, yes and no, because if you go for gpuva deferred cleanup, you
> >> don't really need the fancy kref_put() you have in this patch, it's
> >> just a regular vm_bo_put() that's called in the deferred gpuva path on
> >> the vm_bo attached to the gpuva being released.  
> >
> > Ok, so what you suggest is that on gpuva_unlink() we remove the gpuva
> > from the vm_bo's list, but then instead of putting the vm_bo's refcount,
> > we add the gpuva to a list, and in the deferred cleanup codepath we
> > iterate gpuvas and drop vm_bo refcounts *at that point*. Is that
> > understood correctly?  
> 
> It has to be a special unlink function though, since otherwise
> 
> 	drm_gpuva_link();
> 	drm_gpuva_unlink();
> 	drm_gpuva_link();
> 	drm_gpuva_unlink();
> 
> leaks the VM_BO.

I'm not following. Yes there's going to be a
drm_gpuva_unlink_defer_put() that skips the

        va->vm_bo = NULL;
        drm_gpuvm_bo_put(vm_bo);

and adds the gpuva to a list for deferred destruction. But I'm not
seeing where the leak is. Once the gpuva has been put in this list,
there should be no existing component referring to this object, and it's
going to be destroyed or recycled, but not re-used as-is.


> Sounds a bit messy, but my concern is really about the below:
> 
> > That means we don't immediately remove the vm_bo from the gem.gpuva
> > list, but the gpuva list in the vm_bo will be empty. I guess you already
> > have to handle such vm_bos anyway since you can already have an empty
> > vm_bo in between vm_bo_obtain() and the first call to gpuva_link().
> >
> > One disadvantage is that we might end up preparing or unevicting a GEM
> > object that doesn't have any VAs left, which the current approach
> > avoids.  
> 
> Yeah, we really want to avoid that.

I think I agree that we want to avoid it, but I'm not too sure about
the solution that involves playing with vm_bo::kref. I'm particularly
worried by the fact drivers can iterate the evict/extobj lists
directly, and can thus see objects scheduled for destruction. I know
there's a gpuvm_bo_is_dead() helper, and drivers should be aware of the
risks, but I don't feel comfortable about this.

And since we've mentioned the possibility of having to support
gpuva destruction deferral too, I'm wondering it wouldn't be cleaner
to just go for this approach from the start (gpuva owns a ref to a
vm_bo, which gets released when the gpuva object is released).
