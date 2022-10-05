Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C55F508A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 09:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827EC10E1CB;
	Wed,  5 Oct 2022 07:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB9310E1CB;
 Wed,  5 Oct 2022 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664956760; x=1696492760;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4APE4Td3vlhTWgT0QNyfJeF5+Y1L7mYJzFdpEImeczM=;
 b=lbLI1BoDB6HEvIkHeeWTUXNKuPOkgaHhj2EVVIWg2Op1CgpmB+/lzLo8
 y1JpxnQTr9IajJ9lZkvGmxs2ycsOCcUsrq3WRl1RUpmzbLhgLxWwsVvGj
 rbcEGSZnZHUqArItMokuB/ijh3Qcd8haqwKaqTGEXWjTZ0f7vtofxSVGU
 MEBVsHhuvlNwI6UAeL3mPlNFkjsRCJkjCJ050dUZw65wpMQ7pxi8zq1pU
 Dv9X4D7M7wmoYhbm88F1A3LSAbfrcbpfg5YNGtg/a04bgkcVNzLRQOQiH
 VurtG5NaTS9b/2y/cPl7V5TUmIqUOh1bBHG6C4hzhhErCeQXz1AlVjxGy A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="304674072"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="304674072"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 00:59:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="655091239"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="655091239"
Received: from bfglenno-mobl.ger.corp.intel.com (HELO [10.213.229.208])
 ([10.213.229.208])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 00:59:18 -0700
Message-ID: <7af80924-73cf-14fb-44d4-b5ed28bbdc9f@linux.intel.com>
Date: Wed, 5 Oct 2022 08:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/guc: Fix revocation of
 non-persistent contexts
Content-Language: en-US
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 Intel-gfx@lists.freedesktop.org
References: <20220930094716.430937-1-tvrtko.ursulin@linux.intel.com>
 <20221003121630.694249-1-tvrtko.ursulin@linux.intel.com>
 <36096340-aac7-7072-688a-bbef4e7d7d7f@linux.intel.com>
 <e2140d7a-b084-4298-d92a-649d0672fcc7@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <e2140d7a-b084-4298-d92a-649d0672fcc7@intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/10/2022 16:13, Ceraolo Spurio, Daniele wrote:
> On 10/4/2022 4:14 AM, Tvrtko Ursulin wrote:
>>
>> On 03/10/2022 13:16, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Patch which added graceful exit for non-persistent contexts missed the
>>> fact it is not enough to set the exiting flag on a context and let the
>>> backend handle it from there.
>>>
>>> GuC backend cannot handle it because it runs independently in the
>>> firmware and driver might not see the requests ever again. Patch also
>>> missed the fact some usages of intel_context_is_banned in the GuC 
>>> backend
>>> needed replacing with newly introduced intel_context_is_schedulable.
>>>
>>> Fix the first issue by calling into backend revoke when we know this is
>>> the last chance to do it. Fix the second issue by replacing
>>> intel_context_is_banned with intel_context_is_schedulable, which should
>>> always be safe since latter is a superset of the former.
>>>
>>> v2:
>>>   * Just call ce->ops->revoke unconditionally. (Andrzej)
>>
>> CI is happy - could I get some acks for the GuC backend changes please?
> 
> I think we still need to have a longer conversation on the revoking 
> times, but in the meantime this fixes the immediate concerns, so:
> 
> Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Thanks, I've pushed it so should unbreak 6.0 via stable.

For follow up work I am okay either with a fixes 20ms timeout (this was 
enough for users which originally reported it), or go with fully 
configurable? Latter feels a bit over the top since it would then me a 
kconfig and sysfs to align with the normal preempt timeout.

Regards,

Tvrtko
