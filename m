Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C327B8B2436
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC4F11A4CC;
	Thu, 25 Apr 2024 14:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHvqGiH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B3A11A4CC;
 Thu, 25 Apr 2024 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055967; x=1745591967;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qGRpt6bZDCsTz1PWX7f/9ZZ8kRWoiqHM7jRTfpecQw8=;
 b=XHvqGiH4P9lkaLT9j6BEeR97goj+bSKEV/yAy/D/ysz7dY7DqugMZJg5
 DpEWqTwrJ3K0OkCzgEp51nle93hIHR9BWQZPJ/AYUhGwCj+vGQTHDtAHz
 V1gRn5ElyhmLfJiTMp/ag6lzvnvItExEsO7BxNUjwTLztgHNV2KWkpd0t
 IFhLxBYHZQN2lOiBy8fLM9/PDHOBF6mdskyFSNpSD5i/DwEcuI4jmpOW6
 ajceo9fRmNDcvFM40AEOY6LkF7lNmgqzWODntN5zF+S7lLUKLWt8l3JiM
 h8qgisWp08jY351AY1vXlVjm53ZzTerejjnFZwbJNX95H2b+flrZAyU26 A==;
X-CSE-ConnectionGUID: rHlRuvnETDqfTNv8qGzveg==
X-CSE-MsgGUID: 0eGnzqPTTpWuskcSAFUYyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20436523"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="20436523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:26 -0700
X-CSE-ConnectionGUID: 4ojWzRI2S7OIyZ2bon94wA==
X-CSE-MsgGUID: XYNWXsRBRHCSY8ETRTM1BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29871168"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:24 -0700
Message-ID: <ab3bcaa5-15b3-48a0-9916-58806b20ae06@linux.intel.com>
Date: Thu, 25 Apr 2024 20:12:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: add devm release action
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, tzimmermann@suse.de,
 intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
 <ZibOmWPr3pZXdoNM@intel.com>
 <c899f2a5-e4f8-421f-ba87-8e8c15a6f665@linux.intel.com>
 <Zify_rd1yV6ki7oR@intel.com> <20240424-spectacular-lumpy-guan-7188eb@houat>
 <Zij5EJLa-E5VEX14@intel.com>
 <20240425-diligent-literate-terrier-2e787d@penduick>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240425-diligent-literate-terrier-2e787d@penduick>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/04/24 18:22, Maxime Ripard wrote:
> On Wed, Apr 24, 2024 at 08:20:32AM -0400, Rodrigo Vivi wrote:
>> On Wed, Apr 24, 2024 at 01:49:16PM +0200, Maxime Ripard wrote:
>>> On Tue, Apr 23, 2024 at 01:42:22PM -0400, Rodrigo Vivi wrote:
>>>> On Tue, Apr 23, 2024 at 02:25:06PM +0530, Aravind Iddamsetty wrote:
>>>>> On 23/04/24 02:24, Rodrigo Vivi wrote:
>>>>>> On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrote:
>>>>>>> In scenarios where drm_dev_put is directly called by driver we want to
>>>>>>> release devm_drm_dev_init_release action associated with struct
>>>>>>> drm_device.
>>>>>>>
>>>>>>> v2: Directly expose the original function, instead of introducing a
>>>>>>> helper (Rodrigo)
>>>>>>>
>>>>>>> v3: add kernel-doc (Maxime Ripard)
>>>>>>>
>>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>
>>>>>> please avoid these empty lines here.... cc, rv-b, sign-offs, links,
>>>>>> etc are all in the same block.
>>>>> ok.
>>>>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
>>>>>>>  include/drm/drm_drv.h     |  2 ++
>>>>>>>  2 files changed, 15 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>>>>> index 243cacb3575c..9d0409165f1e 100644
>>>>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>>>>> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *parent,
>>>>>>>  					devm_drm_dev_init_release, dev);
>>>>>>>  }
>>>>>>>  
>>>>>>> +/**
>>>>>>> + * devm_drm_dev_release_action - Call the final release action of the device
>>>>>> Seeing the doc here gave me a second thought....
>>>>>>
>>>>>> the original release should be renamed to _devm_drm_dev_release
>>>>>> and this should be called devm_drm_dev_release without the 'action' word.
>>>>> i believe, was suggested earlier to directly expose the main function, is 
>>>>> there any reason to have a __ version ?
>>>> No no, just ignore me. Just remove the '_action' and don't change the other.
>>>>
>>>> I don't like exposing the a function with '__'. what would '__' that mean?
>>>> This is what I meant on the first comment.
>>>>
>>>> Now, I believe that we don't need the '_action'. What does the 'action' mean?
>>>>
>>>> the devm_drm_dev_release should be enough. But then I got confused and
>>>> I thought it would conflict with the original released function name.
>>>> But I misread it.
>>> I don't think devm_drm_dev_release is a good name either. Just like any
>>> other devm_* function that cancels what a previous one has been doing
>>> (devm_kfree, devm_backlight_device_unregister, devm_nvmem_device_put,
>>> etc.) it should be called devm_drm_dev_put or something similar.
>> I see what you mean, but I don't believe the 'put' is the best option,
>> for 2 reasons:
>> - in general, we have put paired with gets and this has not get equivalent
> Yeah, that's true. _release is fine then I guess.
>
>> - this bypass the regular get/put mechanism and forces the releases that
>>   would be done only after all drm_dev_put() taking ref to zero.
> I don't think it does? devm_release_action will only remove the devm
> action and execute it directly, but this action here is a call to
> drm_dev_put, so we might still have other references taken that would
> defer the device being freed.
yes i.e right, i assumed drm_dev_unplug would close all client handles but no.
So i was thinking if it is ok to iterate over  no of clients and call drm_dev_put in either
drm_dev_unplug or as part of this devm_release.


Thanks,
Aravind.
>
> Maxime
