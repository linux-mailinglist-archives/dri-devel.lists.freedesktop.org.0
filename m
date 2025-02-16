Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A95A374BE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 15:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2224410E251;
	Sun, 16 Feb 2025 14:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FmLrW4fj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F1C10E251
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 14:40:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBF885C55FC;
 Sun, 16 Feb 2025 14:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1413C4CEDD;
 Sun, 16 Feb 2025 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739716844;
 bh=x3aFXyhGS+U6X3HUjZO8xlvr8jPhcUkEQ3Hk37j9GNc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FmLrW4fjCmyZFZr1YzTzhQQn46h4frr/4RKLRlUYWYOEjHvSwmJUlZp2CgHJ8YZ+8
 8oTMm3l/zAHH4nQ0+vsGOlZdjgR7lgUpAAsyJVuysP1iLBY+Srk3/9megO+4YW3l0v
 kuL5kqYjYjBjeLH1jrR+K43/suqFQ3FxcF80vF7d/4tztaMOntanyuqSQFSk5fU6x4
 qkuBgqLAKcsD5y/VD1dBENmjbMaJasuWPY9rQiuxdceU0/1f0YjlYVdBdtuDA0lSCo
 Zxbh5G9/BWuQeRtCfEaoZFVLFDSemCavP8Pt1VA51S1JVv66krp/SZ5EtXq5ORG/jF
 VvgqcSInyKysA==
Date: Sun, 16 Feb 2025 14:40:33 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>, Daniel
 Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 2/2] mfd: lm3533: convert to use OF
Message-ID: <20250216144033.47852a60@jic23-huawei>
In-Reply-To: <20250212075845.11338-3-clamor95@gmail.com>
References: <20250212075845.11338-1-clamor95@gmail.com>
 <20250212075845.11338-3-clamor95@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 12 Feb 2025 09:58:42 +0200
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> Add ability to fill pdata from device tree. Common stuff is
> filled from core driver and then pdata is filled per-device
> since all cells are optional.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Focusing on just the IIO bit. (backlog of review is a bit high
for me this weekend!)

> ---
>  drivers/iio/light/lm3533-als.c      | 58 ++++++++++++++++++++-
>  drivers/leds/leds-lm3533.c          | 69 +++++++++++++++++++++++--
>  drivers/mfd/lm3533-core.c           | 79 ++++++++++++++++++++++++-----
>  drivers/video/backlight/lm3533_bl.c | 72 ++++++++++++++++++++++++--
>  include/linux/mfd/lm3533.h          |  1 +
>  5 files changed, 256 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
> index 99f0b903018c..21fc5f215c80 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c
> @@ -16,7 +16,9 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/mfd/core.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  
> @@ -826,6 +828,50 @@ static const struct iio_info lm3533_als_info = {
>  	.read_raw	= &lm3533_als_read_raw,
>  };
>  
> +static void lm3533_parse_als(struct platform_device *pdev,
> +			     struct lm3533_als_platform_data *pdata)
> +{
> +	struct device *dev = &pdev->dev;
> +	int val, ret;
> +
> +	/* 1 - 127 (ignored in PWM-mode) */
> +	ret = device_property_read_u32(dev, "resistor-value", &val);
> +	if (ret)
> +		val = 1;
For defaults that apply on any error, the pattern

	val = 1;
	device_property_read_u32(dev, "resistor-value", &val);
is cleaner.

What are the units? If it's a resistor then they should be ohms
or similar and that should be part of the naming.

You should be taking whatever the value is in ohms and mapping
it to appropriate r_select in this function.

> +	pdata->r_select = val;
> +
> +	pdata->pwm_mode = device_property_read_bool(dev, "pwm-mode");
> +}
> +
> +static int lm3533_pass_of_node(struct platform_device *pdev,
> +			       struct lm3533_als_platform_data *pdata)
> +{
> +	struct device *parent_dev = pdev->dev.parent;
> +	struct device *dev = &pdev->dev;
> +	struct fwnode_handle *node;
> +	const char *label;
> +	int val, ret;
> +
> +	device_for_each_child_node(parent_dev, node) {

This devices should have direct access to the correct child node.
Otherwise something odd is going on...

> +		fwnode_property_read_string(node, "compatible", &label);
> +
> +		if (!strcmp(label, pdev->name)) {
> +			ret = fwnode_property_read_u32(node, "reg", &val);
> +			if (ret) {
> +				dev_err(dev, "reg property is missing: ret %d\n", ret);

use return dev_err_probe() for these.

> +				return ret;
> +			}
> +
> +			if (val == pdev->id) {
> +				dev->fwnode = node;
> +				dev->of_node = to_of_node(node);
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int lm3533_als_probe(struct platform_device *pdev)
>  {
>  	const struct lm3533_als_platform_data *pdata;
> @@ -840,8 +886,16 @@ static int lm3533_als_probe(struct platform_device *pdev)
>  
>  	pdata = dev_get_platdata(&pdev->dev);
>  	if (!pdata) {
> -		dev_err(&pdev->dev, "no platform data\n");
> -		return -EINVAL;
> +		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata)
> +			return -ENOMEM;
> +
> +		ret = lm3533_pass_of_node(pdev, pdata);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "failed to get als device node\n");
> +
> +		lm3533_parse_als(pdev, pdata);
>  	}
>  
>  	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*als));

