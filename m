Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA734D3C3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 17:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6593E89C7F;
	Mon, 29 Mar 2021 15:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 45B6489C7F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 15:27:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69EBC142F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 08:27:37 -0700 (PDT)
Received: from [10.99.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28D983F694
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 08:27:37 -0700 (PDT)
Subject: Re: [PATCH] drm/komeda: Fix off-by-1 when with readback conn due to
 rounding
To: dri-devel@lists.freedesktop.org
References: <20210311120846.23543-1-carsten.haitzler@foss.arm.com>
 <20210312105521.dg6zcuf5gikfz5zm@DESKTOP-E1NTVVP.localdomain>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
Message-ID: <4cb0df03-e038-0613-5d83-5992618e876e@foss.arm.com>
Date: Mon, 29 Mar 2021 16:27:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312105521.dg6zcuf5gikfz5zm@DESKTOP-E1NTVVP.localdomain>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/12/21 10:55 AM, Brian Starkey wrote:
> (Adding back James again - did you use get_maintainer.pl?)
> 
> On Thu, Mar 11, 2021 at 12:08:46PM +0000, carsten.haitzler@foss.arm.com wrote:
>> From: Carsten Haitzler <carsten.haitzler@arm.com>
>>
>> When setting up a readback connector that writes data back to memory
>> rather than to an actual output device (HDMI etc.), rounding was set
>> to round. As the DPU uses a higher internal number of bits when generating
>> a color value, this round-down back to 8bit ended up with everything
>> being off-by one. e.g. #fefefe became #ffffff. This sets
> 
> Perhaps overly pedantic, but now we've tracked down what was actually
> happening I think we can be more precise here. Not _everything_ is
> off-by-one, it's just rounding in the standard sense - if the most

Well a very large number of pixels were off-by-1 ... I guess it's an 
exaggeration but a "vast number of pixels were off by 1". I guess I was 
just using common terms like "everything is expensive here" doesn't 
actually mean absolutely everything but a very vast number of things. 
You know what I mean. :) The comment as a whole describing rounding 
policies should provide more details. I just write the log as a "when 
spelunking through history, this log will give me some broader insight 
into what this change is without being war and peace and If I want to 
see more and this commit is interesting to my spelunking efforts, I'll 
git log -U to read that".

> significant bit-to-be-discarded is set, the value is rounded up to
> minimise the absolute error introduced by bit-depth reduction.
> 
>> rounding to "round-down" so things end up correct by turning on the LW_TRC
>> round down flag.
> 
> Can we call it "truncate" rather than round down? I think it makes
> "TRC" a bit more understandable.

That's the official name from the docs though (TRC)... makes it easier 
to match to them... So I think you can argue this both ways. The comment 
where it's used though does make it clear...

>>
>> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
>> ---
>>   drivers/gpu/drm/arm/display/komeda/d71/d71_component.c | 7 ++++++-
>>   drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h      | 1 +
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
>> index 8a02ade369db..e97acc5519d1 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
>> @@ -468,7 +468,12 @@ static void d71_wb_layer_update(struct komeda_component *c,
>>   	struct komeda_layer_state *st = to_layer_st(state);
>>   	struct drm_connector_state *conn_st = state->wb_conn->state;
>>   	struct komeda_fb *kfb = to_kfb(conn_st->writeback_job->fb);
>> -	u32 ctrl = L_EN | LW_OFM, mask = L_EN | LW_OFM | LW_TBU_EN;
>> +	/* LW_TRC sets rounding to truncate not round which is needed for
>> +	 * the output of writeback to match the input in the most common
>> +	 * use cases like RGB888 -> RGB888, so set this bit by default
>> +	 */
> 
> Hm, not sure why this file uses "net/" style comments, but as you
> said, this is in-keeping with the rest of the file, so meh :-)

Yup. Just stick to "follow the style there" unless there is seemingly a 
good reason that what is there is horribly "broken" and needs fixing up.

>> +	u32 ctrl = LW_TRC | L_EN | LW_OFM;
>> +	u32 mask = LW_TRC | L_EN | LW_OFM | LW_TBU_EN;
> 
> If you were aiming for matching register order, this should be:
> 
>      L_EN | LW_TRC | LW_OFM | LW_TBU_EN
> 
> 
> I think it'd be nice to have the exact behaviour in the commit
> message, but either way this seems OK as a pragmatic fix so:

git log -U ? :)

> Reviewed-by: Brian Starkey <brian.starkey@arm.com>
> 
> Thanks,
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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
