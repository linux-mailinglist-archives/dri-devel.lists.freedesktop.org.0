Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52698C6661
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 14:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16AF10E2A5;
	Wed, 15 May 2024 12:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXzW3Rsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C939510E2A5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715776449; x=1747312449;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XymYIZrTNs0PqoJLPqZU96l6SV3iNPwocMiKU2rcpgw=;
 b=kXzW3RsxOncUhhVhUEdFO7K/NlLCg0iwIemSOMAxlpFIgGnARjN1ia0x
 E4oNveJWYjo8TvxayGvdZKVFQNlYSPAZkXYFLEFp+HoG0mzEYxfMyFCq1
 8BXZj4QUZUfCcVz8xfRSZwnKNlC8adbzVnHaNeBQOLv8SSRGwU6ovK39t
 VJ9q6koNHqS/nOzkfJzkFV+wMzBvdnvp2cryaSCF70a4XGwf8x+KRXn4g
 KjMEBQYQUB6DNSi99+UB/8xo/ZTQaHIQNEsKBTRJy4hLb/VR+Yg/SIDAr
 KgCEg0B47i9vGH7gLS1p5tbffoBMgiE4zCmC5X02v0hUD2BkgZ6VTF/mh w==;
X-CSE-ConnectionGUID: bJeg2U8XReGN1VU870f44w==
X-CSE-MsgGUID: F7Nyvi9PS7OZvYXURvSHeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29312703"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="29312703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:34:09 -0700
X-CSE-ConnectionGUID: 7XMfzVB0QZWUge1bliLL4w==
X-CSE-MsgGUID: gt/Y1OqMSguBSjSszNpTHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31166004"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.141])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:34:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao
 <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH 05/11] drm/hisilicon/hibmc: convert to struct drm_edid
In-Reply-To: <784e277b-ef15-4c82-9720-c9a03d53f3c6@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715691257.git.jani.nikula@intel.com>
 <386e3a64efbdd61c3eaed3f49ea9c3ebd4fcd41d.1715691257.git.jani.nikula@intel.com>
 <784e277b-ef15-4c82-9720-c9a03d53f3c6@suse.de>
Date: Wed, 15 May 2024 15:34:02 +0300
Message-ID: <87jzjvckzp.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 May 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 14.05.24 um 14:55 schrieb Jani Nikula:
>> Prefer the struct drm_edid based functions for reading the EDID and
>> updating the connector.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> ---
>>
>> Cc: Xinliang Liu <xinliang.liu@linaro.org>
>> Cc: Tian Tao <tiantao6@hisilicon.com>
>> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: Yongqin Liu <yongqin.liu@linaro.org>
>> Cc: John Stultz <jstultz@google.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c    | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> index 94e2c573a7af..409c551c92af 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> @@ -24,14 +24,16 @@
>>   
>>   static int hibmc_connector_get_modes(struct drm_connector *connector)
>
> Could this function be replaced with a call to 
> drm_connector_helper_get_modes()? With the patch, the only difference is 
> the call to the _noedid() function, which the DRM core does 
> automatically. There will still be a difference in the maximum 
> resolution, but standardizing on 1024x768 seems preferable to me.

Looks like it might work, but personally, I'm trying to shy away from
any further cleanups than just switching to struct drm_edid. I've got my
plate pretty full already.

BR,
Jani.


>
> Best regards
> Thomas
>
>>   {
>> -	int count;
>> -	void *edid;
>>   	struct hibmc_connector *hibmc_connector = to_hibmc_connector(connector);
>> +	const struct drm_edid *drm_edid;
>> +	int count;
>> +
>> +	drm_edid = drm_edid_read_ddc(connector, &hibmc_connector->adapter);
>>   
>> -	edid = drm_get_edid(connector, &hibmc_connector->adapter);
>> -	if (edid) {
>> -		drm_connector_update_edid_property(connector, edid);
>> -		count = drm_add_edid_modes(connector, edid);
>> +	drm_edid_connector_update(connector, drm_edid);
>> +
>> +	if (drm_edid) {
>> +		count = drm_edid_connector_add_modes(connector);
>>   		if (count)
>>   			goto out;
>>   	}
>> @@ -42,7 +44,8 @@ static int hibmc_connector_get_modes(struct drm_connector *connector)
>>   	drm_set_preferred_mode(connector, 1024, 768);
>>   
>>   out:
>> -	kfree(edid);
>> +	drm_edid_free(drm_edid);
>> +
>>   	return count;
>>   }
>>   

-- 
Jani Nikula, Intel
