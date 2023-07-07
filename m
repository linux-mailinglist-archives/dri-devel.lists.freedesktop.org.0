Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CED074B14F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C276110E581;
	Fri,  7 Jul 2023 12:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1B210E581;
 Fri,  7 Jul 2023 12:52:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DFB866606FCA;
 Fri,  7 Jul 2023 13:52:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688734365;
 bh=qDwANLQ61icK21USCiych8PHXsbfyaAg3fQVfsTFR0E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=boT51Xa27cuR67WqrDMmww5kmVhzhlbknsmSumNKNe2IMGQNPOAPwayNQiMid4Arm
 PCTi9I1uDsmSeinZi5hJgv1iZVciUExuTV8atQOoC/yizk9RwVG6MyE3ruNem4HUBk
 3FX5ogGMBHTxJBk92bd3zAhDwPTeLWhIBsTO1nUnmEjs4eDm2K5Xldn/ave9FEr57N
 vUukeiXBD0H9dTTUeWBRS38RYnx6MPjdWayiXBGCVurLNPe3gPAm8C/jtCWbTuPVnW
 53rsS7H9wLon79o5Pk63NH0cw74yWoqIISnsT1HUnJiwOlOkS0w5SGQzStyPMmjjZv
 Oth6cqLZl2npw==
Date: Fri, 7 Jul 2023 14:52:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230707145241.6ea73643@collabora.com>
In-Reply-To: <e92219d7-77f7-a40a-39d9-ea7afc5f3687@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <20230707130010.1bd5d41b@collabora.com>
 <e92219d7-77f7-a40a-39d9-ea7afc5f3687@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Jul 2023 14:41:23 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> >> +	     va__ && (va__->va.addr < (end__)) && \
> >> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
> >> +	     va__ = list_next_entry(va__, rb.entry))  
> > 
> > If you define:
> > 
> > static inline struct drm_gpuva *
> > drm_gpuva_next(struct drm_gpuva *va)
> > {
> > 	if (va && !list_is_last(&va->rb.entry, &va->mgr->rb.list))
> > 		return list_next_entry(va, rb.entry);
> > 
> > 	return NULL;
> > } >
> > the for loop becomes a bit more readable:  
> 
> Yes, it would. However, I don't want it to be confused with 
> drm_gpuva_find_next(). Maybe I should rename the latter to something 
> like drm_gpuva_find_next_neighbor() then.

If you want to keep drm_gpuva_find_next(), feel free to rename/prefix
the drm_gpuva_next() function. I was just posting it as a reference.

> 
> > 
> > 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
> > 	     va__ && (va__->va.addr < (end__)); \
> > 	     va__ = drm_gpuva_next(va__))
> >   
> >> +
> >> +/**
> >> + * drm_gpuva_for_each_va_range_safe - iternator to safely walk over a range of
> >> + * &drm_gpuvas
> >> + * @va__: &drm_gpuva to assign to in each iteration step
> >> + * @next__: another &drm_gpuva to use as temporary storage
> >> + * @mgr__: &drm_gpuva_manager to walk over
> >> + * @start__: starting offset, the first gpuva will overlap this
> >> + * @end__: ending offset, the last gpuva will start before this (but may
> >> + * overlap)
> >> + *
> >> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
> >> + * between @start__ and @end__. It is implemented similarly to
> >> + * list_for_each_safe(), but is using the &drm_gpuva_manager's internal interval
> >> + * tree to accelerate the search for the starting &drm_gpuva, and hence is safe
> >> + * against removal of elements. It assumes that @end__ is within (or is the
> >> + * upper limit of) the &drm_gpuva_manager. This iterator does not skip over the
> >> + * &drm_gpuva_manager's @kernel_alloc_node.
> >> + */
> >> +#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
> >> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)), \
> >> +	     next__ = va ? list_next_entry(va__, rb.entry) : NULL; \
> >> +	     va__ && (va__->va.addr < (end__)) && \
> >> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
> >> +	     va__ = next__, next__ = list_next_entry(va__, rb.entry))  
> > 
> > And this is the safe version using the drm_gpuva_next() helper:
> > 
> > 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
> > 	     next__ = drm_gpuva_next(va__); \
> > 	     va__ && (va__->va.addr < (end__)); \
> > 	     va__ = next__, next__ = drm_gpuva_next(va__))
> > 
> > Those changes fixed an invalid pointer access I had in the sm_unmap()
> > path.
> >   
> 
> Sorry you did run into this bug.

No worries, that's what testing/debugging/reviewing is for. And I'm glad
someone decided to work on this gpuva stuff so I don't have to code it
myself, so that's the least I can do.
