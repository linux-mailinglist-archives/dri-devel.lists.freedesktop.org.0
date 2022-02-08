Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA3E4AD444
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 10:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028C110E28D;
	Tue,  8 Feb 2022 09:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D3910E1AB;
 Tue,  8 Feb 2022 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644310982; x=1675846982;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6gsHdhECg7qlbF1Xa5g8nzFYNyaEDNCQeKH80eWPTZo=;
 b=nk+a4NLEYtdW+izBOOy4icDWG1aFRPoSLUDkjPaU3HcjpHBNGzXKxYPC
 AoBTfC0TshuCQg0uJd91UA9Tydx4WJgNWfnty9iddmBGw3L6Oz9llJk6w
 4S+QyK0LyQO07IVkTwjSHWk+F72ZAnpk0C6FUvry2B2jXSOmINqsq8oVq
 7+c3rR9rgKxLVyH5yv8HOZvVwoKU6OpDTA4le4NhNgNPooplHqk7/KtFE
 K+3dE+Jb4n0p/Guvno0jK7h5oFLd3IUcEsEtl6QvJ+1Cczo/4LC4PCren
 0J7E0BcwclSdRsFGgyinFC33Z9zdoFcZkt/EUEMdRnGe9BypUwCQx7KzQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249113691"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="249113691"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 01:03:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="484742565"
Received: from kgonza2-mobl2.gar.corp.intel.com (HELO [10.213.198.226])
 ([10.213.198.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 01:02:59 -0800
Message-ID: <1616b843-7fb0-8d81-c152-128fe9da8d28@linux.intel.com>
Date: Tue, 8 Feb 2022 09:02:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v5 0/5] Use drm_clflush* instead of clflush
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220204163711.439403-1-michael.cheng@intel.com>
 <f245951e-6f6c-1eab-7cba-ccb774db1194@linux.intel.com>
 <87pmnyrglt.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87pmnyrglt.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/02/2022 12:44, Jani Nikula wrote:
> On Mon, 07 Feb 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> On 04/02/2022 16:37, Michael Cheng wrote:
>>> This patch series re-work a few i915 functions to use drm_clflush_virt_range
>>> instead of calling clflush or clflushopt directly. This will prevent errors
>>> when building for non-x86 architectures.
>>>
>>> v2: s/PAGE_SIZE/sizeof(value) for Re-work intel_write_status_page and added
>>> more patches to convert additional clflush/clflushopt to use drm_clflush*.
>>> (Michael Cheng)
>>>
>>> v3: Drop invalidate_csb_entries and directly invoke drm_clflush_virt_ran
>>>
>>> v4: Remove extra memory barriers
>>>
>>> v5: s/cache_clflush_range/drm_clflush_virt_range
>>
>> Is anyone interested in this story noticing my open? I will repeat:
>>
>> How about we add i915_clflush_virt_range as static inline and by doing
>> so avoid adding function calls to code paths which are impossible on Arm
>> builds? Case in point relocations, probably execlists backend as well.
>>
>> Downside would be effectively duplicating drm_clfush_virt_range code.
>> But for me, (Also considering no other driver calls it so why it is
>> there? Should it be deleted?), that would be okay.
> 
> Keep it simple first, optimize later if necessary?

I don't think it would ever happen unless done from the start. :/

Regards,

Tvrtko
