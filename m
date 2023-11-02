Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D67DEF31
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 10:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2055810E841;
	Thu,  2 Nov 2023 09:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB50F10E840;
 Thu,  2 Nov 2023 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698918639; x=1730454639;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=MqEwOqFEROpRK8ja8oMw2BZyw0QLmhjLjywaIfAclHs=;
 b=K7kNYQKEXZY3kNIDkeLdDFIexIAcoO3SE/VkKJe0lXb8menFAZZOP1R2
 AUCB84rYuBGVE/3L9LaK1by0PKTH8tX2a45PZ94R/8mvoQrogogrBI0pK
 TCi5CfeJ4R8siiBDNLeqc6s+cXhw29UttPF3ZZAyRbCLftrGVGBEwbdaS
 CtKzr9P7unXBG8dJJUT3yJDaSc2X+dehKg2Vz9iCTpyg0pjTp012NNKcG
 WGFJ5X6zDOAWPTGPQnGCGiIEFs9EsFVNZt3suoevNNL7dnrvSJoBLDzwy
 BvxJPDvwcomQC1DynFqrgW/jmFT2tmhFT1K/ynmxGSQ6Uai9D+Lg93Gts Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="391536676"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="391536676"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="9329023"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO [10.213.233.30])
 ([10.213.233.30])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:50:36 -0700
Message-ID: <12f89faa-d36f-4f3a-99f3-749456d0f700@linux.intel.com>
Date: Thu, 2 Nov 2023 09:50:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm: Do not round to megabytes for greater than 1MiB
 sizes in fdinfo stats
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Steven Price <steven.price@arm.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
 <20230927133843.247957-2-tvrtko.ursulin@linux.intel.com>
 <3344d3cf-2883-27d1-424e-d33b739dceb5@arm.com>
 <d1a3df17-4c50-68ba-35d4-8a7ef62b84fb@linux.intel.com>
 <6b4eb4bd-fe32-477e-836a-4f745a173772@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <6b4eb4bd-fe32-477e-836a-4f745a173772@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/10/2023 15:43, Tvrtko Ursulin wrote:
> 
> On 28/09/2023 13:47, Tvrtko Ursulin wrote:
>>
>> On 27/09/2023 14:48, Steven Price wrote:
>>> On 27/09/2023 14:38, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> It is better not to lose precision and not revert to 1 MiB size
>>>> granularity for every size greater than 1 MiB.
>>>>
>>>> Sizes in KiB should not be so troublesome to read (and in fact machine
>>>> parsing is I expect the norm here), they align with other api like
>>>> /proc/meminfo, and they allow writing tests for the interface without
>>>> having to embed drm.ko implementation knowledge into them. (Like 
>>>> knowing
>>>> that minimum buffer size one can use for successful verification has 
>>>> to be
>>>> 1MiB aligned, and on top account for any pre-existing memory 
>>>> utilisation
>>>> outside of driver's control.)
>>>>
>>>> But probably even more importantly I think that it is just better to 
>>>> show
>>>> the accurate sizes and not arbitrary lose precision for a little bit 
>>>> of a
>>>> stretched use case of eyeballing fdinfo text directly.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>> Cc: steven.price@arm.com
>>>
>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>> Thanks! Rob? Can we have your blessing? Could you live with KiBs? :)
> 
> Acked received on #dri-devel:
> 
> [12:15] <tursulin> robclark: ping on 
> https://lists.freedesktop.org/archives/dri-devel/2023-September/424905.html - can you live with it or object?
> [14:41] <robclark> tursulin: a-b
> 
> Adding the drm-misc maintainers with an ask to merge please.

Ping please - just this one patch to merge to drm-misc-next if possible.

Regards,

Tvrtko
