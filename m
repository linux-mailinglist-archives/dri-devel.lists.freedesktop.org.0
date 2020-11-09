Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D92AB3E5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 10:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747F98984E;
	Mon,  9 Nov 2020 09:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15AF8984E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 09:45:55 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A99jjTV099774;
 Mon, 9 Nov 2020 03:45:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604915145;
 bh=COAVyTk7i6o5HDEkvjL5xPKkFmEHDjO11P2Nn31PjK0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=W8tR9JVablLbtSdMARP4yVhBa0MRvxd0q90XIXntb8Y1ejsjBCuE5J/lWjFzAEpGz
 3bp39Im4JZRCPZCjgCBtunrcYwp/pMehTGQJx3fhhNcU/qaAOKjXJCjgTl07MVsVzb
 K8esU4Obc0j5iqD56ZoViIIlZz4GFhCwyyWn64/M=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A99jjRx039519
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 03:45:45 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 03:45:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 03:45:45 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A99jgti128248;
 Mon, 9 Nov 2020 03:45:43 -0600
Subject: Re: [PATCH v3 22/56] drm/omap: dsi: use pixel-format and mode from
 attach
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-23-tomi.valkeinen@ti.com>
 <20201109084921.GS6029@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c4ce6c5a-8515-4ae3-200b-7c4f8b890c31@ti.com>
Date: Mon, 9 Nov 2020 11:45:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109084921.GS6029@pendragon.ideasonboard.com>
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

On 09/11/2020 10:49, Laurent Pinchart wrote:
> Hi Tomi and Sebastian,
> 
> Thank you for the patch.
> 
> On Thu, Nov 05, 2020 at 02:02:59PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> In order to reduce the amount of custom functionality, this moves
>> handling of pixel format and DSI mode from set_config() to dsi
>> attach.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  2 --
>>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 31 ++++++++++++-------
>>  2 files changed, 19 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> index a9609eed6bfa..2e9de33fc8d4 100644
>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> @@ -550,8 +550,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>>  	u8 id1, id2, id3;
>>  	int r;
>>  	struct omap_dss_dsi_config dsi_config = {
>> -		.mode = OMAP_DSS_DSI_CMD_MODE,
>> -		.pixel_format = MIPI_DSI_FMT_RGB888,
>>  		.vm = &ddata->vm,
>>  		.hs_clk_min = 150000000,
>>  		.hs_clk_max = 300000000,
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index a16427f3bc23..e341aca92462 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -4579,24 +4579,19 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
>>  {
>>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>>  	struct dsi_clk_calc_ctx ctx;
>> +	struct omap_dss_dsi_config cfg = *config;
>>  	bool ok;
>>  	int r;
>>  
>>  	mutex_lock(&dsi->lock);
>>  
>> -	dsi->pix_fmt = config->pixel_format;
>> -	dsi->mode = config->mode;
>> +	cfg.mode = dsi->mode;
>> +	cfg.pixel_format = dsi->pix_fmt;
>>  
>> -	if (mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) < 0) {
>> -		DSSERR("invalid pixel format\n");
>> -		r = -EINVAL;
>> -		goto err;
>> -	}
>> -
>> -	if (config->mode == OMAP_DSS_DSI_VIDEO_MODE)
>> -		ok = dsi_vm_calc(dsi, config, &ctx);
>> +	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE)
>> +		ok = dsi_vm_calc(dsi, &cfg, &ctx);
>>  	else
>> -		ok = dsi_cm_calc(dsi, config, &ctx);
>> +		ok = dsi_cm_calc(dsi, &cfg, &ctx);
>>  
>>  	if (!ok) {
>>  		DSSERR("failed to find suitable DSI clock settings\n");
>> @@ -4607,7 +4602,7 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
>>  	dsi_pll_calc_dsi_fck(dsi, &ctx.dsi_cinfo);
>>  
>>  	r = dsi_lp_clock_calc(ctx.dsi_cinfo.clkout[HSDIV_DSI],
>> -		config->lp_clk_min, config->lp_clk_max, &dsi->user_lp_cinfo);
>> +		cfg.lp_clk_min, cfg.lp_clk_max, &dsi->user_lp_cinfo);
>>  	if (r) {
>>  		DSSERR("failed to find suitable DSI LP clock settings\n");
>>  		goto err;
>> @@ -4785,7 +4780,19 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>>  		return -EBUSY;
>>  	}
>>  
>> +	if (mipi_dsi_pixel_format_to_bpp(client->format) < 0) {
>> +		DSSERR("invalid pixel format\n");
>> +		return -EINVAL;
>> +	}
>> +
>>  	dsi->vc[channel].dest = client;
>> +
>> +	dsi->pix_fmt = client->format;
> 
> Does this mean that all clients must use the same pixel format ? Do we
> even support multiple clients ? If no the VC allocation could be
> simplified.

The driver does not (and has not) support multiple DSI peripherals, even if the plumbing has been
there. Yes, the VC handling can be made simpler. I would prefer to do that after this series.

As I see it, the main point of this series is to move to DRM model while keeping the current
mainline drivers working (dsi and panel-dsi-cm). That will enable many cleanups also outside the dsi
driver. The series adds some shortcuts in places where they don't affect the supported setup.

When we get to the end, we'll be using DRM bridge and panel model, and re-writing the VC handling
(and some other parts) should fall into place much more neatly than doing them either before the
series (on top of omapdrm's custom APIs) or inside the series.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
