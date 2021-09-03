Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537043FFFF5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FEC6E88A;
	Fri,  3 Sep 2021 12:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59426E88A;
 Fri,  3 Sep 2021 12:47:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="206532541"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="206532541"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 05:47:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="500348132"
Received: from ojcasey-mobl.ger.corp.intel.com (HELO [10.213.195.251])
 ([10.213.195.251])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 05:47:54 -0700
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c8aecd1e-f6d6-cec2-3352-e01c9427248b@linux.intel.com>
Date: Fri, 3 Sep 2021 13:47:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE412nf5RisGBR2GrNsvgPH+omHv4K+m5McJv1t55DQMQ@mail.gmail.com>
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


On 29/07/2021 15:06, Daniel Vetter wrote:
> On Thu, Jul 29, 2021 at 3:34 PM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Usage of Transparent Hugepages was disabled in 9987da4b5dcf
>> ("drm/i915: Disable THP until we have a GPU read BW W/A"), but since it
>> appears majority of performance regressions reported with an enabled IOMMU
>> can be almost eliminated by turning them on, lets just do that.
>>
>> To err on the side of safety we keep the current default in cases where
>> IOMMU is not active, and only when it is default to the "huge=within_size"
>> mode. Although there probably would be wins to enable them throughout,
>> more extensive testing across benchmarks and platforms would need to be
>> done.
>>
>> With the patch and IOMMU enabled my local testing on a small Skylake part
>> shows OglVSTangent regression being reduced from ~14% (IOMMU on versus
>> IOMMU off) to ~2% (same comparison but with THP on).
>>
>> v2:
>>   * Add Kconfig dependency to transparent hugepages and some help text.
>>   * Move to helper for easier handling of kernel build options.
>>
>> v3:
>>   * Drop Kconfig. (Daniel)
>>
>> References: b901bb89324a ("drm/i915/gemfs: enable THP")
>> References: 9987da4b5dcf ("drm/i915: Disable THP until we have a GPU read BW W/A")
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/430
>> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Eero Tamminen <eero.t.tamminen@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
> 
> On both patches: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Eero's testing results at 
https://gitlab.freedesktop.org/drm/intel/-/issues/430 are looking good - 
seem to show this to be a net win for at least Gen9 and Gen12 platforms.

Is the ack enough to merge in this case or I should look for an r-b as well?

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/i915/gem/i915_gemfs.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
>> index 5e6e8c91ab38..dbdbdc344d87 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
>> @@ -6,7 +6,6 @@
>>
>>   #include <linux/fs.h>
>>   #include <linux/mount.h>
>> -#include <linux/pagemap.h>
>>
>>   #include "i915_drv.h"
>>   #include "i915_gemfs.h"
>> @@ -15,6 +14,7 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>>   {
>>          struct file_system_type *type;
>>          struct vfsmount *gemfs;
>> +       char *opts;
>>
>>          type = get_fs_type("tmpfs");
>>          if (!type)
>> @@ -26,10 +26,26 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>>           *
>>           * One example, although it is probably better with a per-file
>>           * control, is selecting huge page allocations ("huge=within_size").
>> -        * Currently unused due to bandwidth issues (slow reads) on Broadwell+.
>> +        * However, we only do so to offset the overhead of iommu lookups
>> +        * due to bandwidth issues (slow reads) on Broadwell+.
>>           */
>>
>> -       gemfs = kern_mount(type);
>> +       opts = NULL;
>> +       if (intel_vtd_active()) {
>> +               if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>> +                       static char huge_opt[] = "huge=within_size"; /* r/w */
>> +
>> +                       opts = huge_opt;
>> +                       drm_info(&i915->drm,
>> +                                "Transparent Hugepage mode '%s'\n",
>> +                                opts);
>> +               } else {
>> +                       drm_notice(&i915->drm,
>> +                                  "Transparent Hugepage support is recommended for optimal performance when IOMMU is enabled!\n");
>> +               }
>> +       }
>> +
>> +       gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, opts);
>>          if (IS_ERR(gemfs))
>>                  return PTR_ERR(gemfs);
>>
>> --
>> 2.30.2
>>
> 
> 
