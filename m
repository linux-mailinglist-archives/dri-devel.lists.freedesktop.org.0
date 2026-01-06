Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B64CF6527
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 02:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FA410E460;
	Tue,  6 Jan 2026 01:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QReAPE7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AFB10E46B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 01:37:11 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dlYgR559sz9t8l;
 Tue,  6 Jan 2026 02:37:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767663427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZdZ6z94WkwXLP8aTircs4WcG7hRxfUszazs7DfQTcA=;
 b=QReAPE7ke0wiZOzVxM3a+dKfeWMTiR+P+pxZJKx7eZrI6m3p9b4JzkT6PL8iTPFl0+fs8z
 PetcKAB7TzuBlZsmok6+/WjeLB3cgzvhDxU17sxj1Rv+Sst7sjLimqPs2mCLrcFHvfvA94
 Zt1C2XyL8R7kneUy6RN4xvOxQZa25ZERMcOBFCOXAjfAbdwNxEdhRZ3hVJ+fnzayfmUokX
 kkCoJEqCB3tk8Oc+JJXYp3P8JCr1CqJDtkAzyiXPZIjQUswuHYH9EdZb7wZY2YYNc8QAje
 FemL8DTDplAylFvImKRL0m/B4m4LQVK4GixZR/ntkLC/vQ3x6unQokSD8o71Jw==
Message-ID: <9912e2dc-50cc-464d-8372-b3b79334ac67@mailbox.org>
Date: Tue, 6 Jan 2026 02:36:18 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
To: Liu Ying <victor.liu@oss.nxp.com>, Liu Ying <victor.liu@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
 <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
 <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
 <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
 <500852c9-2cd5-4897-a139-4e93988f5469@mailbox.org>
 <df8751ba-7215-4635-98b0-ca659ec786cd@nxp.com>
 <de695268-1241-4658-871c-30dbf068ad92@mailbox.org>
 <3d622f3c-ddd4-4feb-bc88-a1eea7dd936d@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <3d622f3c-ddd4-4feb-bc88-a1eea7dd936d@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: o3msartdmiogq9p5x1ggudos8skw5gfh
X-MBO-RS-ID: f3f8d579d449a7f2514
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

On 11/14/25 11:03 AM, Liu Ying wrote:

Hello Liu,

sorry for my late reply.

>>>>>>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>>>>>>> @@ -1,6 +1,7 @@
>>>>>>>      config DRM_IMX8_DC
>>>>>>>          tristate "Freescale i.MX8 Display Controller Graphics"
>>>>>>>          depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>>>>>>> +    depends on IMX_SCU
>>>>>> Can the SCU dependency be made optional,
>>>>>
>>>>> I don't think this can be done.  If you grep 'depends on IMX_SCU' in
>>>>> kernel, you may find a handful of existing dependancies.
>>>>
>>>> Sure, I do not dispute this part.
>>>>
>>>> But the SCU dependency can be contained in a component of this driver,
>>>> which is not used by MX95, and used only by MX8Q . Then there will be
>>>> no problem.
>>>
>>> Which component?  You mean PRG and DPRC?
>>>
>>> If we add something like CONFIG_DRM_IMX8_DC_PRG and make CONFIG_DRM_IMX8_DC_PRG
>>> depend on SCU, then should we make CONFIG_DRM_IMX8_DC depend on
>>> CONFIG_DRM_IMX8_DC_PRG?  That's yet another dependency.
>>
>> I would say, if possible, put the SCU-dependent parts behind
>> CONFIG_DRM_IMX8_DC_PRG symbol, and make that symbol configurable via
>> Kconfig . Users of iMX95-only can turn it off, generic kernel config
>> should keep it on.
> 
> Both i.MX8 and i.MX95 would use arm64 defconfig.  Most distros if not all
> would use that to generate a single kernel image + modules for i.MX8 and
> i.MX95.  We can't presume that __most__ users would change the configs
> for i.MX95.

That wasn't my point. My point was, make it possible to compile the PRG 
parts out if they aren't needed (and with them, SCU support). If I build 
the kernel for iMX95, I don't need iMX8Q support in, so I can turn MX8Q 
support off alongside the SCU parts. The clean way to do that is to keep 
the SCU-dependent parts in dedicated file(s), which may or may not be 
compiled in. For generic kernel builds, they should be compiled in and 
decide at runtime, whether or not they should be used of course.

