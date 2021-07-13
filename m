Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842C3C73B1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 17:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4D06E0E1;
	Tue, 13 Jul 2021 15:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00636E0ED;
 Tue, 13 Jul 2021 15:55:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="231991311"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="231991311"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 08:55:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="459619088"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 13 Jul 2021 08:55:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 13 Jul 2021 18:55:15 +0300
Date: Tue, 13 Jul 2021 18:55:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: document caching related bits
Message-ID: <YO23Y3PUS22FaXDC@intel.com>
References: <20210713104554.2381406-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210713104554.2381406-1-matthew.auld@intel.com>
X-Patchwork-Hint: comment
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 11:45:50AM +0100, Matthew Auld wrote:
> +	/**
> +	 * @cache_coherent:
> +	 *
> +	 * Track whether the pages are coherent with the GPU if reading or
> +	 * writing through the CPU cache.
> +	 *
> +	 * This largely depends on the @cache_level, for example if the object
> +	 * is marked as I915_CACHE_LLC, then GPU access is coherent for both
> +	 * reads and writes through the CPU cache.
> +	 *
> +	 * Note that on platforms with shared-LLC support(HAS_LLC) reads through
> +	 * the CPU cache are always coherent, regardless of the @cache_level. On
> +	 * snooping based platforms this is not the case, unless the full
> +	 * I915_CACHE_LLC or similar setting is used.
> +	 *
> +	 * As a result of this we need to track coherency separately for reads
> +	 * and writes, in order to avoid superfluous flushing on shared-LLC
> +	 * platforms, for reads.
> +	 *
> +	 * I915_BO_CACHE_COHERENT_FOR_READ:
> +	 *
> +	 * When reading through the CPU cache, the GPU is still coherent. Note
> +	 * that no data has actually been modified here, so it might seem
> +	 * strange that we care about this.
> +	 *
> +	 * As an example, if some object is mapped on the CPU with write-back
> +	 * caching, and we read some page, then the cache likely now contains
> +	 * the data from that read. At this point the cache and main memory
> +	 * match up, so all good. But next the GPU needs to write some data to
> +	 * that same page. Now if the @cache_level is I915_CACHE_NONE and the
> +	 * the platform doesn't have the shared-LLC, then the GPU will
> +	 * effectively skip invalidating the cache(or however that works
> +	 * internally) when writing the new value.  This is really bad since the
> +	 * GPU has just written some new data to main memory, but the CPU cache
> +	 * is still valid and now contains stale data. As a result the next time
> +	 * we do a cached read with the CPU, we are rewarded with stale data.
> +	 * Likewise if the cache is later flushed, we might be rewarded with
> +	 * overwriting main memory with stale data.
> +	 *
> +	 * I915_BO_CACHE_COHERENT_FOR_WRITE:
> +	 *
> +	 * When writing through the CPU cache, the GPU is still coherent. Note
> +	 * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> +	 *
> +	 * This is never set when I915_CACHE_NONE is used for @cache_level,
> +	 * where instead we have to manually flush the caches after writing
> +	 * through the CPU cache. For other cache levels this should be set and
> +	 * the object is therefore considered coherent for both reads and writes
> +	 * through the CPU cache.

I don't remember why we have this read vs. write split and this new
documentation doesn't seem to really explain it either.

Is it for optimizing some display related case where we can omit the
invalidates but still have to do the writeback to keep the display
engine happy?

-- 
Ville Syrjälä
Intel
