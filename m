Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CF99B72C
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 23:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2988D10E369;
	Sat, 12 Oct 2024 21:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="aCAQo/2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47C110E368
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 21:26:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3222488E0F;
 Sat, 12 Oct 2024 23:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728768369;
 bh=n0gUqPu0L9PwDtoZ6oud8EjC999D6KiLx0miig+Q668=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aCAQo/2Z3WzrkPFGWG9CNKR5Q8y+q1PTKmsVQjglOxSQ4VEP7zhzHKYNl8zufNiM8
 krgEJs8JtZlB1vxP0UsKEEmf85k+YT/5Ic5rQP+i+2/zeyWQSZVkMRrYNSDAmpGvea
 R78zdO11EmGongwbpEVDwMYXyTzLoJzILxU3BHtvkVq8W+wLbUxwLnR0IuYiyYFAOm
 XwZpL36xvQk4R0qZwkeJ4M5qVR9fPQQqNXPWVBKyAWmMqXRrqj6Q1A8JB/3b0LhZl5
 JR1pN7SSiKvYFtBLEkX8Qci0b38yHxq4SNf4RiWeXI4LIgyNadHbiMDwSXiXQKiFwi
 qaQ0R7AGolbfQ==
Message-ID: <207b20ff-cc7b-40aa-8dde-bc5aabdfb414@denx.de>
Date: Sat, 12 Oct 2024 23:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <20241008223846.337162-2-marex@denx.de>
 <d6a34efa-47ad-439b-8b0c-a427cf087cb3@nxp.com>
 <0e47b529-59f2-4d25-8c5d-30ca1dc4e964@denx.de>
 <3341a6a7-ac0e-4594-a670-b3a6d583b344@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3341a6a7-ac0e-4594-a670-b3a6d583b344@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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

On 10/11/24 8:49 AM, Liu Ying wrote:
> On 10/11/2024, Marek Vasut wrote:
>> On 10/10/24 9:15 AM, Liu Ying wrote:
>>> On 10/09/2024, Marek Vasut wrote:
>>>> The LDB serializer clock operate at either x7 or x14 rate of the input
>>>
>>> Isn't it either x7 or 3.5x?
>>
>> Is it 3.5 for the dual-link LVDS ?
> 
> Yes.
> 
> static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
> {
>          if (fsl_ldb_is_dual(fsl_ldb))
>                  return clock * 3500;
>          else
>                  return clock * 7000;
> }
> 
>> I don't have such a panel right now to test.
> 
> You can add a panel DT node for test to see the relationship
> between the clocks, without a real dual-link LVDS panel.

I'll take your word for this.

>> [...]
>>
>>>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>> index 0e4bac7dd04ff..a3a31467fcc85 100644
>>>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>> @@ -278,6 +278,16 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>>>>        return MODE_OK;
>>>>    }
>>>>    +static void fsl_ldb_mode_set(struct drm_bridge *bridge,
>>>> +                   const struct drm_display_mode *mode,
>>>> +                   const struct drm_display_mode *adj)
>>>> +{
>>>> +    struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>>>> +    unsigned long requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
>>>> +
>>>> +    clk_set_rate(fsl_ldb->clk, requested_link_freq);
>>>
>>> The mode_set callback won't be called when only crtc_state->active
>>> is changed from false to true in an atomic commit, e.g., blanking
>>> the emulated fbdev first and then unblanking it.  So, in this case,
>>> the clk_set_rate() in fsl_ldb_atomic_enable() is still called after
>>> those from mxsfb_kms or lcdif_kms.
>>>
>>> Also, it doesn't look neat to call clk_set_rate() from both mode_set
>>> callback and atomic_enable callback.
>>
>> I agree the mode_set callback is not the best place for this.
>> Do you know of a better callback where to do this ? I couldn't find one.
> 
> A wild idea is to change the order between the CRTC atomic_enable
> callback and the bridge one by implementing your own
> atomic_commit_tail...  I don't think there is any place to do this
> other than atomic_enable callback.

I will give that a try, thanks.

> Anyway, I don't think it is necessary to manage the clk_set_rate()
> function calls between this driver and mxsfb_kms or lcdif_kms
> because "video_pll1" clock rate is supposed to be assigned in DT...

I disagree with this part. I believe the assignment of clock in DT is 
only a temporary workaround which should be removed. The drivers should 
be able to figure out and set the clock tree configuration.

>>> The idea is to assign a reasonable PLL clock rate in DT to make
>>> display drivers' life easier, especially for i.MX8MP where LDB,
>>> Samsung MIPI DSI may use a single PLL at the same time.
>> I would really like to avoid setting arbitrary clock in DT, esp. if it can be avoided. And it surely can be avoided for this simple use case.
> 
> ... just like I said in patch 1/2, "video_pll1" clock rate needs
> to be x2 "media_ldb" clock rate for dual LVDS link mode. Without
> an assigned "video_pll1" clock rate in DT, this driver cannot
> achieve that.

This is something the LDB driver can infer from DT and configure the 
clock tree accordingly.

> And, the i.MX8MP LDB + Samsung MIPI DSI case is
> not simple considering using one single PLL and display modes
> read from EDID.
You could use separate PLLs for each LCDIF scanout engine in such a 
deployment, I already ran into that, so I am aware of it. That is 
probably the best way out of such a problem, esp. if accurate pixel 
clock are the requirement.

[...]
