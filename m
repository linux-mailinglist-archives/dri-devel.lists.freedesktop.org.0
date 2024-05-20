Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871458C9C8C
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F6A10E067;
	Mon, 20 May 2024 11:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="X2Di+fr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CF310E067
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 11:48:58 +0000 (UTC)
X-Envelope-To: dmitry.baryshkov@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716205735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/2jIMHpQ5bz88ELVTIuNNb4NQxUzvaS8gU5mTaBGSc=;
 b=X2Di+fr32ouYtT2RQoCqmcywfTyjnqOfZwcx88Ts3so/uxK3xC6/dfwwU8kqtpQ9GDfEe1
 bOFxOZB8nCsCcidXjxYqZRPcD/Mim24m42bsN5Bn4DsQH1OODajRu1CgSIdNCNmWFtTfgD
 VG0DdNhqelDu7nJcuYP0CBGQy1b0zik=
X-Envelope-To: victor.liu@nxp.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: andrzej.hajda@intel.com
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: rfoss@kernel.org
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: jonas@kwiboo.se
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: biju.das.jz@bp.renesas.com
X-Envelope-To: u.kleine-koenig@pengutronix.de
X-Envelope-To: aford173@gmail.com
X-Envelope-To: jani.nikula@intel.com
X-Envelope-To: bli@bang-olufsen.dk
Message-ID: <acc508e2-b067-47ef-b3e2-fcac51403fe0@linux.dev>
Date: Mon, 20 May 2024 19:48:46 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 biju.das.jz@bp.renesas.com, u.kleine-koenig@pengutronix.de,
 aford173@gmail.com, jani.nikula@intel.com, bli@bang-olufsen.dk
References: <20240516101006.2388767-1-victor.liu@nxp.com>
 <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
 <e2d4e8b4-bab4-448f-8b67-21f2902fdcd2@linux.dev>
 <CAA8EJppH1rYQ5pzkGP+V-=cOPBYMWm=ZK2Ei1ttjOiN6GRDP+w@mail.gmail.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJppH1rYQ5pzkGP+V-=cOPBYMWm=ZK2Ei1ttjOiN6GRDP+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 5/20/24 19:13, Dmitry Baryshkov wrote:
> On Mon, 20 May 2024 at 14:11, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>
>> Hi,
>>
>> On 5/20/24 06:11, Dmitry Baryshkov wrote:
>>> On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
>>>> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
>>>> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
>>>> no interrupt requested at all.
>>>>
>>>> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
>>>> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
>>>> a few times, but adv7511_irq_process() happens to refuse to handle
>>>> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
>>>>
>>>> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
>>>> handling from adv7511_irq_process().
>>>>
>>>> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>>> index 6089b0bb9321..2074fa3c1b7b 100644
>>>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>>> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>>>>               return ret;
>>>>
>>>>       /* If there is no IRQ to handle, exit indicating no IRQ data */
>>>> -    if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>>>> +    if (adv7511->i2c_main->irq &&
>>>> +        !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>>>>           !(irq1 & ADV7511_INT1_DDC_ERROR))
>>>>               return -ENODATA;
>>>
>>> I think it might be better to handle -ENODATA in adv7511_wait_for_edid()
>>> instead. WDYT?
>>>
>>
>> I think this is may deserve another patch.
> 
> My point is that the IRQ handler is fine to remove -ENODATA here,

[...]

> there is no pending IRQ that can be handled. 

But there may has other things need to do in the adv7511_irq_process()
function.

So instead of continuing
> the execution when we know that IRQ bits are not set, 

Even when IRQ bits are not set, it just means that there is no HPD
and no EDID ready-to-read signal. HDMI CEC interrupts still need
to process.


it's better to
> ignore -ENODATA in the calling code and go on with msleep().
> 

So, It's confusing to ignore the -ENODATA here.

-- 
Best regards
Sui
