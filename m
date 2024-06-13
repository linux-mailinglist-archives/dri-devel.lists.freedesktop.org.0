Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4C99061A1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 04:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9284210E1F9;
	Thu, 13 Jun 2024 02:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="R/5W0fr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE09A10E1F9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:12:25 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ebed33cb67so4510831fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718244743; x=1718849543;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WeEnxDJr0RmVkW9Hz4xW1YRBVjqtjlaYDHSsAnCAAa8=;
 b=R/5W0fr5X/zT0T6VBXMJUcLE/CtmIIe6ewFSzDtphlR9WVlZrJYQ3xxDlJQyNhMEnK
 dUVjJm8bSqZafnYzHFHuId9NLWuaNK1+K5j7ddN5IR8mBDx/UF3PVo2QexAoAepCnsHw
 OH6py81hKgi62bw/KPXUlPWPGmWtLry69SI676mT/t1fiyAef5uOQMAhnz4tiGaUFJQ+
 /vH/p2glgWSrJIcM2qTAfBdmuxLarhMTQGMw/vYAbZs1brlXuM/evAeoR1km0AUwsJoT
 CklI/WEuRhYAZHHtM6BpXNPGcPpSNf46qToyvoEel8tmpBtHtmR7fRObPVruxkY3KdKt
 c8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718244743; x=1718849543;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WeEnxDJr0RmVkW9Hz4xW1YRBVjqtjlaYDHSsAnCAAa8=;
 b=kmbsOa8Z35rYxgqmzZtAVK5u4GlRrTcdF+/8orWvCSQUemsLlmM8JvG8X3059rxLQV
 BJu2XauXI9VeJoW/REaaUeC9UTC9Vg/XetfBM23qWw/ugiPBmzhiQXqxf/r9pBrrx4Qe
 +3J/ICzcgTWVu4D29rd1y1tXFNlDWlyCooxjNdGj+5yh0lsK9JdNlXAwtuDUJhfiylJT
 8PpbQ2QqRcP8pQrHfPe3xVGYyXfuEBgkml0W9cqiNfU8KZOQjNbydGlllqvOH0RRJOup
 ylogw9VFow3wFlibZ5av6tzFhhH9s8yWbi10MjWFhLtTFOXKZZ9eoFJiu7CTibTYCAFo
 i92g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxNyRbYMBuyAbNxHMlRvHgrdWvjl//gnF5/hCWN/Q4rLjqxJyPEVS+GrdNIT9XRFGkUF77lC8pzQuMYfyW4Mf+XEa35NCXfj5cvgvD/9F3
X-Gm-Message-State: AOJu0YxMmLPh5YWaclKIvkO+wcEiQq+gI/7077TORinkDs8sLC6OSeeU
 Ep014WaNTwJymuM3WWwUZFh1EdH/eAAg8P66BqwmOyM9sFn8UOoDXNI7rHOvmF0=
X-Google-Smtp-Source: AGHT+IGDlMcquXTaNhYSYyyHTOnzPNi2Pwq1nCjKGgVxDkJDLKAmNftxPtcIzkyndO/tiz2Uz+ZBlg==
X-Received: by 2002:a05:651c:1989:b0:2ea:e3b4:d509 with SMTP id
 38308e7fff4ca-2ebfc8ab322mr25069131fa.6.1718244743092; 
 Wed, 12 Jun 2024 19:12:23 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:4005:4e7a:f4d9:7f14?
 ([2a01:e34:ec24:52e0:4005:4e7a:f4d9:7f14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870e9193sm43075425e9.21.2024.06.12.19.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:12:22 -0700 (PDT)
Message-ID: <57959aeb-20c2-4283-b316-c4ae5397177c@freebox.fr>
Date: Thu, 13 Jun 2024 04:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: simple-bridge: Add support for TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr>
 <ddd5joylbkovcdogfwhvzaepd3d6wxsnccgvpq2x3h6fmpo2hk@2sitzl6bjt7d>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <ddd5joylbkovcdogfwhvzaepd3d6wxsnccgvpq2x3h6fmpo2hk@2sitzl6bjt7d>
Content-Type: text/plain; charset=UTF-8
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

On 28/05/2024 03:13, Dmitry Baryshkov wrote:

> Bindings please. Also, note that per the datasheet the bridge uses two
> supplies, Vcc for 3.3V and Vdd for 1.1V, so it doesn't fully fit the
> simple-bridge.c (which might need to be adjusted for the second supply).
> Chapter 7.3.2 of the datasheet points out that Vcc should be brought up
> before Vdd.

Is something simple like below acceptable?


// SPDX-License-Identifier: GPL-2.0-only
/*
 * Copyright 2024 Freebox SAS
 */

#include <drm/drm_bridge.h>
#include <linux/i2c.h>
#include <linux/module.h>
#include <linux/delay.h>

struct tdp158 {
	struct i2c_client *client;
	struct gpio_desc *OE; // Operation Enable
	struct drm_bridge bridge;
};

static int tdp158_probe(struct i2c_client *client)
{
	struct device *dev = &client->dev;
	struct tdp158 *tdp158;
	int err;

	tdp158 = devm_kzalloc(dev, sizeof(*tdp158), GFP_KERNEL);
	if (!tdp158)
		return -ENOMEM;

	tdp158->client = client;
	i2c_set_clientdata(client, tdp158);

	err = devm_regulator_get_enable(dev, "Vcc"); // 3.3V
	msleep(100);
	if (err)
		return dev_err_probe(dev, err, "Vcc");

	err = devm_regulator_get_enable(dev, "Vdd"); // 1.1V
	msleep(100);
	if (err)
		return dev_err_probe(dev, err, "Vdd");

	tdp158->OE = devm_gpiod_get(dev, "OE", GPIOD_OUT_LOW);
	if (IS_ERR(tdp158->OE))
		return dev_err_probe(dev, PTR_ERR(tdp158->OE), "OE pin");

	gpiod_set_value_cansleep(tdp158->OE, 1);

	tdp158->bridge.of_node = dev->of_node;

	return devm_drm_bridge_add(dev, &tdp158->bridge);
}

static const struct of_device_id tdp158_match_table[] = {
	{ .compatible = "ti,tdp158" },
	{ }
};
MODULE_DEVICE_TABLE(of, tdp158_match_table);

static struct i2c_driver tdp158_driver = {
	.probe = tdp158_probe,
	.driver = {
		.name = "tdp158",
		.of_match_table = tdp158_match_table,
	},
};

module_i2c_driver(tdp158_driver);

MODULE_DESCRIPTION("TI TDP158 driver");
MODULE_LICENSE("GPL");

