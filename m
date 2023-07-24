Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2BC75EEE3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC2510E299;
	Mon, 24 Jul 2023 09:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBD310E299;
 Mon, 24 Jul 2023 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690190280; x=1721726280;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VZIuephpuiECXqv+dLAe1AiqRhSpFzX4VAlECEJz6L0=;
 b=k/b4oAn2R7Sg9g9P+Ip+qS8sTvdxFKJrTGmFqyLLQVDQztupj4BBCI5X
 61lkqE7IbsTzVUZ/iHss3o2dCIlibOlkZDk7dGBZDtrDCx74cYyZpROS5
 9sQuV+NuzF4JAwAlVKz6y/N6rtkSZ5vshjZkx54x1gMcI8aZSbJK+gCCF
 koxMcoPN+Nhw0m/AMfs4nLVFlKDE2xzekI24bDVAC/o4C+rzAzDPCFuIy
 VQDr/g1R6U+83CQPY6KVsnmnCRPX0Fb9/lLJ34VQVZO0qzdVcGG0O8F0k
 i02GK4dPDPVG0R/6F0+g3pgA0Rpr9uYCHSA3O6759idEkTqA589K9XZDm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="367417450"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="367417450"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790895131"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="790895131"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.14.115])
 ([10.213.14.115])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:17:57 -0700
Message-ID: <57103f96-19e9-dbbf-fb6f-3bcfcbd7c6a1@intel.com>
Date: Mon, 24 Jul 2023 11:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v8 7/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-8-andi.shyti@linux.intel.com>
 <3b7e1781-ca2b-44b3-846d-89e42f24106e@intel.com>
 <ZL5A82eugN0hbFjr@ashyti-mobl2.lan>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZL5A82eugN0hbFjr@ashyti-mobl2.lan>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-stable <stable@vger.kernel.org>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.07.2023 11:14, Andi Shyti wrote:
> Hi Andrzej,
>
>>>    	intel_engine_mask_t aux_inv = 0;
>>> -	u32 cmd, *cs;
>>> +	u32 cmd_flush = 0;
>>> +	u32 cmd = 4;
>>> +	u32 *cs;
>>> -	cmd = 4;
>>> -	if (mode & EMIT_INVALIDATE) {
>>> +	if (mode & EMIT_INVALIDATE)
>>>    		cmd += 2;
>>> -		if (gen12_needs_ccs_aux_inv(rq->engine) &&
>>> -		    (rq->engine->class == VIDEO_DECODE_CLASS ||
>>> -		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
>>> -			aux_inv = rq->engine->mask &
>>> -				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
>>> -			if (aux_inv)
>>> -				cmd += 4;
>>> -		}
>>> +	if (gen12_needs_ccs_aux_inv(rq->engine))
>>> +		aux_inv = rq->engine->mask &
>>> +			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
>> Shouldn't we remove BCS check for MTL? And move it inside
>> gen12_needs_ccs_aux_inv?
>> Btw aux_inv is used as bool, make better is to make it bool.
> Both the cleanups come in patch 9. I wanted to move it initially
> before, but per engine check come later in the series.
>
> I think would need to re-architecture all the patch structure if
> I want to remove it :)
>
> Are you strong with this change?

Nope, if it finally arrives then OK for me.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej



>
> Andi

