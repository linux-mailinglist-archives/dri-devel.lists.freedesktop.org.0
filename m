Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A597C7EE6BA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CAB10E65A;
	Thu, 16 Nov 2023 18:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEF010E65A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:29:35 +0000 (UTC)
Message-ID: <cc1bee15-f69f-4467-873d-c85cc09d60a0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700159373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Edk6FLzHTRuYYpwZ3fxzpEOntgKfq8bYriPXqiotyZI=;
 b=BbdP5LbJs917g+nVPVtTSfLgSHIgGpMCVOrjedB+PT0GgKJiSDIx0DGhDbT/Ah1BqC9wpM
 ZD4bC24s5vEy0uF0/fkgAkyHsJWdqIQJPalBJWY4DSRUIxxg4M0MluE/FHjBS/c3OJm26G
 6aAeBVSpaWnB12L7dQlA+6hK6pE7n0E=
Date: Fri, 17 Nov 2023 02:29:25 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 5/8] drm/bridge: it66121: Add a helper function to read
 chip id
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-6-sui.jingfeng@linux.dev>
 <CAA8EJprkDpjuHEi5R01p4XNvFBr94BvXhr7AZCLr6dC8Mk=yPw@mail.gmail.com>
 <7602cd83-0e05-4e11-9bd1-10eb1d48a507@linux.dev>
 <CAA8EJprFjdrQtegJd5HyzGYQaMawwQOhvkE=SNqsdsBCrtfDTA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJprFjdrQtegJd5HyzGYQaMawwQOhvkE=SNqsdsBCrtfDTA@mail.gmail.com>
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


On 2023/11/16 21:00, Dmitry Baryshkov wrote:
> On Thu, 16 Nov 2023 at 14:18, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> Hi,
>>
>>
>> On 2023/11/15 00:06, Dmitry Baryshkov wrote:
>>> On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>
>>>> Read the required chip id data back by calling regmap_bulk_read() once,
>>>> reduce the number of local variables needed in it66121_probe() function.
>>>> And store its values into struct it66121_ctx, as it will be used latter.
>>>>
>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>> ---
>>>>    drivers/gpu/drm/bridge/ite-it66121.c | 47 ++++++++++++++++++++--------
>>>>    1 file changed, 34 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
>>>> index 7e473beefc79..f36d05331f25 100644
>>>> --- a/drivers/gpu/drm/bridge/ite-it66121.c
>>>> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
>>>> @@ -313,6 +313,9 @@ struct it66121_ctx {
>>>>                   bool auto_cts;
>>>>           } audio;
>>>>           const struct it66121_chip_info *info;
>>>> +       u16 vender_id;
>>>> +       u16 device_id;
>>>> +       u8 revision;
>>> There is no need to store them, they are not used by the driver anywhere.
>>>
>>>>    };
>>>>
>>>>    static inline struct it66121_ctx *bridge_to_it66121(struct drm_bridge *bridge)
>>>> @@ -399,6 +402,30 @@ static void it66121_hw_reset(struct it66121_ctx *ctx)
>>>>           gpiod_set_value(ctx->gpio_reset, 0);
>>>>    }
>>>>
>>>> +static int it66121_read_chip_id(struct it66121_ctx *ctx, bool verbose)
>>>> +{
>>>> +       u8 id[4];
>>>> +       int ret;
>>>> +
>>>> +       ret = regmap_bulk_read(ctx->regmap, IT66121_VENDOR_ID0_REG, id, 4);
>>>> +       if (ret < 0) {
>>>> +               dev_err(ctx->dev, "Failed to read chip ID: %d\n", ret);
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       ctx->vender_id = (u16)id[1] << 8 | id[0];
>>>> +       ctx->device_id = ((u16)(id[3] & IT66121_DEVICE_ID1_MASK) << 8 | id[2]);
>>>> +       /* Revision is shared with DEVICE_ID1 */
>>>> +       ctx->revision = FIELD_GET(IT66121_REVISION_MASK, id[3]);
>>>> +
>>>> +       if (verbose) {
>>>> +               dev_info(ctx->dev, "Found ITE66121: 0x%x%x, revision: %u\n",
>>>> +                        ctx->vender_id, ctx->device_id, ctx->revision);
>>>> +       }
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>>    static inline int it66121_preamble_ddc(struct it66121_ctx *ctx)
>>>>    {
>>>>           return regmap_write(ctx->regmap, IT66121_MASTER_SEL_REG, IT66121_MASTER_SEL_HOST);
>>>> @@ -1561,7 +1588,6 @@ static const char * const it66121_supplies[] = {
>>>>
>>>>    static int it66121_probe(struct i2c_client *client)
>>>>    {
>>>> -       u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
>>>>           int ret;
>>>>           struct it66121_ctx *ctx;
>>>>           struct device *dev = &client->dev;
>>>> @@ -1603,19 +1629,13 @@ static int it66121_probe(struct i2c_client *client)
>>>>           if (IS_ERR(ctx->regmap))
>>>>                   return PTR_ERR(ctx->regmap);
>>>>
>>>> -       regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
>>>> -       regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
>>>> -       regmap_read(ctx->regmap, IT66121_DEVICE_ID0_REG, &device_ids[0]);
>>>> -       regmap_read(ctx->regmap, IT66121_DEVICE_ID1_REG, &device_ids[1]);
>>>> -
>>>> -       /* Revision is shared with DEVICE_ID1 */
>>>> -       revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
>>>> -       device_ids[1] &= IT66121_DEVICE_ID1_MASK;
>>>> +       ret = it66121_read_chip_id(ctx, false);
>>>> +       if (ret)
>>>> +               return ret;
>>>>
>>>> -       if ((vendor_ids[1] << 8 | vendor_ids[0]) != ctx->info->vid ||
>>>> -           (device_ids[1] << 8 | device_ids[0]) != ctx->info->pid) {
>>>> +       if (ctx->vender_id != ctx->info->vid ||
>>>> +           ctx->device_id != ctx->info->pid)
>> Q: There is no need to store them, they are not used by the driver anywhere.
>>
>> A: Here it is used, it is also used by the 0007-patch to get the entity(instance)-specific data.
> And the patch 7 will be changed once you have proper i2c client struct
> registered.
>
We will create a "wrong"i2c client intentionally by calling i2c_new_client_device, the "wrong" 
here means that 'board_info.type'  is not equal to "it66121" or "it6610".

I probably know what you means, but please note that we are not object you at here.
The reason why we prefer theit66121_get_match_data() over the i2c_get_match_data() is that our 
it66121_get_match_data()  works with *the least dependency*. Ourversion
don't rely on the DT to provide compatible strings. Because the it66121 itself already
provided constant hard-coded vender id and device id on-chip register. This is a bit
similar with the PCIe devices. This chip id speak everything about chip identify.
By re-arranging the variants into array, searching and matching against became
straight-forward. We can also utilize the vender id and device id information to
dynamic bind the instance specific functions *at the setup(probe) time*. Which helps
to untangle the it66121 and it6610 cases with function object. Currently they are
tangled. This is not a problem simply because the model supported is too small(less).


>>
>> Since it6610 was introduced, this is used for chip identifying.
>> It can also be used with in debugfs context, to show who I am.
> I'd say, there is little point in whoami debugfs files. Debugfs is for
> the useful information.
>
>>
>>>>                   return -ENODEV;
>>>> -       }
>>>>
>>>>           ctx->bridge.funcs = &it66121_bridge_funcs;
>>>>           ctx->bridge.of_node = dev->of_node;
>>>> @@ -1633,7 +1653,8 @@ static int it66121_probe(struct i2c_client *client)
>>>>
>>>>           drm_bridge_add(&ctx->bridge);
>>>>
>>>> -       dev_info(dev, "IT66121 revision %d probed\n", revision_id);
>>>> +       dev_info(dev, "IT66121 probed, chip id: 0x%x:0x%x, revision: %u\n",
>>>> +                ctx->vender_id, ctx->device_id, ctx->revision);
>>>>
>>>>           return 0;
>>>>    }
>>>> --
>>>> 2.34.1
>>>>
>
>
