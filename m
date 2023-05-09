Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAD36FC49A
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 13:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B360810E387;
	Tue,  9 May 2023 11:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA5210E387;
 Tue,  9 May 2023 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683630539; x=1715166539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dXP6jE6h6gxYAw8DQHf88A0e90eMUD0J0N4hUUvMJ0M=;
 b=FOQTTg1lPmaoslH8kWqAjHwGjyWqOvRrYt6N5r7Sw8dC1iHPHp7qEw8P
 jFepRVVoullOrzNSPmuDr/IoeWPN+GygJFDyaOf+IHtTIZR59c9i8ShGJ
 C89E+fFjyD7ONeeAoaAzIVK/KuaaKAQ62zmpNaeNYWXyHqBKXbAIlvj1Z
 fjLzFJ/rSkZgEUlhdu78RmLqdlQUoOTmdIcJDCgsgwgc1QQ3hUb0Dw2YM
 ZMd4WSAshdCOds23jbPzuWUk7O93cvTY2wxb7IM2nka1y22aK7ySBlO6Q
 oHOKy20L+N09VXlJsK4ktyr109tD+66FlT5IBFpp25uGLvIhPX+tAqc26 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349932146"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="349932146"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 04:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="701802205"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="701802205"
Received: from aanokhov-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.38.157])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 04:08:55 -0700
Date: Tue, 9 May 2023 13:08:53 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [PATCH v7 2/2] drm/i915: use pat_index instead of cache_level
Message-ID: <ZFopxZtZAOfiEviI@ashyti-mobl2.lan>
References: <20230508234854.4028658-1-fei.yang@intel.com>
 <20230508234854.4028658-3-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508234854.4028658-3-fei.yang@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Mon, May 08, 2023 at 04:48:54PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Currently the KMD is using enum i915_cache_level to set caching policy for
> buffer objects. This is flaky because the PAT index which really controls
> the caching behavior in PTE has far more levels than what's defined in the
> enum. In addition, the PAT index is platform dependent, having to translate
> between i915_cache_level and PAT index is not reliable, and makes the code
> more complicated.
> 
> >From UMD's perspective there is also a necessity to set caching policy for
> performance fine tuning. It's much easier for the UMD to directly use PAT
> index because the behavior of each PAT index is clearly defined in Bspec.
> Having the abstracted i915_cache_level sitting in between would only cause
> more ambiguity. PAT is expected to work much like MOCS already works today,
> and by design userspace is expected to select the index that exactly
> matches the desired behavior described in the hardware specification.
> 
> For these reasons this patch replaces i915_cache_level with PAT index. Also
> note, the cache_level is not completely removed yet, because the KMD still
> has the need of creating buffer objects with simple cache settings such as
> cached, uncached, or writethrough. For kernel objects, cache_level is used
> for simplicity and backward compatibility. For Pre-gen12 platforms PAT can
> have 1:1 mapping to i915_cache_level, so these two are interchangeable. see
> the use of LEGACY_CACHELEVEL.
> 
> One consequence of this change is that gen8_pte_encode is no longer working
> for gen12 platforms due to the fact that gen12 platforms has different PAT
> definitions. In the meantime the mtl_pte_encode introduced specfically for
> MTL becomes generic for all gen12 platforms. This patch renames the MTL
> PTE encode function into gen12_pte_encode and apply it to all gen12. Even
> though this change looks unrelated, but separating them would temporarily
> break gen12 PTE encoding, thus squash them in one patch.
> 
> Special note: this patch changes the way caching behavior is controlled in
> the sense that some objects are left to be managed by userspace. For such
> objects we need to be careful not to change the userspace settings.There
> are kerneldoc and comments added around obj->cache_coherent, cache_dirty,
> and how to bypass the checkings by i915_gem_object_has_cache_level. For
> full understanding, these changes need to be looked at together with the
> two follow-up patches, one disables the {set|get}_caching ioctl's and the
> other adds set_pat extension to the GEM_CREATE uAPI.
> 
> Bspec: 63019
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> To be squashed

Ha! you forgot to remove this... I also do the same :)

No worries, if the patch is right I'll fix it before pushing it.

Tvrtko? Any opinion?

Andi
