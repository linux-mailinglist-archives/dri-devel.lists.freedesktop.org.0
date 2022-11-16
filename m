Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007C62C134
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 15:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B77510E0C2;
	Wed, 16 Nov 2022 14:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C387B10E4C4;
 Wed, 16 Nov 2022 14:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668609772; x=1700145772;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0VSDb4om6vstcWtYoyJItyrcUu/QsUDzUwXOETPwPU0=;
 b=KWVo5FK1neEM2IOnAtyHAyJsvHVScHF8vFIKdKAmsXNtXknUMSIWiYcG
 sGSS7sKOu4mXYcm0SIu9cN+qY0p5tpRcv44KVZmusS+QYZPqAss9ydGQi
 Bngn9hPQnop8QxvoOEcoPtykTBRdHMshZvmkAc5+ELTfxHt+bMyNyNI4I
 Igc0MUkGlGTyTFMnVIZsgUvbBAeHrv8+FaL19TsnmGg5An7gtIOOYIi+Z
 EBuIoN06pcF5Kmdzdp8XZ5kLQLw6IQrCrl2HSw9gpOKhxVj/Nn7gX6g9Z
 M1SbEEDDbtLY1WX2oErbztp9YCksezOehhx6fTLyVTHxIcUmuRfRoZ2o4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="313708116"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="313708116"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 06:42:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="745075303"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="745075303"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.11.238])
 ([10.213.11.238])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 06:42:49 -0800
Message-ID: <cd0c8e1e-743c-f3d7-5e2e-91f7a8144c7d@intel.com>
Date: Wed, 16 Nov 2022 15:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Never return 0 if request wait
 succeeds
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
 <20221116112532.36253-4-janusz.krzysztofik@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221116112532.36253-4-janusz.krzysztofik@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.11.2022 12:25, Janusz Krzysztofik wrote:
> According to the docs of i915_request_wait_timeout(), its return value
> "may be zero if the request is unfinished after the timeout expires."
> However, 0 is also returned when the request is found finished right
> after the timeout has expired.
> 
> Since the docs also state: "If the timeout is 0, it will return 1 if the
> fence is signaled.", return 1 also when the fence is found signaled after
> non-zero timeout has expired.

As I understand the patch "drm/i915: Fix i915_request fence wait 
semantics", and the docs "timeout is 0" means the initial value of 
timeout argument and this is handled already on the beginning of the 
function.
In case initial timeout is greater than zero and then it expires, 
function should return 0 regardless of fence state. This is what I have 
understood from reading docs and implementation of 
dma_fence_default_wait [1], which should be the best source of info 
about "dma_fence wait semantic".

As I said already, mixing remaining time and bool in return value of 
dma_fence_wait* functions is very confusing, but changing it would 
require major rework of the framework.

[1]: 
https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-fence.c#L753

Regards
Andrzej

> 
> Fixes: 7e2e69ed4678 ("drm/i915: Fix i915_request fence wait semantics")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: stable@vger.kernel.org # v5.17
> ---
>   drivers/gpu/drm/i915/i915_request.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index f949a9495758a..406ddfafbed4d 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -2079,6 +2079,8 @@ long i915_request_wait_timeout(struct i915_request *rq,
>   
>   		timeout = io_schedule_timeout(timeout);
>   	}
> +	if (!timeout)	/* expired but signaled, we shouldn't return 0 */
> +		timeout = 1;
>   	__set_current_state(TASK_RUNNING);
>   
>   	if (READ_ONCE(wait.tsk))

