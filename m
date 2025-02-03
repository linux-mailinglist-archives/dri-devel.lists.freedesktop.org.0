Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AECA26112
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D81810E51A;
	Mon,  3 Feb 2025 17:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TYpzovAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F95610E517;
 Mon,  3 Feb 2025 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738602809;
 bh=ndkb6szgntNxZ1m9AzaW8Vv16UmmpDx4y5UikG7Io34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TYpzovAXni3oTIHKsbrXT52QeFbQ7JCzdlo4ZsE2L5ilPPt4pB4EJWIITFgZ0YDxI
 IU4cXOLO/cXPJb66JIWHWWHyVvwFVbsPs7oZUyCFUfTocxiv69pOdgZiVft+txaK1B
 LG49HiPaP/XGPwv+U5G9OSCnUbX32q7XXyU8W99afOSXXjA7YIv+GMmeton0BX6r1Z
 jyG6YmoU3ofsMz5kFzB0zmA2DqD9yJVTcuSwPTHg8tLmstNPVQsw4yUKXlzvmJ4BUw
 50iagQBD3YP4+b34D9cB3L3UtMFP95qENaAsRahy7kffzhKO9ybRwwGaZ6lZthg4Jn
 hC4Us2/1hLO5A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B1B9617E10C2;
 Mon,  3 Feb 2025 18:13:28 +0100 (CET)
Date: Mon, 3 Feb 2025 18:13:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@kernel.org>, asahi@lists.linux.dev, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Karol
 Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 akash.goel@arm.com
Subject: Re: [PATCH 0/4] drm/gpuvm: Add support for single-page-filled mappings
Message-ID: <20250203181321.3d8a0f8c@collabora.com>
In-Reply-To: <8659ac1f-3bb0-4891-b4ea-958a1a308c01@asahilina.net>
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
 <Z5-_O8vkCO0LXcl7@pollux.localdomain>
 <20250203102153.145229e0@collabora.com>
 <8659ac1f-3bb0-4891-b4ea-958a1a308c01@asahilina.net>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Mon, 3 Feb 2025 22:46:15 +0900
Asahi Lina <lina@asahilina.net> wrote:

