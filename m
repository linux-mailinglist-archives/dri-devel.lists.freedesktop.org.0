Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1168B9F7F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 19:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C945D10E41C;
	Thu,  2 May 2024 17:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="TY+1eBHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C1F10F6F2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 17:28:38 +0000 (UTC)
Message-ID: <1509ec3a-be84-42b0-a704-51c10482f406@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714670915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FwuBkMV1cz8K2OmSfCwl9zAuP6IPiKH3Gc8CY+nxQ0=;
 b=TY+1eBHJkEXh56ZoCWlox1HoT5FhPyibcX4FI3MzR74YRIO3GcOO00t1dB392XcrY+WRYa
 wk2y23ajiPmJoUFpky4rHqONw9IcNsHeNxVm/4uSsWJxi3zPBfE62WXfC70usU0CFUw96c
 hgNBa0j6JRJx8itTBOT2wzsJy706u2Q=
Date: Fri, 3 May 2024 01:28:26 +0800
MIME-Version: 1.0
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
To: neil.armstrong@linaro.org, Maxime Ripard <mripard@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
 <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
 <20240426-married-augmented-mantis-ff7edd@penduick>
 <509b3822-dcf6-45eb-9516-ba8ff2cc4382@linux.dev>
 <20240429-bouncy-attentive-vole-9964f1@houat>
 <795bec5d-c7ba-4fc2-9be9-78c4063743d9@linux.dev>
 <20240430-unnatural-steel-spaniel-dbacef@houat>
 <75a89efb-f653-4185-a451-ef496dffd804@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <75a89efb-f653-4185-a451-ef496dffd804@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/5/2 15:34, Neil Armstrong wrote:
> On 30/04/2024 11:34, Maxime Ripard wrote:
>> On Tue, Apr 30, 2024 at 12:54:39AM +0800, Sui Jingfeng wrote:
>>> On 2024/4/29 19:55, Maxime Ripard wrote:
>>>> On Sat, Apr 27, 2024 at 01:57:46PM +0800, Sui Jingfeng wrote:
>>>>> On 2024/4/26 14:23, Maxime Ripard wrote:
>>>>>> On Fri, Apr 26, 2024 at 04:43:18AM +0800, Sui Jingfeng wrote:
>>>>>>> On 2024/4/26 03:10, Andy Shevchenko wrote:
>>>>>>>> On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
>>>>>>>>> On 2024/4/25 22:26, Andy Shevchenko wrote:
>>>>>>>>>> It seems driver missed the point of proper use of device 
>>>>>>>>>> property APIs.
>>>>>>>>>> Correct this by updating headers and calls respectively.
>>>>>>>>> You are using the 'seems' here exactly saying that you are not 
>>>>>>>>> 100% sure.
>>>>>>>>>
>>>>>>>>> Please allow me to tell you the truth: This patch again has 
>>>>>>>>> ZERO effect.
>>>>>>>>> It fix nothing. And this patch is has the risks to be wrong.
>>>>>>>> Huh?! Really, stop commenting the stuff you do not understand.
>>>>>>> I'm actually a professional display drivers developer at the 
>>>>>>> downstream
>>>>>>> in the past, despite my contribution to upstream is less. But I 
>>>>>>> believe
>>>>>>> that all panel driver developers know what I'm talking about. So 
>>>>>>> please
>>>>>>> have take a look at my replies.
>>>>>> Most of the interactions you had in this series has been uncalled 
>>>>>> for.
>>>>>> You might be against a patch, but there's no need to go to such 
>>>>>> length.
>>>>>>
>>>>>> As far as I'm concerned, this patch is fine to me in itself, and 
>>>>>> I don't
>>>>>> see anything that would prevent us from merging it.
>>>>> No one is preventing you, as long as don't misunderstanding what 
>>>>> other
>>>>> people's technical replies intentionally. I'm just a usual and normal
>>>>> contributor, I hope the world will better than yesterday.
>>>> You should seriously consider your tone when replying then.
>>>>
>>>>> Saying such thing to me may not proper, I guess you may want to talk
>>>>> to peoples who has the push rights
>>>> I think you misunderstood me. My point was that your several rants 
>>>> were
>>>> uncalled for and aren't the kind of things we're doing here.
>>>>
>>>> I know very well how to get a patch merged, thanks.
>>>>
>>>>> just make sure it isn't a insult to the professionalism of drm bridge
>>>>> community itself though.
>>>> I'm not sure why you're bringing the bridge community or its
>>>> professionalism. It's a panel, not a bridge, and I never doubted the
>>>> professionalism of anyone.
>>>
>>>
>>> I means that the code itself could be adopted, as newer and younger
>>> programmer (like Andy) need to be encouraged to contribute.
>>
>> Andy has thousands of commits in Linux. He's *very* far from being a new
>> contributor.
>>
>>> I express no obvious objections, just hints him that something else
>>> probably should also be taken into consideration as well.
>>
>> That might be what you wanted to express, but you definitely didn't
>> express it that way.
>>
>>> On the other hand, we probably should allow other people participate
>>> in discussion so that it is sufficient discussed and ensure that it
>>> won't be reverted by someone in the future for some reasons. Backing
>>> to out case happens here, we may need to move things forward. 
>>> Therefore,
>>> it definitely deserve to have a try. It is not a big deal even though
>>> it gets reverted someday.
>>>
>>> In the end, I don't mind if you think there is nothing that could
>>> prevent you from merge it, but I still suggest you have a glance at
>>> peoples siting at the Cc list. I'm busy now and I have a lot of other
>>> tasks to do, and may not be able to reply you emails on time. So it up
>>> to you and other maintainers to decide.
>>> Thank you.
>>
>> So far, you're the only one who reviewed those patches. I'm not sure
>> what you're talking about here.
>
> Well I (as drm-panel maintainer) did review them positively


