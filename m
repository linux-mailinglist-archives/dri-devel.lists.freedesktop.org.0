Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 719486426F4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 11:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A3E10E1BB;
	Mon,  5 Dec 2022 10:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A9E10E081;
 Mon,  5 Dec 2022 10:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670237460; x=1701773460;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZtQiyBckUqwzejPR2GfLMw1fO1ZsEeVGuEaG9PLVtdI=;
 b=N/oB47w+D3XnGphv8r+02MIiwrur+pA2vncxnGPeY5TnnRzynGA7HV+y
 R+BtqkFyEL+0VdazbmKx5ag0s6BNW8Fw0EZbLyEisaVDhFlsdVh/3GcKd
 95JSoeH9rQnUT54bq25Zyw1t8u/CyB2AVE2k0Iu9gxe8geymUqw/sRXxq
 k01DNaaGeps2Z7BtLnRtvY3El3CF2LrRHrHEQl7K1AROrIu2H++JZVs9n
 TA2a0z9VN3Km5teMe+R9iBamh8EkNEJgZg2W7JgTs7h3W2LjUez4gWRdx
 L9PfW3ekRl2eet719tnFxXuvae8EyHi1B5uhFj/K+xYQX0zwqhuR3ZHEg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="315021579"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="315021579"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 02:51:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="623461396"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="623461396"
Received: from akramiss-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.54.203])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 02:50:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: ye.xingchen@zte.com.cn, joonas.lahtinen@linux.intel.com
Subject: Re: [PATCH] drm/i915: use sysfs_emit() to instead of scnprintf()
In-Reply-To: <202212011053265568903@zte.com.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202212011053265568903@zte.com.cn>
Date: Mon, 05 Dec 2022 12:50:53 +0200
Message-ID: <878rjm2kfm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Dec 2022, <ye.xingchen@zte.com.cn> wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Replace the open-code with sysfs_emit() to simplify the code.

I was going to push this, but noticed the function has a third
scnprintf(), and the last two play together with count. It would be
confusing to have a mix of sysfs_emit() and scnprintf(). The third one
can't be blindly converted to sysfs_emit() because it writes at an
offset not aligned by PAGE_SIZE.

So I'm not taking this.

BR,
Jani.

>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/i915/i915_mitigations.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_mitigations.c b/drivers/gpu/drm/i915/i915_mitigations.c
> index def7302ef7fe..2b7aaaefb3a9 100644
> --- a/drivers/gpu/drm/i915/i915_mitigations.c
> +++ b/drivers/gpu/drm/i915/i915_mitigations.c
> @@ -102,10 +102,10 @@ static int mitigations_get(char *buffer, const struct kernel_param *kp)
>  	bool enable;
>
>  	if (!local)
> -		return scnprintf(buffer, PAGE_SIZE, "%s\n", "off");
> +		return sysfs_emit(buffer, "%s\n", "off");
>
>  	if (local & BIT(BITS_PER_LONG - 1)) {
> -		count = scnprintf(buffer, PAGE_SIZE, "%s,", "auto");
> +		count = sysfs_emit(buffer, "%s,", "auto");
>  		enable = false;
>  	} else {
>  		enable = true;

-- 
Jani Nikula, Intel Open Source Graphics Center
