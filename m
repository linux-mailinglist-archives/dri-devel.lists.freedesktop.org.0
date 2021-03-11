Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824B53371D8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 12:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2016EC0C;
	Thu, 11 Mar 2021 11:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4844D6EC0C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 11:55:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5868931B;
 Thu, 11 Mar 2021 03:55:10 -0800 (PST)
Received: from [10.99.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 606B43F793;
 Thu, 11 Mar 2021 03:55:09 -0800 (PST)
Subject: Re: [PATCH] drm/komeda: Fix off-by-1 when with readback conn due to
 rounding
To: Brian Starkey <brian.starkey@arm.com>, james.qian.wang@arm.com
References: <20210305163853.66157-1-carsten.haitzler@foss.arm.com>
 <20210309113636.whdolt4v3k5qpgpx@DESKTOP-E1NTVVP.localdomain>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
Message-ID: <b9832558-cb41-14a5-fadd-94f4b0aad81d@foss.arm.com>
Date: Thu, 11 Mar 2021 11:55:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309113636.whdolt4v3k5qpgpx@DESKTOP-E1NTVVP.localdomain>
Content-Language: en-US
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
Cc: nd@arm.com, liviu.dudau@arm.com,
 Carsten Haitzler <carsten.haitzler@arm.com>, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/9/21 11:36 AM, Brian Starkey wrote:
> Hi Carsten, (+James for komeda)
> 
> Thanks for typing this up.
> 
> On Fri, Mar 05, 2021 at 04:38:53PM +0000, carsten.haitzler@foss.arm.com wrote:
>> From: Carsten Haitzler <carsten.haitzler@arm.com>
>>
>> When setting up a readback conenctor that writes data back to memory
> 
> s/readback conenctor/writeback connector/ (similar in the subject)
> 
>> rather than to an actual output device (HDMI etc.), rounding was ses
> 
> s/ses/set/

I swear I re-read the log text... I must be auto-correcting in my head 
as I read. :)

>> to round-down. As the DPU uses a higher internal number of bits when
> 
> "round-down" isn't really accurate - the rounding mode "rounds" based
> on the most-significant discarded bit - so can round-up too.
> 
> Come to think of it, I can't explain 0xff becoming 0xfe, but still,
> truncation is likely fine.

Actually it was the other way - I mixed up the src/dest, but TRC does 
fix it which is the important bit.

>> generating a color value, this round-down back to 8bit ended up with
>> everything being off-by one. e.g. #ffffff became #fefefe. This sets
>> rounding to "round" so things end up correct by turning on the round
>> flag (LW_TRC).
> 
> LW_TRC is the truncation flag. 0: Round, 1: Truncate
> 
>>
>> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
>> ---
>>   drivers/gpu/drm/arm/display/komeda/d71/d71_component.c | 6 +++++-
>>   drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h      | 1 +
>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
>> index 8a02ade369db..d551e79fa0f1 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
>> @@ -468,7 +468,11 @@ static void d71_wb_layer_update(struct komeda_component *c,
>>   	struct komeda_layer_state *st = to_layer_st(state);
>>   	struct drm_connector_state *conn_st = state->wb_conn->state;
>>   	struct komeda_fb *kfb = to_kfb(conn_st->writeback_job->fb);
>> -	u32 ctrl = L_EN | LW_OFM, mask = L_EN | LW_OFM | LW_TBU_EN;
>> +	/* LW_TRC sets rounding to round not truncate which is needed for
>> +         * the output of writeback to match the input in the most common
>> +         * use cases like RGB888 -> RGB888, so set this bit by default */
> 
> /*
>   * Comment style should be like this
>   */
> 
> Same as above though - your description is inverted. By setting the
> LW_TRC bit, you're forcing the hardware to truncate instead of round.

Yeah - inverted. But the source does have mixed comment styles with some
/*
  * xxxx
  */

and some

/* xxxx */

and some

/* xxxx
  */

with the last 2 most common.

>> +	u32 ctrl = L_EN | LW_OFM | LW_TRC;
>> +	u32 mask = L_EN | LW_OFM | LW_TBU_EN | LW_TRC;
> 
> Really nitpicking, but I think it'd be good to keep these in the same
> order as the bits in the register: L_EN | LW_TRC | LW_OFM | LW_TBU_EN

I can do that. I'll send another with the above.

> Cheers,
> -Brian
> 
>>   	u32 __iomem *reg = c->reg;
>>   
>>   	d71_layer_update_fb(c, kfb, st->addr);
>> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
>> index e80172a0b320..a8036689d721 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
>> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
>> @@ -321,6 +321,7 @@
>>   #define LAYER_WR_FORMAT		0x0D8
>>   
>>   /* Layer_WR control bits */
>> +#define LW_TRC			BIT(1)
>>   #define LW_OFM			BIT(4)
>>   #define LW_LALPHA(x)		(((x) & 0xFF) << 8)
>>   #define LW_A_WCACHE(x)		(((x) & 0xF) << 28)
>> -- 
>> 2.30.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
