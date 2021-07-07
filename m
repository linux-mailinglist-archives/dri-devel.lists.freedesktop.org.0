Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F263BE056
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 02:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166AE6E7DD;
	Wed,  7 Jul 2021 00:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11C86E7DD;
 Wed,  7 Jul 2021 00:40:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209038526"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="209038526"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 17:40:15 -0700
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="427760290"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 17:40:11 -0700
Date: Wed, 7 Jul 2021 06:11:51 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 4/5] drm/i915/uapi: convert drm_i915_gem_set_domain to
 kernel doc
Message-ID: <20210707004151.GC26377@intel.com>
References: <20210705135310.1502437-1-matthew.auld@intel.com>
 <20210705135310.1502437-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210705135310.1502437-4-matthew.auld@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-05 at 14:53:09 +0100, Matthew Auld wrote:
> Convert all the drm_i915_gem_set_domain bits to proper kernel doc.

LGTM.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  include/uapi/drm/i915_drm.h | 34 +++++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index a4faceeb8c32..6f94e5e7569a 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -880,14 +880,42 @@ struct drm_i915_gem_mmap_offset {
>  	__u64 extensions;
>  };
>  
> +
> +/**
> + * struct drm_i915_gem_set_domain - Adjust the objects write or read domain, in
> + * preparation for accessing the pages via some CPU domain.
> + *
> + * Specifying a new write or read domain will flush the object out of the
> + * previous domain(if required), before then updating the objects domain
> + * tracking with the new domain.
> + *
> + * Note this might involve waiting for the object first if it is still active on
> + * the GPU.
> + *
> + * Supported values for @read_domains and @write_domain:
> + *
> + *	- I915_GEM_DOMAIN_WC: Uncached write-combined domain
> + *	- I915_GEM_DOMAIN_CPU: CPU cache domain
> + *	- I915_GEM_DOMAIN_GTT: Mappable aperture domain
> + *
> + * All other domains are rejected.
> + *
> + */
>  struct drm_i915_gem_set_domain {
> -	/** Handle for the object */
> +	/** @handle: Handle for the object. */
>  	__u32 handle;
>  
> -	/** New read domains */
> +	/**
> +	 * @read_domains: New read domains.
> +	 */
>  	__u32 read_domains;
>  
> -	/** New write domain */
> +	/**
> +	 * @write_domain: New write domain.
> +	 *
> +	 * Note that having something in the write domain implies it's in the
> +	 * read domain, and only that read domain.
> +	 */
>  	__u32 write_domain;
>  };
>  
> -- 
> 2.26.3
> 
