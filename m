Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FD9120844
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 15:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E596E598;
	Mon, 16 Dec 2019 14:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AF26E598
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576505794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kWznC8f0Sw5hpnKrBN/sRNgm7RvIde/Or5f2/cvT4Og=;
 b=AQDtJSCCvAqTWm9K/blNfwKP68/31F5SUgXDu2atLfvQmDHmXOSNmkY38EU6rxmtb8LJ/P
 SrzobtzvptehNhzvtcJRwt6nQX+5yRWJbh7Sw1Sc12tc8xnCd8jzK1cnGNQq8kfjJ/cvnX
 l+t5OSQ6nz2H/fJ8P3xPaqt5ZnxGdaI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-gOSY4zGJNASeXexTZTSoXA-1; Mon, 16 Dec 2019 09:16:32 -0500
Received: by mail-wm1-f70.google.com with SMTP id o24so1079114wmh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 06:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iyyJmBM3fDcRwB4obuoYugCBOkwPjR5ZZAf85xRDFJI=;
 b=IGsdHSZr+t9zgS2dVmTnsTPGy4pP9/pxxcQSU7Lj/1orq24ZSh7n8CLbZyqKrSmBNl
 l8/as9HIk9mhd+KSRaweNs+zmtlsJq3XSfsub8S7FVvH44Q28uK2LIZBAzQY9/zDaqte
 S4nNnRd0EleUHqrMl4MjOI/EWVbpNLYSKyDffylX58/yOF5uDG04vNQqsQFTiqqqA18v
 J2cI9pR1rDOHsHMMV3uoKGTO9kuJRy9YHpxQFDsFRrCl5PU9gWy5EjrBHfX0uepVMw9l
 KscQZaAVxQmq+rul9/ENFKN4eqVbAyVNBZHVks6sqeBp3zDJTtaJZnlm7k094/Ua6t7L
 vjBA==
X-Gm-Message-State: APjAAAVHZ4WNBINS3joa7bTXFB15iN7oVgE/ZF3jnpLc+a+c8qHcEpZm
 7CCHj385ILpkNvFVHk94cmC2ldOtxaEGwTGKz0ddYL5DIBfw5Lf8vYIbkjceQR6s5pEwGETH0k0
 DW14p8R+2cwFnsaQcFHwMsNhxFsRV
X-Received: by 2002:adf:a308:: with SMTP id c8mr29838074wrb.240.1576505790872; 
 Mon, 16 Dec 2019 06:16:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqycr8vbMR7LAJzKT/83BL3q03HQov83Lat9afG86+vT2vXdgjwSHLffqAKplmr/V+CoUwBxgw==
X-Received: by 2002:adf:a308:: with SMTP id c8mr29838050wrb.240.1576505790643; 
 Mon, 16 Dec 2019 06:16:30 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id c9sm20297847wmc.47.2019.12.16.06.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 06:16:30 -0800 (PST)
Subject: Re: [PATCH 4/5] drm/i915/dsi: Move Crystal Cove PMIC panel GPIO
 lookup from mfd to the i915 driver
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-5-hdegoede@redhat.com>
 <20191216135627.GS1208@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <25e93a0e-3f48-abd4-d2ba-07a4d03f7f7d@redhat.com>
Date: Mon, 16 Dec 2019 15:16:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216135627.GS1208@intel.com>
Content-Language: en-US
X-MC-Unique: gOSY4zGJNASeXexTZTSoXA-1
X-Mimecast-Spam-Score: 0
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
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Jones <lee.jones@linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16-12-2019 14:56, Ville Syrj=E4l=E4 wrote:
> On Sun, Dec 15, 2019 at 05:38:09PM +0100, Hans de Goede wrote:
>> Move the Crystal Cove PMIC panel GPIO lookup-table from
>> drivers/mfd/intel_soc_pmic_core.c to the i915 driver.
>>
>> The moved looked-up table is adding a GPIO lookup to the i915 PCI
>> device and the GPIO subsys allows only one lookup table per device,
>>
>> The intel_soc_pmic_core.c code only adds lookup-table entries for the
>> PMIC panel GPIO (as it deals only with the PMIC), but we also need to be
>> able to access some GPIOs on the SoC itself, which requires entries for
>> these GPIOs in the lookup-table.
>>
>> Since the lookup-table is attached to the i915 PCI device it really
>> should be part of the i915 driver, this will also allow us to extend
>> it with GPIOs from other sources when necessary.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 23 +++++++++++++++++++-
>>   drivers/mfd/intel_soc_pmic_core.c            | 19 ----------------
>>   2 files changed, 22 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/=
drm/i915/display/intel_dsi_vbt.c
>> index 027970348b22..847f04eec2a1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> @@ -25,6 +25,7 @@
>>    */
>>   =

