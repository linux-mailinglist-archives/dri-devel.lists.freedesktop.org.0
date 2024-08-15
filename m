Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F14B952E97
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 14:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BA210E012;
	Thu, 15 Aug 2024 12:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wj/F70lD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62C510E012
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 12:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723726552; x=1755262552;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2X9G21GfySd/3z6sUyOyAGem1WNWSQkR8WKYFXbYVmo=;
 b=Wj/F70lDfTKc1vL/6GynWfvSqQjAGe7yT6unICnhAhnLrsQNGrTFsVb0
 Tdulw7V3xlpCQjS2237b8kuIahiKeMd/dOgWy499sRN9Rrw37SGUz5QaW
 Tx0JvfdjcuJKahIzR2Ore688RL/U1Ll85pvMbw9RO1wXqcz/GAVU+duoR
 1qDYlr4rDfrRYZ4VL1RNZAHlu8P6jXvp4wHm8xwsAWqbOu6Gv2LpkU3OP
 DJ+LY2ntM31cXKhd/WwvH3ISH7Y5EpQMrFuGoZg7x6jIt/udbQ4MkgdOL
 S0xBrf3MKOet8JpAybt9pQRcfS9oQzCEQSqD36Q1eb4MnzBd6SZl1GoOj Q==;
X-CSE-ConnectionGUID: f3zc9AsASV+FDPhK8W8XsA==
X-CSE-MsgGUID: oMddbYIDR2mGBvtchNF3EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33369564"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="33369564"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 05:55:36 -0700
X-CSE-ConnectionGUID: nOnh68cWRNOGH4sUDzc4NQ==
X-CSE-MsgGUID: qH0V5UOYSDiL/QqEHui67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="60108144"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 05:55:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Alain Volmat
 <alain.volmat@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/11] drm/sti/sti_hdmi: convert to struct drm_edid
In-Reply-To: <Znk6y4_attY361en@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715691257.git.jani.nikula@intel.com>
 <dd1c232cb85d5e0815af73c918953fa3b852baa2.1715691257.git.jani.nikula@intel.com>
 <Znk6y4_attY361en@phenom.ffwll.local>
Date: Thu, 15 Aug 2024 15:55:30 +0300
Message-ID: <87jzgix7wd.fsf@intel.com>
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

On Mon, 24 Jun 2024, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, May 14, 2024 at 03:55:08PM +0300, Jani Nikula wrote:
>> Prefer the struct drm_edid based functions for reading the EDID and
>> updating the connector.
>> 
>> The functional change is that the CEC physical address gets invalidated
>> when the EDID could not be read.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Cc: Alain Volmat <alain.volmat@foss.st.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/sti/sti_hdmi.c | 24 ++++++++++++++----------
>>  1 file changed, 14 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
>> index 500936d5743c..3b62ec2d742f 100644
>> --- a/drivers/gpu/drm/sti/sti_hdmi.c
>> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
>> @@ -974,28 +974,32 @@ static const struct drm_bridge_funcs sti_hdmi_bridge_funcs = {
>>  
>>  static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
>>  {
>> +	const struct drm_display_info *info = &connector->display_info;
>>  	struct sti_hdmi_connector *hdmi_connector
>>  		= to_sti_hdmi_connector(connector);
>>  	struct sti_hdmi *hdmi = hdmi_connector->hdmi;
>> -	struct edid *edid;
>> +	const struct drm_edid *drm_edid;
>>  	int count;
>>  
>>  	DRM_DEBUG_DRIVER("\n");
>>  
>> -	edid = drm_get_edid(connector, hdmi->ddc_adapt);
>> -	if (!edid)
>> -		goto fail;
>> +	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc_adapt);
>
> I think you can use drm_edid_read here since the ddc is correctly set up
> with drm_connector_init_with_ddc()
>
>> +
>> +	drm_edid_connector_update(connector, drm_edid);
>>  
>> -	cec_notifier_set_phys_addr_from_edid(hdmi->notifier, edid);
>> +	cec_notifier_set_phys_addr(hdmi->notifier,
>> +				   connector->display_info.source_physical_address);
>> +
>> +	if (!drm_edid)
>> +		goto fail;
>
> Unless I missed something, all the functions can cope with a NULL edid,
> but this jump means in the failure case you'll return stack garbage in
> count. Just drop this check?

Reviving an old thread... the goto fail path returns 0, not count.

BR,
Jani.


>
>>  
>> -	count = drm_add_edid_modes(connector, edid);
>> -	drm_connector_update_edid_property(connector, edid);
>> +	count = drm_edid_connector_add_modes(connector);
>>  
>>  	DRM_DEBUG_KMS("%s : %dx%d cm\n",
>> -		      (connector->display_info.is_hdmi ? "hdmi monitor" : "dvi monitor"),
>> -		      edid->width_cm, edid->height_cm);
>> +		      info->is_hdmi ? "hdmi monitor" : "dvi monitor",
>> +		      info->width_mm / 10, info->height_mm / 10);
>>  
>> -	kfree(edid);
>> +	drm_edid_free(drm_edid);
>>  	return count;
>
> With the two items addressed:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>>  
>>  fail:
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel
