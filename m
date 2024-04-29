Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9608B5F6B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 18:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC7D10E7B3;
	Mon, 29 Apr 2024 16:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="A62KNs5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B55310E821
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 16:54:52 +0000 (UTC)
Message-ID: <795bec5d-c7ba-4fc2-9be9-78c4063743d9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714409690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZcRLqCKZ99s9BPl9IWgxkXzMSNJVxZZp+zfZTMxHbQ=;
 b=A62KNs5XmNHHpyGS9t1N4WYIPaZ86jsZuc3vSXflNzOpYnPNWpmOvsosZCSNYzCK1jkxzh
 l4BZM4M7+e83rU7xsVteYzX5EmYPHe48Pq2f2cfIWbKZudpo6UG/1x4MF0sfR2YtzCxXUO
 HMk014Gl8vOJMxcvR8o6OO5ag+0WDOs=
Date: Tue, 30 Apr 2024 00:54:39 +0800
MIME-Version: 1.0
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
To: Maxime Ripard <mripard@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240429-bouncy-attentive-vole-9964f1@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/4/29 19:55, Maxime Ripard wrote:
> On Sat, Apr 27, 2024 at 01:57:46PM +0800, Sui Jingfeng wrote:
>> Hi,
>>
>>
>> On 2024/4/26 14:23, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Fri, Apr 26, 2024 at 04:43:18AM +0800, Sui Jingfeng wrote:
>>>> On 2024/4/26 03:10, Andy Shevchenko wrote:
>>>>> On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
>>>>>> On 2024/4/25 22:26, Andy Shevchenko wrote:
>>>>>>> It seems driver missed the point of proper use of device property APIs.
>>>>>>> Correct this by updating headers and calls respectively.
>>>>>> You are using the 'seems' here exactly saying that you are not 100% sure.
>>>>>>
>>>>>> Please allow me to tell you the truth: This patch again has ZERO effect.
>>>>>> It fix nothing. And this patch is has the risks to be wrong.
>>>>> Huh?! Really, stop commenting the stuff you do not understand.
>>>> I'm actually a professional display drivers developer at the downstream
>>>> in the past, despite my contribution to upstream is less. But I believe
>>>> that all panel driver developers know what I'm talking about. So please
>>>> have take a look at my replies.
>>> Most of the interactions you had in this series has been uncalled for.
>>> You might be against a patch, but there's no need to go to such length.
>>>
>>> As far as I'm concerned, this patch is fine to me in itself, and I don't
>>> see anything that would prevent us from merging it.
>> No one is preventing you, as long as don't misunderstanding what other
>> people's technical replies intentionally. I'm just a usual and normal
>> contributor, I hope the world will better than yesterday.
> You should seriously consider your tone when replying then.
>
>> Saying such thing to me may not proper, I guess you may want to talk
>> to peoples who has the push rights
> I think you misunderstood me. My point was that your several rants were
> uncalled for and aren't the kind of things we're doing here.
>
> I know very well how to get a patch merged, thanks.
>
>> just make sure it isn't a insult to the professionalism of drm bridge
>> community itself though.
> I'm not sure why you're bringing the bridge community or its
> professionalism. It's a panel, not a bridge, and I never doubted the
> professionalism of anyone.


I means that the code itself could be adopted, as newer and younger
programmer (like Andy) need to be encouraged to contribute. I express
no obvious objections, just hints him that something else probably
should also be taken into consideration as well.

On the other hand, we probably should allow other people participate
in discussion so that it is sufficient discussed and ensure that it
won't be reverted by someone in the future for some reasons. Backing
to out case happens here, we may need to move things forward. Therefore,
it definitely deserve to have a try. It is not a big deal even though
it gets reverted someday.

In the end, I don't mind if you think there is nothing that could
prevent you from merge it, but I still suggest you have a glance at
peoples siting at the Cc list. I'm busy now and I have a lot of other
tasks to do, and may not be able to reply you emails on time. So it up
to you and other maintainers to decide.
  
Thank you.

> Maxime

-- 
Best regards,
Sui

