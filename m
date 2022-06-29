Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8155FA4D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 10:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF3D10E81E;
	Wed, 29 Jun 2022 08:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1E410E81E;
 Wed, 29 Jun 2022 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656490983; x=1688026983;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0h8gKuDxVpBMfEXvQ+5hx1/EJFE9Qmj0dGm5ASes7Lw=;
 b=LcTMdBuzvqvT6wIvlcEbNutZkEHFdWkPd9SzeH3e3yLTsmhvzSANquPD
 dyYrYK7ArkoP2DAIXAvb2UNXukF0xT/cVV/A2DfiDW/3NfNt0iRJiLEUV
 0mxfv/+kMne1uNs6Yooczdn2n0RvsuT7gTx8V/rF9AqXpSqW0uyOSl5mH
 ZFV2C878EeU+IwaXqvjjqGHm1XRQojI/bbuXJhtfavJEObiIt/rjXFJai
 N3u868UKvKD9A37mIYxYj1RuwbQzjQoggBbmV9G9UCBum27EFCxzKTSo4
 y0ZDLpVn4UYiiwrFkvfJZ3H3rYbaIUw7ewhrebOmc/1wJkj+GqbstJfH3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="261769630"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="261769630"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 01:23:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="837038491"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.7.241])
 ([10.213.7.241])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 01:22:58 -0700
Message-ID: <437bcbda-970d-2a83-051f-f350e53827bd@intel.com>
Date: Wed, 29 Jun 2022 10:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/fbdev: suspend HPD before fbdev
 unregistration
Content-Language: en-US
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220623163813.1990801-1-andrzej.hajda@intel.com>
 <20220623163813.1990801-3-andrzej.hajda@intel.com>
 <DM6PR11MB317754BAC87AD15EF47D274FBABB9@DM6PR11MB3177.namprd11.prod.outlook.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <DM6PR11MB317754BAC87AD15EF47D274FBABB9@DM6PR11MB3177.namprd11.prod.outlook.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for comments,


On 29.06.2022 07:38, Murthy, Arun R wrote:
>>   void intel_fbdev_unregister(struct drm_i915_private *dev_priv)  {
>>        struct intel_fbdev *ifbdev = dev_priv->fbdev; @@ -573,6 +594,8 @@
>> void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
>>        if (!ifbdev)
>>                return;
>>
>> +     intel_fbdev_hpd_set_suspend(dev_priv,
>> FBINFO_STATE_SUSPENDED);
>> +
> 
> Instead of intel_fbdev_hpd_set_suspend(), will intel_fbdev_set_suspend() make more sense?
> If intel_fbdev_set_suspend() is called, then the below cancel_work_sync() may not be required.


It does more than I needed (calls drm_fb_helper_set_suspend), but it 
shouldn't hurt. I will try this approach.

Regards
Andrzej

> 
>>        cancel_work_sync(&dev_priv->fbdev_suspend_work);
>>        if (!current_is_async())
>>                intel_fbdev_sync(ifbdev);
> 
> Thanks and Regards,
> Arun R Murthy
> --------------------

