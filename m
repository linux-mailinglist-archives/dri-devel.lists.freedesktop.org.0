Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D947EDF78
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA8F10E265;
	Thu, 16 Nov 2023 11:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD0210E051
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:18:27 +0000 (UTC)
Message-ID: <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700133505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3ky3IGmo059i8LI1Q9gFHB3PczZNsekFc8ype32aes=;
 b=ezvDvGaKms6UgbUFpQmlbuvdMdUzp45i41zsw5O9HfSyJGV4UMBDg6zyNYu3EsRLSwbG2o
 k4e+Affx2Sfqf3pA06ntjqVEDRIwfKEot2KYZC15r0Du2dZAb8lgoQ/etG0aEye1YplH/u
 TC41cbtffix+gvgv2yWgFUBgqOHmZ4s=
Date: Thu, 16 Nov 2023 19:18:18 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/11/15 00:30, Dmitry Baryshkov wrote:
>> +
>> +               ctx->connector = connector;
>> +       }
>>
>>          if (ctx->info->id == ID_IT66121) {
>>                  ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>> @@ -1632,16 +1651,13 @@ static const char * const it66121_supplies[] = {
>>          "vcn33", "vcn18", "vrf12"
>>   };
>>
>> -static int it66121_probe(struct i2c_client *client)
>> +int it66121_create_bridge(struct i2c_client *client, bool of_support,
>> +                         bool hpd_support, bool audio_support,
>> +                         struct drm_bridge **bridge)
>>   {
>> +       struct device *dev = &client->dev;
>>          int ret;
>>          struct it66121_ctx *ctx;
>> -       struct device *dev = &client->dev;
>> -
>> -       if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>> -               dev_err(dev, "I2C check functionality failed.\n");
>> -               return -ENXIO;
>> -       }
>>
>>          ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>          if (!ctx)
>> @@ -1649,24 +1665,19 @@ static int it66121_probe(struct i2c_client *client)
>>
>>          ctx->dev = dev;
>>          ctx->client = client;
>> -       ctx->info = i2c_get_match_data(client);
>> -
>> -       ret = it66121_of_read_bus_width(dev, &ctx->bus_width);
>> -       if (ret)
>> -               return ret;
>> -
>> -       ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
>> -       if (ret)
>> -               return ret;
>> -
>> -       i2c_set_clientdata(client, ctx);
>>          mutex_init(&ctx->lock);
>>
>> -       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it66121_supplies),
>> -                                            it66121_supplies);
>> -       if (ret) {
>> -               dev_err(dev, "Failed to enable power supplies\n");
>> -               return ret;
>> +       if (of_support) {
>> +               ret = it66121_of_read_bus_width(dev, &ctx->bus_width);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
>> +               if (ret)
>> +                       return ret;
>> +       } else {
>> +               ctx->bus_width = 24;
>> +               ctx->next_bridge = NULL;
>>          }
> A better alternative would be to turn OF calls into fwnode calls and
> to populate the fwnode properties. See
> drivers/platform/x86/intel/chtwc_int33fe.c for example.


Honestly, I don't want to leave any scratch(breadcrumbs).
I'm worries about that turn OF calls into fwnode calls will leave something unwanted.

Because I am not sure if fwnode calls will make sense in the DT world, while my patch
*still* be useful in the DT world. Because the newly introduced it66121_create_bridge()
function is a core. I think It's better leave this task to a more advance programmer.
if there have use case. It can be introduced at a latter time, probably parallel with
the DT.

I think DT and/or ACPI is best for integrated devices, but it66121 display bridges is
a i2c slave device. Personally, I think slave device shouldn't be standalone. I'm more
prefer to turn this driver to support hot-plug, even remove the device on the run time
freely when detach and allow reattach. Like the I2C EEPROM device in the monitor (which
contains the EDID, with I2C slave address 0x50). The I2C EEPROM device *also* don't has
a corresponding struct device representation in linux kernel.

so I still think It is best to make this drivers functional as a static lib, but I want
to hear you to say more. Why it would be a *better* alternative to turn OF calls into
fwnode calls? what are the potential benefits?



