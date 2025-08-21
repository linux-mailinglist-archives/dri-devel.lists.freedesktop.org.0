Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E88B2F733
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC2E10E948;
	Thu, 21 Aug 2025 11:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ly8rgEvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEC510E948;
 Thu, 21 Aug 2025 11:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755777284;
 bh=69wzCZHhSFHeHuTH3cr2PUYgHqtI+f+GALGK+wokVyA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ly8rgEvX5U+tO7SJMmv4YFydyn0vAw3UgGN9Bx2xeLJA5ukPvo3AsnW6jngbMxY+N
 lKez3ppvehdP16jThVFB4BjSU9smlrCz50csvQJA989iC1n8oX+lc+TXvjdNMKveBd
 ILd9DPlfPzlvVTSOMKPpT3sCrzyqYFWnS2g7jHC7R69oDiG3xAaO4GJ/7z7x6JQswH
 h7cIxm7z2uUZj71qJIEzgqj4Tkiq7UuJ38zd9DeerR9Tp9rxEhHkXuMaUJ/5OXOYkN
 fH21M9MwIPuYBCT4FwQinAJOwGQWfQPTAVp7QdLJ1+Miy5lvb+fUDqnBVskzT0s/GA
 VVCum848K4ViA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EF55C17E127B;
 Thu, 21 Aug 2025 13:54:43 +0200 (CEST)
Date: Thu, 21 Aug 2025 13:54:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Cc: Caterina Shablia <caterina.shablia@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v4 4/7] drm/gpuvm: Add a helper to check if two VA can
 be merged
Message-ID: <20250821135437.499d9a6a@fedora>
In-Reply-To: <bvoiomc5x7cbyc4l35rbideznuyw557u2ttp7utoifaxs27j3m@6mc7ya7asmpy>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-5-caterina.shablia@collabora.com>
 <bvoiomc5x7cbyc4l35rbideznuyw557u2ttp7utoifaxs27j3m@6mc7ya7asmpy>
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

On Tue, 22 Jul 2025 20:17:14 +0100
Adrian Larumbe <adrian.larumbe@collabora.com> wrote:

> On 07.07.2025 17:04, Caterina Shablia wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > We are going to add flags/properties that will impact the VA merging
> > ability. Instead of sprinkling tests all over the place in
> > __drm_gpuvm_sm_map(), let's add a helper aggregating all these checks
> > can call it for every existing VA we walk through in the
> > __drm_gpuvm_sm_map() loop.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 47 +++++++++++++++++++++++++++++--------
> >  1 file changed, 37 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 05978c5c38b1..dc3c2f906400 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -2098,12 +2098,48 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
> >  	return fn->sm_step_unmap(&op, priv);
> >  }
> >
> > +static bool can_merge(struct drm_gpuvm *gpuvm, const struct drm_gpuva *a,
> > +		      const struct drm_gpuva *b)
> > +{
> > +	/* Only GEM-based mappings can be merged, and they must point to
> > +	 * the same GEM object.
> > +	 */
> > +	if (a->gem.obj != b->gem.obj || !a->gem.obj)
> > +		return false;
> > +
> > +	/* Let's keep things simple for now and force all flags to match. */
> > +	if (a->flags != b->flags)
> > +		return false;
> > +
> > +	/* Order VAs for the rest of the checks. */
> > +	if (a->va.addr > b->va.addr)
> > +		swap(a, b);
> > +
> > +	/* We assume the caller already checked that VAs overlap or are
> > +	 * contiguous.
> > +	 */
> > +	if (drm_WARN_ON(gpuvm->drm, b->va.addr > a->va.addr + a->va.range))
> > +		return false;
> > +
> > +	/* We intentionally ignore u64 underflows because all we care about
> > +	 * here is whether the VA diff matches the GEM offset diff.
> > +	 */
> > +	return b->va.addr - a->va.addr == b->gem.offset - a->gem.offset;  
> 
> If we're reordering the VAs for the rest of the checks, when could underflow happen?

I think this comments predates the re-ordering (I originally tried not
to order VAs).

> 
> > +}
> > +
> >  static int
> >  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  		   const struct drm_gpuvm_ops *ops, void *priv,
> >  		   const struct drm_gpuvm_map_req *req)
> >  {
> >  	struct drm_gpuva *va, *next;
> > +	struct drm_gpuva reqva = {
> > +		.va.addr = req->va.addr,
> > +		.va.range = req->va.range,
> > +		.gem.offset = req->gem.offset,
> > +		.gem.obj = req->gem.obj,
> > +		.flags = req->flags,
> > +	};
> >  	u64 req_end = req->va.addr + req->va.range;
> >  	int ret;
> >
> > @@ -2116,12 +2152,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  		u64 addr = va->va.addr;
> >  		u64 range = va->va.range;
> >  		u64 end = addr + range;
> > -		bool merge = !!va->gem.obj;
> > +		bool merge = can_merge(gpuvm, va, &reqva);
> >
> >  		if (addr == req->va.addr) {
> > -			merge &= obj == req->gem.obj &&
> > -				 offset == req->gem.offset;
> > -
> >  			if (end == req_end) {
> >  				ret = op_unmap_cb(ops, priv, va, merge);
> >  				if (ret)
> > @@ -2163,8 +2196,6 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  			};
> >  			struct drm_gpuva_op_unmap u = { .va = va };
> >
> > -			merge &= obj == req->gem.obj &&
> > -				 offset + ls_range == req->gem.offset;
> >  			u.keep = merge;
> >
> >  			if (end == req_end) {
> > @@ -2196,10 +2227,6 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  				break;
> >  			}
> >  		} else if (addr > req->va.addr) {
> > -			merge &= obj == req->gem.obj &&
> > -				 offset == req->gem.offset +
> > -					   (addr - req->va.addr);
> > -
> >  			if (end == req_end) {
> >  				ret = op_unmap_cb(ops, priv, va, merge);
> >  				if (ret)
> > --
> > 2.47.2  
> 
> 
> Adrian Larumbe

