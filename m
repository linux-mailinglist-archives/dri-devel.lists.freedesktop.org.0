Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB6A372F6
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4451E10E275;
	Sun, 16 Feb 2025 09:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="YJ1k7qHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32108.qiye.163.com (mail-m32108.qiye.163.com
 [220.197.32.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F6210E275
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:06:29 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id b2f6e438;
 Sun, 16 Feb 2025 17:06:23 +0800 (GMT+08:00)
Message-ID: <467d4a72-1b7a-40e8-b394-6e742de8999f@rock-chips.com>
Date: Sun, 16 Feb 2025 17:06:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/14] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-8-damon.ding@rock-chips.com>
 <fw74xd2hgwc7iodhh5wb3ovd26tzlsomgypx4hqlqrxl4k2mdf@pycb5ugojyhr>
 <CAD=FV=Ubi11ejFO8asRF57OYGb3fGEFo0mz_04-5yQ89PPw3_A@mail.gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <CAD=FV=Ubi11ejFO8asRF57OYGb3fGEFo0mz_04-5yQ89PPw3_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUpCSVZJSh1NGklPTE1KSx9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a950e023f8403a3kunmb2f6e438
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NE06KSo4TTITMzI3DDQBEx5R
 AQMaCi1VSlVKTEhCTUJNTENPQkpOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNTEpPNwY+
DKIM-Signature: a=rsa-sha256;
 b=YJ1k7qHD9LMbZV3yl7iXwxQpd0X3Jto2JLXX0X62UlGrJO6L3X6di+xejiNoVmhhZM7rTME34n5f9xyJMRDWzytg4/qeNvIue/GWdwS4zSNVyPxUczB1FjXKhKqQMsJDqDupllRFNrrvlptwO0DPf2pDRXxitJxpyQpHBI7nvNM=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=uBn2ZwWfBgfEZJD69JqZ5aG4tVP+QnUKrTAAleubLs8=;
 h=date:mime-version:subject:message-id:from;
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

Hi Doug,

On 2025/1/24 11:13, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jan 23, 2025 at 3:25 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Thu, Jan 23, 2025 at 06:07:40PM +0800, Damon Ding wrote:
>>> The main modification is moving the DP AUX initialization from function
>>> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
>>> eDP panel during probing, it is also needed to advance PM operaions to
> 
> nit: s/operaions/operations
> 

I will fix it in the next version.

> 
>>> ensure that eDP controller and phy are prepared for AUX transmission.
>>
>> This doesn't sound right. Per the documentation of
>> drm_dp_aux::transfer(), the device should power itself up if transfer()
>> is called when it is powered off. The caller must only ensure that the
>> panel is on.
>>
>> Doug, what's your opinion?
> 
> I think maybe the CL description is a bit confusing, but looking at
> the patch I think that the general idea is correct. drm_dp_aux_init()
> is expected to be called in probe() and not in bind(). ...and in order
> for it to work then pm_runtime needs to be enabled at probe and not at
> bind. So both of those two things that this patch does are (in my
> opinion) correct.
> 
> 
>>> In addtion, add a new function analogix_dp_remove() to ensure symmetry
>>> for PM operations.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>>>    component_add() when getting panel from the DP AUX bus
>>>
>>> Changes in v5:
>>> - Advance PM operations to make eDP AUX work well
>>>
>>> Changes in v6:
>>> - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
>>> - Add a new function analogix_dp_remove() to ensure symmetry for PM
>>>    operations
>>> ---
>>>   .../drm/bridge/analogix/analogix_dp_core.c    | 57 ++++++++++---------
>>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  4 ++
>>>   include/drm/bridge/analogix_dp.h              |  1 +
>>>   3 files changed, 34 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> index 8251adfce2f9..30da8a14361e 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> @@ -1658,14 +1658,42 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>>>        }
>>>        disable_irq(dp->irq);
> 
> not related to your patch, but probably needs to be a prerequisite of
> your patch: instead of calling disable_irq() here, you should OR in
> "IRQF_NO_AUTOEN" to the "irq_flags" of devm_request_threaded_irq().
> That not only closes a potential race condition but also makes all the
> error handling much more robust.
> 

