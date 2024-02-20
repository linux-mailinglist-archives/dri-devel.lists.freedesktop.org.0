Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B23085BD79
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 14:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D8810E2F9;
	Tue, 20 Feb 2024 13:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYO6EVyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E4210E3F1;
 Tue, 20 Feb 2024 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708436760; x=1739972760;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2ageuzYIDO+WbuArr2sk34TB/dcqNcj2mbegel9ouHI=;
 b=AYO6EVyRjsW8GulDZbGVGIZbdhkqqkAO2QuBui/Eoqr36mym6HFq4bzR
 c4trWbwXOSq/aLTi9dVO7N1kX5xBowJHzQvgMZLO5XkJUY3o7++Z6tVZM
 ZHBPTD1Dz7WPckOR4q5NjPK1kTDfrmuDyjXFv9iVv2VxEIZvqT3a6GW9h
 F60S2YxGNrN0ZfeJN8eYx9sCT5Lj05r2/DiQuvRTs9oICgRvBtuQDLeGG
 0QXxGs4F9QDCcCKwHB5dT8TjoUwfWRCJXR/XmGIUgKLtV7Vo9piigO9Ia
 +J81T0dJIdF4+EtAFLlGj26zL/sh5+Lx1OcUhXKtYEfJ5PtgWc3MaRAim A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13095819"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="13095819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 05:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5016656"
Received: from dunnejor-mobl2.ger.corp.intel.com (HELO [10.213.231.185])
 ([10.213.231.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 05:45:57 -0800
Message-ID: <4699d7eb-429c-4e7f-a74a-afdece286f4e@linux.intel.com>
Date: Tue, 20 Feb 2024 13:45:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Fix possible null pointer dereference after
 drm_dbg_printer conversion
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Jani Nikula
 <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20240219131423.1854991-1-tvrtko.ursulin@linux.intel.com>
 <ZdOz78jQu-GvJuDJ@intel.com>
 <f8455cd2-bed6-4026-bf6e-f6dfea2f86c5@linux.intel.com>
 <ztlmkeavgpriq2hifpdjqw4k5zyfopstfcmgvgzakfbomrj43j@qxcw74jtw3uf>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ztlmkeavgpriq2hifpdjqw4k5zyfopstfcmgvgzakfbomrj43j@qxcw74jtw3uf>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/02/2024 10:36, Maxime Ripard wrote:
> On Tue, Feb 20, 2024 at 09:16:43AM +0000, Tvrtko Ursulin wrote:
>>
>> On 19/02/2024 20:02, Rodrigo Vivi wrote:
>>> On Mon, Feb 19, 2024 at 01:14:23PM +0000, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Request can be NULL if no guilty request was identified so simply use
>>>> engine->i915 instead.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Fixes: d50892a9554c ("drm/i915: switch from drm_debug_printer() to device specific drm_dbg_printer()")
>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> Cc: Luca Coelho <luciano.coelho@intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> Thanks Rodrigo!
>>
>> Given how d50892a9554c landed via drm-misc-next, Maxime or Thomas - could
>> you take this via drm-misc-next-fixes or if there will be another
>> drm-misc-next pull request?
> 
> There will be a drm-misc-next PR on thursday

Could you pull this one into which branch is needed so it appears in 
that pull request?

Regards,

Tvrtko
