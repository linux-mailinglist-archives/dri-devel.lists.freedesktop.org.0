Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7D02AF30B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 15:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BB889EAE;
	Wed, 11 Nov 2020 14:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FA289EAE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 14:06:22 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABE5YS2090680;
 Wed, 11 Nov 2020 08:05:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605103534;
 bh=bm5liVtdKMxh8yQ23uRVMOFWo6OEkXdxMU4qlm5qC2Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MpIt8H0ghc4oEGNW7tMVEuz7dB+n4zE/3Va1WMLd/cLj0qLOpDk14xZ6TfUqrBXCK
 fvQ3SF8hFH7cGh558tvgVWhrWPa3q7gqfvlQACfilbnrj9g0o/O0T3cKby+4w5ALLj
 lbWSEBK/W3NxizJ1/KJVYvNj/k2xKHi+R62de8rg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABE5Y3n004321
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 08:05:34 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 08:05:33 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 08:05:33 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABE5VBe023055;
 Wed, 11 Nov 2020 08:05:31 -0600
Subject: Re: [PATCH v3 28/56] drm/omap: dsi: untangle ulps ops from
 enable/disable
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-29-tomi.valkeinen@ti.com>
 <20201109095732.GY6029@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <581c50c5-1654-b967-7e26-e0cf732e0787@ti.com>
Date: Wed, 11 Nov 2020 16:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109095732.GY6029@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 11:57, Laurent Pinchart wrote:
> Hi Tomi and Sebastian,
> 
> Thank you for the patch.
> 
> On Thu, Nov 05, 2020 at 02:03:05PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> Create a custom function pointer for ULPS and use it instead of
>> reusing disable/enable functions for ULPS mode switch. This allows
>> us to use the common disable/enable functions pointers for DSI.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  8 ++--
>>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 42 ++++++++++++++-----
>>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  5 +--
>>  3 files changed, 38 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> index 4be0c9dbcc43..78247dcb1848 100644
>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> @@ -233,7 +233,7 @@ static int dsicm_enter_ulps(struct panel_drv_data *ddata)
>>  	if (r)
>>  		goto err;
>>  
>> -	src->ops->dsi.disable(src, false, true);
>> +	src->ops->dsi.ulps(src, true);
>>  
>>  	ddata->ulps_enabled = true;
>>  
>> @@ -258,7 +258,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
>>  	if (!ddata->ulps_enabled)
>>  		return 0;
>>  
>> -	src->ops->enable(src);
>> +	src->ops->dsi.ulps(src, false);
>>  	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>  
>>  	r = _dsicm_enable_te(ddata, ddata->te_enabled);
>> @@ -586,7 +586,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>>  
>>  	dsicm_hw_reset(ddata);
>>  
>> -	src->ops->dsi.disable(src, true, false);
>> +	src->ops->disable(src);
>>  err_regulators:
>>  	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
>>  	if (r)
>> @@ -612,7 +612,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
>>  		dsicm_hw_reset(ddata);
>>  	}
>>  
>> -	src->ops->dsi.disable(src, true, false);
>> +	src->ops->disable(src);
>>  
>>  	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
>>  	if (r)
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index d54b743c2b48..937362ade4b4 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -4055,13 +4055,10 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
>>  	}
>>  }
>>  
>> -static void dsi_display_enable(struct omap_dss_device *dssdev)
>> +static void dsi_display_ulps_enable(struct dsi_data *dsi)
>>  {
>> -	struct dsi_data *dsi = to_dsi_data(dssdev);
>>  	int r;
>>  
>> -	DSSDBG("dsi_display_enable\n");
>> -
>>  	WARN_ON(!dsi_bus_is_locked(dsi));
>>  
>>  	mutex_lock(&dsi->lock);
>> @@ -4084,16 +4081,19 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
>>  	dsi_runtime_put(dsi);
>>  err_get_dsi:
>>  	mutex_unlock(&dsi->lock);
>> -	DSSDBG("dsi_display_enable FAILED\n");
>> +	DSSDBG("dsi_display_ulps_enable FAILED\n");
>>  }
>>  
>> -static void dsi_display_disable(struct omap_dss_device *dssdev,
>> -		bool disconnect_lanes, bool enter_ulps)
>> +static void dsi_display_enable(struct omap_dss_device *dssdev)
>>  {
>>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>> +	DSSDBG("dsi_display_enable\n");
>> +	dsi_display_ulps_enable(dsi);
>> +}
>>  
>> -	DSSDBG("dsi_display_disable\n");
>> -
>> +static void dsi_display_ulps_disable(struct dsi_data *dsi,
>> +		bool disconnect_lanes, bool enter_ulps)
>> +{
>>  	WARN_ON(!dsi_bus_is_locked(dsi));
>>  
>>  	mutex_lock(&dsi->lock);
>> @@ -4110,6 +4110,27 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
>>  	mutex_unlock(&dsi->lock);
>>  }
>>  
>> +static void dsi_display_disable(struct omap_dss_device *dssdev)
>> +{
>> +	struct dsi_data *dsi = to_dsi_data(dssdev);
>> +
>> +	DSSDBG("dsi_display_disable\n");
>> +
>> +	dsi_display_ulps_disable(dsi, true, false);
>> +}
>> +
>> +static void dsi_ulps(struct omap_dss_device *dssdev, bool enable)
>> +{
>> +	struct dsi_data *dsi = to_dsi_data(dssdev);
>> +
>> +	DSSDBG("dsi_ulps\n");
>> +
>> +	if (enable)
>> +		dsi_display_ulps_disable(dsi, false, true);
>> +	else
>> +		dsi_display_ulps_enable(dsi);
> 
> The names are fairly confusing. I would expect
> dsi_display_ulps_disable() to disable ULPS mode.

It is fairly confusing naming. It's actually something like dsi_display_displaye_featuring_ulps.
I'll rename those to

_dsi_display_disable and _dsi_display_enable. So they're just lower level enable/disable functions,
which also handle ulps.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
