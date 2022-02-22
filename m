Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F84BF814
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 13:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE29D10E366;
	Tue, 22 Feb 2022 12:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E4F10E366;
 Tue, 22 Feb 2022 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645533115; x=1677069115;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TUdJrw/iiseU5DkzTcdJTi52Csi3QSN8Erc7cYrMztQ=;
 b=MyeXPWnPT66k1ZzH1mxwHyDU5oQxHsqDClEdkit7Nuconz7Yz/jJ45hk
 m4lePl+zq+NuYBCXrb4VbaaIvUo/y1mXY4PIeveBIwekzriHe5uSMmz9w
 xd0ZDzBb4sXzZHeSB0JJ6e1almUwagfrEkmiyNuJdTXntlv5C2j1r8BcF
 RgXRcGXNfw3NGMUw54/q7h04xYHDnjF0zGsnAsMw9Cem+NuQQ+tjYNS8+
 bWQOh29fEGTsJ2dV+WoFPHziw8k8hpw4V14YFN7MNF9kLMzBi3wh+q1ds
 Y/mtiqcyuKSS/uBcSVgBS/zK0qWVyxhE9vcizs3/rSKfih5hYvHkn2rPU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232310842"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232310842"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 04:31:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="507967965"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO [10.213.218.63])
 ([10.213.218.63])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 04:31:52 -0800
Message-ID: <b9ae4943-2bb2-c1e1-a9f7-24db071ae1f5@linux.intel.com>
Date: Tue, 22 Feb 2022 12:31:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/7] drm/i915: Expose client engine utilisation via fdinfo
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
 <20220106165536.57208-8-tvrtko.ursulin@linux.intel.com>
 <20220219005127.GI34157@unerlige-ril-10.165.21.154>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220219005127.GI34157@unerlige-ril-10.165.21.154>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chris Healy <cphealy@gmail.com>, David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/02/2022 00:51, Umesh Nerlige Ramappa wrote:
> On Thu, Jan 06, 2022 at 04:55:36PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Similar to AMD commit
>> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
>> infrastructure added in previous patches, we add basic client info
>> and GPU engine utilisation for i915.
>>
>> Example of the output:
>>
>>  pos:    0
>>  flags:  0100002
>>  mnt_id: 21
>>  drm-driver: i915
>>  drm-pdev:   0000:00:02.0
>>  drm-client-id:      7
>>  drm-engine-render:  9288864723 ns
>>  drm-engine-copy:    2035071108 ns
>>  drm-engine-video:   0 ns
>>  drm-engine-video-enhance:   0 ns
>>
>> v2:
>> * Update for removal of name and pid.
>>
>> v3:
>> * Use drm_driver.name.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: David M Nieto <David.Nieto@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Chris Healy <cphealy@gmail.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> ---
>> Documentation/gpu/drm-usage-stats.rst  |  6 +++
>> Documentation/gpu/i915.rst             | 27 ++++++++++
>> drivers/gpu/drm/i915/i915_driver.c     |  3 ++
>> drivers/gpu/drm/i915/i915_drm_client.c | 73 ++++++++++++++++++++++++++
>> drivers/gpu/drm/i915/i915_drm_client.h |  4 ++
>> 5 files changed, 113 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>> b/Documentation/gpu/drm-usage-stats.rst
>> index c669026be244..6952f8389d07 100644
>> --- a/Documentation/gpu/drm-usage-stats.rst
>> +++ b/Documentation/gpu/drm-usage-stats.rst
>> @@ -95,3 +95,9 @@ object belong to this client, in the respective 
>> memory region.
>>
>> Default unit shall be bytes with optional unit specifiers of 'KiB' or 
>> 'MiB'
>> indicating kibi- or mebi-bytes.
>> +
>> +===============================
>> +Driver specific implementations
>> +===============================
>> +
>> +:ref:`i915-usage-stats`
>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>> index b7d801993bfa..29f412a0c3dc 100644
>> --- a/Documentation/gpu/i915.rst
>> +++ b/Documentation/gpu/i915.rst
>> @@ -708,3 +708,30 @@ The style guide for ``i915_reg.h``.
>>
>> .. kernel-doc:: drivers/gpu/drm/i915/i915_reg.h
>>    :doc: The i915 register macro definition style guide
>> +
>> +.. _i915-usage-stats:
>> +
>> +i915 DRM client usage stats implementation
>> +==========================================
>> +
>> +The drm/i915 driver implements the DRM client usage stats 
>> specification as
>> +documented in :ref:`drm-client-usage-stats`.
>> +
>> +Example of the output showing the implemented key value pairs and 
>> entirety of
>> +the currenly possible format options:
> 
> s/currenly/currently/
> 
> lgtm, for the series
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks Umesh!

There will be a small re-spin, mostly about adding drm-engine-capacity- 
tag which I needed for vendor agnostic gputop, and couple fixups. Some 
r-b's will need updating. I will copy you when sending it out.

Regards,

Tvrtko
