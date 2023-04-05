Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938506D7EED
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555EB10E98A;
	Wed,  5 Apr 2023 14:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A7A10E98D;
 Wed,  5 Apr 2023 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680704085; x=1712240085;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=oxj5StD2UhFS14Ga3X4J/q+X+pUmXWLy/TPX+TY4StY=;
 b=HIIQi/H1DTYi+cffX1urC8uSHVQnTtrdR5v+UVc+FJtTwVgmDuQSsszj
 OjULaUJ/a2Ip9ONRid6l1PvH8Px74EvdhE3hP1+zey+HP6d04Ybw82r2Y
 ev/OrLtaVgkDy81eqEXJRySdwFLs4iMmY3RrEFLot0UKosZGIqakZz3Nd
 dO1xdLUVwMln0tuWgAbt7bd3y2Cvk/wRjY216JefIngOn7NpJ9OfGcSep
 f28rhRHk0jvOBuJs3iehwpYsYyxkdjN8pbssTiMi+vCj21WJT4brJWdMd
 ezu/cccUuTx7WXy+9jd8VHb8BLQMZaTtdeN3FJKHVeNBj6BFwT05PeLQW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="407545189"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="407545189"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="719339212"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="719339212"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.30.7])
 ([10.213.30.7])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:14:08 -0700
Message-ID: <8c8511ab-4229-f4d5-2516-d7e867c32020@intel.com>
Date: Wed, 5 Apr 2023 16:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [PATCH 4/5] drm/i915/display: Add helper func to get intel_fbdev
 from drm_fb_helper
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230404143100.10452-1-nirmoy.das@intel.com>
 <20230404143100.10452-4-nirmoy.das@intel.com>
 <2b6440b5-a6de-0124-8336-38030ae82703@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2b6440b5-a6de-0124-8336-38030ae82703@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05.04.2023 16:13, Andrzej Hajda wrote:
>
>
> On 04.04.2023 16:30, Nirmoy Das wrote:
>> Add a helper function to retrieve struct intel_fbdev from
>> struct drm_fb_helper.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Imre Deak <imre.deak@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


Ups, please ignore :)

>
> Regards
> Andrzej
>
>> ---
>>   drivers/gpu/drm/i915/display/intel_fbdev.c | 23 ++++++++++------------
>>   1 file changed, 10 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c 
>> b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index f7d48d00ae4b..2ac9e9f8a128 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -67,6 +67,11 @@ struct intel_fbdev {
>>       struct mutex hpd_lock;
>>   };
>>   +static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper 
>> *fb_helper)
>> +{
>> +    return container_of(fb_helper, struct intel_fbdev, helper);
>> +}
>> +
>>   static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev 
>> *ifbdev)
>>   {
>>       return ifbdev->fb->frontbuffer;
>> @@ -79,9 +84,7 @@ static void intel_fbdev_invalidate(struct 
>> intel_fbdev *ifbdev)
>>     static int intel_fbdev_set_par(struct fb_info *info)
>>   {
>> -    struct drm_fb_helper *fb_helper = info->par;
>> -    struct intel_fbdev *ifbdev =
>> -        container_of(fb_helper, struct intel_fbdev, helper);
>> +    struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>>       int ret;
>>         ret = drm_fb_helper_set_par(info);
>> @@ -93,9 +96,7 @@ static int intel_fbdev_set_par(struct fb_info *info)
>>     static int intel_fbdev_blank(int blank, struct fb_info *info)
>>   {
>> -    struct drm_fb_helper *fb_helper = info->par;
>> -    struct intel_fbdev *ifbdev =
>> -        container_of(fb_helper, struct intel_fbdev, helper);
>> +    struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>>       int ret;
>>         ret = drm_fb_helper_blank(blank, info);
>> @@ -108,9 +109,7 @@ static int intel_fbdev_blank(int blank, struct 
>> fb_info *info)
>>   static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
>>                      struct fb_info *info)
>>   {
>> -    struct drm_fb_helper *fb_helper = info->par;
>> -    struct intel_fbdev *ifbdev =
>> -        container_of(fb_helper, struct intel_fbdev, helper);
>> +    struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>>       int ret;
>>         ret = drm_fb_helper_pan_display(var, info);
>> @@ -136,8 +135,7 @@ static const struct fb_ops intelfb_ops = {
>>   static int intelfb_alloc(struct drm_fb_helper *helper,
>>                struct drm_fb_helper_surface_size *sizes)
>>   {
>> -    struct intel_fbdev *ifbdev =
>> -        container_of(helper, struct intel_fbdev, helper);
>> +    struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
>>       struct drm_framebuffer *fb;
>>       struct drm_device *dev = helper->dev;
>>       struct drm_i915_private *dev_priv = to_i915(dev);
>> @@ -194,8 +192,7 @@ static int intelfb_alloc(struct drm_fb_helper 
>> *helper,
>>   static int intelfb_create(struct drm_fb_helper *helper,
>>                 struct drm_fb_helper_surface_size *sizes)
>>   {
>> -    struct intel_fbdev *ifbdev =
>> -        container_of(helper, struct intel_fbdev, helper);
>> +    struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
>>       struct intel_framebuffer *intel_fb = ifbdev->fb;
>>       struct drm_device *dev = helper->dev;
>>       struct drm_i915_private *dev_priv = to_i915(dev);
>

