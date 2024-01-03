Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF7C822BB2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD6110E274;
	Wed,  3 Jan 2024 10:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EAA10E274
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704279440; x=1735815440;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=/sTx7DraN8ocmcK9bePXkJBevqtU2CZtlqunazeftMg=;
 b=MVDFXX2VlgwVGWtN7b5vV/8mQScR/gsHkBBrZFTyXgWISK9X6aqMP9H5
 hHnTZdL7Y88PmNlH/onhiXTBW/qc97tDvUVejAHYjuy9ANfgRuduXXbwM
 rKLmsYvMVQG0tfzFvRs4AgnFU7c02UK8ywkVY32vL9mwEtL+H5NgMArjJ
 rz368M88lp0YZ5LxzXze1Ptlt8DeHpn93udpRgS4L58WUPbFfpaA+KEAl
 /CrrcxUuFapzrHsJlkq7ziPyzd4AM/5wtdzcD++sY+tI0f/xYoB5l77tm
 lZh3gq3c0reyCoSuYy+BwG3wgVkwpF5Cs1WUEPIyrzue8r0L5Vcu0piAH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396725425"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="396725425"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="783471944"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="783471944"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:57:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 02/39] drm/bridge: switch to drm_bridge_read_edid()
In-Reply-To: <0750897a-94b6-4a7f-bcb5-89c5658943ca@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704276309.git.jani.nikula@intel.com>
 <3bf556369d2e81e0391a42035a85beb303937158.1704276309.git.jani.nikula@intel.com>
 <0750897a-94b6-4a7f-bcb5-89c5658943ca@suse.de>
Date: Wed, 03 Jan 2024 12:57:03 +0200
Message-ID: <877ckq1y80.fsf@intel.com>
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

On Wed, 03 Jan 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi Jani
>
>  > drm/bridge: switch to drm_bridge_read_edid()
>
> Did you mean drm_bridge_edid_read(), here and in the other patches?

Ah, yeah, I did.

> (Personally, I'd prefer read_edid over edid_read. The former is common 
> style and easier to read.)

The name comes from drm_edid_read() family of functions, which are so
named because they reside in drm_edid.[ch].

BR,
Jani.

>
> Best regards
> Thomas
>
> Am 03.01.24 um 11:08 schrieb Jani Nikula:
>> Prefer using the struct drm_edid based functions.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/drm_bridge_connector.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
>> index 3acd67021ec6..982552c9f92c 100644
>> --- a/drivers/gpu/drm/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/drm_bridge_connector.c
>> @@ -239,27 +239,27 @@ static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
>>   					       struct drm_bridge *bridge)
>>   {
>>   	enum drm_connector_status status;
>> -	struct edid *edid;
>> +	const struct drm_edid *drm_edid;
>>   	int n;
>>   
>>   	status = drm_bridge_connector_detect(connector, false);
>>   	if (status != connector_status_connected)
>>   		goto no_edid;
>>   
>> -	edid = drm_bridge_get_edid(bridge, connector);
>> -	if (!drm_edid_is_valid(edid)) {
>> -		kfree(edid);
>> +	drm_edid = drm_bridge_edid_read(bridge, connector);
>> +	if (!drm_edid_valid(drm_edid)) {
>> +		drm_edid_free(drm_edid);
>>   		goto no_edid;
>>   	}
>>   
>> -	drm_connector_update_edid_property(connector, edid);
>> -	n = drm_add_edid_modes(connector, edid);
>> +	drm_edid_connector_update(connector, drm_edid);
>> +	n = drm_edid_connector_add_modes(connector);
>>   
>> -	kfree(edid);
>> +	drm_edid_free(drm_edid);
>>   	return n;
>>   
>>   no_edid:
>> -	drm_connector_update_edid_property(connector, NULL);
>> +	drm_edid_connector_update(connector, NULL);
>>   	return 0;
>>   }
>>   

-- 
Jani Nikula, Intel
