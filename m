Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447162AF4CD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 16:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8F789F5B;
	Wed, 11 Nov 2020 15:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE4589F5B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 15:35:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABFYtC8124138;
 Wed, 11 Nov 2020 09:34:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605108895;
 bh=2RhOWohEcsqdzfZEt+iVGXI4cM46M51taVBcvWG9wbo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JUiwfr4ZuHf6VQkFyF9XJPRoUvSZeB8yN09BuLeUW6vPj6k9/QIqMPIRM5fwEXJjt
 uZa5ulEyR/qKemkJ+sq8kR5auK42LyS3AFtrl/X6X8ZWnobsgfj4GnzfwSfkapP4rk
 vnLfw0zcxOYBglDhzON5dZOmOEZk9CurCo6sewNI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABFYtvL108954
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 09:34:55 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 09:34:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 09:34:55 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABFYrtO073869;
 Wed, 11 Nov 2020 09:34:53 -0600
Subject: Re: [PATCH v3 30/56] drm/omap: dsi: move panel refresh function to
 host
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-31-tomi.valkeinen@ti.com>
 <20201109101003.GA6029@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6118c70e-6dc5-2d87-fc68-266cd3eeb66c@ti.com>
Date: Wed, 11 Nov 2020 17:34:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109101003.GA6029@pendragon.ideasonboard.com>
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

On 09/11/2020 12:10, Laurent Pinchart wrote:
> Hi Tomi and Sebastian,
> 
> Thank you for the patch.
> 
> On Thu, Nov 05, 2020 at 02:03:07PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> This moves the panel refresh/update function from the panel
>> driver into the DSI host driver to prepare for common drm_panel
>> support.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  68 ------------
>>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 101 ++++++++++++++++--
>>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  13 +--
>>  drivers/gpu/drm/omapdrm/omap_crtc.c           |  11 +-
>>  4 files changed, 97 insertions(+), 96 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> index 030a8fa140db..1582960f9e90 100644
>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> @@ -177,27 +177,6 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
>>  	return 0;
>>  }
>>  
>> -static int dsicm_set_update_window(struct panel_drv_data *ddata,
>> -		u16 x, u16 y, u16 w, u16 h)
>> -{
>> -	struct mipi_dsi_device *dsi = ddata->dsi;
>> -	int r;
>> -	u16 x1 = x;
>> -	u16 x2 = x + w - 1;
>> -	u16 y1 = y;
>> -	u16 y2 = y + h - 1;
>> -
>> -	r = mipi_dsi_dcs_set_column_address(dsi, x1, x2);
>> -	if (r < 0)
>> -		return r;
>> -
>> -	r = mipi_dsi_dcs_set_page_address(dsi, y1, y2);
>> -	if (r < 0)
>> -		return r;
>> -
>> -	return 0;
>> -}
>> -
> 
> I can't tell whether this is common to all command-mode panels, or if
> there could be a need for panel-specific update procedures, so I can't
> really ack this patch.

I can't say either, but all the command mode panels I know need and support this. And, afaik, we
have only the single cmd mode panel driver which we add in this series.

