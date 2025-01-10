Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47EA08892
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 07:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050FB10EFE8;
	Fri, 10 Jan 2025 06:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1C37vZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1173E10EFE4;
 Fri, 10 Jan 2025 06:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736491964; x=1768027964;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zE0kI+xrDleh27a/lCgBElw93lhuYZYwCzD//hZxdyA=;
 b=F1C37vZ/Iz8ftJEMafJoo4QqfEOTPXKJqTsFHq95hcjzwq+neHMdc4af
 LmMnSNfYZYgRSCgeDIspkCnMsf2B4qDBKbvVcUriJA3fknn9ugHuIDvAv
 9aziT18h+5CetIB5GLF9RvrYj0iJzb3t5XfZRywHb55lFlM9t2uoQEayo
 ZmiAe0VpqgzfGeLE4uD1RzsALKlTn+d0sjf3V01Ux8RztOlvE3i3xybv3
 nXWGPURB6O6Z+bAh5x6gPgtIWyv+rjh/MaP/Djhz/0F/0WxNfc/OPv3rV
 xzH85sCyRMIhgWkhjgfCQ9zcZjmJ390pcucznQahKJfS2wTSOyb0f6lUn Q==;
X-CSE-ConnectionGUID: kyNfEYY0SIyuibKe1soWwA==
X-CSE-MsgGUID: N9XloZpYTCaO9te3mQaVFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59253801"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="59253801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:52:44 -0800
X-CSE-ConnectionGUID: Tyt1YveGRPOuPW9XC9jswQ==
X-CSE-MsgGUID: 6QoA8k/TTwikpnuNXkdKnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103437632"
Received: from unknown (HELO [10.246.4.167]) ([10.246.4.167])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:52:41 -0800
Message-ID: <805016ca-c8b7-4455-9187-3972dab21fbc@linux.intel.com>
Date: Fri, 10 Jan 2025 07:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Add VM_DONTEXPAND to exported buffers
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, karol.wachowski@intel.com,
 tomasz.rusinowicz@intel.com
References: <20250108105346.240103-1-jacek.lawrynowicz@linux.intel.com>
 <mk5kmhrk5kpqaf4o2wfkqt4rqijsprj6r5om5ygcempavigl46@eqeupyenr2xj>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <mk5kmhrk5kpqaf4o2wfkqt4rqijsprj6r5om5ygcempavigl46@eqeupyenr2xj>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 1/9/2025 12:22 PM, Krzysztof Karas wrote:
> Hi Jacek,
> 
> On 2025-01-08 at 11:53:46 +0100, Jacek Lawrynowicz wrote:
>> drm_gem_mmap_obj() expects VM_DONTEXPAND flag to be set after mmap
>> callback is executed. Set this flag at the end of i915_gem_dmabuf_mmap()
>> to prevent WARN on mmap in buffers imported from i915 e.g.,
> ...
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -110,6 +110,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
>>  	if (ret)
>>  		return ret;
>>  
>> +	vm_flags_set(vma, VM_DONTEXPAND);
>>  	vma_set_file(vma, obj->base.filp);
>>  
>>  	return 0;
>>
> Is this an existing issue somewhere (on GitLab for example)? The fix
> looks good, I'm just curious how you noticed this problem and if the
> patch should have "Fixes/Closes" labels added.

We noticed the problem while running internal intel_vpu tests that import buffers from vulkan.
These tests will be upstreamed at some point but currently there is no external issue for this bug.
I will add Fixes tag.

Jacek
