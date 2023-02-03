Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F55368A109
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 18:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40D910E82E;
	Fri,  3 Feb 2023 17:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C4710E82E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 17:58:26 +0000 (UTC)
Received: from maud (138-51-85-230-lsn-2.nat.utoronto.ca [138.51.85.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A13C56602F11;
 Fri,  3 Feb 2023 17:58:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675447104;
 bh=lHh3b0J2Bxr2EVTnfth5avdeJphwHu0Hi2Ax26RGEDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZ/phMfeENodnj2myfZETCgE+MVZjHmz0klP/HkgynCWFO9HeYsmF/fX1ybfzE47/
 iAkw/PAnoLsUVvDsEG9wElk3zDlbR2aKtaR+ViD4MxxocyIdk9dDIt+w9kpP510/zC
 YVmSHSywZf7p4pBmgyBcH6irX6cUCSOtKHt+6q0WkCg87awAb0hJz0/qI2+UJdEG8A
 NISK9Ly2EHiGL0m7jZqr+wqSbnU51ndiARv3WuyPt0IALLKEClaZGXrY3GYvG32aRB
 1z1+VKtXvkZv3cAs7CmjMTFrPok7C4aIlgyS/P5ohwi7EbFsfjsBU22weCBXdR8eU6
 0JF/jNCrftsdw==
Date: Fri, 3 Feb 2023 12:58:19 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
Message-ID: <Y91LO6PdQep9FFY6@maud>
References: <20230201084832.1708866-1-boris.brezillon@collabora.com>
 <bf9a7562-796b-d39e-ef4b-deb8217484b4@arm.com>
 <20230203182956.4e7f8730@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203182956.4e7f8730@collabora.com>
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > +struct drm_pancsf_gpu_info {
> > > +#define DRM_PANCSF_ARCH_MAJOR(x)		((x) >> 28)
> > > +#define DRM_PANCSF_ARCH_MINOR(x)		(((x) >> 24) & 0xf)
> > > +#define DRM_PANCSF_ARCH_REV(x)			(((x) >> 20) & 0xf)
> > > +#define DRM_PANCSF_PRODUCT_MAJOR(x)		(((x) >> 16) & 0xf)
> > > +#define DRM_PANCSF_VERSION_MAJOR(x)		(((x) >> 12) & 0xf)
> > > +#define DRM_PANCSF_VERSION_MINOR(x)		(((x) >> 4) & 0xff)
> > > +#define DRM_PANCSF_VERSION_STATUS(x)		((x) & 0xf)
> > > +	__u32 gpu_id;
> > > +	__u32 gpu_rev;
> > > +#define DRM_PANCSF_CSHW_MAJOR(x)		(((x) >> 26) & 0x3f)
> > > +#define DRM_PANCSF_CSHW_MINOR(x)		(((x) >> 20) & 0x3f)
> > > +#define DRM_PANCSF_CSHW_REV(x)			(((x) >> 16) & 0xf)
> > > +#define DRM_PANCSF_MCU_MAJOR(x)			(((x) >> 10) & 0x3f)
> > > +#define DRM_PANCSF_MCU_MINOR(x)			(((x) >> 4) & 0x3f)
> > > +#define DRM_PANCSF_MCU_REV(x)			((x) & 0xf)
> > > +	__u32 csf_id;
> > > +	__u32 l2_features;
> > > +	__u32 tiler_features;
> > > +	__u32 mem_features;
> > > +	__u32 mmu_features;
> > > +	__u32 thread_features;
> > > +	__u32 max_threads;
> > > +	__u32 thread_max_workgroup_size;
> > > +	__u32 thread_max_barrier_size;
> > > +	__u32 coherency_features;
> > > +	__u32 texture_features[4];
> > > +	__u32 as_present;
> > > +	__u32 core_group_count;
> > > +	__u64 shader_present;
> > > +	__u64 l2_present;
> > > +	__u64 tiler_present;
> > > +};
> > > +
> > > +struct drm_pancsf_csif_info {
> > > +	__u32 csg_slot_count;
> > > +	__u32 cs_slot_count;
> > > +	__u32 cs_reg_count;
> > > +	__u32 scoreboard_slot_count;
> > > +	__u32 unpreserved_cs_reg_count;
> > > +};
> > > +
> > > +struct drm_pancsf_dev_query {
> > > +	/** @type: the query type (see enum drm_pancsf_dev_query_type). */
> > > +	__u32 type;
> > > +
> > > +	/**
> > > +	 * @size: size of the type being queried.
> > > +	 *
> > > +	 * If pointer is NULL, size is updated by the driver to provide the
> > > +	 * output structure size. If pointer is not NULL, the the driver will
> > > +	 * only copy min(size, actual_structure_size) bytes to the pointer,
> > > +	 * and update the size accordingly. This allows us to extend query
> > > +	 * types without breaking userspace.
> > > +	 */
> > > +	__u32 size;
> > > +
> > > +	/**
> > > +	 * @pointer: user pointer to a query type struct.
> > > +	 *
> > > +	 * Pointer can be NULL, in which case, nothing is copied, but the
> > > +	 * actual structure size is returned. If not NULL, it must point to
> > > +	 * a location that's large enough to hold size bytes.
> > > +	 */
> > > +	__u64 pointer;
> > > +};  
> > 
> > Genuine question: is there something wrong with the panfrost 'get_param'
> > ioctl where individual features are queried one-by-one, rather than
> > passing a big structure back to user space.
> 
> Well, I've just seen the Xe driver exposing things this way, and I thought
> it was a good idea, but I don't have a strong opinion here, and if others
> think it's preferable to stick to GET_PARAM, I'm fine with that too.

I vastly prefer the info struct, GET_PARAM isn't a great interface when
there are large numbers of properties to query... Actually I just
suggested to Lina that she adopt this approach for Asahi instead of the
current GET_PARAM ioctl we have (downstream for now).

It isn't a *big* deal but GET_PARAM doesn't really seem better on any
axes.

> > I ask because we've had issues in the past with trying to 'deprecate'
> > registers - if a new version of the hardware stops providing a
> > (meaningful) value for a register then it's hard to fix up the
> > structures.

I'm not sure this is a big deal. If the register no longer exists
(meaningfully), zero it out in the info structure and trust userspace to
interpret meaningfully based on the GPU. If registers are getting
dropped between revisions, that's obviously not great. But this should
only change at major architecture boundaries; I don't see the added
value of doing the interpretation in kernel instead of userspace. I say
this with my userspace hat on, of course ;-)

> > There is obviously overhead iterating over all the register that user
> > space cares about. Another option (used by kbase) is to return some form
> > of structured data so a missing property can be encoded.
> 
> I'll have a look at how kbase does that. Thanks for the pointer.

I'd be fine with the kbase approach but I don't really see the added
value over what Boris proposed in the RFC, tbh.
