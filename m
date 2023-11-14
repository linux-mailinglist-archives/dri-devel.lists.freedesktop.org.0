Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC37EB2AA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 15:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343ED10E0A0;
	Tue, 14 Nov 2023 14:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586AE10E0A0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 14:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699972990; x=1731508990;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=Hkpn0DizSMYTdNqKSlIduuNHWk6r6djmhc+C69dKQbg=;
 b=JAWZRmJMQGgxGa+nxkHLGgW9TkLG69eZtOI6Bl+Ld1kz5OWfN6Zrt0Vv
 /mTGFC7uLoR6D5RMPdkVYg4sI9vI4Ql6Ze7jqq2dRbrG44q0GVlE7w6c1
 fNz/bZQ845Y6OVMQ3CVr6BDbCHJH7+0gfx6UM2JJ5BvzT0uTPDNsZsxNs
 1qBKXtm6hOPtl4mUt8fgp4HnUEz8bG6Qeg27olFijrCXebP75uYVvAgO6
 Z6BHoLknLPEZC07jQTO4cuG5figIcUjKEudxdGopUhiJfSGxXapwFe016
 mi3UzcUH7gylXZfBgfXsGYaHdulPke9bQ+FPwSeNuD8cm9x6YbJCcOyT7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390460299"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="390460299"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 06:43:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="6046165"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 06:43:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/probe-helper: convert
 drm_connector_helper_get_modes_from_ddc() to struct drm_edid
In-Reply-To: <54a3c4bc-b013-4096-ab59-b163c4984618@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231114105815.4188901-1-jani.nikula@intel.com>
 <54a3c4bc-b013-4096-ab59-b163c4984618@suse.de>
Date: Tue, 14 Nov 2023 16:43:06 +0200
Message-ID: <877cmks8ed.fsf@intel.com>
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

On Tue, 14 Nov 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 14.11.23 um 11:58 schrieb Jani Nikula:
>> Going forward, the struct drm_edid based functions drm_edid_read(),
>> drm_edid_connector_update() and drm_edid_connector_add_modes() are the
>> preferred ways of retrieving the EDID and updating the connector.
>> 
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> If I'm not mistaken, the correct pattern is to read the EDID block in 
> the detect callback and only parse it for modes in get_modes. If so, you 
> might also inline this helper into its only caller in mgag200. I'll 
> later split it up into detect and get_modes.

That's what we do in i915 anyway.

drm_edid_read() and drm_edid_connector_update() in ->detect and ->force,
and drm_edid_connector_add_modes() in ->get_modes.

BR,
Jani.


>
> Best regards
> Thomas
>
>> ---
>>   drivers/gpu/drm/drm_probe_helper.c | 17 ++++++++---------
>>   1 file changed, 8 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
>> index 3f479483d7d8..309d88f13648 100644
>> --- a/drivers/gpu/drm/drm_probe_helper.c
>> +++ b/drivers/gpu/drm/drm_probe_helper.c
>> @@ -1116,21 +1116,20 @@ EXPORT_SYMBOL(drm_crtc_helper_mode_valid_fixed);
>>    */
>>   int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
>>   {
>> -	struct edid *edid;
>> -	int count = 0;
>> +	const struct drm_edid *drm_edid;
>> +	int count;
>>   
>>   	if (!connector->ddc)
>>   		return 0;
>>   
>> -	edid = drm_get_edid(connector, connector->ddc);
>> +	drm_edid = drm_edid_read(connector);
>> +
>> +	/* clears property if EDID is NULL */
>> +	drm_edid_connector_update(connector, drm_edid);
>>   
>> -	// clears property if EDID is NULL
>> -	drm_connector_update_edid_property(connector, edid);
>> +	count = drm_edid_connector_add_modes(connector);
>>   
>> -	if (edid) {
>> -		count = drm_add_edid_modes(connector, edid);
>> -		kfree(edid);
>> -	}
>> +	drm_edid_free(drm_edid);
>>   
>>   	return count;
>>   }

-- 
Jani Nikula, Intel
