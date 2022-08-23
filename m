Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D25459DAC4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 12:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC1D11B3F5;
	Tue, 23 Aug 2022 10:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17439112BD2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 10:52:43 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CA982B3;
 Tue, 23 Aug 2022 12:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661251961;
 bh=+boyjn+LEo3QKbvtSEsppC6tvAYzFv1WRY18MBYonqI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O/BG33ao3spx+zQAA6dkPIiV43W1PVrMUKywrfjMTQJHqDnY5OdIYOBBWEyY4Uj/O
 16ooAWWJ1FX1WiVs0afLz6895S0GBLmaom2b3LsgbstFwf6MIrejxIExMcZeBNkuiy
 U+os6eUkUQCOGk62jYsdW/1y8qDOsp4uXAZ/v4yI=
Message-ID: <6fe9dffe-0f02-9cdc-cc6e-136de8326895@ideasonboard.com>
Date: Tue, 23 Aug 2022 13:52:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 5/5] drm: rcar-du: dsi: Fix VCLKSET write
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
 <20220822143401.135081-6-tomi.valkeinen@ideasonboard.com>
 <YwOWc1pKM+vFK80P@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YwOWc1pKM+vFK80P@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2022 17:45, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Aug 22, 2022 at 05:34:01PM +0300, Tomi Valkeinen wrote:
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> rcar_mipi_dsi_startup() writes correct values to VCLKSET, but as it uses
>> or-operation to add the new values to the current value in the register,
>> it should first make sure the fields are cleared.
>>
>> Do this by using rcar_mipi_dsi_write() to write the VCLKSET_CKEN bit to
>> VCLKSET before the rest of the VCLKSET configuration.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> index 06250f2f3499..b60a6d4a5d46 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> @@ -412,9 +412,10 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>>   			return ret;
>>   	}
>>   
>> -	/* Enable DOT clock */
>> -	vclkset = VCLKSET_CKEN;
>> -	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
>> +	/* Clear VCLKSET and enable DOT clock */
>> +	rcar_mipi_dsi_write(dsi, VCLKSET, VCLKSET_CKEN);
>> +
>> +	vclkset = 0;
>>   
>>   	if (dsi_format == 24)
>>   		vclkset |= VCLKSET_BPP_24;
> 
> You can replace one more set() with a write():

That's true. I'll send a new one.

> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 06250f2f3499..2744ea23e6f6 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -414,7 +414,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
> 
>   	/* Enable DOT clock */
>   	vclkset = VCLKSET_CKEN;
> -	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> +	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
> 
>   	if (dsi_format == 24)
>   		vclkset |= VCLKSET_BPP_24;
> @@ -429,7 +429,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>   	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
>   		|  VCLKSET_LANE(dsi->lanes - 1);
> 
> -	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> +	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
> 
>   	/* After setting VCLKSET register, enable VCLKEN */
>   	rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);
> 
> I'll apply patches 1/5 to 4/5 to my tree already.

I'm not sure if 4 works correctly without 2.

  Tomi
