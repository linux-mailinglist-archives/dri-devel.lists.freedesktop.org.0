Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A4B84C714
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EED510EB48;
	Wed,  7 Feb 2024 09:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvjnieim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F17610E641;
 Wed,  7 Feb 2024 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707297417; x=1738833417;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zQQCNmahUwZK3qO6Zo+aBo/S2P1qs/t9sW1T2X5nctU=;
 b=jvjnieimSip56EhhQbfZBClFtsraR3CVunTxY2sFGN9Nm7BjwZWRJmG1
 XLvQgfYJVTtGSlzFhImQXYOGaosIoo9j/CBbvbzaMSszytAya/vQmZXhI
 +NjQT9FTxKu0ZHk82cTB7l6fOdx1Ft6bbW3EovO9gyHMrJPMRDNcSor/I
 IW9z5MevZZZAks+NQr7g1RTivXnOkj75zmdtPGwC8Ml330tlD8XMSKujm
 YvHtSh3voa0kEXnShPSC38Yu76SRrKA12k9NjC4wAKXrrmO68AyGU2KL1
 Y7C2AEzz5XOIYYko5ZxdpU3htbGzlbDihytxBza6/DD0KWGRrFi4D1WUj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11683700"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="11683700"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 01:16:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1559644"
Received: from ahamill-mobl2.ger.corp.intel.com (HELO [10.213.228.167])
 ([10.213.228.167])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 01:16:32 -0800
Message-ID: <3c63aea1-1a04-45eb-9af1-02f52d4132e4@linux.intel.com>
Date: Wed, 7 Feb 2024 09:16:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Prevent possible NULL dereference in
 __caps_show()
Content-Language: en-US
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240206164543.46834-1-n.zhandarovich@fintech.ru>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240206164543.46834-1-n.zhandarovich@fintech.ru>
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


Hi,

On 06/02/2024 16:45, Nikita Zhandarovich wrote:
> After falling through the switch statement to default case 'repr' is
> initialized with NULL, which will lead to incorrect dereference of
> '!repr[n]' in the following loop.
> 
> Fix it with the help of an additional check for NULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 4ec76dbeb62b ("drm/i915/gt: Expose engine properties via sysfs")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
> P.S. The NULL-deref problem might be dealt with this way but I am
> not certain that the rest of the __caps_show() behaviour remains
> correct if we end up in default case. For instance, as far as I
> can tell, buf might turn out to be w/o '\0'. I could use some
> direction if this has to be addressed as well.
> 
>   drivers/gpu/drm/i915/gt/sysfs_engines.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> index 021f51d9b456..6b130b732867 100644
> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> @@ -105,7 +105,7 @@ __caps_show(struct intel_engine_cs *engine,
>   
>   	len = 0;
>   	for_each_set_bit(n, &caps, show_unknown ? BITS_PER_LONG : count) {
> -		if (n >= count || !repr[n]) {
> +		if (n >= count || !repr || !repr[n]) {

There are two input combinations to this function when repr is NULL.

First is show_unknown=true and caps=0, which means the for_each_set_bit 
will not execute its body. (No bits set.)

Second is show_unknown=false and caps=~0, which means count is zero so 
for_each_set_bit will again not run. (Bitfield size input param is zero.)

So unless I am missing something I do not see the null pointer dereference.

What could theoretically happen is that a third input combination 
appears, where caps is not zero in the show_unknown=true case, either 
via a fully un-handled engine->class (switch), or a new capability bit 
not added to the static array a bit above.

That would assert during driver development here:

			if (GEM_WARN_ON(show_unknown))

Granted that could be after the dereference in "if (n >= count || 
!repr[n])", but would be caught in debug builds (CI) and therefore not 
be able to "ship" (get merge to the repo).

Your second question is about empty buffer returned i.e. len=0 at the 
end of the function? (Which is when the buffer will not be null 
terminated - or you see another option?)

That I think is safe too since it just results in a zero length read in 
sysfs.

Regards,

Tvrtko

>   			if (GEM_WARN_ON(show_unknown))
>   				len += sysfs_emit_at(buf, len, "[%x] ", n);
>   		} else {
