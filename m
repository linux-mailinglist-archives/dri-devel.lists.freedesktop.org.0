Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB62F674F17
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A421210EA7B;
	Fri, 20 Jan 2023 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8187710E243
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:58:32 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08E117EC;
 Thu, 19 Jan 2023 09:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674118711;
 bh=Jj9znI46CA5ppdBOQkcRAyp0VhOq6GAVCkPX/fwslrM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kAX+ecxRR6quwALvmcqKIIDlxdU28IBNP1aw4Hm5QV7ISqmA5JbQAelCqPpcx3CDr
 SjAm7Uaon6obr1qd17FroIOHH7ZB+PwkvsYdBTkmLm0x0/KOrpLgzRILvjRheoNyUl
 72/xfk4+xH/JuAdLaHFMWGhA4zkHCPthlWlHhRHk=
Message-ID: <fbf5e571-8fd4-a3e9-273e-8bb6e8c6a439@ideasonboard.com>
Date: Thu, 19 Jan 2023 10:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/6] drm: rcar-du: Add quirk for H3 ES1 pclk WA
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-5-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8hiStARYk1b2tdS@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8hiStARYk1b2tdS@pendragon.ideasonboard.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 23:19, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Jan 17, 2023 at 03:51:52PM +0200, Tomi Valkeinen wrote:
>> rcar_du_crtc.c does a soc_device_match() in
>> rcar_du_crtc_set_display_timing() to find out if the SoC is H3 ES1, and
> 
> s/ES1/ES1.x/
> 
> Same below.
> 
>> if so, apply a WA.
> 
> s/WA/workaround/
> 
> Same below.

Ok.

>> We will need another H3 ES1 check in the following patch, so rather than
>> adding more soc_device_match() calls, let's add a rcar_du_device_info
>> entry for the ES1, and a quirk flag,
>> RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY, for the WA.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  8 +---
>>   drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 51 +++++++++++++++++++++++++-
>>   drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
>>   3 files changed, 52 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> index 3619e1ddeb62..f2d3266509cc 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> @@ -10,7 +10,6 @@
>>   #include <linux/clk.h>
>>   #include <linux/mutex.h>
>>   #include <linux/platform_device.h>
>> -#include <linux/sys_soc.h>
>>   
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> @@ -204,11 +203,6 @@ static void rcar_du_escr_divider(struct clk *clk, unsigned long target,
>>   	}
>>   }
>>   
>> -static const struct soc_device_attribute rcar_du_r8a7795_es1[] = {
>> -	{ .soc_id = "r8a7795", .revision = "ES1.*" },
>> -	{ /* sentinel */ }
>> -};
>> -
>>   static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>>   {
>>   	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
>> @@ -238,7 +232,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>>   		 * no post-divider when a display PLL is present (as shown by
>>   		 * the workaround breaking HDMI output on M3-W during testing).
>>   		 */
>> -		if (soc_device_match(rcar_du_r8a7795_es1)) {
>> +		if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY) {
>>   			target *= 2;
>>   			div = 1;
>>   		}
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> index c7c5217cfc1a..ba2e069fc0f7 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/pm.h>
>>   #include <linux/slab.h>
>> +#include <linux/sys_soc.h>
>>   #include <linux/wait.h>
>>   
>>   #include <drm/drm_atomic_helper.h>
>> @@ -386,6 +387,42 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>>   	.dpll_mask =  BIT(2) | BIT(1),
>>   };
>>   
>> +static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
>> +	.gen = 3,
>> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
>> +		  | RCAR_DU_FEATURE_CRTC_CLOCK
>> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
>> +		  | RCAR_DU_FEATURE_INTERLACED
>> +		  | RCAR_DU_FEATURE_TVM_SYNC,
>> +	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY,
>> +	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
>> +	.routes = {
>> +		/*
>> +		 * R8A7795 has one RGB output, two HDMI outputs and one
>> +		 * LVDS output.
>> +		 */
>> +		[RCAR_DU_OUTPUT_DPAD0] = {
>> +			.possible_crtcs = BIT(3),
>> +			.port = 0,
>> +		},
>> +		[RCAR_DU_OUTPUT_HDMI0] = {
>> +			.possible_crtcs = BIT(1),
>> +			.port = 1,
>> +		},
>> +		[RCAR_DU_OUTPUT_HDMI1] = {
>> +			.possible_crtcs = BIT(2),
>> +			.port = 2,
>> +		},
>> +		[RCAR_DU_OUTPUT_LVDS0] = {
>> +			.possible_crtcs = BIT(0),
>> +			.port = 3,
>> +		},
>> +	},
>> +	.num_lvds = 1,
>> +	.num_rpf = 5,
>> +	.dpll_mask =  BIT(2) | BIT(1),
>> +};
>> +
>>   static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>>   	.gen = 3,
>>   	.features = RCAR_DU_FEATURE_CRTC_IRQ
>> @@ -576,6 +613,11 @@ static const struct of_device_id rcar_du_of_table[] = {
>>   
>>   MODULE_DEVICE_TABLE(of, rcar_du_of_table);
>>   
>> +static const struct soc_device_attribute rcar_du_soc_table[] = {
>> +	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &rcar_du_r8a7795_es1_info },
>> +	{ /* sentinel */ }
>> +};
>> +
>>   const char *rcar_du_output_name(enum rcar_du_output output)
>>   {
>>   	static const char * const names[] = {
>> @@ -670,6 +712,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>>   	struct rcar_du_device *rcdu;
>>   	unsigned int mask;
>>   	int ret;
>> +	const struct soc_device_attribute *soc_attr;
> 
> Please move this up before rcdu.

Sure.

>>   
>>   	if (drm_firmware_drivers_only())
>>   		return -ENODEV;
>> @@ -681,7 +724,13 @@ static int rcar_du_probe(struct platform_device *pdev)
>>   		return PTR_ERR(rcdu);
>>   
>>   	rcdu->dev = &pdev->dev;
>> -	rcdu->info = of_device_get_match_data(rcdu->dev);
>> +
>> +	soc_attr = soc_device_match(rcar_du_soc_table);
>> +	if (soc_attr)
>> +		rcdu->info = soc_attr->data;
>> +
>> +	if (!rcdu->info)
>> +		rcdu->info = of_device_get_match_data(rcdu->dev);
> 
> As Geert mentioned,
> 
> 	rcdu->info = of_device_get_match_data(rcdu->dev);
> 
> 	soc_attr = soc_device_match(rcar_du_soc_table);
> 	if (soc_attr)
> 		rcdu->info = soc_attr->data;
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Ok. Thanks!

  Tomi


