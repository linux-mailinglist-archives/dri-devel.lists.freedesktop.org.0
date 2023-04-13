Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8D6E06C5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 08:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3503810EA31;
	Thu, 13 Apr 2023 06:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB37910EA31;
 Thu, 13 Apr 2023 06:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681366213; x=1712902213;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pr4JMmzrY9/O4gH96CYZvtQO5gVEJvmjkeQFkOuJ8iE=;
 b=apNLTqSG6Dh3levP8+vVOslRWnkbHMw7wzA1RAPCeZvQY//xgcJBYs/d
 6Ioqk+iL+c54b8BU/wedbObcclmfFRFDbUIGjgmMGySXFYe/ZUYHZHfH4
 WvBmcp9s5B4KUATdWyMt6Rt6BAyoZuZZL4nmhds9y64kMYcMMBlEZvgVq
 wuVfyrT740RIjFq209RfHdeYg2N9n3+IUOoTKGbBQa1JcxA3slKBV5NXP
 G9U4BNHk2AVz48uuM+wR1RseoLDu8HDk1Yw/w/wCYgci2eR+NiYdkec2f
 Dk22P2keWk/j59/RASRoBynGYwBatyOA8gumraFLXDy1CCxT37EpDcpdx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="324453758"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="324453758"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 23:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="758554353"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="758554353"
Received: from lzygo-mobl.ger.corp.intel.com (HELO [10.213.3.63])
 ([10.213.3.63])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 23:10:08 -0700
Message-ID: <71ba4962-14fd-887f-1d40-31089dd1cf50@intel.com>
Date: Thu, 13 Apr 2023 08:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/i915: Fix memory leaks in i915 selftests
Content-Language: en-US
To: Cong Liu <liucong2@kylinos.cn>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230413031349.9026-1-liucong2@kylinos.cn>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230413031349.9026-1-liucong2@kylinos.cn>
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



On 13.04.2023 05:13, Cong Liu wrote:
> Fixes: c3bfba9a2225 ("drm/i915: Check for integer truncation on scatterlist creation")
>
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> ---

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 5361ce70d3f2..154801f1c468 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -69,8 +69,10 @@ static int fake_get_pages(struct drm_i915_gem_object *obj)
>   
>   	rem = round_up(obj->base.size, BIT(31)) >> 31;
>   	/* restricted by sg_alloc_table */
> -	if (overflows_type(rem, unsigned int))
> +	if (overflows_type(rem, unsigned int)) {
> +		kfree(pages);
>   		return -E2BIG;
> +	}
>   
>   	if (sg_alloc_table(pages, rem, GFP)) {
>   		kfree(pages);

