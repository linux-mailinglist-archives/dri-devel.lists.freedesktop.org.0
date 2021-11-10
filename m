Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F7C44BE80
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5BA6E1D2;
	Wed, 10 Nov 2021 10:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C356E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:22:23 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92509D8B;
 Wed, 10 Nov 2021 11:22:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636539742;
 bh=Kb2mqQcYSIR30c1c/QCzqZNgi4OO/yDrYs6SnhNUIuQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aPLuUzA685pqCn694mGfTKHYBiuVhIufJVoMO2GulmQVv36CE3Ox+BK4MACzJ+hDp
 8oKRyKHUh5zgtOZOi+SmyS85U7loN3CDuB7b85TZSQgdx7YQjWP0lX8HRyKEE8Npcg
 2Z+4dZxUZ3O9UinQJ7cGN0hnmawutZyeFLSpw6Y0=
Subject: Re: [PATCH] drm/omap: increase DSS5 max tv pclk to 192MHz
To: Neil Armstrong <narmstrong@baylibre.com>
References: <20211012133939.2145462-1-narmstrong@baylibre.com>
 <b0683f52-abde-cb11-c88c-dd05645945a0@baylibre.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <f6bc98f1-2a1e-1fd9-6efe-37193b835b0d@ideasonboard.com>
Date: Wed, 10 Nov 2021 12:22:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b0683f52-abde-cb11-c88c-dd05645945a0@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: khilman@baylibre.com, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2021 15:33, Neil Armstrong wrote:
> Hi Tomi,
> 
> On 12/10/2021 15:39, Neil Armstrong wrote:
>> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> DSS5's maximum tv pclk rate (i.e. HDMI) is set to 186MHz, which comes
>> from the TRM (DPLL_HDMI_CLK1 frequency must be lower than 186 MHz). To
>> support DRA76's wide screen HDMI feature, we need to increase this
>> maximum rate.
>>
>> Testing shows that the PLL seems to work fine even with ~240MHz clocks,
>> and even the HDMI output at that clock is stable enough for monitors to
>> show a picture. This holds true for all DRA7 and AM5 SoCs (and probably
>> also for OMAP5).
>>
>> However, the highest we can go without big refactoring to the clocking
>> code is 192MHz, as that is the DSS func clock we get from the PRCM. So,
>> increase the max HDMI pixel clock to 192MHz for now, to allow some more
>> 2k+ modes to work.
>>
>> This patch never had a clear confirmation from HW people, but this
>> change stayed on production trees for multiple years without any report
>> on an eventual breakage.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/omapdrm/dss/dispc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Tomi,
>>
>> I slighly changed the commit message to point the fact this patch has been
>> used in production fort years without any sign of breakage.
>>
>> Neil
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> index 5619420cc2cc..3c4a4991e45a 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> @@ -4458,7 +4458,7 @@ static const struct dispc_features omap54xx_dispc_feats = {
>>   	.mgr_width_max		=	4096,
>>   	.mgr_height_max		=	4096,
>>   	.max_lcd_pclk		=	170000000,
>> -	.max_tv_pclk		=	186000000,
>> +	.max_tv_pclk		=	192000000,
>>   	.max_downscale		=	4,
>>   	.max_line_width		=	2048,
>>   	.min_pcd		=	1,
>>
>> base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
>>
> 
> Gentle ping,

Thanks, I'll apply this to drm-misc-next.

  Tomi

