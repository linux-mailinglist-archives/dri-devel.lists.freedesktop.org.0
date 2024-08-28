Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827199628C5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DCE10E521;
	Wed, 28 Aug 2024 13:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K08gHYFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C472910E51F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724852159; x=1756388159;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bKwXrN6+5cKfdAZBgjx7Avct1ebWy+U9c3HWlI9fiu8=;
 b=K08gHYFMiMdMTaxK7edv38BRFyLmxKlxesj5FIy39ckfqjXlOyUZrabe
 mIro5WC5T98LUc8SgYN2JZ0mAT1Eavyi8FGrS9O4p+FXsFuyTbjqQp3xK
 cEIGhcWzoUB4l3BJYwTzxuBNn70qo/DvUXtE/vUzy2WqJt2n8GqjBIXlu
 gQ7wI3fvaXr48dQ03z39aCkbznNF6q0V2oGdmqB5vl0Ido6vKRHsnhBoc
 r2LBQX5WW0mlJ1M5y1C7PzGE1kNtZyagWxCarS8+T2qq+YOqWTRsawE9Z
 Q1lYnwRl8K8Mg9psP59tEPK8/j7UGiwLpKbM1kvb+mCnU0jWAVFUiowd2 A==;
X-CSE-ConnectionGUID: 70It1ZHmT+GO3GP24dzs5A==
X-CSE-MsgGUID: CKj4advJT8e+iXb8F/b7Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="48765433"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="48765433"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 06:35:57 -0700
X-CSE-ConnectionGUID: ICOlxACDTl6DQniKZGOPIg==
X-CSE-MsgGUID: gzOjOr5/Sie01vp1W9L3zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63282474"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 06:35:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 6/6] drm/tiny/gm12u320: convert to struct drm_edid
In-Reply-To: <a1e0ddbc-30b5-4303-9d1a-99f51c44d679@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1724348429.git.jani.nikula@intel.com>
 <c31c3afa883a3321345608c480c26161b638a83e.1724348429.git.jani.nikula@intel.com>
 <a1e0ddbc-30b5-4303-9d1a-99f51c44d679@suse.de>
Date: Wed, 28 Aug 2024 16:35:50 +0300
Message-ID: <87seuoydl5.fsf@intel.com>
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

On Wed, 28 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 22.08.24 um 19:42 schrieb Jani Nikula:
>> Prefer the struct drm_edid based functions for allocating the EDID and
>> updating the connector.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> ---
>>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/tiny/gm12u320.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
>> index e0defb1d134f..0bd7707c053e 100644
>> --- a/drivers/gpu/drm/tiny/gm12u320.c
>> +++ b/drivers/gpu/drm/tiny/gm12u320.c
>> @@ -464,7 +464,7 @@ static int gm12u320_set_ecomode(struct gm12u320_device *gm12u320)
>>    * Note this assumes this driver is only ever used with the Acer C120, if we
>>    * add support for other devices the vendor and model should be parameterized.
>>    */
>> -static struct edid gm12u320_edid = {
>> +static const struct edid gm12u320_edid = {
>>   	.header		= { 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00 },
>>   	.mfg_id		= { 0x04, 0x72 },	/* "ACR" */
>>   	.prod_code	= { 0x20, 0xc1 },	/* C120h */
>> @@ -523,8 +523,15 @@ static struct edid gm12u320_edid = {
>>   
>>   static int gm12u320_conn_get_modes(struct drm_connector *connector)
>>   {
>> -	drm_connector_update_edid_property(connector, &gm12u320_edid);
>> -	return drm_add_edid_modes(connector, &gm12u320_edid);
>> +	const struct drm_edid *drm_edid;
>> +	int count;
>> +
>> +	drm_edid = drm_edid_alloc(&gm12u320_edid, sizeof(gm12u320_edid));
>
> Wouldn't it be better to use drm_edid_read_custom() to get the 
> connector's edid override, if any?

It would, no doubt. But it's more work, and the conversion is more error
prone. I don't have the devices to test any of this, and I don't see
many people jumping in to help with that either.

So I'm opting for the minimum but positive incremental improvements with
the drm_edid conversions.

BR,
Jani.


>
> Best regards
> Thomas
>
>> +	drm_edid_connector_update(connector, drm_edid);
>> +	count = drm_edid_connector_add_modes(connector);
>> +	drm_edid_free(drm_edid);
>> +
>> +	return count;
>>   }
>>   
>>   static const struct drm_connector_helper_funcs gm12u320_conn_helper_funcs = {

-- 
Jani Nikula, Intel
