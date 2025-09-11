Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE30B52B55
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94BC10E310;
	Thu, 11 Sep 2025 08:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XWF4PwSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94AA10E310
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 08:15:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 098A7601AE;
 Thu, 11 Sep 2025 08:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EAAC4CEF1;
 Thu, 11 Sep 2025 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757578547;
 bh=MZkSNF729QqNTQj4q9PWDrOZg6xdXAe10HC4k5HQhA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWF4PwSs+H43I/a5ob6RMVM1e7DIddUYISGAQpdHdB80rrbiLOVmgcwYPDbdQnUnx
 omtvKRdXL9kTjEdlT/mA6jcklq7qN05N6uV9vCrQDL9vwf2XykyhKIe/72SVOdrx+A
 M7Ofe21pJ8uU3amFLq3Ax6U/b4wc38Lpy+nDSEAKq7mJut1cuyhKuyB4hcSPvxVZZc
 1iLX3srlsJ8AQTUL/+NQxW3+c4rSxYQDXBo0De6JI1YAEML44dP19+ZdA4PsVnYCWq
 SjViXlstokf3/Zj7+xaABT+0BnWcftX8znP6k27TosFQZFbWHmbojTAEUbEpqV+iWR
 BqXbC2lhEsZpA==
Date: Thu, 11 Sep 2025 09:15:40 +0100
From: Lee Jones <lee@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, threeway@gmail.com,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
Message-ID: <20250911081540.GD9224@google.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
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

On Wed, 10 Sep 2025, Aleksandrs Vinarskis wrote:

> From: Hans de Goede <hansg@kernel.org>
> 
> Add 'name' argument to of_led_get() such that it can lookup LEDs in
> devicetree by either name or index.
> 
> And use this modified function to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
> 
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Lee Jones <lee@kernel.org>

Remind me why this can't go in through LED again?

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  drivers/leds/led-class.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 15633fbf3c166aa4f521774d245f6399a642bced..f3faf37f9a08ac762ed87b91cb3cab5faa8eacb0 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -252,15 +252,23 @@ static const struct class leds_class = {
>   * of_led_get() - request a LED device via the LED framework
>   * @np: device node to get the LED device from
>   * @index: the index of the LED
> + * @name: the name of the LED used to map it to its function, if present
>   *
>   * Returns the LED device parsed from the phandle specified in the "leds"
>   * property of a device tree node or a negative error-code on failure.
>   */
> -static struct led_classdev *of_led_get(struct device_node *np, int index)
> +static struct led_classdev *of_led_get(struct device_node *np, int index,
> +				       const char *name)
>  {
>  	struct device *led_dev;
>  	struct device_node *led_node;
>  
> +	/*
> +	 * For named LEDs, first look up the name in the "led-names" property.
> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> +	 */
> +	if (name)
> +		index = of_property_match_string(np, "led-names", name);
>  	led_node = of_parse_phandle(np, "leds", index);
>  	if (!led_node)
>  		return ERR_PTR(-ENOENT);
> @@ -324,7 +332,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
>  	if (!dev)
>  		return ERR_PTR(-EINVAL);
>  
> -	led = of_led_get(dev->of_node, index);
> +	led = of_led_get(dev->of_node, index, NULL);
>  	if (IS_ERR(led))
>  		return led;
>  
> @@ -342,9 +350,14 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
>  struct led_classdev *led_get(struct device *dev, char *con_id)
>  {
>  	struct led_lookup_data *lookup;
> +	struct led_classdev *led_cdev;
>  	const char *provider = NULL;
>  	struct device *led_dev;
>  
> +	led_cdev = of_led_get(dev->of_node, -1, con_id);
> +	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
> +		return led_cdev;
> +
>  	mutex_lock(&leds_lookup_lock);
>  	list_for_each_entry(lookup, &leds_lookup_list, list) {
>  		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
> 
> -- 
> 2.48.1
> 
> 

-- 
Lee Jones [李琼斯]
