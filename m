Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A8367F3DB
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 02:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513B210E2EC;
	Sat, 28 Jan 2023 01:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C1A10E2E2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 01:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674870679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+3TIqExVGcGxVe/8EWwTMzK7X2Z27cVPvc4/0mzpd+A=;
 b=bC0VDejuexEB0UvV7MD2sgAo4s2gpUtP8eKAau176YQjsxih/27h9uWNNpZ8eCkTw/D2jE
 zplmbcbENcDj8OTx7w7/3qKKELO9LOIVZ/l6mD/NmHLskwgAig9b2J62Lsjo1rZJhEIAG/
 wR9tehOvk2flcHNpMGO1yLEt2/pBsZo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-pXdpBuuCMPOxRBroO_S_hQ-1; Fri, 27 Jan 2023 20:51:18 -0500
X-MC-Unique: pXdpBuuCMPOxRBroO_S_hQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 fx8-20020a170906b74800b00877a89f965aso4379601ejb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 17:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+3TIqExVGcGxVe/8EWwTMzK7X2Z27cVPvc4/0mzpd+A=;
 b=Q/+tadsXFjASaDY6MtSAtW/HsDzz70c77NyCvvBDnnsveRckpqZoUjJltG9CEqUy2e
 UXTYKMnb7D3XoaulwmUasKaBHNNywCo8Y/8wkYLlQ/K5wODBy3oz3+Dnr8slSsDJIpaR
 S7VOWeTOr1KojjveScc7QVXwlM7piGkqN3Fz90a4DeDogjAFSFHUtxZGqQEhPkNbDBZu
 1Hl8nw67x/T4p93+1xs45VbbfxmYUU1/FXyjQYV2RNZmhcWlK2EimUJBbrA7CflZqx0u
 bLDGc7egZPLBAdyU9dsY1OLtcvkAnkrO+P5/5FFr/fekS57MpVGuJOBXFl5M94xubFJE
 LelA==
X-Gm-Message-State: AO0yUKXUr3yEmbO8Mbn/La+U3qjKaJm5tCN0/BDnJuCYjLwu0FWl6T+t
 7D7N/psEglcMN0h6SAt7TtLfTgvWGxD+34GI1qnqxzl3iblHJ9VGcIWCYLUpp2fupedId0eDTHc
 nbr6gIgDmF/K3OX5iGd3kQXmESU0S
X-Received: by 2002:a17:906:88b:b0:878:7cf1:e370 with SMTP id
 n11-20020a170906088b00b008787cf1e370mr7005443eje.15.1674870677133; 
 Fri, 27 Jan 2023 17:51:17 -0800 (PST)
X-Google-Smtp-Source: AK7set+w2BHBBxT7rfKOUmgeNEoIwf21pBj+8awMzMRygBkrq923MraXcCw0MqkbTxIYDwEI9X3C2Q==
X-Received: by 2002:a17:906:88b:b0:878:7cf1:e370 with SMTP id
 n11-20020a170906088b00b008787cf1e370mr7005431eje.15.1674870676860; 
 Fri, 27 Jan 2023 17:51:16 -0800 (PST)
Received: from WINDOWS. ([2a02:810d:4b3f:de78:34ca:d547:b407:3c1c])
 by smtp.gmail.com with ESMTPSA id
 gn19-20020a1709070d1300b008512e1379dbsm3235152ejc.171.2023.01.27.17.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 17:51:16 -0800 (PST)
Message-ID: <63d47f94.170a0220.fe009.d8bb@mx.google.com>
X-Google-Original-Message-ID: <Y9R/knMUJhxC/DX8@WINDOWS.>
Date: Sat, 28 Jan 2023 02:51:14 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH drm-next 03/14] drm: manager to keep track of GPUs VA
 mappings
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-4-dakr@redhat.com>
 <Y9MZp2Uu2xwVBO2d@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
