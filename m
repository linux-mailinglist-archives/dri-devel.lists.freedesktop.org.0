Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C030DB488A4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEEC10E10C;
	Mon,  8 Sep 2025 09:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pLVc7lYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A251910E10C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757324239;
 bh=WlJblooR4r8w7l/04ljXstHrZImkNxyr3pKUtvaZN8I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pLVc7lYw4/8zHpqX2uEat5I3jva1TgXMaKqpWRCq+odrPSlNNEiE686aGQxoTod0e
 +gFQv8Nge63beMhhXGIutalzJLe6uS7m5Gf6fO7oGDdB7MGe37ZyIKhVHu3dw6md7q
 +pAevO8WZMVcGk1Po57wU2H8AxHfEKG2mcaSuzsGnSve4IO9/LwpIu3VSmEYI2Re4K
 5DevsulsOCNYWLcr2t241CuqoY+1mQh2Frl3FPtRO4pnBdBjGuB1ruZcCZAdv/U8UH
 kJ0a0W2pQWQzf15imPosSYIXkHqa5/iiw2NvQ9AkCP0esgIyVBzT/E6wYrp2QioDca
 fsL8HSonYCQOg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C28117E0EB8;
 Mon,  8 Sep 2025 11:37:18 +0200 (CEST)
Date: Mon, 8 Sep 2025 11:37:13 +0200
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
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
Message-ID: <20250908113713.34e57f16@fedora>
In-Reply-To: <aL6TJYRmWIkQXujj@google.com>
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org>
 <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org>
 <aL1u_YxOkuj1kIq6@google.com> <20250908091140.44856fde@fedora>
 <aL6TJYRmWIkQXujj@google.com>
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

On Mon, 8 Sep 2025 08:26:13 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Sep 08, 2025 at 09:11:40AM +0200, Boris Brezillon wrote:
> > Hi Alice,
> > 
> > On Sun, 7 Sep 2025 11:39:41 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >   
> > > Yeah I guess we could have unlink remove the gpuva, but then allow the
> > > end-user to attach the gpuva to a list of gpuvas to kfree deferred. That
> > > way, the drm_gpuva_unlink() is not deferred but any resources it has can
> > > be.  
> > 
> > This ^.
> >   
> > > 
> > > Of course, this approach also makes deferred gpuva cleanup somewhat
> > > orthogonal to this patch.  
> > 
> > Well, yes and no, because if you go for gpuva deferred cleanup, you
> > don't really need the fancy kref_put() you have in this patch, it's
> > just a regular vm_bo_put() that's called in the deferred gpuva path on
> > the vm_bo attached to the gpuva being released.  
> 
> Ok, so what you suggest is that on gpuva_unlink() we remove the gpuva
> from the vm_bo's list, but then instead of putting the vm_bo's refcount,
> we add the gpuva to a list, and in the deferred cleanup codepath we
> iterate gpuvas and drop vm_bo refcounts *at that point*. Is that
> understood correctly?

Yes, that's what I'm suggesting.

> 
> That means we don't immediately remove the vm_bo from the gem.gpuva
> list, but the gpuva list in the vm_bo will be empty. I guess you already
> have to handle such vm_bos anyway since you can already have an empty
> vm_bo in between vm_bo_obtain() and the first call to gpuva_link().
> 
> One disadvantage is that we might end up preparing or unevicting a GEM
> object that doesn't have any VAs left, which the current approach
> avoids.

Fair enough, though, as you said, the unnecessary ::prepare() already
exists in the "queue-map-operation" path, because the object is added
to the extobj list as soon as vm_bo_obtain() is called, not at _map()
time. This being said, I don't know if it really matters in practice,
because:

1. if buffer eviction happens too often, the system will already suffer
   from the constant swapout/swapin already, it's not a single buffer
   that's going to make a difference
2. hopefully the buffer will be gone before the next job is submitted
   most of the time
3. we can flush the gpuva destruction list before preparing/unevicting
   GEM objects, so we don't end up processing vm_bos that no longer
   exist. Actually, I think this step is good to have regardless
   of what we decide here, because the less elements we have to iterate
   the better, and in the submit path, we've already acquired all
   GEM locks to do that cleanup, so we're probably better off doing it
   right away.

> 
> > > One annoying part is that we don't have an gpuvm ops operation for
> > > freeing gpuva, and if we add one for this, it would *only* be used in
> > > this case as most drivers explicitly kfree gpuvas, which could be
> > > confusing for end-users.  
> > 
> > Also not sure ::vm_bo_free() was meant to be used like that. It was for
> > drivers that need to control the drm_gpuvm_bo allocation, not those
> > that rely on the default implementation (kmalloc). Given how things
> > are described in the the doc, it feels weird to have a ::vm_bo_free()
> > without ::vm_bo_alloc(). So, if we decide to go this way (which I'm
> > still not convinced we should, given ultimately we might want to defer
> > gpuvas cleanup), the ::vm_bo_free() doc should be extended to cover
> > this 'deferred vm_bo free' case.  
> 
> I can implement vm_bo_alloc() too, but I think it seems like a pretty
> natural way to use vm_bo_free().

Not necessarily saying we should have a vm_bo_alloc(), just saying it
feels weird as it is now because of the asymmetry and how things are
described in the doc.