[...]


> because the patches looked perfectly correct in regards of the commit 
> message 

The point is the 'fixes' tag.

Then, can I ask what's the issue it fixes? I'm asking because I see the
submitting-patches.html [1] documentation told us that a fixes tag indicates
that the patch fixes an issue in a previous commit.

Previously, the driver only meant to be used on the DT systems, so what's issue?

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#reviewer-s-statement-of-oversight

I copy & paste the paragraph from link [1] for easier to read. See below:


"A Fixes: tag indicates that the patch fixes an issue in a previous commit. It
is used to make it easy to determine where a bug originated, which can help
review a bug fix. This tag also assists the stable kernel team in determining
which stable kernel versions should receive your fix. This is the preferred
method for indicating a bug fixed by the patch."

> and the patchset motivation and


OK, the motivation is good, I agree and I admit.


> because I trust Andy being a long time contributor with a lot of 
> expertise.
>

Does this means that you are going to merge patches from the experts without have a glance and
reject or ignore novice's patches unconditionally?

I'm asking because I see there still have a lot of other panel drivers use of_device_get_match_data()
function to get a match, and most of them has the 'OF' guard. However, in theory, panel should be
able to use on any CPU architecture if necessary. Does the remains has the similar issue? or Do we
need to fixed them together?


$ find . -name "*.c" -type f | xargs grep "of_device_get_match_data"

./panel-ilitek-ili9882t.c:    desc = of_device_get_match_data(&dsi->dev);
./panel-innolux-p079zca.c:    desc = of_device_get_match_data(&dsi->dev);
./panel-simple.c:    desc = of_device_get_match_data(&pdev->dev);
./panel-simple.c:    desc = of_device_get_match_data(&dsi->dev);
./panel-novatek-nt39016.c:    panel->panel_info = 
of_device_get_match_data(dev);
./panel-novatek-nt35950.c:    nt->desc = of_device_get_match_data(dev);
./panel-boe-himax8279d.c:    desc = of_device_get_match_data(&dsi->dev);
./panel-sitronix-st7703.c:    ctx->desc = of_device_get_match_data(dev);
./panel-sony-td4353-jdi.c:    ctx->type = 
(uintptr_t)of_device_get_match_data(dev);
./panel-samsung-sofef00.c:    ctx->mode = of_device_get_match_data(dev);
./panel-synaptics-r63353.c:    panel->pdata = (struct r63353_desc 
*)of_device_get_match_data(dev);
./panel-abt-y030xx067a.c:    priv->panel_info = 
of_device_get_match_data(dev);
./panel-ilitek-ili9881c.c:    ctx->desc = 
of_device_get_match_data(&dsi->dev);
./panel-newvision-nv3052c.c:    priv->panel_info = 
of_device_get_match_data(dev);
./panel-mantix-mlaf057we51.c:    ctx->default_mode = 
of_device_get_match_data(dev);
./panel-himax-hx8394.c:    ctx->desc = of_device_get_match_data(dev);
./panel-ilitek-ili9805.c:    ctx->desc = 
of_device_get_match_data(&dsi->dev);
./panel-boe-tv101wum-nl6.c:    desc = of_device_get_match_data(&dsi->dev);
./panel-samsung-s6d7aa0.c:    ctx->desc = of_device_get_match_data(dev);
./panel-novatek-nt36523.c:    pinfo->desc = of_device_get_match_data(dev);
./panel-novatek-nt35510.c:    nt->conf = of_device_get_match_data(dev);
./panel-newvision-nv3051d.c:    ctx->panel_info = 
of_device_get_match_data(dev);
./panel-khadas-ts050.c:    const void *data = 
of_device_get_match_data(&dsi->dev);
./panel-leadtek-ltk500hd1829.c:    ctx->panel_desc = 
of_device_get_match_data(dev);
./panel-truly-nt35597.c:    ctx->config = of_device_get_match_data(dev);
./panel-innolux-ej030na.c:    priv->panel_info = 
of_device_get_match_data(dev);
./panel-magnachip-d53e6ea8966.c:    db->panel_info = 
of_device_get_match_data(dev);
./panel-novatek-nt36672e.c:    ctx->desc = of_device_get_match_data(dev);
./panel-sitronix-st7701.c:    desc = of_device_get_match_data(&dsi->dev);
./panel-dsi-cm.c:    ddata->panel_data = of_device_get_match_data(dev);
./panel-novatek-nt36672a.c:    desc = of_device_get_match_data(&dsi->dev);
./panel-novatek-nt35560.c:    nt->conf = of_device_get_match_data(dev);
./panel-ilitek-ili9341.c:    ili->conf = of_device_get_match_data(dev);
./panel-jadard-jd9365da-h3.c:    desc = of_device_get_match_data(dev);
./panel-leadtek-ltk050h3146w.c:    ctx->panel_desc = 
of_device_get_match_data(dev);
./panel-ilitek-ili9322.c:    ili->conf = of_device_get_match_data(dev);
./panel-samsung-s6e3ha2.c:    ctx->desc = of_device_get_match_data(dev);


> Anyway since the rant is finished I'll land the patches.
>

It's just *comments* or *remarks*, there really no need to use the 'rant'
to insult and/or devalue other peoples, as it make no sense.


> Neil
>
>>
>> Maxime
>
-- 
Best regards,
Sui

