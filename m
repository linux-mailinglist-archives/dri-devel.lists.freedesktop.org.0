Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76913F230E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 00:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36F56E907;
	Thu, 19 Aug 2021 22:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0A46E907
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 22:22:32 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3D71D82999;
 Fri, 20 Aug 2021 00:22:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1629411750;
 bh=33UHPL0RZcL6+9jW56lcEU9a2CDzC1s+ybQGXQwzmfQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Dt65FNaCxgBS+xEd01WWk4ajHnXrhGr0PbF+ALRxohsJqNUqyhXhbH0z/WMP51PzV
 J5K2nkxWLrY7YmMdxUOwaY9TfEq235oiKG3okvKE9/JbggRICauVU6ff35IRYP4Tap
 4q316SIay5cHI4HYKr9md1UqKwsBRywA7AoRfZLtu2u9qyN/K6z76GdPBVZh61lfEk
 XuQLKJPm0Sj1N5cxXOtlPYdi7ZpxYWtk/C6umu29mZd2Q6uXWqgnjdMuX9dNtl6MVy
 J6UcVAoKrAA6sb/oZL9Qu0skmGXaO+cKXK+gkgW2/ZrjoCPOG+0FsRzkOSN0ZUtX62
 r11+g2AKsPs/A==
Subject: Re: [PATCH] drm/stm: ltdc: improve pm_runtime to stop clocks
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
 <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
 <3bb823e4-4724-7072-fe9f-7b8a355c8e50@foss.st.com>
 <5d65ca80-4f94-49e1-5de1-cf29e8231a6a@denx.de>
 <629b6666-74b3-91f0-5c6c-e26d55ea62d8@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a051825c-1795-b7c4-6fdd-64595e52a6ca@denx.de>
Date: Fri, 20 Aug 2021 00:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <629b6666-74b3-91f0-5c6c-e26d55ea62d8@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

On 8/17/21 11:43 AM, Raphael Gallais-Pou wrote:
> 
> On 7/2/21 8:07 PM, Marek Vasut wrote:
>> On 7/2/21 11:23 AM, Raphael Gallais-Pou wrote:
>>> Hello Marek,
>>
>> Hi,
>>
>>> Sorry for the late answer.
>>
>> No worries, take your time
>>
>>> On 6/30/21 2:35 AM, Marek Vasut wrote:
>>>> On 6/29/21 1:58 PM, Raphael GALLAIS-POU - foss wrote:
>>>>
>>>> [...]
>>>>
>>>>> +++ b/drivers/gpu/drm/stm/ltdc.c
>>>>> @@ -425,10 +425,17 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
>>>>>    {
>>>>>        struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>>>>>        struct drm_device *ddev = crtc->dev;
>>>>> +    int ret;
>>>>>          DRM_DEBUG_DRIVER("\n");
>>>>>    -    pm_runtime_get_sync(ddev->dev);
>>>>> +    if (!pm_runtime_active(ddev->dev)) {
>>>>> +        ret = pm_runtime_get_sync(ddev->dev);
>>>>
>>>> All these if (!pm_runtime_active()) then pm_runtime_get_sync() calls look like workaround for some larger issue. Shouldn't the pm_runtime do some refcounting on its own , so this shouldn't be needed ?
>>>
>>>
>>> This problem purely comes from the driver internals, so I don't think it is a workaround.
>>>
>>> Because of the "ltdc_crtc_mode_set_nofb" function which does not have any "symmetrical" call, such as enable/disable functions, there was two calls to pm_runtime_get_sync against one call to pm_runtime_put_sync.
>>>
>>> This instability resulted in the LTDC clocks being always enabled, even when the peripheral was disabled. This could be seen in the clk_summary as explained in the patch summary among other things.
>>>
>>> By doing so, we first check if the clocks are not already activated, and in that case we call pm_runtime_get_sync.
>>
>> I just have to wonder, how come other drivers don't need these if (!pm_runtime_active()) pm_runtime_get_sync() conditions. I think they just get/put the runtime PM within a call itself, not across function calls. Maybe that could be the right fix here too ?
> 
> 
> Hello Marek,

Hi,

> I've run a deeper analysis over this implementation.

Thank you

> If I may take rockchip's "rockchip_drm_vop.c" driver, there is an boolean "is_enabled" set to true when crtc_atomic_enable is called.
> 
> The above implementation could save us from adding such field in the ltdc_dev structure.
> 
> Another solution could be in order to simply call pm_runtime_get_sync() in ltdc_crtc_mode_set_nofb() and by removing this condition in ltdc_atomic_crtc_disable() the driver behaves just like the first version of this patch.
> 
> In this way, it avoids such conditions and seems more to get along with the current implementation.

Let me maybe ask a different question -- can ltdc_crtc_mode_set_nofb() 
ever be called with the LTDC suspended (so you would have to call 
pm_runtime_get_sync() in that function to power the block up and to get 
access to its registers) ?

[...]
