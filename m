Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE448B2A03
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 22:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEAB10E3BA;
	Thu, 25 Apr 2024 20:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="DJAW2FW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2464310E3BA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 20:43:30 +0000 (UTC)
Message-ID: <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714077808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u2mtItP+V03mGsYiNN70hhu7OHc79xAcYyNtntuYPhE=;
 b=DJAW2FW+hkuxUhr1TylwYEe1ZWXxjgdQVUkI0WgbomDCeHx40HNnOZ+0CtTRk2Y9d99vDm
 NxsClUQHg7mixWEJF7rc5Z+lOolnKYNLibvs93PK0jKZeNsmCbDg5ZEJuzxT6S7qXEbAZE
 tP8vF3HcdiVvel/D5rkp0lwlmCfR5io=
Date: Fri, 26 Apr 2024 04:43:18 +0800
MIME-Version: 1.0
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
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


On 2024/4/26 03:10, Andy Shevchenko wrote:
> On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
>> On 2024/4/25 22:26, Andy Shevchenko wrote:
>>> It seems driver missed the point of proper use of device property APIs.
>>> Correct this by updating headers and calls respectively.
>> You are using the 'seems' here exactly saying that you are not 100% sure.
>>
>> Please allow me to tell you the truth: This patch again has ZERO effect.
>> It fix nothing. And this patch is has the risks to be wrong.
> Huh?! Really, stop commenting the stuff you do not understand.


I'm actually a professional display drivers developer at the downstream
in the past, despite my contribution to upstream is less. But I believe
that all panel driver developers know what I'm talking about. So please
have take a look at my replies.


>> Simple because the "ili9341_probe() ---> ili9341_dbi_prob()" code path
>> is DT dependent.
>>
>> First of all, the devm_of_find_backlight() is called in ili9341_dbi_probe()
>> under *non-DT* environment, devm_of_find_backlight() is just a just a
>> no-op and will return NULL. NULL is not an error code, so ili9341_dbi_probe()
>> won't rage quit. But the several side effect is that the backlight will
>> NOT works at all.
> Is it a problem?

Yes, it is.
  

The core problem is that the driver you are modifying has *implicit* *dependency* on DT.
The implicit dependency is due to the calling of devm_of_find_backlight(). This function
is a no-op under non-DT systems. Therefore, before the devm_of_find_backlight() and
the device_get_match_data() function can truly DT independent.

Removing the "OF" dependency just let the tigers run out from the jail.

It is not really meant to targeting at you, but I thinks, all of drm_panel drivers
that has the devm_of_find_backlight() invoked will suffer such concerns.
In short, the reason is that the *implicit* *dependency* populates and
the undefined behavior gets triggered.


I'm sure you know that device_get_match_data() is same with of_device_get_match_data()
for DT based systems. For non DT based systems, device_get_match_data() is just *undefined*
Note that ACPI is not in the scope of the discussion here, as all of the drm bridges and
panels driver under drivers/gpu/drm/ hasn't the ACPI support yet. Therefore, at present,
it safe to say that device_get_match_data() is *undefined* under no-DT environment.

Removing the "OF" dependency hints to us that it allows the driver to be probed as a
pure SPI device under non DT systems. When device_get_match_data() is called, it returns
NULL to us now. As a result, the drm driver being modified will tears down.

See bellow code snippet extracted frompanel-ilitek-ili9341.c:


```
	ili->conf = of_device_get_match_data(dev);
	if (!ili->conf) {
		dev_err(dev, "missing device configuration\n");
		return -ENODEV;
	}
```

>> It is actually considered as fatal bug for *panels* if the backlight of
>> it is not light up, at least the brightness of *won't* be able to adjust.
>> What's worse, if there is no sane platform setup code at the firmware
>> or boot loader stage to set a proper initial state. The screen is complete
>> dark. Even though the itself panel is refreshing framebuffers, it can not
>> be seen by human's eye. Simple because of no backlight.
> Can you imagine that I may have different hardware that considered
> this is non-fatal error?
>
Yes, I can imagine.

I believe you have the hardware which make you patch correct to run
in 99.9% of all cases. But as long as there one bug happened, you patch
are going to be blamed.

Because its your patch that open the door, both from the perceptive of
practice and from the perceptive of the concept (static analysis).

>> Second, the ili9341_dbi_probe() requires additional device properties to
>> be able to works very well on the rotation screen case. See the calling
>> of "device_property_read_u32(dev, "rotation", &rotation)" in
>> ili9341_dbi_probe() function.
> Yes, exactly, and how does it object the purpose of this patch?

Because under *non-DT* environment, your commit message do not give a
valid description, how does the additional device property can be acquired
is not demonstrated.

And it is exactly your patch open the non-DT code path (way or possibility).
It isn't has such risks before your patch is applied. In other words,
previously, the driver has the 'OF' dependency as the guard, all of the
potential risk(or problem) are suppressed. It is a extremely safe policy,
and it is also a extremely perfect defend.

And suddenly, you patch release the dangerous tiger from the cage.
So I think you can imagine...

>> Combine with those two factors, it is actually can conclude that the
>> panel-ilitek-ili9394 driver has the *implicit* dependency on 'OF'.
>> Removing the 'OF' dependency from its Kconfig just trigger the
>> leakage of such risks.
> What?!
>
Posting a patch is actually doing the defensive works, such a saying
may not sound fair for you, but this is just the hash cruel reality.
Sorry for saying that. :(


>> My software node related patches can help to reduce part of the potential
>> risks, but it still need some extra work. And it is not landed yet.
> Your patch has nothing to do with this series.

With my patch applied, this is way to meet the gap under non-DT systems.
Users of this driver could managed to attach(complete) absent properties
to the SPI device with software node properties. Register the swnode
properties group into the system prior the panel driver is probed. There
may need some quirk. But at the least there has a way to go.  When there
has a way to go, things become self-consistent. Viewed from both the
practice of viewpoint and the concept of viewpoint.

And the dangerous tiger will steer its way to the direction of "ACPI
support is missing". But both of will be safe then.

-- 
Best regards,
Sui

