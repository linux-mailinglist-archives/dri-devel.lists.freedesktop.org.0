Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEBE4D1F8B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 18:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D701A10E205;
	Tue,  8 Mar 2022 17:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD42B10E289;
 Tue,  8 Mar 2022 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646762285; x=1678298285;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aHw/VEZHCid0Fkd+cLIMqhL7qRK0sJoC7cR57/zC4PA=;
 b=BQe2VYj+p5p4c3WpAZQnizUQyLMqz87r+HykqeiRUoHRkUd0U51RjdkF
 7a7tkKn7DfpUo+YPMIbQGQrhESJKMcKgtbP5ZiokwXYxDfwSJXXdQPn8N
 Z1Kp1Sc7n+UeEK9PAIEtwBkHUOi0mRJpKGTIb3q/kTGpvQrgGVimr9jWJ
 L/+JFxcyLr1eCWw3ks+Lm+w5OmS/PWqhunxpyGOZ2SY2Jtrie92vqU3kp
 dDpBulOG2iDZXWJRs94rY8S6mXqRtdTBbtgLxAwRk03GcHhNFSpV3Wlwp
 iBKPs52wvjRh9M3Jm7kLWae6C2YPQMhWhbhxmj6t2CNdDMZg8uKjxuoxT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254497373"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="254497373"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 09:58:04 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="632322446"
Received: from abagarwa-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.156.1])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 09:58:04 -0800
Date: Tue, 8 Mar 2022 09:58:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/gem: Remove logic for
 wbinvd_on_all_cpus
Message-ID: <20220308175803.pszuli2ms3e7tah3@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220222172649.331661-1-michael.cheng@intel.com>
 <20220222172649.331661-3-michael.cheng@intel.com>
 <40f820e6-6b28-fd8a-b058-13f0bbbf71fc@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40f820e6-6b28-fd8a-b058-13f0bbbf71fc@shipmail.org>
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
Cc: intel-gfx@lists.freedesktop.org, Michael Cheng <michael.cheng@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 08:24:31PM +0100, Thomas Hellström (Intel) wrote:
>Hi, Michael,
>
>On 2/22/22 18:26, Michael Cheng wrote:
>>This patch removes logic for wbinvd_on_all_cpus and brings in
>>drm_cache.h. This header has the logic that outputs a warning
>>when wbinvd_on_all_cpus when its being used on a non-x86 platform.
>>
>>Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>
>Linus has been pretty clear that he won't accept patches that add 
>macros that works on one arch and warns on others anymore in i915 and 
>I figure even less so in drm code.
>
>So we shouldn't try to move this out to drm. Instead we should 
>restrict the wbinvd() inside our driver to integrated and X86 only. 
>For discrete on all architectures we should be coherent and hence not 
>be needing wbinvd().

the warn is there to guarantee we don't forget a code path. However
simply adding the warning is the real issue: we should rather guarantee
we can't take that code path. I.e., as you said refactor the code to
guarantee it works on discrete without that logic.

	$ git grep wbinvd_on_all_cpus -- drivers/gpu/drm/
	drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
	drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
	drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())

	drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:      * Currently we just do a heavy handed wbinvd_on_all_cpus() here since
	drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:             wbinvd_on_all_cpus();

It looks like we actually go through this on other discrete graphics. Is
this missing an update like s/IS_DG1/IS_DGFX/? Or should we be doing
something else?

	drivers/gpu/drm/i915/gem/i915_gem_pm.c:#define wbinvd_on_all_cpus() \
	drivers/gpu/drm/i915/gem/i915_gem_pm.c:         wbinvd_on_all_cpus();

Those are for suspend. Revert ac05a22cd07a ("drm/i915/gem: Almagamate clflushes on suspend")
or extract that part to a helper function and implement it differently
for arches != x86?

	drivers/gpu/drm/i915/gem/i915_gem_pm.c: wbinvd_on_all_cpus();

Probably take a similar approach to the suspend case?

	drivers/gpu/drm/i915/gt/intel_ggtt.c:           wbinvd_on_all_cpus();

This one comes from 64b95df91f44 ("drm/i915: Assume exclusive access to objects inside resume")
Shouldn't that be doing the invalidate if the write domain is I915_GEM_DOMAIN_CPU


In the end I think the warning would be ok if it was the cherry on top,
to guarantee we don't take those paths. We should probably have a
warn_once() to avoid spamming the console. But we  also have to rework
the code to guarantee we are the only ones who may eventually get that
warning, and not the end user.

Lucas De Marchi

>
>Thanks,
>
>/Thomas
>
>
