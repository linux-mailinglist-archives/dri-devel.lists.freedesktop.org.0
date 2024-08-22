Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248CA95BBFD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 18:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1FC10EB6C;
	Thu, 22 Aug 2024 16:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAstY/vo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9844F10EB6C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724344343; x=1755880343;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2b8SG7DLbOxYNCCd/9NFlCchUZkfIIEqj6y3J8H6kMU=;
 b=nAstY/voIMm36SlrQmz30v/edcFlkv3sk37dpDGeMeJ3udvADEGqxHru
 bCWzdlZfOT+t00efktK2zyCA6tjf3R/cFMIYL2yND76G2U/NW4pe5im4v
 ntL2X9wR5UaxjQVCPHLYIzIRuK5eHe5Z+pDwpUTA9C27TkNgwXM5T+6Db
 JdWQX+/VRZvMRbgRpE98XOIvwKKLVM4kRVPDz7fr0AiHMJVrrMZp0dTUN
 JlfzTetjZGEMJ+FrJkv53JantsYPZ2qUeVjY94NmR/qgYwo2NIXDi3nP+
 eL/vF+t5w8ccCPqU9G615+/z4FcDVc931N4gb87UqMQSwGcWEuA+67l5S w==;
X-CSE-ConnectionGUID: 59LvulO8RGShh8tshjUy5w==
X-CSE-MsgGUID: Rwq/WaCLTXmtkUACu11DiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33931767"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="33931767"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 09:32:22 -0700
X-CSE-ConnectionGUID: FmrffpcERQySAHRVZ1eFtw==
X-CSE-MsgGUID: WtlCK4i5QSCjb1mT1SDSgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61821101"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.121])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 09:32:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/11] drm/tegra: convert to struct drm_edid
In-Reply-To: <Znk8bwXush7mcOhE@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715691257.git.jani.nikula@intel.com>
 <e037667dfc325925bdeabff539df1e708d7c3c64.1715691257.git.jani.nikula@intel.com>
 <Znk8bwXush7mcOhE@phenom.ffwll.local>
Date: Thu, 22 Aug 2024 19:32:15 +0300
Message-ID: <87y14o34ds.fsf@intel.com>
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
> On Tue, May 14, 2024 at 03:55:15PM +0300, Jani Nikula wrote:
>> Prefer the struct drm_edid based functions for reading the EDID and
>> updating the connector.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Mikko Perttunen <mperttunen@nvidia.com>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: linux-tegra@vger.kernel.org
>> ---
>>  drivers/gpu/drm/tegra/drm.h    |  2 +-
>>  drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
>>  2 files changed, 18 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
>> index 682011166a8f..2f3781e04b0a 100644
>> --- a/drivers/gpu/drm/tegra/drm.h
>> +++ b/drivers/gpu/drm/tegra/drm.h
>> @@ -133,7 +133,7 @@ struct tegra_output {
>>  	struct drm_bridge *bridge;
>>  	struct drm_panel *panel;
>>  	struct i2c_adapter *ddc;
>> -	const struct edid *edid;
>> +	const struct drm_edid *drm_edid;

I keep reviving old stuff, sorry.

Please take note here, removing the edid member.

>>  	struct cec_notifier *cec;
>>  	unsigned int hpd_irq;
>>  	struct gpio_desc *hpd_gpio;
>> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
>> index 4da3c3d1abbc..e6b5863fec71 100644
>> --- a/drivers/gpu/drm/tegra/output.c
>> +++ b/drivers/gpu/drm/tegra/output.c
>> @@ -21,7 +21,7 @@
>>  int tegra_output_connector_get_modes(struct drm_connector *connector)
>>  {
>>  	struct tegra_output *output = connector_to_output(connector);
>> -	struct edid *edid = NULL;
>> +	const struct drm_edid *drm_edid;
>>  	int err = 0;
>>  
>>  	/*
>> @@ -34,18 +34,17 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
>>  			return err;
>>  	}
>>  
>> -	if (output->edid)
>> -		edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
>> +	if (output->drm_edid)
>> +		drm_edid = drm_edid_dup(output->drm_edid);
>>  	else if (output->ddc)
>> -		edid = drm_get_edid(connector, output->ddc);
>> +		drm_edid = drm_edid_read_ddc(connector, output->ddc);
>
> Annoyingly the dsi output is the only one not using
> drm_connector_init_with_ddc() despite that I think it could, so we can't
> yet use drm_edid_read here ...
>
>>  
>> -	cec_notifier_set_phys_addr_from_edid(output->cec, edid);
>> -	drm_connector_update_edid_property(connector, edid);
>> +	drm_edid_connector_update(connector, drm_edid);
>> +	cec_notifier_set_phys_addr(output->cec,
>> +				   connector->display_info.source_physical_address);
>>  
>> -	if (edid) {
>> -		err = drm_add_edid_modes(connector, edid);
>> -		kfree(edid);
>> -	}
>> +	err = drm_edid_connector_add_modes(connector);
>> +	drm_edid_free(drm_edid);
>>  
>>  	return err;
>>  }
>> @@ -98,6 +97,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
>>  int tegra_output_probe(struct tegra_output *output)
>>  {
>>  	struct device_node *ddc, *panel;
>> +	const void *edid;
>>  	unsigned long flags;
>>  	int err, size;
>>  
>> @@ -124,8 +124,6 @@ int tegra_output_probe(struct tegra_output *output)
>>  			return PTR_ERR(output->panel);
>>  	}
>>  
>> -	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
>> -
>
> I think you can/should also delete tegra_output.edid completely, since not
> doing that freaked me out a bit until I checked everything :-) At least if
> I didn't git grep the wrong regex.

I thought I am removing tegra_output.edid. What am I missing?

>
> With that bikeshed addressed:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks,
Jani.


>
>>  	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
>>  	if (ddc) {
>>  		output->ddc = of_get_i2c_adapter_by_node(ddc);
>> @@ -137,6 +135,9 @@ int tegra_output_probe(struct tegra_output *output)
>>  		}
>>  	}
>>  
>> +	edid = of_get_property(output->of_node, "nvidia,edid", &size);
>> +	output->drm_edid = drm_edid_alloc(edid, size);
>> +
>>  	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
>>  					of_fwnode_handle(output->of_node),
>>  					"nvidia,hpd",
>> @@ -187,6 +188,8 @@ int tegra_output_probe(struct tegra_output *output)
>>  	if (output->ddc)
>>  		i2c_put_adapter(output->ddc);
>>  
>> +	drm_edid_free(output->drm_edid);
>> +
>>  	return err;
>>  }
>>  
>> @@ -197,6 +200,8 @@ void tegra_output_remove(struct tegra_output *output)
>>  
>>  	if (output->ddc)
>>  		i2c_put_adapter(output->ddc);
>> +
>> +	drm_edid_free(output->drm_edid);
>>  }
>>  
>>  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel
