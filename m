Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3691B7F57C7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 06:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB90910E6CA;
	Thu, 23 Nov 2023 05:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::b7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E6B10E6CA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 05:25:14 +0000 (UTC)
Message-ID: <1ea7e68d-7005-4f5b-92df-d2f7c56a49b2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700717112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBhhyWhQXe9PftzJalTPt0fVqtNHiuvkFXOR/3zACow=;
 b=v1OiRbRtIea2CS+rg0tQ8ZJe2jyQq1v/LYeS5X9Jgy0QI6ugTyq7ZKJKJESGLNEr9M6JgN
 M/hwo3PVyNczEDfcX2vI97cj5qmwITffUuN+O04o4Yej3sAOZdQJdgHnp7kH9kHRsMFWiK
 M8TW5pTzDnx2C2wOPkydAEOmSPwpoxg=
Date: Thu, 23 Nov 2023 13:25:06 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 4/8] drm/bridge: it66121: Add a helper function to get the
 next bridge
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-5-sui.jingfeng@linux.dev>
 <CAA8EJpp0HY=PsCVFk4S3OERNUcin73c5w6ihnoY6aFg83+NhkA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJpp0HY=PsCVFk4S3OERNUcin73c5w6ihnoY6aFg83+NhkA@mail.gmail.com>
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


On 2023/11/15 00:05, Dmitry Baryshkov wrote:
> On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> Group the code lines(which with the same functional) into one dedicated
>> function, which reduce the weight of it66121_probe() function. Just trivial
>> cleanuo, no functional change.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/bridge/ite-it66121.c | 53 ++++++++++++++++++----------
>>   1 file changed, 34 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
>> index 0f78737adc83..7e473beefc79 100644
>> --- a/drivers/gpu/drm/bridge/ite-it66121.c
>> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
>> @@ -340,6 +340,37 @@ static int it66121_of_read_bus_width(struct device *dev, u32 *bus_width)
>>          return 0;
>>   }
>>
>> +static int it66121_of_get_next_bridge(struct device *dev,
>> +                                     struct drm_bridge **next_bridge)
> it already exists and it is called drm_of_find_panel_or_bridge(),
> could you please use it instead?

That function is too fat and tangled, and should be untangled.
it66121 can not connect with a panel, this is a prior knowledge
and is known at compile time. So this prior knowledge shouldn't
be dropped.

>> +{
>> +       struct device_node *np;
>> +       struct drm_bridge *bridge;
>> +
>> +       np = of_graph_get_remote_node(dev->of_node, 1, -1);
>> +       if (!np) {
>> +               dev_err(dev, "The endpoint is unconnected\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (!of_device_is_available(np)) {
>> +               of_node_put(np);
>> +               dev_err(dev, "The remote device is disabled\n");
>> +               return -ENODEV;
>> +       }
>> +
>> +       bridge = of_drm_find_bridge(np);
>> +       of_node_put(np);
>> +
>> +       if (!bridge) {
>> +               dev_dbg(dev, "Next bridge not found, deferring probe\n");
>> +               return -EPROBE_DEFER;
>> +       }
>> +
>> +       *next_bridge = bridge;
>> +
>> +       return 0;
>> +}
>> +
>>   static const struct regmap_range_cfg it66121_regmap_banks[] = {
>>          {
>>                  .name = "it66121",
>> @@ -1531,7 +1562,6 @@ static const char * const it66121_supplies[] = {
>>   static int it66121_probe(struct i2c_client *client)
>>   {
>>          u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
>> -       struct device_node *ep;
>>          int ret;
>>          struct it66121_ctx *ctx;
>>          struct device *dev = &client->dev;
>> @@ -1553,24 +1583,9 @@ static int it66121_probe(struct i2c_client *client)
>>          if (ret)
>>                  return ret;
>>
>> -       ep = of_graph_get_remote_node(dev->of_node, 1, -1);
>> -       if (!ep) {
>> -               dev_err(dev, "The endpoint is unconnected\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       if (!of_device_is_available(ep)) {
>> -               of_node_put(ep);
>> -               dev_err(dev, "The remote device is disabled\n");
>> -               return -ENODEV;
>> -       }
>> -
>> -       ctx->next_bridge = of_drm_find_bridge(ep);
>> -       of_node_put(ep);
>> -       if (!ctx->next_bridge) {
>> -               dev_dbg(dev, "Next bridge not found, deferring probe\n");
>> -               return -EPROBE_DEFER;
>> -       }
>> +       ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
>> +       if (ret)
>> +               return ret;
>>
>>          i2c_set_clientdata(client, ctx);
>>          mutex_init(&ctx->lock);
>> --
>> 2.34.1
>>
>
