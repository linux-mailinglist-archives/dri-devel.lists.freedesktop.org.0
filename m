Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B08C9DD1
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 15:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA7210E6FF;
	Mon, 20 May 2024 13:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpslbmVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B3310E6FF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 13:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716210387; x=1747746387;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QNxMxsp5f2IJVZm6nz8esw+/sZvJ7kDRqA+fh+kKJJQ=;
 b=lpslbmVbUZK/tUUDWvGrxAz6PxdcS5MEXNZliCfBga3oKlgMDQmr6+YU
 Uq/37Dbmb3/2mTybaX31RFJt0i/yrpOJp/ZgO9JM8CmuplEP1SBvQgaIz
 8JJNl5amNIDwtmlNgDI7qHqVErnd/DzoV7+ZEJOj6PCQAh1oJERxZB7MV
 PK9NzBMTuL9pxKccsogyzhZiyamb+01DQSfacwCAak40EqmSgWEbnQDH3
 MQbst3yeaKeDKozI27186U3KcSWlH4BxvqWypd1xEJk47GPq1sGCp15lh
 cXdVnnJdJNdVN5eIeJ7TeYVL8zlYsJEP3Att6lRTQuZ7xNhFroIaYrQRv Q==;
X-CSE-ConnectionGUID: rPEhhJhrSkuSt+1IwMlpWA==
X-CSE-MsgGUID: 8W++96brSB+OQ6PXibs5tQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12526300"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="12526300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 06:06:27 -0700
X-CSE-ConnectionGUID: F6+f0sAaTM632rEMs4GzRw==
X-CSE-MsgGUID: aBJJoIvDS6qStyLHllYAIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32554370"
Received: from unknown (HELO localhost) ([10.245.246.99])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 06:06:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/11] drm/imx/tve: convert to struct drm_edid
In-Reply-To: <opukbtmhml563rxrjkg2d6ynysth3id6acscnnnbkrds3ix2xf@gbdxb6e5vvxz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715691257.git.jani.nikula@intel.com>
 <2f59a7ad10c29c21f08223ef19221cef48623cc8.1715691257.git.jani.nikula@intel.com>
 <opukbtmhml563rxrjkg2d6ynysth3id6acscnnnbkrds3ix2xf@gbdxb6e5vvxz>
Date: Mon, 20 May 2024 16:06:19 +0300
Message-ID: <87v838skdw.fsf@intel.com>
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

On Mon, 20 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Tue, May 14, 2024 at 03:55:16PM +0300, Jani Nikula wrote:
>> Prefer the struct drm_edid based functions for reading the EDID and
>> updating the connector.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>  drivers/gpu/drm/imx/ipuv3/imx-tve.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
>> index b49bddb85535..29f494bfff67 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
>> @@ -201,18 +201,16 @@ static int tve_setup_vga(struct imx_tve *tve)
>>  static int imx_tve_connector_get_modes(struct drm_connector *connector)
>>  {
>>  	struct imx_tve *tve = con_to_tve(connector);
>> -	struct edid *edid;
>> -	int ret = 0;
>> +	const struct drm_edid *drm_edid;
>> +	int ret;
>>  
>>  	if (!tve->ddc)
>>  		return 0;
>>  
>> -	edid = drm_get_edid(connector, tve->ddc);
>> -	if (edid) {
>> -		drm_connector_update_edid_property(connector, edid);
>> -		ret = drm_add_edid_modes(connector, edid);
>> -		kfree(edid);
>> -	}
>> +	drm_edid = drm_edid_read_ddc(connector, tve->ddc);
>> +	drm_edid_connector_update(connector, drm_edid);
>> +	ret = drm_edid_connector_add_modes(connector);
>> +	drm_edid_free(drm_edid);
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Nit: if you change two last lines, you can drop ret= assignment and use
> return drm_edid_connector_add_modes(connector).
>
> Maybe we shoud add cocci rule for such cases.

I think there was a cocci rule like that, but a lot of people (including
yours truly) preferred to keep the assignment, and the patches ended up
in bikeshedding, so the cocci was removed.

My argument is that it's not uncommon to keep adding and removing stuff
while the code evolves, and having to change the return statement is
boring and makes the diff harder to follow. It's a bit like that extra
comma at the end of initialization lists or enumeration definitions.

Others think the code should reflect current state and not prepare for
scenarios that might never arrive.

Both are correct, so it's perfect for never ending bikeshedding. ;)


BR,
Jani.


>
>>  
>>  	return ret;
>>  }
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel
