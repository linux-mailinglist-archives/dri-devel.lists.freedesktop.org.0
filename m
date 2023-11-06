Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985A7E1E12
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8476B10E2B3;
	Mon,  6 Nov 2023 10:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0075C10E2B2;
 Mon,  6 Nov 2023 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699265726; x=1730801726;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x338Ogbpp9uWR2sIcLcKna5qVpCr3xQ+iG9tZ2WPL/g=;
 b=jgbbYbfmxTAOJA77GviU4LKgrJ6UmAuveOvnIV3zjJ/+wE7Pj9Jm3wJl
 sC4SqsC3dBeosQLlLaSWdNiZ2uHKvMX2dD1aqjBOcSIAY8MtxUW8H3ISO
 +82eUjBx6OIHyam33HgxZ1KYb7729477vWFB2wCEzJFi6nM5gil+e+W53
 SiDmi/E3vtxNzKq+WeVVkfb/pfHxMRX+dsDEfmwo/+pIYvuV882mT402w
 c+wRiR9yLsUbpx6TOiVl70uYkSBL78Lp+A1ifO+v01CeaVK4tLAleYL42
 NR+ffED14Lv+pltmKl/6qaFZOI2U/VtkgwOlqqedQLem3JWjlwQqRV7ea Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455729335"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="455729335"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="765906552"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="765906552"
Received: from ajayshan-mobl.ger.corp.intel.com (HELO [10.213.234.152])
 ([10.213.234.152])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:15:22 -0800
Message-ID: <b4fa0e2b-53f6-4015-9be0-41b45a6b5f4e@linux.intel.com>
Date: Mon, 6 Nov 2023 10:15:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915: Fix potential spectre vulnerability
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Kunwu Chan <chentao@kylinos.cn>
References: <d300506c-ab82-4cc1-b750-61e54ec2ad9e@linux.intel.com>
 <20231103023257.58199-1-chentao@kylinos.cn>
 <ZUi4ploYfYyZvmO7@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZUi4ploYfYyZvmO7@ashyti-mobl2.lan>
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
Cc: robdclark@chromium.org, andrzej.hajda@intel.com,
 alan.previn.teres.alexis@intel.com, kunwu.chan@hotmail.com,
 intel-gfx@lists.freedesktop.org, jonathan.cavitt@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris.p.wilson@intel.com, rodrigo.vivi@intel.com, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/11/2023 09:57, Andi Shyti wrote:
> Hi Kunwu,
> 
> On Fri, Nov 03, 2023 at 10:32:57AM +0800, Kunwu Chan wrote:
>> Fix smatch warning:
>> drivers/gpu/drm/i915/gem/i915_gem_context.c:847 set_proto_ctx_sseu()
>> warn: potential spectre issue 'pc->user_engines' [r] (local cap)
>>
>> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
>> Cc: <stable@vger.kernel.org> # v5.15+
>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Link: https://lore.kernel.org/all/20231102101642.52988-1-chentao@kylinos.cn
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> index 9a9ff84c90d7..e38f06a6e56e 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> @@ -844,6 +844,7 @@ static int set_proto_ctx_sseu(struct drm_i915_file_private *fpriv,
>>   		if (idx >= pc->num_user_engines)
>>   			return -EINVAL;
>>   
>> +		idx = array_index_nospec(idx, pc->num_user_engines);
> 
> you ignored my comment, though.

Sorry it was me, I considered it fine as is given it is the same pattern 
as elsewhere in the file. I've merged the patch btw.

Regards,

Tvrtko

> 
> Andi
> 
>>   		pe = &pc->user_engines[idx];
>>   
>>   		/* Only render engine supports RPCS configuration. */
>> -- 
>> 2.34.1