>>  static int dsicm_bl_update_status(struct backlight_device *dev)
>>  {
>>  	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
>> @@ -470,48 +449,6 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
>>  	mutex_unlock(&ddata->lock);
>>  }
>>  
>> -static void dsicm_framedone_cb(int err, void *data)
>> -{
>> -	struct panel_drv_data *ddata = data;
>> -
>> -	dev_dbg(&ddata->dsi->dev, "framedone, err %d\n", err);
>> -	mutex_unlock(&ddata->lock);
>> -}
>> -
>> -static int dsicm_update(struct omap_dss_device *dssdev,
>> -				    u16 x, u16 y, u16 w, u16 h)
>> -{
>> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
>> -	struct omap_dss_device *src = ddata->src;
>> -	int r;
>> -
>> -	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
>> -
>> -	mutex_lock(&ddata->lock);
>> -
>> -	if (!ddata->enabled) {
>> -		r = 0;
>> -		goto err;
>> -	}
>> -
>> -	/* XXX no need to send this every frame, but dsi break if not done */
>> -	r = dsicm_set_update_window(ddata, 0, 0, ddata->vm.hactive,
>> -				    ddata->vm.vactive);
>> -	if (r)
>> -		goto err;
>> -
>> -	r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
>> -			ddata);
>> -	if (r)
>> -		goto err;
>> -
>> -	/* note: no unlock here. unlock is src framedone_cb */
>> -	return 0;
>> -err:
>> -	mutex_unlock(&ddata->lock);
>> -	return r;
>> -}
>> -
>>  static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>>  {
>>  	struct mipi_dsi_device *dsi = ddata->dsi;
>> @@ -572,10 +509,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
>>  	.check_timings	= dsicm_check_timings,
>>  };
>>  
>> -static const struct omap_dss_driver dsicm_dss_driver = {
>> -	.update		= dsicm_update,
>> -};
>> -
>>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>>  {
>>  	struct device_node *node = dsi->dev.of_node;
>> @@ -658,7 +591,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  	dssdev = &ddata->dssdev;
>>  	dssdev->dev = dev;
>>  	dssdev->ops = &dsicm_ops;
>> -	dssdev->driver = &dsicm_dss_driver;
>>  	dssdev->type = OMAP_DISPLAY_TYPE_DSI;
>>  	dssdev->display = true;
>>  	dssdev->owner = THIS_MODULE;
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index 0f264654792d..0aa0d21cf896 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -214,6 +214,9 @@ static void dsi_display_uninit_dispc(struct dsi_data *dsi);
>>  
>>  static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
>>  
>> +static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
>> +				       const struct mipi_dsi_msg *msg);
>> +
>>  /* DSI PLL HSDIV indices */
>>  #define HSDIV_DISPC	0
>>  #define HSDIV_DSI	1
>> @@ -383,9 +386,6 @@ struct dsi_data {
>>  
>>  	struct delayed_work ulps_work;
>>  
>> -	void (*framedone_callback)(int, void *);
>> -	void *framedone_data;
>> -
>>  	struct delayed_work framedone_timeout_work;
>>  
>>  #ifdef DSI_CATCH_MISSING_TE
>> @@ -3802,8 +3802,6 @@ static void dsi_handle_framedone(struct dsi_data *dsi, int error)
>>  	dsi_set_ulps_auto(dsi, true);
>>  	dsi_bus_unlock(dsi);
>>  
>> -	dsi->framedone_callback(error, dsi->framedone_data);
>> -
>>  	if (!error)
>>  		dsi_perf_show(dsi, "DISPC");
>>  }
>> @@ -3835,6 +3833,8 @@ static void dsi_framedone_irq_callback(void *data)
>>  
>>  	cancel_delayed_work(&dsi->framedone_timeout_work);
>>  
>> +	DSSDBG("Framedone received!\n");
>> +
>>  	dsi_handle_framedone(dsi, 0);
>>  }
>>  
>> @@ -3856,17 +3856,69 @@ static int _dsi_update(struct dsi_data *dsi)
>>  	return 0;
>>  }
>>  
>> -static int dsi_update(struct omap_dss_device *dssdev, int channel,
>> -		void (*callback)(int, void *), void *data)
>> +static int _dsi_update_window(struct dsi_data *dsi, int channel,
>> +			      int x, int y, int w, int h)
>> +{
>> +	int x1 = x, x2 = (x + w - 1);
>> +	int y1 = y, y2 = (y + h - 1);
>> +	u8 payloadX[5] = { MIPI_DCS_SET_COLUMN_ADDRESS,
>> +			   x1 >> 8, x1 & 0xff, x2 >> 8, x2 & 0xff };
>> +	u8 payloadY[5] = { MIPI_DCS_SET_PAGE_ADDRESS,
>> +			   y1 >> 8, y1 & 0xff, y2 >> 8, y2 & 0xff };
>> +	struct mipi_dsi_msg msgX = { 0 }, msgY = { 0 };
>> +	int ret;
>> +
>> +	WARN_ON(!dsi_bus_is_locked(dsi));
>> +
>> +	msgX.type = MIPI_DSI_DCS_LONG_WRITE;
>> +	msgX.channel = channel;
>> +	msgX.tx_buf = payloadX;
>> +	msgX.tx_len = sizeof(payloadX);
>> +
>> +	msgY.type = MIPI_DSI_DCS_LONG_WRITE;
>> +	msgY.channel = channel;
>> +	msgY.tx_buf = payloadY;
>> +	msgY.tx_len = sizeof(payloadY);
>> +
>> +	ret = _omap_dsi_host_transfer(dsi, &msgX);
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	return _omap_dsi_host_transfer(dsi, &msgY);
>> +}
>> +
>> +static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>>  {
>>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>> +	int r;
>> +
>> +	if (channel > 3)
>> +		return -EINVAL;
>>  
>>  	dsi_bus_lock(dsi);
>> +
>> +	if (!dsi->vc[channel].dest) {
>> +		r = -ENODEV;
>> +		goto err;
>> +	}
>> +
>> +	if (dsi->vm.hactive == 0 || dsi->vm.vactive == 0) {
>> +		r = -EINVAL;
>> +		goto err;
>> +	}
>> +
>> +	DSSDBG("dsi_update_channel: %d", channel);
>> +
>>  	dsi_set_ulps_auto(dsi, false);
>>  
>> +	r = _dsi_update_window(dsi, channel, 0, 0, dsi->vm.hactive,
>> +			       dsi->vm.vactive);
>> +	if (r < 0) {
>> +		DSSWARN("window update error: %d\n", r);
>> +		goto err;
>> +	}
>> +
>>  	dsi->update_channel = channel;
>> -	dsi->framedone_callback = callback;
>> -	dsi->framedone_data = data;
>>  
>>  	if (dsi->te_enabled && dsi->te_gpio) {
>>  		schedule_delayed_work(&dsi->te_timeout_work,
>> @@ -3877,6 +3929,24 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
>>  	}
>>  
>>  	return 0;
>> +
>> +err:
>> +	dsi_set_ulps_auto(dsi, true);
>> +	dsi_bus_unlock(dsi);
>> +	return r;
>> +}
>> +
>> +static int dsi_update_all(struct omap_dss_device *dssdev)
>> +{
>> +	int i, r;
> 
> i should be unsigned as it's never negative.
> 
>> +
>> +	for (i = 0; i < 4; i++) {
>> +		r = dsi_update_channel(dssdev, i);
>> +		if (r != -ENODEV)
>> +			return r;
>> +	}
>> +
>> +	return r;
>>  }
>>  
>>  /* Display funcs */
>> @@ -4095,7 +4165,9 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
>>  {
>>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>>  	DSSDBG("dsi_display_enable\n");
>> +	dsi_bus_lock(dsi);
> 
> Why is the lock needed here now ? Should it be part of a previous patch
> ? Or, if I'm missing something, should the commit message explain this ?
> Same for the other locations below.

Yes, the locking should've been done in earlier patch. I moved them.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