>>   #include <linux/gpio/consumer.h>
>> +#include <linux/gpio/machine.h>
>>   #include <linux/mfd/intel_soc_pmic.h>
>>   #include <linux/slab.h>
>>   =

>> @@ -686,8 +687,18 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi=
, u16 panel_id)
>>   =

>>   /*
>>    * On some BYT/CHT devs some sequences are incomplete and we need to m=
anually
>> - * control some GPIOs.
>> + * control some GPIOs. We need to add a GPIO lookup table before we get=
 these.
>>    */
>> +static struct gpiod_lookup_table pmic_panel_gpio_table =3D {
>> +	/* Intel GFX is consumer */
>> +	.dev_id =3D "0000:00:02.0",
>> +	.table =3D {
>> +		/* Panel EN/DISABLE */
>> +		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
>> +		{ },
>> +	},
>> +};
> =

> Feels like a failure in abstraction to have these irrelevant details
> exposed on the consumer side. Also slightly concerned that someone
> refactoring things in the pmic driver could now break this without
> realizing it. But if people want it done this way I can live with it.

Note how in the final patch we add another lookup for a GPIO called "panel"
but now on another GPIO controller. Since which GPIO controller has the
"panel" GPIO is specified by a bit in the VBT doing the lookup-table
registering from within the i915 code actually kinda makes sense.

> =

>> +
>>   void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_i=
s_on)
>>   {
>>   	struct drm_device *dev =3D intel_dsi->base.base.dev;
>> @@ -697,6 +708,8 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel=
_dsi, bool panel_is_on)
>>   =

>>   	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>>   	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
>> +		gpiod_add_lookup_table(&pmic_panel_gpio_table);
>> +
>>   		intel_dsi->gpio_panel =3D gpiod_get(dev->dev, "panel", flags);
>>   		if (IS_ERR(intel_dsi->gpio_panel)) {
>>   			DRM_ERROR("Failed to own gpio for panel control\n");
>> @@ -707,8 +720,16 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *inte=
l_dsi, bool panel_is_on)
>>   =

>>   void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
>>   {
>> +	struct drm_device *dev =3D intel_dsi->base.base.dev;
>> +	struct drm_i915_private *dev_priv =3D to_i915(dev);
>> +	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
>> +
>>   	if (intel_dsi->gpio_panel) {
>>   		gpiod_put(intel_dsi->gpio_panel);
>>   		intel_dsi->gpio_panel =3D NULL;
>>   	}
>> +
>> +	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>> +	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC))
> =

> Needless parens here as well.

Will fix for v2 (will also the other case).

> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Thanks.

Regards,

Hans



> =

>> +		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
>>   }
>> diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_p=
mic_core.c
>> index 47188df3080d..ddd64f9e3341 100644
>> --- a/drivers/mfd/intel_soc_pmic_core.c
>> +++ b/drivers/mfd/intel_soc_pmic_core.c
>> @@ -9,8 +9,6 @@
>>    */
>>   =

>>   #include <linux/acpi.h>
>> -#include <linux/gpio/consumer.h>
>> -#include <linux/gpio/machine.h>
>>   #include <linux/i2c.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/module.h>
>> @@ -25,17 +23,6 @@
>>   #define BYT_CRC_HRV		2
>>   #define CHT_CRC_HRV		3
>>   =

>> -/* Lookup table for the Panel Enable/Disable line as GPIO signals */
>> -static struct gpiod_lookup_table panel_gpio_table =3D {
>> -	/* Intel GFX is consumer */
>> -	.dev_id =3D "0000:00:02.0",
>> -	.table =3D {
>> -		/* Panel EN/DISABLE */
>> -		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
>> -		{ },
>> -	},
>> -};
>> -
>>   /* PWM consumed by the Intel GFX */
>>   static struct pwm_lookup crc_pwm_lookup[] =3D {
>>   	PWM_LOOKUP("crystal_cove_pwm", 0, "0000:00:02.0", "pwm_pmic_backlight=
", 0, PWM_POLARITY_NORMAL),
>> @@ -96,9 +83,6 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client =
*i2c,
>>   	if (ret)
>>   		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
>>   =

>> -	/* Add lookup table binding for Panel Control to the GPIO Chip */
>> -	gpiod_add_lookup_table(&panel_gpio_table);
>> -
>>   	/* Add lookup table for crc-pwm */
>>   	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>>   =

>> @@ -121,9 +105,6 @@ static int intel_soc_pmic_i2c_remove(struct i2c_clie=
nt *i2c)
>>   =

>>   	regmap_del_irq_chip(pmic->irq, pmic->irq_chip_data);
>>   =

>> -	/* Remove lookup table for Panel Control from the GPIO Chip */
>> -	gpiod_remove_lookup_table(&panel_gpio_table);
>> -
>>   	/* remove crc-pwm lookup table */
>>   	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>>   =

>> -- =

>> 2.23.0
> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
