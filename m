Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9729A764B1
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 13:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF1D10E3D0;
	Mon, 31 Mar 2025 11:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A033F10E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 11:02:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10B6B1F02;
 Mon, 31 Mar 2025 04:02:41 -0700 (PDT)
Received: from [10.57.15.213] (unknown [10.57.15.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60DF93F694;
 Mon, 31 Mar 2025 04:02:34 -0700 (PDT)
Message-ID: <c4620199-79da-413f-807d-f99a751c1e43@arm.com>
Date: Mon, 31 Mar 2025 12:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panfrost: Add PM runtime flags
To: Philippe Simons <simons.philippe@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
 <20250312232319.25712-2-simons.philippe@gmail.com>
 <20250327123628.3d33c68e@donnerap.manchester.arm.com>
 <d102aa1b-61cf-4dcc-851e-fc56adf9fab8@arm.com>
 <edf101e3-c638-45fa-8f5d-48247b9e0c9d@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <edf101e3-c638-45fa-8f5d-48247b9e0c9d@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 31/03/2025 11:49, Philippe Simons wrote:
> 
> On 3/31/25 12:32, Steven Price wrote:
>> On 27/03/2025 12:36, Andre Przywara wrote:
>>> On Thu, 13 Mar 2025 00:23:18 +0100
>>> Philippe Simons <simons.philippe@gmail.com> wrote:
>>>
>>> Hi Rob, Boris, Steven,
>>>
>>>> When the GPU is the only device attached to a single power domain,
>>>> core genpd disable and enable it when gpu enter and leave runtime
>>>> suspend.
>>>>
>>>> Some power-domain requires a sequence before disabled,
>>>> and the reverse when enabled.
>>>>
>>>> Add PM flags for CLK and RST, and implement in
>>>> panfrost_device_runtime_suspend/resume.
>>> So some Mali configuration and integration manual I am looking at says
>>> that this sequence should be always observed, as the powerdown sequence
>>> would include disabling the clocks first, then asserting the reset, then
>>> turning the power switches off (and the inverse sequence on powerup).
>>>
>>> So should we make this unconditional, not depending on implementation
>>> specific flags?
>> I think you're right, this probably should be unconditional. My only
>> reservation is that "it works" currently and we'd need to test this
>> doesn't cause regressions on existing platforms. So unless someone with
>> a reasonable board farm is able to do that testing I think this solution
>> is reasonable. So:
> 
> Should I merge both flags together then ? something like GPU_PM_RT ?

Yes, that would probably be a good idea and might simplify things a little.

Thanks,
Steve

>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>>> And also I am wondering if panfrost_device_init() gets this wrong as
>>> well?
>>> As I see it enabling clock first, then reset, then pm_domain, where it
>>> should be exactly the opposite?
>> I agree, that looks very wrong - the power needs to be enabled before
>> reset is deasserted. I'm somewhat surprised we've got away with that.
>> Fancy writing a patch? ;)
>>
>> Steve
>>
>>> Cheers,
>>> Andre
>>>
>>>> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/panfrost/panfrost_device.c | 37 ++++++++++++++++++
>>>> ++++
>>>>   drivers/gpu/drm/panfrost/panfrost_device.h |  4 +++
>>>>   2 files changed, 41 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/
>>>> gpu/drm/panfrost/panfrost_device.c
>>>> index a45e4addcc19..189ad2ad2b32 100644
>>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>>>> @@ -406,11 +406,38 @@ void panfrost_device_reset(struct
>>>> panfrost_device *pfdev)
>>>>   static int panfrost_device_runtime_resume(struct device *dev)
>>>>   {
>>>>       struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>>> +    int ret;
>>>> +
>>>> +    if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT)) {
>>>> +        ret = reset_control_deassert(pfdev->rstc);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
>>>> +        ret = clk_enable(pfdev->clock);
>>>> +        if (ret)
>>>> +            goto err_clk;
>>>> +
>>>> +        if (pfdev->bus_clock) {
>>>> +            ret = clk_enable(pfdev->bus_clock);
>>>> +            if (ret)
>>>> +                goto err_bus_clk;
>>>> +        }
>>>> +    }
>>>>         panfrost_device_reset(pfdev);
>>>>       panfrost_devfreq_resume(pfdev);
>>>>         return 0;
>>>> +
>>>> +err_bus_clk:
>>>> +    if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS))
>>>> +        clk_disable(pfdev->clock);
>>>> +err_clk:
>>>> +    if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
>>>> +        reset_control_assert(pfdev->rstc);
>>>> +    return ret;
>>>>   }
>>>>     static int panfrost_device_runtime_suspend(struct device *dev)
>>>> @@ -426,6 +453,16 @@ static int
>>>> panfrost_device_runtime_suspend(struct device *dev)
>>>>       panfrost_gpu_suspend_irq(pfdev);
>>>>       panfrost_gpu_power_off(pfdev);
>>>>   +    if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
>>>> +        if (pfdev->bus_clock)
>>>> +            clk_disable(pfdev->bus_clock);
>>>> +
>>>> +        clk_disable(pfdev->clock);
>>>> +    }
>>>> +
>>>> +    if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
>>>> +        reset_control_assert(pfdev->rstc);
>>>> +
>>>>       return 0;
>>>>   }
>>>>   diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/
>>>> gpu/drm/panfrost/panfrost_device.h
>>>> index cffcb0ac7c11..f372d4819262 100644
>>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>>>> @@ -36,10 +36,14 @@ enum panfrost_drv_comp_bits {
>>>>    * enum panfrost_gpu_pm - Supported kernel power management features
>>>>    * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
>>>>    * @GPU_PM_VREG_OFF: Allow turning off regulators during system
>>>> suspend
>>>> + * @GPU_PM_RT_CLK_DIS: Allow disabling clocks during system runtime
>>>> suspend
>>>> + * @GPU_PM_RST_ASRT: Allow asserting the reset control during
>>>> runtime suspend
>>>>    */
>>>>   enum panfrost_gpu_pm {
>>>>       GPU_PM_CLK_DIS,
>>>>       GPU_PM_VREG_OFF,
>>>> +    GPU_PM_RT_CLK_DIS,
>>>> +    GPU_PM_RT_RST_ASRT
>>>>   };
>>>>     struct panfrost_features {

