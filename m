Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7E3BE3DD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 09:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0518D6E831;
	Wed,  7 Jul 2021 07:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1596E831;
 Wed,  7 Jul 2021 07:46:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="207434324"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="207434324"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 00:46:26 -0700
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="457388184"
Received: from jleigh1-mobl2.ger.corp.intel.com (HELO [10.213.192.58])
 ([10.213.192.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 00:46:23 -0700
Subject: Re: [Intel-gfx] [PATCH 08/53] drm/i915/xehp: Extra media engines -
 Part 2 (interrupts)
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-9-matthew.d.roper@intel.com>
 <96b1625f-1b72-d28c-6d92-02bd5d255277@linux.intel.com>
 <20210706211503.la6t4lvvjuoycizd@ldmartin-desk2>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ce5ca62f-5b8c-ee9e-bd10-69ba8e1a1c04@linux.intel.com>
Date: Wed, 7 Jul 2021 08:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706211503.la6t4lvvjuoycizd@ldmartin-desk2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/07/2021 22:15, Lucas De Marchi wrote:
> On Fri, Jul 02, 2021 at 01:42:59PM +0100, Tvrtko Ursulin wrote:
>>
>> On 01/07/2021 21:23, Matt Roper wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Xe_HP can have a lot of extra media engines. This patch adds the
>>> interrupt handler support for them.
>>>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/gt/intel_gt_irq.c | 13 ++++++++++++-
>>>  drivers/gpu/drm/i915/i915_reg.h        |  3 +++
>>>  2 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>> index c13462274fe8..b2de83be4d97 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>> @@ -184,7 +184,13 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>>>      intel_uncore_write(uncore, GEN11_BCS_RSVD_INTR_MASK,    ~0);
>>>      intel_uncore_write(uncore, GEN11_VCS0_VCS1_INTR_MASK,    ~0);
>>>      intel_uncore_write(uncore, GEN11_VCS2_VCS3_INTR_MASK,    ~0);
>>> +    if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
>>> +        intel_uncore_write(uncore, GEN12_VCS4_VCS5_INTR_MASK,   ~0);
>>> +    if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
>>> +        intel_uncore_write(uncore, GEN12_VCS6_VCS7_INTR_MASK,   ~0);
>>>      intel_uncore_write(uncore, GEN11_VECS0_VECS1_INTR_MASK,    ~0);
>>> +    if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
>>> +        intel_uncore_write(uncore, GEN12_VECS2_VECS3_INTR_MASK, ~0);
>>>      intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
>>>      intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
>>> @@ -218,8 +224,13 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>>      intel_uncore_write(uncore, GEN11_BCS_RSVD_INTR_MASK, ~smask);
>>>      intel_uncore_write(uncore, GEN11_VCS0_VCS1_INTR_MASK, ~dmask);
>>>      intel_uncore_write(uncore, GEN11_VCS2_VCS3_INTR_MASK, ~dmask);
>>> +    if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
>>> +        intel_uncore_write(uncore, GEN12_VCS4_VCS5_INTR_MASK, ~dmask);
>>> +    if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
>>> +        intel_uncore_write(uncore, GEN12_VCS6_VCS7_INTR_MASK, ~dmask);
>>>      intel_uncore_write(uncore, GEN11_VECS0_VECS1_INTR_MASK, ~dmask);
>>
>> Poor 0-1 sandwiched between 4-7 and 2-3. ;) With hopefully order 
>> restored:
> 
> not sure I understand this, order looks correct to me. It handles all
> (possible) VCS engines, and later VECS

Oops my bad, my eyes confused VCS and VECS blocks.

Regards,

Tvrtko

