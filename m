Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11B9781D50
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 12:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044C810E131;
	Sun, 20 Aug 2023 10:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr
 [80.12.242.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F44510E131
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 10:06:44 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id XfKSq7fa0WghuXfKSq3Tzp; Sun, 20 Aug 2023 12:06:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1692526002;
 bh=GiOe1P5RZBAu0+IDAU0H1NgB/w3J2a4zROWs+GR1bIs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dNvhYJTG55qucsGiqkg/mOVpuZxDI+WhER2U/+XjCyirYycq/czq0XRKsGhNgKuPY
 ZTMJWh9gMQPYYL/RAhrsEl7r9rgamS6GBXBnEqxHqo8VP6SVtLpZU6l8YhHLCQRjf6
 xV76Ou8igdQowkUo62+u2ldZa7He4jpDZ4GgoC8XQjs4mVR7RaYNYApCo8kfd7Zxr6
 IRHQjw3zrzEnPRO+7fG5UyKYzRRHIWiHc5QF14aAX2PoC7N1F7bPu5h10SWAEwhfRy
 psEpA/kUe70Fp/AFglfpbyrUooZDIHtufczVgixBLfyLiE+zecK8T05aODWHfGLn27
 IgH/A3WaGOafQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Aug 2023 12:06:42 +0200
X-ME-IP: 86.243.2.178
Message-ID: <2b7cf5af-1d96-8650-ac93-b1243bab5d7a@wanadoo.fr>
Date: Sun, 20 Aug 2023 12:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
Content-Language: fr
To: Julius Zint <julius@zint.sh>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230820094118.20521-2-julius@zint.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 20/08/2023 à 11:41, Julius Zint a écrit :
> The HID spec defines the following Usage IDs (p. 345 ff):
> 
> - Monitor Page (0x80) -> Monitor Control (0x01)
> - VESA Virtual Controls Page (0x82) -> Brightness (0x10)
> 
> Apple made use of them in their Apple Studio Display and most likely on
> other external displays (LG UltraFine 5k, Pro Display XDR).
> 
> The driver will work for any HID device with a report, where the
> application matches the Monitor Control Usage ID and:
> 
> 1. An Input field in this report with the Brightness Usage ID (to get
>     the current brightness)
> 2. A Feature field in this report with the Brightness Usage ID (to
>     set the current brightness)
> 
> This driver has been developed and tested with the Apple Studio Display.
> Here is a small excerpt from the decoded HID descriptor showing the
> feature field for setting the brightness:
> 
>    Usage Page (Monitor VESA VCP),  ; Monitor VESA VPC (82h, monitor page)
>    Usage (10h, Brightness),
>    Logical Minimum (400),
>    Logical Maximum (60000),
>    Unit (Centimeter^-2 * Candela),
>    Unit Exponent (14),
>    Report Size (32),
>    Report Count (1),
>    Feature (Variable, Null State),
> 
> The full HID descriptor dump is available as a comment in the source
> code.
> 
> Signed-off-by: Julius Zint <julius@zint.sh>
> ---

[...]

> +static void hid_bl_remove(struct hid_device *hdev)
> +{
> +	struct backlight_device *bl;
> +	struct hid_bl_data *data;
> +
> +	hid_dbg(hdev, "remove\n");
> +	bl = hid_get_drvdata(hdev);
> +	data = bl_get_data(bl);
> +
> +	devm_backlight_device_unregister(&hdev->dev, bl);

Hi,

If this need to be called here, before the hid_() calls below, there 
seems to be no real point in using devm_backlight_device_register() / 
devm_backlight_device_unregister().

The non-devm_ version should be enough.

> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +	hid_set_drvdata(hdev, NULL);
> +	devm_kfree(&hdev->dev, data);

'data' is devm_kzalloc()'ed.
It is likely that this explicit devm_kfree() could be saved. It will be 
freed by the framework.

> +}

[...]

> +static int hid_bl_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	int ret;
> +	struct hid_field *input_field;
> +	struct hid_field *feature_field;
> +	struct hid_bl_data *data;
> +	struct backlight_properties props;
> +	struct backlight_device *bl;
> +
> +	hid_dbg(hdev, "probe\n");
> +
> +	ret = hid_parse(hdev);
> +	if (ret) {
> +		hid_err(hdev, "parse failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
> +	if (ret) {
> +		hid_err(hdev, "hw start failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	input_field = hid_get_usage_field(hdev, HID_INPUT_REPORT,
> +					  HID_USAGE_MONITOR_CTRL,
> +					  HID_USAGE_VESA_VCP_BRIGHTNESS);
> +	if (input_field == NULL) {
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	feature_field = hid_get_usage_field(hdev, HID_FEATURE_REPORT,
> +					    HID_USAGE_MONITOR_CTRL,
> +					    HID_USAGE_VESA_VCP_BRIGHTNESS);
> +	if (feature_field == NULL) {
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	if (input_field->logical_minimum != feature_field->logical_minimum) {
> +		hid_warn(hdev, "minimums do not match: %d / %d\n",
> +			 input_field->logical_minimum,
> +			 feature_field->logical_minimum);
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	if (input_field->logical_maximum != feature_field->logical_maximum) {
> +		hid_warn(hdev, "maximums do not match: %d / %d\n",
> +			 input_field->logical_maximum,
> +			 feature_field->logical_maximum);
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	hid_dbg(hdev, "Monitor VESA VCP with brightness control\n");
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		hid_err(hdev, "hw open failed: %d\n", ret);
> +		goto exit_stop;
> +	}
> +
> +	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (data == NULL) {
> +		ret = -ENOMEM;
> +		goto exit_stop;

exit_free?
in order to undo the hid_hw_open() just above.

> +	}
> +	data->hdev = hdev;
> +	data->min_brightness = input_field->logical_minimum;
> +	data->max_brightness = input_field->logical_maximum;
> +	data->input_field = input_field;
> +	data->feature_field = feature_field;
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = data->max_brightness - data->min_brightness;
> +
> +	bl = devm_backlight_device_register(&hdev->dev, "vesa_vcp",
> +					    &hdev->dev, data,
> +					    &hid_bl_ops,
> +					    &props);
> +	if (IS_ERR(bl)) {
> +		ret = PTR_ERR(bl);
> +		hid_err(hdev, "failed to register backlight: %d\n", ret);
> +		goto exit_free;
> +	}
> +
> +	hid_set_drvdata(hdev, bl);
> +
> +	return 0;
> +
> +exit_free:
> +	hid_hw_close(hdev);
> +	devm_kfree(&hdev->dev, data);

'data' is devm_kzalloc()'ed.
It is likely that this explicit devm_kfree() could be saved. It will be 
freed by the framework.

> +
> +exit_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}

[...]

