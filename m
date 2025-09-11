Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD9B52FF3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEC810EA95;
	Thu, 11 Sep 2025 11:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kdRV6RbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B801210EA95
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757589513;
 bh=IY6irs1xcyfinm+ECQ+nwn7CQq/0lCo73oLaURZh2Lc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kdRV6RbF12GupEHynvvxuBmEHCmbvW9aQ497kWd1+uMnSVFmTh7041KRM2kGeZEJS
 FsrXgjgUt93JPRznoD3WO6AEuVekylI6EZnJ35PsnqjPoxS6cXbX0+IE05loUf+TkL
 P6abjFEmEChjx1tnURfWQTF2+h1NBVJX3rLvosohGUtFQt+8sTiUKvMh7AYOMuUfR+
 yTFRnSOyVOAz+xpXh3wcmjnHIdefpWqzf60sjG9xVZuJ2/7dbRvEs8AMnRB7bpmsHr
 UPH+ppC0RrOFq9kMiMCppfSPVzTzGXTPYUsuNJ5Q2Gy9fSOEZrOp6eg84UyfCYIGyR
 7fzjzfThn8Ptw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BACD917E0109;
 Thu, 11 Sep 2025 13:18:32 +0200 (CEST)
Date: Thu, 11 Sep 2025 13:18:17 +0200
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
Subject: Re: [PATCH v2 2/2] panthor: use drm_gpuva_unlink_defer()
Message-ID: <20250911131817.3e0ab0d0@fedora>
In-Reply-To: <aMKtuwdk2HsejS-Q@google.com>
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
 <20250909-vmbo-defer-v2-2-9835d7349089@google.com>
 <20250911121537.523195c5@fedora> <aMKtuwdk2HsejS-Q@google.com>
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

On Thu, 11 Sep 2025 11:08:43 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Thu, Sep 11, 2025 at 12:15:37PM +0200, Boris Brezillon wrote:
> > On Tue, 09 Sep 2025 13:36:23 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >   
> > >  static void panthor_vma_init(struct panthor_vma *vma, u32 flags)
> > > @@ -2084,12 +2010,12 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	/* Ref owned by the mapping now, clear the obj field so we don't release the
> > > -	 * pinning/obj ref behind GPUVA's back.
> > > -	 */
> > >  	drm_gpuva_map(&vm->base, &vma->base, &op->map);
> > >  	panthor_vma_link(vm, vma, op_ctx->map.vm_bo);
> > > +
> > > +	drm_gpuvm_bo_put_deferred(op_ctx->map.vm_bo);
> > >  	op_ctx->map.vm_bo = NULL;  
> > 
> > Hm, I don't see why we need a drm_gpuvm_bo_put_deferred() here. The
> > original idea was to delegate the vm_bo ownership to the VA being added
> > to the VM tree, so if we put it here, we have a UAF situation, don't we?  
> 
> The vm_bo refcount goes like this:
> 
> incr vm_bo_obtain()
> incr vma_link()
> decr vm_bo_put()
> 
> There is no decrement in panthor_vm_cleanup_op_ctx() due to this line:
> 
> 	op_ctx->map.vm_bo = NULL
> 
> So when everything is done, it is linked once and the refcount is
> incremented by one, which is correct.

Ah, right, I overlooked the change to panthor_vma_link() where you drop
the _put().
