Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568F240263C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 11:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C0F89F07;
	Tue,  7 Sep 2021 09:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E0889ED6;
 Tue,  7 Sep 2021 09:34:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="199679004"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="199679004"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 02:34:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="502905529"
Received: from ikcrook-mobl.amr.corp.intel.com (HELO [10.213.197.103])
 ([10.213.197.103])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 02:34:19 -0700
Subject: Re: [PATCH 2/2] drm/i915: Use Transparent Hugepages when IOMMU is
 enabled
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20210729133420.770672-1-tvrtko.ursulin@linux.intel.com>
 <20210729133420.770672-2-tvrtko.ursulin@linux.intel.com>
 <CAKMK7uE412nf5RisGBR2GrNsvgPH+omHv4K+m5McJv1t55DQMQ@mail.gmail.com>
 <c8aecd1e-f6d6-cec2-3352-e01c9427248b@linux.intel.com>
 <YTcmCSr5HJZDeRNH@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c58dd95e-3db0-9095-8f4e-bf3b9b6fda9c@linux.intel.com>
Date: Tue, 7 Sep 2021 10:34:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTcmCSr5HJZDeRNH@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 07/09/2021 09:42, Daniel Vetter wrote:
> On Fri, Sep 03, 2021 at 01:47:52PM +0100, Tvrtko Ursulin wrote:
>>
>> On 29/07/2021 15:06, Daniel Vetter wrote:
>>> On Thu, Jul 29, 2021 at 3:34 PM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Usage of Transparent Hugepages was disabled in 9987da4b5dcf
>>>> ("drm/i915: Disable THP until we have a GPU read BW W/A"), but since it
>>>> appears majority of performance regressions reported with an enabled IOMMU
>>>> can be almost eliminated by turning them on, lets just do that.
>>>>
>>>> To err on the side of safety we keep the current default in cases where
>>>> IOMMU is not active, and only when it is default to the "huge=within_size"
>>>> mode. Although there probably would be wins to enable them throughout,
>>>> more extensive testing across benchmarks and platforms would need to be
>>>> done.
>>>>
>>>> With the patch and IOMMU enabled my local testing on a small Skylake part
>>>> shows OglVSTangent regression being reduced from ~14% (IOMMU on versus
>>>> IOMMU off) to ~2% (same comparison but with THP on).
>>>>
>>>> v2:
>>>>    * Add Kconfig dependency to transparent hugepages and some help text.
>>>>    * Move to helper for easier handling of kernel build options.
>>>>
>>>> v3:
>>>>    * Drop Kconfig. (Daniel)
>>>>
>>>> References: b901bb89324a ("drm/i915/gemfs: enable THP")
>>>> References: 9987da4b5dcf ("drm/i915: Disable THP until we have a GPU read BW W/A")
>>>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/430
>>>> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
>>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Eero Tamminen <eero.t.tamminen@intel.com>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
>>>
>>> On both patches: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Eero's testing results at
>> https://gitlab.freedesktop.org/drm/intel/-/issues/430 are looking good -
>> seem to show this to be a net win for at least Gen9 and Gen12 platforms.
>>
>> Is the ack enough to merge in this case or I should look for an r-b as well?
> 
> Since your back to defacto v1 with the 2nd patch I think you have full r-b
> already. So more than enough I think.

Just in case you missed it, v1 had Kconfig. But it's the same spirit so 
probably indeed fine as you say.

> Please do record the relative perf numbers from Eero in that issue in the
> commit message so that we have that on the git log record too. It's easier
> to find there than following the link and finding the right comment in the
> issue.

Will do.

Regards,

Tvrtko
