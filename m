Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97453B142DC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C7510E58D;
	Mon, 28 Jul 2025 20:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ftEeCykm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C2910E58D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0LmW0E/vkDNIAhf3X31SRxOQwtkOCbr34v6CbexZ2HU=; b=ftEeCykmVD7+wuWAjJ/X4kj+un
 YzwkwGVF0bgM2jZgwsHfI7O9O9aUW0SjA7lGCFz5ziPpj/xO5D92x4DDbsdht/rF0MyLn2vhGBKuy
 QS5wcc2eyKQ21yp0+tRu3vbWrGHr8xtNO9RwghEkLHFdnvlzjNsTiWEdtrCbvwkMUi4ClEVA67Xk6
 L1rk5jmpjI5vbm+sucG+o3hGd4jwbu7r9GBZiT3TPNiys0ZKqDGyapJY7hx0An3mXThhtiDV6008+
 Un7XGFM6jmXWq3X15uln72QKltAU506EEsPYgiFowCXrTGty+sHnT2LmBFH0nbVOZshOLTjt8VP1n
 t4R3hg2A==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ugUFn-005571-H1; Mon, 28 Jul 2025 22:15:23 +0200
Message-ID: <b19643a7-33b1-4b75-83ec-6027ed69d4c0@igalia.com>
Date: Mon, 28 Jul 2025 17:15:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Stefan Wahren <wahrenst@gmx.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
 <673f3f05-53f1-4eb4-ae65-a3cd9ccbd1bf@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <673f3f05-53f1-4eb4-ae65-a3cd9ccbd1bf@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On 28/07/25 13:33, Stefan Wahren wrote:
> Hi Maíra,
> 
> thanks for working on this.
> 
> Am 28.07.25 um 14:35 schrieb Maíra Canal:
>> Currently, when we prepare or unprepare RPi's clocks, we don't actually
>> enable/disable the firmware clock. This means that
>> `clk_disable_unprepare()` doesn't actually change the clock state at
>> all, nor does it lowers the clock rate.
>>
>>  From the Mailbox Property Interface documentation [1], we can see that
>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>> prepare and an unprepare hook for RPi's firmware clock.
>>
>> As now the clocks are actually turned off, some of them are now marked
>> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
>> early boot or are required during reboot.
>>
>> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property- 
>> interface [1]
>> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
> could you please explain from user perspective, which issue is fixed by 
> this patch?

I was about to talk about the power savings benefits for the user.
However, as I type, I notice that such a thing doesn't justify a
"Fixes:" tag. I'll drop it.

Thanks for your review, I'll address all the comments.

Best Regards,
- Maíra

> 
> Why does this needs to be backported?
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/clk/bcm/clk-raspberrypi.c | 41 +++++++++++++++++++++++++++++ 
>> +++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk- 
>> raspberrypi.c
>> index 
>> 8e4fde03ed232b464165f524d27744b4ced93a60..a2bd5040283a2f456760bd685e696b423985cac0 100644
>> --- a/drivers/clk/bcm/clk-raspberrypi.c
>> +++ b/drivers/clk/bcm/clk-raspberrypi.c
>> @@ -68,6 +68,7 @@ struct raspberrypi_clk_variant {
>>       char        *clkdev;
>>       unsigned long    min_rate;
>>       bool        minimize;
>> +    u32        flags;
>>   };
>>   static struct raspberrypi_clk_variant
>> @@ -75,6 +76,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>       [RPI_FIRMWARE_ARM_CLK_ID] = {
>>           .export = true,
>>           .clkdev = "cpu0",
>> +        .flags = CLK_IGNORE_UNUSED,
>>       },
>>       [RPI_FIRMWARE_CORE_CLK_ID] = {
>>           .export = true,
>> @@ -90,6 +92,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>            * always use the minimum the drivers will let us.
>>            */
>>           .minimize = true,
>> +        .flags = CLK_IGNORE_UNUSED,
>>       },
>>       [RPI_FIRMWARE_M2MC_CLK_ID] = {
>>           .export = true,
>> @@ -115,6 +118,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>            * drivers will let us.
>>            */
>>           .minimize = true,
>> +        .flags = CLK_IGNORE_UNUSED,
>>       },
>>       [RPI_FIRMWARE_V3D_CLK_ID] = {
>>           .export = true,
>> @@ -127,6 +131,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>       [RPI_FIRMWARE_HEVC_CLK_ID] = {
>>           .export = true,
>>           .minimize = true,
>> +        .flags = CLK_IGNORE_UNUSED,
>>       },
>>       [RPI_FIRMWARE_ISP_CLK_ID] = {
>>           .export = true,
>> @@ -135,6 +140,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>>       [RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
>>           .export = true,
>>           .minimize = true,
>> +        .flags = CLK_IS_CRITICAL,
>>       },
>>       [RPI_FIRMWARE_VEC_CLK_ID] = {
>>           .export = true,
>> @@ -259,7 +265,40 @@ static int 
>> raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
>>       return 0;
>>   }
>> +static int raspberrypi_fw_prepare(struct clk_hw *hw)
>> +{
>> +    const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
>> +    struct raspberrypi_clk *rpi = data->rpi;
>> +    u32 state = RPI_FIRMWARE_STATE_ENABLE_BIT;
>> +    int ret;
>> +
>> +    ret = raspberrypi_clock_property(rpi->firmware, data,
>> +                     RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>> +    if (ret)
>> +        dev_err(rpi->dev, "Failed to set clock %d state to on: %d",
>> +            data->id, ret);
> I suggest to use dev_err_ratelimited for prepare/unprepare, otherwise 
> this could spam the kernel log.
> 
> Furthermore i wouldn't recommend to log some magic clock id. How about 
> using clk_hw_get_name(hw) instead?
> 
> Don't we need a newline character at the end?
> 
>> +
>> +    return ret;
>> +}
>> +
>> +static void raspberrypi_fw_unprepare(struct clk_hw *hw)
>> +{
>> +    const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
>> +    struct raspberrypi_clk *rpi = data->rpi;
>> +    u32 state = 0;
>> +    int ret;
>> +
>> +    ret = raspberrypi_clock_property(rpi->firmware, data,
>> +                     RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>> +    if (ret)
>> +        dev_err(rpi->dev, "Failed to set clock %d state to off: %d",
>> +            data->id, ret);
> see above
> 
> Best regards
>> +}
>> +
>> +
>>   static const struct clk_ops raspberrypi_firmware_clk_ops = {
>> +    .prepare        = raspberrypi_fw_prepare,
>> +    .unprepare      = raspberrypi_fw_unprepare,
>>       .is_prepared    = raspberrypi_fw_is_prepared,
>>       .recalc_rate    = raspberrypi_fw_get_rate,
>>       .determine_rate    = raspberrypi_fw_dumb_determine_rate,
>> @@ -289,7 +328,7 @@ static struct clk_hw 
>> *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>>       if (!init.name)
>>           return ERR_PTR(-ENOMEM);
>>       init.ops = &raspberrypi_firmware_clk_ops;
>> -    init.flags = CLK_GET_RATE_NOCACHE;
>> +    init.flags = variant->flags | CLK_GET_RATE_NOCACHE;
>>       data->hw.init = &init;
>>
> 

