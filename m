Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E06E55E530
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 16:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C890113505;
	Tue, 28 Jun 2022 14:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3431134BC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656425134; x=1687961134;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=clmJL26rycHPtOcX3oz+mlaEUYIILkqC1w8h4HSw21k=;
 b=DWkC+dWYql56wSKrJOzR+xqkeSluF8wmyMOlnOU0HglKm3hcgunJAwzp
 2wBMRCI8Pqkm7b0vYe/AKGFp6KUddypIBq1f2hvHiD+2OVrfi7zTvZtpD
 F/e5VxhGCoc1rxjnZyA8ZgpMcejPXmYXC7C7VVvlkMy8h7LXTu1f6W5mn
 bJbm+qa11SOFmWFF2Cc1mpcyvRLvQQWsrAEPzm9GGOom99nfW5tYR8xRZ
 UE5M6DGAhzSA6Td59aDQCsZ8uoD72tQX+3cAsyGt5VATkelNVKzXHVRXL
 5CiKw8BDtCQT1BBJkUI4Mq/dAqMFCknC1cEHJvliQ/mKKuiMlGjY8AO/T w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="282484560"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="282484560"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 07:05:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="836685675"
Received: from mwardyn-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.49.11])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 07:05:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <maxime@cerno.tech>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2 08/68] drm/connector: Introduce
 drmm_connector_init_with_ddc
In-Reply-To: <473edc93-e60d-6230-33a4-1bf224373a0a@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-9-maxime@cerno.tech>
 <473edc93-e60d-6230-33a4-1bf224373a0a@suse.de>
Date: Tue, 28 Jun 2022 17:05:28 +0300
Message-ID: <87h744rihj.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Jun 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 22.06.22 um 16:31 schrieb Maxime Ripard:
>> Let's create a DRM-managed variant of drm_connector_init_with_ddc that will
>> take care of an action of the connector cleanup.
>> 
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> ---
>>   drivers/gpu/drm/drm_connector.c | 74 ++++++++++++++++++++++++++++-----
>>   include/drm/drm_connector.h     |  5 +++
>>   2 files changed, 69 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 0fec2d87178f..076ca247c6d0 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -354,6 +354,30 @@ int drm_connector_init(struct drm_device *dev,
>>   }
>>   EXPORT_SYMBOL(drm_connector_init);
>>   
>> +typedef int (*connector_init_t)(struct drm_device *dev,
>> +				struct drm_connector *connector,
>> +				const struct drm_connector_funcs *funcs,
>> +				int connector_type);
>> +
>> +static int __drm_connector_init_with_ddc(struct drm_device *dev,
>> +					 struct drm_connector *connector,
>> +					 connector_init_t init_func,
>> +					 const struct drm_connector_funcs *funcs,
>> +					 int connector_type,
>> +					 struct i2c_adapter *ddc)
>
> Back in the days when drm_connector_init_with_ddc() was added, there was 
> a small controversy about whether we should simply extend the regular 
> drm_connector_init() to support the extra ddc argument. That would have 
> meant a lot of churn, but the idea was probably sound.
>
> Maybe it would be better to provide a single function 
> drmm_connector_init() that receives a ddc argument. If the argument is 
> NULL, no DDC channel would be set. This would make 
> drmm_connector_init_with_ddc() unnnecessary.

FWIW I really dislike the "_with_ddc" variant as a function name. Like,
what if you add another thing you'd need to pass in at init. Add
functions "_with_ddc_and_foo" and "_with_foo", and so on.

I'd take the churn to convert to drm_connector_init() and
drmm_connector_init() only.

BR,
Jani.


>
> Best regards
> Thomas
>
>> +{
>> +	int ret;
>> +
>> +	ret = init_func(dev, connector, funcs, connector_type);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* provide ddc symlink in sysfs */
>> +	connector->ddc = ddc;
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * drm_connector_init_with_ddc - Init a preallocated connector
>>    * @dev: DRM device
>> @@ -371,6 +395,10 @@ EXPORT_SYMBOL(drm_connector_init);
>>    *
>>    * Ensures that the ddc field of the connector is correctly set.
>>    *
>> + * Note: consider using drmm_connector_init_with_ddc() instead of
>> + * drm_connector_init_with_ddc() to let the DRM managed resource
>> + * infrastructure take care of cleanup and deallocation.
>> + *
>>    * Returns:
>>    * Zero on success, error code on failure.
>>    */
>> @@ -380,16 +408,9 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
>>   				int connector_type,
>>   				struct i2c_adapter *ddc)
>>   {
>> -	int ret;
>> -
>> -	ret = drm_connector_init(dev, connector, funcs, connector_type);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* provide ddc symlink in sysfs */
>> -	connector->ddc = ddc;
>> -
>> -	return ret;
>> +	return __drm_connector_init_with_ddc(dev, connector,
>> +					     drm_connector_init,
>> +					     funcs, connector_type, ddc);
>>   }
>>   EXPORT_SYMBOL(drm_connector_init_with_ddc);
>>   
>> @@ -443,6 +464,39 @@ int drmm_connector_init(struct drm_device *dev,
>>   }
>>   EXPORT_SYMBOL(drmm_connector_init);
>>   
>> +/**
>> + * drmm_connector_init_with_ddc - Init a preallocated connector
>> + * @dev: DRM device
>> + * @connector: the connector to init
>> + * @funcs: callbacks for this connector
>> + * @connector_type: user visible type of the connector
>> + * @ddc: pointer to the associated ddc adapter
>> + *
>> + * Initialises a preallocated connector. Connectors should be
>> + * subclassed as part of driver connector objects.
>> + *
>> + * Cleanup is automatically handled with a call to
>> + * drm_connector_cleanup() in a DRM-managed action.
>> + *
>> + * The connector structure should be allocated with drmm_kzalloc().
>> + *
>> + * Ensures that the ddc field of the connector is correctly set.
>> + *
>> + * Returns:
>> + * Zero on success, error code on failure.
>> + */
>> +int drmm_connector_init_with_ddc(struct drm_device *dev,
>> +				 struct drm_connector *connector,
>> +				 const struct drm_connector_funcs *funcs,
>> +				 int connector_type,
>> +				 struct i2c_adapter *ddc)
>> +{
>> +	return __drm_connector_init_with_ddc(dev, connector,
>> +					     drmm_connector_init,
>> +					     funcs, connector_type, ddc);
>> +}
>> +EXPORT_SYMBOL(drmm_connector_init_with_ddc);
>> +
>>   /**
>>    * drm_connector_attach_edid_property - attach edid property.
>>    * @connector: the connector
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 35a6b6e944b7..2565541f2c10 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1676,6 +1676,11 @@ int drmm_connector_init(struct drm_device *dev,
>>   			struct drm_connector *connector,
>>   			const struct drm_connector_funcs *funcs,
>>   			int connector_type);
>> +int drmm_connector_init_with_ddc(struct drm_device *dev,
>> +				 struct drm_connector *connector,
>> +				 const struct drm_connector_funcs *funcs,
>> +				 int connector_type,
>> +				 struct i2c_adapter *ddc);
>>   void drm_connector_attach_edid_property(struct drm_connector *connector);
>>   int drm_connector_register(struct drm_connector *connector);
>>   void drm_connector_unregister(struct drm_connector *connector);

-- 
Jani Nikula, Intel Open Source Graphics Center