> Hi,
> 
> On 2/3/25 6:21 PM, Boris Brezillon wrote:
> > +Akash with whom we've been discussing adding a 'REPEAT' mode to
> > drm_gpuvm/panthor.
> > 
> > On Sun, 2 Feb 2025 19:53:47 +0100
> > Danilo Krummrich <dakr@kernel.org> wrote:
> >   
> >> Hi Lina,
> >>
> >> On Sun, Feb 02, 2025 at 10:34:49PM +0900, Asahi Lina wrote:  
> >>> Some hardware requires dummy page mappings to efficiently implement
> >>> Vulkan sparse features. These mappings consist of the same physical
> >>> memory page, repeated for a large range of address space (e.g. 16GiB).
> >>>
> >>> Add support for this to drm_gpuvm. Currently, drm_gpuvm expects BO
> >>> ranges to correspond 1:1 to virtual memory ranges that are mapped, and
> >>> does math on the BO offset accordingly. To make single page mappings
> >>> work, we need a way to turn off that math, keeping the BO offset always
> >>> constant and pointing to the same page (typically BO offset 0).
> >>>
> >>> To make this work, we need to handle all the corner cases when these
> >>> mappings intersect with regular mappings. The rules are simply to never
> >>> mix or merge a "regular" mapping with a single page mapping.
> >>>
> >>> drm_gpuvm has support for a flags field in drm_gpuva objects. This is
> >>> normally managed by drivers directly. We can introduce a
> >>> DRM_GPUVA_SINGLE_PAGE flag to handle this. However, to make it work,
> >>> sm_map and friends need to know ahead of time whether the new mapping is
> >>> a single page mapping or not. Therefore, we need to add an argument to
> >>> these functions so drivers can provide the flags to be filled into
> >>> drm_gpuva.flags.
> >>>
> >>> These changes should not affect any existing drivers that use drm_gpuvm
> >>> other than the API change:
> >>>
> >>> - imagination: Does not use flags at all
> >>> - nouveau: Only uses drm_gpuva_invalidate(), which is only called on
> >>>   existing drm_gpuva objects (after the map steps)
> >>> - panthor: Does not use flags at all
> >>> - xe: Does not use drm_gpuva_init_from_op() or
> >>>   drm_gpuva_remap()/drm_gpuva_map() (which call it). This means that the
> >>> flags field of the gpuva object is managed by the driver only, so these
> >>> changes cannot clobber it.
> >>>
> >>> Note that the way this is implemented, drm_gpuvm does not need to know
> >>> the GPU page size. It only has to never do math on the BO offset to meet
> >>> the requirements.
> >>>
> >>> I suspect that after this change there could be some cleanup possible in
> >>> the xe driver (which right now passes flags around in various
> >>> driver-specific ways from the map step through to drm_gpuva objects),
> >>> but I'll leave that to the Xe folks.
> >>>
> >>> Signed-off-by: Asahi Lina <lina@asahilina.net>
> >>> ---
> >>> Asahi Lina (4):
> >>>       drm/gpuvm: Add a flags argument to drm_gpuvm_sm_map[_*]
> >>>       drm/gpuvm: Plumb through flags into drm_gpuva_op_map
> >>>       drm/gpuvm: Add DRM_GPUVA_SINGLE_PAGE flag and logic
> >>>       drm/gpuvm: Plumb through flags into drm_gpuva_init    
> >>
> >> Without looking into any details yet:
> >>
> >> This is a bit of tricky one, since we're not even close to having a user for
> >> this new feature upstream yet, are we?  
> > 
> > Actually, we would be interesting in having this feature hooked up in
> > panthor. One use case we have is Vulkan sparse bindings, of course. But
> > we also have cases where we need to map a dummy page repeatedly on the
> > FW side. The approach we've been considering is slightly different:
> > pass a DRM_GPUVA_REPEAT_FLAG along with GEM range, so we can repeat a
> > range of the GEM (see the below diff, which is completely untested by
> > the way), but I think we'd be fine with this SINGLE_PAGE flag.  
> 
> That sounds similar, though your patch does not handle gpuva
> splitting/remapping and all the other corner cases.

Indeed, I didn't really consider the remapping could be in the middle
of a repeated region, and I see how it complicates things.

> I think you'll find
> that once you handle those, the logic will become significantly more
> complicated, since you need to start storing the start offset within the
> repeat range on GPUVAs to be able to split them while keeping the
> mappings identical, and do modular arithmetic to keep it all consistent
> across all the corner cases.
> 
> If SINGLE_PAGE works for you then I would advocate for that.

I'm perfectly fine with that.

> It keeps
> complexity down to a minimum in drm_gpuvm. You can still have a range
> that's greater than one page in practice, you'd just have to handle it
> driver-internal and pass the desired range out of band as a flag or
> other field. For example, you could decide that the mapping is always
> congruent to the VA (GEM page offset = start offset + VA % range) and
> always treat SINGLE_PAGE mappings like that when you actually set up the
> page tables, or pass in an extra offset to be able to shift the phase of
> the mapping to whatever you want. You just need to ensure that, if you
> mix range sizes or other configuration, you don't do that for the same
> GEM BO at the same offset, so that the drm_gpuvm core does not wrongly
> consider them equivalent.
> 
> Maybe I should rename SINGLE_PAGE to something else, since it isn't
> technically limited to that as far as gpuvm is concerned. Something like
> FIXED_OFFSET?

FWIW, I think I prefer SINGLE_PAGE or REPEAT over FIXED_OFFSET. I mean,
the documentation should clear any confusion, but I like when names are
obvious enough that people can guess their purpose without having to go
read the doc, and I don't think FIXED_OFFSET is clear enough in this
regard.
