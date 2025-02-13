Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D65A33F9D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 13:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E610B10EA87;
	Thu, 13 Feb 2025 12:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QU/FYJCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E2310EA87
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739451422; x=1770987422;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=4XOKJP5C9KasCvv9RRiGNI4Xj2vhZlzPXtPpNzDC/WM=;
 b=QU/FYJCzhIjzo341v5A/bg6Od6h6HOghiZjSzvMJwjLy7tkDdbaLDc3L
 3FFQFlSzxPr4TiUjEqPJo7kUwGb+CJlX6fml6y+ARJxgKKWrInznl0O20
 xoHWDA4AWpaj3ZbWNfyiZ77ENjnQXBj6naZu3bojquWjkZrNUtBGTRwYi
 V4fHdJArHD7/nmaZ+9EtaZpcF/KyYixSoCfM8yjCCEU1l1ybslvNDMdN/
 /A/DDm2dR4mLiZihRKt83z0lMXcLYFYgurfLko6Qo8tumBavM6NaZfmXH
 PHqo44MoHM/oxaqq+dYLJBl6AzO4gUh3ZMHrx8FhCkqKMk867R0z/nORR g==;
X-CSE-ConnectionGUID: eZrDE03bTEq20cAdZ7mO8g==
X-CSE-MsgGUID: NInUuhh+RdWQRDHnkFtRgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="62619416"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62619416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 04:57:01 -0800
X-CSE-ConnectionGUID: ThDS0Z6ISMGS8HTigpxZiA==
X-CSE-MsgGUID: x6AFKZzsRDeJj1srwh0IiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112973137"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.48])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 04:56:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Feb 2025 14:56:44 +0200 (EET)
To: Jerome Brunet <jbrunet@baylibre.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?ISO-8859-15?Q?Th=E9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 4/7] platform: arm64: lenovo-yoga-c630: use the
 auxiliary device creation helper
In-Reply-To: <20250211-aux-device-create-helper-v3-4-7edb50524909@baylibre.com>
Message-ID: <0e83224d-9517-48f4-f030-b622c5d39d48@linux.intel.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-4-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 11 Feb 2025, Jerome Brunet wrote:

> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
> 
> Use it and remove some boilerplate code.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/platform/arm64/lenovo-yoga-c630.c | 42 +++----------------------------
>  1 file changed, 4 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
> index 1f05c9a6a89d5ee146144062f5d2e36795c56639..921a93d4ea39ac54344cc964e2805e974cc7e808 100644
> --- a/drivers/platform/arm64/lenovo-yoga-c630.c
> +++ b/drivers/platform/arm64/lenovo-yoga-c630.c
> @@ -191,50 +191,16 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
>  }
>  EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
>  
> -static void yoga_c630_aux_release(struct device *dev)
> -{
> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> -
> -	kfree(adev);
> -}
> -
> -static void yoga_c630_aux_remove(void *data)
> -{
> -	struct auxiliary_device *adev = data;
> -
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> -}
> -
>  static int yoga_c630_aux_init(struct device *parent, const char *name,
>  			      struct yoga_c630_ec *ec)
>  {
>  	struct auxiliary_device *adev;
> -	int ret;
> -
> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> -	if (!adev)
> -		return -ENOMEM;
> -
> -	adev->name = name;
> -	adev->id = 0;
> -	adev->dev.parent = parent;
> -	adev->dev.release = yoga_c630_aux_release;
> -	adev->dev.platform_data = ec;
>  
> -	ret = auxiliary_device_init(adev);
> -	if (ret) {
> -		kfree(adev);
> -		return ret;
> -	}
> -
> -	ret = auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> -	}
> +	adev = devm_auxiliary_device_create(parent, name, ec, 0);
> +	if (IS_ERR(adev))
> +		return PTR_ERR(adev);
>  
> -	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
> +	return 0;

return PTR_ERR_OR_ZERO()

>  }
>  
>  static int yoga_c630_ec_probe(struct i2c_client *client)
> 
> 

-- 
 i.

