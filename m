Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2992B00DA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422A86E176;
	Thu, 12 Nov 2020 08:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F846E176
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 08:08:37 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AC88PTx103946;
 Thu, 12 Nov 2020 02:08:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605168505;
 bh=kTmPS+14L43/mN4J8NF4b/8F8zr576pK0ujbi8KDnd8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Di49O4ZSj3WbRunCYxEc8afWOd55tiXH2Cbl2vQP37Sb5FT75DhahuBaCy7Qlkj/J
 7F9zVEq5BQIyFkIbSKDN/cz8HdJM+RYlm7FeNqS4mxgkvWW6CuCC6u/zhPbG1rsDLx
 xIqPJizmEOLzNpDi8+93I/oBYL0LxwpzKKIwMgx0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AC88Pe7016167
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Nov 2020 02:08:25 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 02:08:25 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 02:08:25 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AC88MKE014002;
 Thu, 12 Nov 2020 02:08:23 -0600
Subject: Re: [PATCH v3 30/56] drm/omap: dsi: move panel refresh function to
 host
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-31-tomi.valkeinen@ti.com>
 <20201109101003.GA6029@pendragon.ideasonboard.com>
 <6118c70e-6dc5-2d87-fc68-266cd3eeb66c@ti.com>
 <20201111155854.GH4115@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fca968af-9554-041a-c416-0781da8b70ca@ti.com>
Date: Thu, 12 Nov 2020 10:08:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111155854.GH4115@pendragon.ideasonboard.com>
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

On 11/11/2020 17:58, Laurent Pinchart wrote:

>>>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>>>> index 030a8fa140db..1582960f9e90 100644
>>>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>>>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>>>> @@ -177,27 +177,6 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -static int dsicm_set_update_window(struct panel_drv_data *ddata,
>>>> -		u16 x, u16 y, u16 w, u16 h)
>>>> -{
>>>> -	struct mipi_dsi_device *dsi = ddata->dsi;
>>>> -	int r;
>>>> -	u16 x1 = x;
>>>> -	u16 x2 = x + w - 1;
>>>> -	u16 y1 = y;
>>>> -	u16 y2 = y + h - 1;
>>>> -
>>>> -	r = mipi_dsi_dcs_set_column_address(dsi, x1, x2);
>>>> -	if (r < 0)
>>>> -		return r;
>>>> -
>>>> -	r = mipi_dsi_dcs_set_page_address(dsi, y1, y2);
>>>> -	if (r < 0)
>>>> -		return r;
>>>> -
>>>> -	return 0;
>>>> -}
>>>> -
>>>
>>> I can't tell whether this is common to all command-mode panels, or if
>>> there could be a need for panel-specific update procedures, so I can't
>>> really ack this patch.
>>
>> I can't say either, but all the command mode panels I know need and support this. And, afaik, we
>> have only the single cmd mode panel driver which we add in this series.
> 
> Now that I think about it again, isn't it a layering violation ?
> Shouldn't the DSI host handle DSI commands transfers, with the panel
> driver taking care of specific DSI commands ?

Well, the DSI host (the HW) already handles specific DSI commands, as it does the update with DCS
Write Start/Continue commands. The update is initiated from omap_crtc, via dssdev->dsi_ops->update().

We could perhaps add a new function to drm_panel_funcs, say, prepare_update, which could then do the
above.

Although I think the above code is not strictly speaking required, as the panel should remember the
column and page address, and as such, they could be set just once at config time.

However, I remember debugging issues related to this. And with a quick test, I can see that things
break down if I just do the above once in the panel's setup. But things work if I send a DSI NOP
instead in the dsi host. So looks to me that either the OMAP DSI or the panel I have need some
command transmitted there. It probably has to happen between two frame transfers.

There are also other things related to update which I'm not so happy about: 1) the TE gpio irq is
handled in the dsi host driver now, even if it's a panel gpio, 2) the dsi host driver snoops the DSI
packets sent by the panel, and catches TEAR_ON/OFF packets, and then change internal state accordingly.

So... I could change the dsi host driver to only send a NOP, and do the page/column call from the
panel's setup. That simplifies the code.

Or I could add the new function to drm_panel_funcs, and send a NOP from there. But if this "needs a
NOP" is an OMAP DSI feature, the panel driver is not the right place for it. I also think that
managing the TE cleanly needs more thought, and probably requires some more interaction between the
dsi host and the panel. It might be better to look at both the update callback and the TE at the
same time.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
