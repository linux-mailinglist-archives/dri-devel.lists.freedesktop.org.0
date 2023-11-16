Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 198767EDD68
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A7110E028;
	Thu, 16 Nov 2023 09:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::b4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DDD10E028
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:14:46 +0000 (UTC)
Message-ID: <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700126084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jn5rgSrBrjLK6PAHO0z0ZZeNgL8lxDK10ve4wgaryM0=;
 b=E7ZuYFtvP0qBAkY4U9B3dNXM3Sdhb//ifqKkr+pcslLqmkVt9Tsa36T2oIjo8EcBG9NUhB
 2J9EB1uAr4ZQrIrhm71b3o8H75VrTIXLzFQVcmxgJKpLArFh9MZRW012X4UHUGPkuIokQH
 qdRJGDplLP2BsWCx+JRhbvaD8+T5LKE=
Date: Thu, 16 Nov 2023 17:14:34 +0800
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

Thanks a lot for reviewing!


On 2023/11/15 00:30, Dmitry Baryshkov wrote:
> On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> The it66121_create_bridge() and it66121_destroy_bridge() are added to
>> export the core functionalities. Create a connector manually by using
>> bridge connector helpers when link as a lib.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/bridge/ite-it66121.c | 134 +++++++++++++++++++--------
>>   include/drm/bridge/ite-it66121.h     |  17 ++++
>>   2 files changed, 113 insertions(+), 38 deletions(-)
>>   create mode 100644 include/drm/bridge/ite-it66121.h
>>
>> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
>> index 8971414a2a60..f5968b679c5d 100644
>> --- a/drivers/gpu/drm/bridge/ite-it66121.c
>> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
>> @@ -22,6 +22,7 @@
>>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>   #include <drm/drm_edid.h>
>>   #include <drm/drm_modes.h>
>>   #include <drm/drm_print.h>
>> @@ -703,14 +704,32 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
>>                                   enum drm_bridge_attach_flags flags)
>>   {
>>          struct it66121_ctx *ctx = bridge_to_it66121(bridge);
>> +       struct drm_bridge *next_bridge = ctx->next_bridge;
>> +       struct drm_encoder *encoder = bridge->encoder;
>>          int ret;
>>
>> -       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
>> -               return -EINVAL;
>> +       if (next_bridge) {
>> +               if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>> +                       WARN_ON(1);
> Why? At least use WARN() instead

Originally I want to




>> +                       flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
>> +               }
>> +               ret = drm_bridge_attach(encoder, next_bridge, bridge, flags);
>> +               if (ret)
>> +                       return ret;
>> +       } else {
>> +               struct drm_connector *connector;
>>
>> -       ret = drm_bridge_attach(bridge->encoder, ctx->next_bridge, bridge, flags);
>> -       if (ret)
>> -               return ret;
>> +               if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>> +                       WARN_ON(1);
> No. It is perfectly fine to create attach a bridge with no next_bridge
> and with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>

The document say when DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is set
the bridge shall not create a drm_connector. So I think if a display
bridge driver don't have a next bridge attached (Currently, this is
told by the DT), it says that this is a non-DT environment. On such
a case, this display bridge driver(it66121.ko) should behavior like
a *agent*. Because the upstream port of it66121 is the DVO port of
the display controller, the downstream port of it66121 is the HDMI
connector. it66121 is on the middle. So I think the it66121.ko should
handle all of troubles on behalf of the display controller drivers.

Therefore (when in non-DT use case), the display controller drivers
side should not set DRM_BRIDGE_ATTACH_NO_CONNECTOR flag anymore.
Which is to hint that the it66121 should totally in charge of those
tasks (either by using bridge connector helper or create a connector
manually). I don't understand on such a case, why bother display
controller drivers anymore.


>> +
>> +               connector = drm_bridge_connector_init(bridge->dev, encoder);
>> +               if (IS_ERR(connector))
>> +                       return PTR_ERR(connector);
>> +
>> +               drm_connector_attach_encoder(connector, encoder);
> This goes into your device driver.
>
>> +
>> +               ctx->connector = connector;
>> +       }
>>
>>          if (ctx->info->id == ID_IT66121) {
>>                  ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>> @@ -1632,16 +1651,13 @@ static const char * const it66121_supplies[] = {
>>          "vcn33", "vcn18", "vrf12"
>>   };
>
