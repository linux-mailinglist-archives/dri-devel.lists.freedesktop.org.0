Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B32430777C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 14:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE7589DA8;
	Thu, 28 Jan 2021 13:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF54889DA8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 13:56:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10SDrJut013912; Thu, 28 Jan 2021 14:55:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GfKrt14OkknTrort21mgXlkyqBWwzQFyqWLIemGUlRo=;
 b=XojY2Io+FS6TN6q49iVWiXUGjdoBBWLJb5hVS30OsQeJTbfcFH5U8sa/2vEzIF2dxcsM
 b3eloClgfjMmh3Si2UuKMN58xJpMS+LJBU4JLjPZyDTgzqPEz9NZFpZuCtm9tU6A/NNS
 QFRtkLk9k07mVbO7BCYoAdoD3gw9YaHGd8KVKquOVpgRrngD8WYVJfdwtJrCETWddPB8
 F/sKXKUNUSNxi21dXwkEJOk6SVaEnqNMg25RiKJXE7bBTIClPfyZPVwQ3pfu7AZoUVUE
 NoqNs7KHLeZPxmd/phZrQxXb0rcDUQfVH0JRAe3siqokEv5LpsoaMCvRjyTrC031UYMd cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368a56yg20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 14:55:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCE9810002A;
 Thu, 28 Jan 2021 14:55:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A891245C65;
 Thu, 28 Jan 2021 14:55:56 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 Jan
 2021 14:55:55 +0100
Subject: Re: [PATCH V4] drm/stm: Fix bus_flags handling
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20210127110756.125570-1-marex@denx.de>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <661c0929-1170-d092-b8a2-7047490a5570@foss.st.com>
Date: Thu, 28 Jan 2021 14:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127110756.125570-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_08:2021-01-28,
 2021-01-28 signatures=0
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Sam Ravnborg <sam@ravnborg.org>,
 Philippe
 Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,
Thanks for the patch.

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>



On 1/27/21 12:07 PM, Marek Vasut wrote:
> The drm_display_mode_to_videomode() does not populate DISPLAY_FLAGS_DE_LOW
> or DISPLAY_FLAGS_PIXDATA_NEGEDGE flags in struct videomode. Therefore, no
> matter what polarity the next bridge or display might require, these flags
> are never set, and thus the LTDC GCR_DEPOL and GCR_PCPOL bits are never set,
> and the LTDC behaves as if both DISPLAY_FLAGS_PIXDATA_POSEDGE and
> DISPLAY_FLAGS_DE_HIGH were always set.
> 
> The fix for this problem is taken almost verbatim from MXSFB driver. In
> case there is a bridge attached to the LTDC, the bridge might have extra
> polarity requirements, so extract bus_flags from the bridge and use them
> for LTDC configuration. Otherwise, extract bus_flags from the connector,
> which is the display.
> 
> Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Antonio Borneo <antonio.borneo@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Check if ldev->bridge->timings is non-NULL before accessing it
> V3: get bus_flags from connector (from Yannick)
>      - Display controller could support several connectors (not connected at
>        the same time). ie: stm32mp15c-DK2 board have 2 connectors (HDMI + DSI).
>        Driver check which connector is connected to get the bus flag.
> V4: get bridge from encoder (from Yannick)
> ---
>   drivers/gpu/drm/stm/ltdc.c | 33 +++++++++++++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 6e28e6b60e72..acc9f6694eb6 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -544,13 +544,42 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
>   {
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>   	struct drm_device *ddev = crtc->dev;
> +	struct drm_connector_list_iter iter;
> +	struct drm_connector *connector = NULL;
> +	struct drm_encoder *encoder = NULL;
> +	struct drm_bridge *bridge = NULL;
>   	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>   	struct videomode vm;
>   	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
>   	u32 total_width, total_height;
> +	u32 bus_flags = 0;
>   	u32 val;
>   	int ret;
>   
> +	/* get encoder from crtc */
> +	drm_for_each_encoder(encoder, ddev)
> +		if (encoder->crtc == crtc)
> +			break;
> +
> +	if (encoder) {
> +		/* get bridge from encoder */
> +		list_for_each_entry(bridge, &encoder->bridge_chain, chain_node)
> +			if (bridge->encoder == encoder)
> +				break;
> +
> +		/* Get the connector from encoder */
> +		drm_connector_list_iter_begin(ddev, &iter);
> +		drm_for_each_connector_iter(connector, &iter)
> +			if (connector->encoder == encoder)
> +				break;
> +		drm_connector_list_iter_end(&iter);
> +	}
> +
> +	if (bridge && bridge->timings)
> +		bus_flags = bridge->timings->input_bus_flags;
> +	else if (connector)
> +		bus_flags = connector->display_info.bus_flags;
> +
>   	if (!pm_runtime_active(ddev->dev)) {
>   		ret = pm_runtime_get_sync(ddev->dev);
>   		if (ret) {
> @@ -586,10 +615,10 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
>   	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
>   		val |= GCR_VSPOL;
>   
> -	if (vm.flags & DISPLAY_FLAGS_DE_LOW)
> +	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
>   		val |= GCR_DEPOL;
>   
> -	if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>   		val |= GCR_PCPOL;
>   
>   	reg_update_bits(ldev->regs, LTDC_GCR,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
