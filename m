Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5667767A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 09:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBD710E328;
	Mon, 23 Jan 2023 08:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423C410E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:05:51 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E2B52B3;
 Mon, 23 Jan 2023 09:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674461149;
 bh=eif4ALjXn4Xg3gNkN0qiznal4u/c3NCcB3pOWqLEf1w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AnW7FGX9mvBzUq71bCTU4tT6Fw6pmL5BtX6V5cQgG8W2WI3B3pcP4OxEkBQR0uckH
 XBdfLxI6Moyrvks3wp7YF5O2Is54/S5b0NinX4Z9FzS8IeFtgVzn3aPqJHIqkOi+Lm
 Bpgj5HkeC+jBBJajv6pvfz2XVbzkWZEKRSY5fhHE=
Message-ID: <e89fefcb-1628-ea85-f3a6-10c4377db244@ideasonboard.com>
Date: Mon, 23 Jan 2023 10:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/7] drm: rcar-du: lvds: Add runtime PM
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-3-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8q+ad8CxC7LBN4l@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8q+ad8CxC7LBN4l@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 23 Jan 2023 08:39:49 +0000
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
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 18:16, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Jan 20, 2023 at 10:50:04AM +0200, Tomi Valkeinen wrote:
>> Add simple runtime PM suspend and resume functionality.
> 
> I think you need to depend on PM in Kconfig. That's not a compile-time
> dependency but a runtime-dependency, with runtime PM support the
> suspend/resume handler will never be called.

Yes, LVDS won't work without runtime PM after this patch.

>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 43 +++++++++++++++++++++++++----
>>   1 file changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> index 81a060c2fe3f..8e1be51fbee6 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/of_device.h>
>>   #include <linux/of_graph.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/slab.h>
>>   #include <linux/sys_soc.h>
>>   
>> @@ -316,8 +317,8 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
>>   
>>   	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
>>   
>> -	ret = clk_prepare_enable(lvds->clocks.mod);
>> -	if (ret < 0)
>> +	ret = pm_runtime_resume_and_get(lvds->dev);
>> +	if (ret)
>>   		return ret;
>>   
>>   	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
>> @@ -337,7 +338,7 @@ void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
>>   
>>   	rcar_lvds_write(lvds, LVDPLLCR, 0);
>>   
>> -	clk_disable_unprepare(lvds->clocks.mod);
>> +	pm_runtime_put(lvds->dev);
> 
> Should we use pm_runtime_put_sync() here, to make sure the clock gets
> disabled right away ? The DU hardware may depend on the exact sequencing
> of events. I would then do the same in rcar_lvds_atomic_disable().

That's perhaps a good idea. I think I saw some of the docs saying that 
startup sequences must begin with the reset. If we don't use _sync, we 
could end up not resetting at all.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

  Tomi

