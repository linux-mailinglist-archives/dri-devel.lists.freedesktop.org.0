Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7096FF101
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 14:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C989210E0CF;
	Thu, 11 May 2023 12:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36AC10E0CF;
 Thu, 11 May 2023 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683806574; x=1715342574;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pgKwgNGYg+F+j98b2qPTjWsB/OPTbOcSNjg9AVmnpys=;
 b=NWf8wbNjS+7DXLiRUZY9AMC5Jek6cJJxBAs2v1PqXzUg68gPToMDLXa5
 Ath38zVF63ClVIDgRpPlgnGYDEnfG2t60kIYRF+NvnTI+7yF9kr2rczOY
 FDrZ6M23OP2wa7n9hBq+Rm86ldrN7OxjfvkWRs7FYQ0x86mWGQw3LHiLa
 0HXS/U6DuLXnMBNtr4xe8TbeKpqsh+Wsv+tY7LaAkj2kpCHCkoqe374En
 svclQshGpEeEsju0i90v31chxTxxOzu+MevFDQymlJIu8+JYlXZKFoIgs
 ZAT6HWaw1Jj9mx0AO0Y0p2DnPLH/SsG8cLUFV/ugcepAOfc4H5tpTE9Yb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436810423"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="436810423"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:02:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873957221"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="873957221"
Received: from thenehan-mobl1.ger.corp.intel.com (HELO [10.213.214.244])
 ([10.213.214.244])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:02:52 -0700
Message-ID: <5c7abe53-aa76-e16d-4276-e53d8138bc55@linux.intel.com>
Date: Thu, 11 May 2023 13:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v7 2/2] drm/i915: use pat_index instead of
 cache_level
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230508234854.4028658-1-fei.yang@intel.com>
 <20230508234854.4028658-3-fei.yang@intel.com>
 <1eba1d94-427e-c8fe-9d58-69b52d1545e4@linux.intel.com>
 <SN6PR11MB25746DE12E35850DF6772BA29A769@SN6PR11MB2574.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <SN6PR11MB25746DE12E35850DF6772BA29A769@SN6PR11MB2574.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/05/2023 18:12, Yang, Fei wrote:
>  > On 09/05/2023 00:48, fei.yang@intel.com wrote:
>  >> From: Fei Yang <fei.yang@intel.com>
>  >>
>  >> Currently the KMD is using enum i915_cache_level to set caching 
> policy for
>  >> buffer objects. This is flaky because the PAT index which really 
> controls
>  >> the caching behavior in PTE has far more levels than what's defined 
> in the
>  >> enum. In addition, the PAT index is platform dependent, having to 
> translate
>  >> between i915_cache_level and PAT index is not reliable, and makes 
> the code
>  >> more complicated.
>  >>
>  >> From UMD's perspective there is also a necessity to set caching 
> policy for
>  >> performance fine tuning. It's much easier for the UMD to directly 
> use PAT
>  >> index because the behavior of each PAT index is clearly defined in 
> Bspec.
>  >> Having the abstracted i915_cache_level sitting in between would only 
> cause
>  >> more ambiguity. PAT is expected to work much like MOCS already works 
> today,
>  >> and by design userspace is expected to select the index that exactly
>  >> matches the desired behavior described in the hardware specification.
>  >>
>  >> For these reasons this patch replaces i915_cache_level with PAT 
> index. Also
>  >> note, the cache_level is not completely removed yet, because the KMD 
> still
>  >> has the need of creating buffer objects with simple cache settings 
> such as
>  >> cached, uncached, or writethrough. For kernel objects, cache_level 
> is used
>  >> for simplicity and backward compatibility. For Pre-gen12 platforms 
> PAT can
>  >> have 1:1 mapping to i915_cache_level, so these two are 
> interchangeable. see
>  >> the use of LEGACY_CACHELEVEL.
>  >>
>  >> One consequence of this change is that gen8_pte_encode is no longer 
> working
>  >> for gen12 platforms due to the fact that gen12 platforms has 
> different PAT
>  >> definitions. In the meantime the mtl_pte_encode introduced 
> specfically for
>  >> MTL becomes generic for all gen12 platforms. This patch renames the MTL
>  >> PTE encode function into gen12_pte_encode and apply it to all gen12. 
> Even
>  >> though this change looks unrelated, but separating them would 
> temporarily
>  >> break gen12 PTE encoding, thus squash them in one patch.
>  >>
>  >> Special note: this patch changes the way caching behavior is 
> controlled in
>  >> the sense that some objects are left to be managed by userspace. For 
> such
>  >> objects we need to be careful not to change the userspace settings.There
>  >> are kerneldoc and comments added around obj->cache_coherent, 
> cache_dirty,
>  >> and how to bypass the checkings by i915_gem_object_has_cache_level. For
>  >> full understanding, these changes need to be looked at together with the
>  >> two follow-up patches, one disables the {set|get}_caching ioctl's 
> and the
>  >> other adds set_pat extension to the GEM_CREATE uAPI.
>  >>
>  >> Bspec: 63019
>  >>
>  >> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>  >> Signed-off-by: Fei Yang <fei.yang@intel.com>
>  >> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>  >> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

[snip]

>  >> +                                          node.start,
>  >> +                                          i915_gem_get_pat_index(i915,
>  >> +                                                                 
> I915_CACHE_NONE), 0);
>  >>                        wmb(); /* flush modifications to the GGTT 
> (insert_page) */
>  >>                } else {
>  >>                        page_base += offset & PAGE_MASK;
>  >> @@ -1142,6 +1148,19 @@ int i915_gem_init(struct drm_i915_private 
> *dev_priv)
>  >>        unsigned int i;
>  >>        int ret;
>  >>
>  >> +     /*
>  >> +      * In the proccess of replacing cache_level with pat_index a 
> tricky
>  >> +      * dependency is created on the definition of the enum 
> i915_cache_level.
>  >> +      * in case this enum is changed, PTE encode would be broken.
>  >
>  >_I_n
> 
> Sorry, what does this mean?

Start of sentence, capital 'i'.

[snip]

>  > With a pinky promise to improve this all in the near future I won't
>  > grumble to loudly. :) I haven't read all the details, I leave that to
>  > other reviewers, and also assuming some final tweaks as indicated above
>  > please.
> 
> Thanks for all the suggestions, really appreciated.
> May I add your Acked-by?

I can't make myself do it since I really don't like the design that 
much. That's why I said I will not grumble too loudly.

Jira for follow up clean since we both agreed something more elegant is 
possible would be appreciated though.

Regards,

Tvrtko