[...]

>>>>> Like I replied to your i.MX95 DC patch series's cover letter, SCU accesses
>>>>> registers via Cortex-M core instead of Cortex-A core IIUC.  I really don't
>>>>> know how to abstract IMX_SCU out, especially via regmap.
>>>>
>>>> The simplest way would be to use regmap_config .reg_read and .reg_write ,
>>>> if there is no better way.
>>>
>>> Can you shed more light on this?  Any examples?
>>
>> I'll just reply to this part, because that is probably the most relevant
>> to this whole conversation.
>>
>> git grep '\.reg_write' drivers -> drivers/hwmon/aspeed-pwm-tacho.c as a
>> simple example.
>>
>> Then such a reg_write implementation can do:
>>
>> if (SCU)
>>    use SCU accessor
>> else
>>    use writel() or so
> 
> Thanks for the example, it makes regmap idea a bit more clear.  But, how
> would you pass the SCU flag to .reg_write?  I hope i.MX95 code path won't
> see any information about SCU.

You could have one regmap for MX8Q and one regmap for MX95. For the 
register IO in the driver which uses regmap, either regmap is still only 
a generic regmap, no matter what the hardware accessor in that regmap 
are. Therefore most of the code can be generic (use generic regmap) and 
only the probe code decides which regmap (MX8Q SCU regmap or MX95 
regmap) is going to be used by the driver.

> Also, IMO, wrapping SCU with regmap is abusing the regmap API.
> How would you pass the resource, ctrl and val parameters to .reg_write?
> 
> int imx_sc_misc_set_control(struct imx_sc_ipc *ipc, u32 resource,
>                              u8 ctrl, u32 val)
> 
> Regarding the 'else' clause, I don't think we can use writel(), because
> SCU accesses registers via Cortex-M core, not Cortex-A core(I mentioned
> this before).  I don't see anything we can put under the 'else' clause.

You could have one regmap definition for MX8Q/SCU and one for MX95, and 
at probe time, select which of those is going to be used. That could 
work I think ?

>>>>>> so iMX95 support can be added into the driver easily too ?
>>>>>
>>>>> Like I replied to your i.MX95 DC patch series, I think i.MX95 DC support
>>>>> can be in drivers/gpu/drm/imx/dc, but it should be in a separate module
>>>>> (something like imx95_dc_drm) plus an additional common module(like
>>>>> imx_dc_drm_common).
>>>> This design part is something I do not fully understand. Sure, it can be
>>>> two modules, but in the end, the result would have to be capable of being
>>>> compiled into single kernel binary if both modules would be =y in Kconfig
>>>> anyway.
>>>
>>> This is something like imx8qm_ldb, imx8qxp_ldb and imx_ldb_helper modules -
>>> DRM_IMX8QM_LDB and DRM_IMX8QXP_LDB select DRM_IMX_LDB_HELPER.
>>>
>>> Note you may make CONFIG_DRM_IMX8QM_LDB=y and CONFIG_DRM_IMX8QXP_LDB=m with
>>> CONFIG_DRM_IMX_LDB_HELPER=y.
>> Do we have to make it this complicated right from the start ?
> 
> I don't think imx_dc_drm_common would make it complicated, but instead it
> makes drivers simple and easy to maintain.
> 
>> Maybe we can start simple, with one module, and then split it up if it turns
>> out to be unsuitable ?
> 
> Hmm, maybe it's time to split it up now, because:
> 1) Your below patch has already been adding DB to CRTC function.
>     See dc_db_shdtokgen() in dc_crtc_atomic_enable(), which certainly breaks
>     i.MX8 DC.  To avoid that, you'll add branches to the atomic enable
>     callback, which is something I don't want.

Can we have separate atomic_enable() callback for MX8Q and MX95 for 
example ?

> https://patchwork.freedesktop.org/patch/680085/?series=155784&rev=1
> 
> 2) This patch series is trying to add i.MX8 DC prefetch engine support.
>     i.MX95 really doesn't embed the prefetch engine.  And I hope i.MX95 code
>     path doesn't need to know the prefetch engine/SCU existence or non-existence.
I think the prefetch code can be contained in a single file and called 
only if the SoC is MX8Q, that shouldn't be difficult to do ?
