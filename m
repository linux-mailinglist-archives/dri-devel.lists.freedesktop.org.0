Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 351902CA1C5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 12:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E856E4DD;
	Tue,  1 Dec 2020 11:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579846E546
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:51:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1Bp6ek052532;
 Tue, 1 Dec 2020 05:51:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606823466;
 bh=9W0hK1rpFo4DdhY4YKrSkkcWO4Yj6WnlMmE/FypurwQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=d76vLOfrNb4z/1xY5NnaEM1d6RrHwTd4Q9XLUdCoM6M3ba9dF3x2HznDnZ++4v+ps
 wt5vEBfgWaT2DmgLWsXNqvG6WliXvkHAQe1xXyCqEs7rCwClOOUhYIAFvu5KHcf0BW
 D1zCEXwNhrUcoGeZNrUoapGM2K+PwXPvpx6PNLMU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1Bp5U7070361
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 05:51:06 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 05:51:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 05:51:05 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1Bp3em096756;
 Tue, 1 Dec 2020 05:51:03 -0600
Subject: Re: [PATCH v4 76/80] drm/omap: dsi: cleanup initial vc setup
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-77-tomi.valkeinen@ti.com>
 <20201201003628.GU25713@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <040c5a51-8c57-68ab-4db5-619774b4ffd6@ti.com>
Date: Tue, 1 Dec 2020 13:51:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201003628.GU25713@pendragon.ideasonboard.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2020 02:36, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:34PM +0200, Tomi Valkeinen wrote:
>> As we now have a fixed setup for VCs (VC0 for video stream, VC1 for
>> commands), we can simplify the VC setup.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  drivers/gpu/drm/omapdrm/dss/dsi.c | 85 +++++++++++--------------------
>>  1 file changed, 31 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index ff8ace957291..27d0d119668b 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -2017,40 +2017,6 @@ static void dsi_vc_initial_config(struct dsi_data *dsi, int vc)
>>  	dsi->vc[vc].source = DSI_VC_SOURCE_L4;
>>  }
>>  
>> -static int dsi_vc_config_source(struct dsi_data *dsi, int vc,
>> -				enum dsi_vc_source source)
>> -{
>> -	if (dsi->vc[vc].source == source)
>> -		return 0;
>> -
>> -	DSSDBG("Source config of VC %d", vc);
>> -
>> -	dsi_sync_vc(dsi, vc);
>> -
>> -	dsi_vc_enable(dsi, vc, 0);
>> -
>> -	/* VC_BUSY */
>> -	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(vc), 15, 0)) {
>> -		DSSERR("vc(%d) busy when trying to config for VP\n", vc);
>> -		return -EIO;
>> -	}
>> -
>> -	/* SOURCE, 0 = L4, 1 = video port */
>> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), source, 1, 1);
>> -
>> -	/* DCS_CMD_ENABLE */
>> -	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) {
>> -		bool enable = source == DSI_VC_SOURCE_VP;
>> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 30, 30);
>> -	}
>> -
>> -	dsi_vc_enable(dsi, vc, 1);
>> -
>> -	dsi->vc[vc].source = source;
>> -
>> -	return 0;
>> -}
>> -
>>  static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
>>  		bool enable)
>>  {
>> @@ -2072,10 +2038,6 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
>>  	dsi_if_enable(dsi, 1);
>>  
>>  	dsi_force_tx_stop_mode_io(dsi);
>> -
>> -	/* start the DDR clock by sending a NULL packet */
>> -	if (dsi->vm_timings.ddr_clk_always_on && enable)
>> -		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
>>  }
>>  
>>  static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
>> @@ -2270,8 +2232,6 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
>>  		return -EINVAL;
>>  	}
>>  
>> -	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
>> -
>>  	dsi_vc_write_long_header(dsi, vc, msg->channel, msg->type, msg->tx_len, 0);
>>  
>>  	p = msg->tx_buf;
>> @@ -2331,8 +2291,6 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
>>  		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
>>  		       vc, msg->type, pkt.header[1], pkt.header[2]);
>>  
>> -	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
>> -
>>  	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(vc)), 16, 16)) {
>>  		DSSERR("ERROR FIFO FULL, aborting transfer\n");
>>  		return -EINVAL;
>> @@ -3351,8 +3309,6 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
>>  
>>  	DSSDBG("dsi_update_screen_dispc(%dx%d)\n", w, h);
>>  
>> -	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_VP);
>> -
>>  	bytespp	= mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
>>  	bytespl = w * bytespp;
>>  	bytespf = bytespl * h;
>> @@ -3522,9 +3478,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
>>  
>>  	dsi_set_ulps_auto(dsi, false);
>>  
>> -	dsi_vc_enable_hs(dssdev, vc, !(dsi->dsidev->mode_flags & MIPI_DSI_MODE_LPM));
> 
> Why is this not needed anymore ?

This is in dsi_update_channel(), so about sending the frame. We always want to send the frame in HS,
and we set the VC to HS in the dsi_setup_dsi_vcs() in this patch. So there's no longer need to
configure the speed for each dsi_update_channel invocation.

So there's a slight change in behavior, as before this patch you could send frames in LP, but can't
after this. But who would want to do that...

I think I can clean this up by changing "drm/omap: dsi: set LP/HS before update" to "always enable
HS before update". And then dropping the line here.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
