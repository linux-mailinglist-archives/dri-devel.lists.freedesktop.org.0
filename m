Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8239EF7E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E716EAD1;
	Tue,  8 Jun 2021 07:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CE66EAD0;
 Tue,  8 Jun 2021 07:26:13 +0000 (UTC)
IronPort-SDR: 7Yg6wR7OKCcqTABQJBqq9I2Tk2UJUlSNdS4u48lPykdQ/5aZ19cjuuSAo8a1HB/THxUw4rGxmc
 4n2dvX1qryCg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="191898581"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="191898581"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:26:13 -0700
IronPort-SDR: DpzJw+QhUy01TxzSUWWyK/xL7EEADHuFh3ABYewH5Q+4ANAyKKv5VogFEXXanDVIlk92It8XEr
 fShPsOvUYOKQ==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="440361268"
Received: from delmer-mobl.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:26:11 -0700
Message-ID: <044baf68ef8e6fe11941fdb43a9ad404f46c6d3a.camel@linux.intel.com>
Subject: Re: [PATCH 4/6] drm/i915/ttm: pass along the I915_BO_ALLOC_CONTIGUOUS
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 08 Jun 2021 09:26:09 +0200
In-Reply-To: <20210607182210.99036-5-matthew.auld@intel.com>
References: <20210607182210.99036-1-matthew.auld@intel.com>
 <20210607182210.99036-5-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

On Mon, 2021-06-07 at 19:22 +0100, Matthew Auld wrote:
> Currently we just ignore the I915_BO_ALLOC_CONTIGUOUS flag, which is
> fine since everything is already contiguous with the ttm range
> manager.
> However in the next patch we want to switch over to the ttm buddy
> manager, where allocations are by default not contiguous.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 73d52df8f2be..0b0fce445e9b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -86,10 +86,18 @@ i915_ttm_select_tt_caching(const struct
> drm_i915_gem_object *obj)
>  
>  static void
>  i915_ttm_place_from_region(const struct intel_memory_region *mr,
> -                          struct ttm_place *place)
> +                          struct ttm_place *place,
> +                          unsigned int flags)
>  {
>         memset(place, 0, sizeof(*place));
>         place->mem_type = intel_region_to_ttm_type(mr);
> +
> +       switch(mr->type) {
> +       case INTEL_MEMORY_LOCAL:
> +               if (flags & I915_BO_ALLOC_CONTIGUOUS)
> +                       place->flags = TTM_PL_FLAG_CONTIGUOUS;
> +               break;
> +       }

Do we need to restrict this to INTEL_MEMORY_LOCAL? While it doesn't
currently make much sense for other memory regions, no point in not
forwarding for all?

/Thomas