In-Reply-To: <Y9MZp2Uu2xwVBO2d@DUT025-TGLU.fm.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 12:24:07AM +0000, Matthew Brost wrote:
> On Wed, Jan 18, 2023 at 07:12:45AM +0100, Danilo Krummrich wrote:
> > This adds the infrastructure for a manager implementation to keep track
> > of GPU virtual address (VA) mappings.
> > 
> > New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> > start implementing, allow userspace applications to request multiple and
> > arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> > intended to serve the following purposes in this context.
> > 
> > 1) Provide a dedicated range allocator to track GPU VA allocations and
> >    mappings, making use of the drm_mm range allocator.
> > 
> > 2) Generically connect GPU VA mappings to their backing buffers, in
> >    particular DRM GEM objects.
> > 
> > 3) Provide a common implementation to perform more complex mapping
> >    operations on the GPU VA space. In particular splitting and merging
> >    of GPU VA mappings, e.g. for intersecting mapping requests or partial
> >    unmap requests.
> > 
> > Idea-suggested-by: Dave Airlie <airlied@redhat.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> <snip>
> 
> > +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> 
> <snip>
> 
> > +struct drm_gpuva *
> > +drm_gpuva_find(struct drm_gpuva_manager *mgr,
> > +	       u64 addr, u64 range)
> > +{
> > +	struct drm_gpuva *va;
> > +
> > +	drm_gpuva_for_each_va_in_range(va, mgr, addr, range) {
> 
> Last argument should be: range + addr, right?
> 

Thanks, good catch.

> > +		if (va->node.start == addr &&
> > +		    va->node.size == range)
> > +			return va;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_find);
> > +
> > +/**
> > + * drm_gpuva_find_prev - find the &drm_gpuva before the given address
> > + * @mgr: the &drm_gpuva_manager to search in
> > + * @start: the given GPU VA's start address
> > + *
> > + * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
> > + *
> > + * Note that if there is any free space between the GPU VA mappings no mapping
> > + * is returned.
> > + *
> > + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> > + */
> > +struct drm_gpuva *
> > +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
> > +{
> > +	struct drm_mm_node *node;
> > +
> > +	if (start <= mgr->mm_start ||
> > +	    start > (mgr->mm_start + mgr->mm_range))
> > +		return NULL;
> > +
> > +	node = __drm_mm_interval_first(&mgr->va_mm, start - 1, start);
> > +	if (node == &mgr->va_mm.head_node)
> > +		return NULL;
> > +
> > +	return (struct drm_gpuva *)node;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_find_prev);
> > +
> > +/**
> > + * drm_gpuva_find_next - find the &drm_gpuva after the given address
> > + * @mgr: the &drm_gpuva_manager to search in
> > + * @end: the given GPU VA's end address
> > + *
> > + * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
> > + *
> > + * Note that if there is any free space between the GPU VA mappings no mapping
> > + * is returned.
> > + *
> > + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> > + */
> > +struct drm_gpuva *
> > +drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
> > +{
> > +	struct drm_mm_node *node;
> > +
> > +	if (end < mgr->mm_start ||
> > +	    end >= (mgr->mm_start + mgr->mm_range))
> > +		return NULL;
> > +
> > +	node = __drm_mm_interval_first(&mgr->va_mm, end, end + 1);
> > +	if (node == &mgr->va_mm.head_node)
> > +		return NULL;
> > +
> > +	return (struct drm_gpuva *)node;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_find_next);
> > +
> > +/**
> > + * drm_gpuva_region_insert - insert a &drm_gpuva_region
> > + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> > + * @reg: the &drm_gpuva_region to insert
> > + * @addr: the start address of the GPU VA
> > + * @range: the range of the GPU VA
> > + *
> > + * Insert a &drm_gpuva_region with a given address and range into a
> > + * &drm_gpuva_manager.
> > + *
> > + * Returns: 0 on success, negative error code on failure.
> > + */
> > +int
> > +drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
> > +			struct drm_gpuva_region *reg,
> > +			u64 addr, u64 range)
> > +{
> > +	int ret;
> > +
> > +	ret = drm_mm_insert_node_in_range(&mgr->region_mm, &reg->node,
> > +					  range, 0,
> > +					  0, addr,
> > +					  addr + range,
> > +					  DRM_MM_INSERT_LOW|
> > +					  DRM_MM_INSERT_ONCE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	reg->mgr = mgr;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_region_insert);
> > +
> > +/**
> > + * drm_gpuva_region_destroy - destroy a &drm_gpuva_region
> > + * @mgr: the &drm_gpuva_manager holding the region
> > + * @reg: the &drm_gpuva to destroy
> > + *
> > + * This removes the given &reg from the underlaying range allocator.
> > + */
> > +void
> > +drm_gpuva_region_destroy(struct drm_gpuva_manager *mgr,
> > +			 struct drm_gpuva_region *reg)
> > +{
> > +	struct drm_gpuva *va;
> > +
> > +	drm_gpuva_for_each_va_in_range(va, mgr,
> > +				       reg->node.start,
> > +				       reg->node.size) {
> 
> Last argument should be: reg->node.start + reg->node.size, right?

Thanks, pushed the fix to new-uapi-drm-next-fixes.

> 
> Matt
> 
> > +		WARN(1, "GPU VA region must be empty on destroy.\n");
> > +		return;
> > +	}
> > +
> > +	if (&reg->node == &mgr->kernel_alloc_node) {
> > +		WARN(1, "Can't destroy kernel reserved region.\n");
> > +		return;
> > +	}
> > +
> > +	drm_mm_remove_node(&reg->node);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_region_destroy);
> 