Yes, it is nice to set the IRQF_NO_AUTOEN flag rather than calling the 
disable_irq().

> 
>>> +     dp->aux.name = "DP-AUX";
>>> +     dp->aux.transfer = analogix_dpaux_transfer;
>>> +     dp->aux.dev = dp->dev;
>>> +     drm_dp_aux_init(&dp->aux);
> 
> FWIW: I would highly encourage you to (in a separate patch) add
> wait_hpd_asserted() support here. It is deprecated to not implement
> wait_hpd_asserted(). See the definition of "wait_hpd_asserted" in
> "struct drm_dp_aux" if you're going to support eDP panels.
> 

Indeed, the &drm_dp_aux.wait_hpd_asserted() help confirm the HPD state 
before doing AUX transfers. I will add it in the next version.

> 
>>> +     if (IS_ENABLED(CONFIG_PM)) {
> 
> Do we really truly need this? Is there anyone actually using this
> driver without "CONFIG_PM", or can we just assume CONFIG_PM. For the
> most part drivers I've interacted with just assume CONFIG_PM and
> they're a lot simpler because of it. If there's truly a need then we
> can keep this complexity, but I'd rather wait until there is a user.
> Maybe you could add this as a dependency in the Kconfig if needed.
> 

I would also like to remove the CONFIG_PM related check, which would 
make the code more concise. And I believe that it would be a good idea 
to remove it and wait until there is a user who actually needs it.

> 
>>> +             pm_runtime_use_autosuspend(dp->dev);
>>> +             pm_runtime_set_autosuspend_delay(dp->dev, 100);
>>> +             ret = devm_pm_runtime_enable(dp->dev);
>>> +             if (ret)
>>> +                     goto err_disable_pm_runtime;
>>> +     } else {
>>> +             ret = analogix_dp_resume(dp);
>>> +             if (ret)
>>> +                     goto err_disable_clk;
> 
> IMO: if analogix_dp_resume() succeeds, use devm_add_action_or_reset()
> to have a function call analogix_dp_suspend(). Then you can keep using
> "devm" for everything and totally get rid of the need for the
> analogix_dp_remove() function.
> 

It may be better to drop the 'complex' check about CONFIG_PM and just 
keep using 'devm' as mentioned above.

> 
>>> +     }
>>> +
>>>        return dp;
>>>
>>> +err_disable_pm_runtime:
>>> +     pm_runtime_dont_use_autosuspend(dp->dev);
> 
> You don't need to call pm_runtime_dont_use_autosuspend(). If you
> enabled pm_runtime with devm_pm_runtime_enable() then it's documented
> to handle calling pm_runtime_dont_use_autosuspend() for you. See the
> kernel doc comment for devm_pm_runtime_enable(). So you can get rid of
> this.
> 

Yeah, I find the comment in the definition of 
pm_runtime_use_autosuspend() and I will remove it in the next version.

> 
>>>   err_disable_clk:
>>>        clk_disable_unprepare(dp->clock);
>>>        return ERR_PTR(ret);
> 
> Huh? Why would you call "err_disable_clk" here? The only thing that
> enables the clock is analogix_dp_resume(), right? There's something
> fishy here and it predates your patch. I suspect there were problems
> in commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
> runtime PM"). You should fix that in a separate patch before yours.
> 

Yes, I believe there is a small bug in the commit mentioned above and I 
will add a separate patch to fix it.

> 
>>> +void analogix_dp_remove(struct analogix_dp_device *dp)
>>> +{
>>> +     if (IS_ENABLED(CONFIG_PM))
>>> +             pm_runtime_dont_use_autosuspend(dp->dev);
>>> +     else
>>> +             analogix_dp_suspend(dp);
>>> +}
>>> +EXPORT_SYMBOL_GPL(analogix_dp_remove);
> 
> See above. Proper use of "devm" should mean you don't need a remove() function.
> 

Yeah, the analogix_dp_remove() is not needed based on the above discussion.

> 

Best regards
Damon

