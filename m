Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB9674F18
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99E010EA70;
	Fri, 20 Jan 2023 08:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0538310E8E3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:49:33 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 397267EC;
 Thu, 19 Jan 2023 09:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674118171;
 bh=J23izYBcvCMQej7kG7YCu/n9+2PG1tMQWi/kC6w/aMU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KHjNfYrHmiw/xNTiML/XRVYPoiHOFr5ACwG7/WsRRCR0B+1kGNQbNG4OJHfe4YyXc
 twc93EJitmPColvkR8wwHfVzTDz0/F5xZEh7TKNPubpjnfsjmr4n66tBjpeN1WYhzR
 ElQcgwyXlO3/Qg1ypFYc5NRVHVcZV1HmdD+ii+oQ=
Message-ID: <5e0fea45-0e5c-ef7c-007e-69ba69d2b08c@ideasonboard.com>
Date: Thu, 19 Jan 2023 10:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/6] drm: rcar-du: Fix LVDS stop sequence
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-4-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8hg0m7cidkscHkN@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8hg0m7cidkscHkN@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, dri-devel@lists.freedesktop.org,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 23:12, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Jan 17, 2023 at 03:51:51PM +0200, Tomi Valkeinen wrote:
>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>>
>> According to H/W manual, LVDCR0 register must be cleared bit by bit when
> 
> s@H/W@the hardware/
> 
>> disabling LVDS.
> 
> I don't like this much, but I think I'll stop fighting :-)
> 
>> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
>> [tomi.valkeinen: simplified the code a bit]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 27 ++++++++++++++++++++++++++-
>>   1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> index 674b727cdaa2..01800cef1c33 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> @@ -87,6 +87,11 @@ static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
>>   	iowrite32(data, lvds->mmio + reg);
>>   }
>>   
>> +static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
>> +{
>> +	return ioread32(lvds->mmio + reg);
>> +}
> 
> Could you please move read before write ?

Sure.

>> +
>>   /* -----------------------------------------------------------------------------
>>    * PLL Setup
>>    */
>> @@ -549,8 +554,28 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>>   				     struct drm_bridge_state *old_bridge_state)
>>   {
>>   	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>> +	u32 lvdcr0;
>> +
>> +	lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
>> +
>> +	lvdcr0 &= ~LVDCR0_LVRES;
>> +	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +
>> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
>> +		lvdcr0 &= ~LVDCR0_LVEN;
>> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +	}
>> +
>> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
>> +		lvdcr0 &= ~LVDCR0_PWD;
>> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +	}
>> +
>> +	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
>> +		lvdcr0 &= ~LVDCR0_PLLON;
>> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>> +	}
> 
> This will leave LVDCR0_BEN and LVDCR0_LVEN on Gen2. Is that fine ?

I don't know, I don't have the manuals or HW. But your point is a bit 
worrying.

I think we can just do a rcar_lvds_write(lvds, LVDCR0, 0) after the 
above shenanigans, to make sure everything is disabled. The HW manual 
doesn't tell us to do that, though, on gen3. Do you think that will be a 
problem?

And I'm not fully serious with the last sentence...

  Tomi

