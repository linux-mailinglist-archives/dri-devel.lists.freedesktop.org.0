Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6824F8ADD70
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 08:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4251311312D;
	Tue, 23 Apr 2024 06:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="vocU1hcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A3411312D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 06:22:08 +0000 (UTC)
Message-ID: <ecbf2d04-f1e4-453d-b24c-f984c2fa1d1b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713853325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tvs8T44TPQ+aZe85ozLPkk1OZqgZ5bUavSfbQMGyH+o=;
 b=vocU1hcIndM/wqxveJm4cFavglkhOpuXm9yHhE3wBj7RYgF7UpLthNEnSHCGOq9Yljmjhk
 unX7WJUaUimwvQrH4YieB+zKr+LkLfmw6n6jxAZjb5nMHobVfPXLDQnOE4lroFooBooDow
 j6x1d08DbT7rgwx59efvckX4l927RN0=
Date: Tue, 23 Apr 2024 14:21:53 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/9] drm/bridge: Allow using fwnode API to get the next
 bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-2-sui.jingfeng@linux.dev>
 <xsfrnucued63q2amv7betkvgks6bhssubhjcryghkcloytixj4@ukmak4xwyjtg>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <xsfrnucued63q2amv7betkvgks6bhssubhjcryghkcloytixj4@ukmak4xwyjtg>
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


On 2024/4/23 03:51, Dmitry Baryshkov wrote:
> On Tue, Apr 23, 2024 at 03:18:55AM +0800, Sui Jingfeng wrote:
>> Currently, the various display bridge drivers rely on OF infrastructures
>> to works very well, yet there are platforms and/or devices absence of 'OF'
>> support. Such as virtual display drivers, USB display apapters and ACPI
>> based systems etc.
>>
>> Add fwnode based helpers to fill the niche, this allows part of the display
>> bridge drivers to work across systems. As the fwnode API has wider coverage
>> than DT counterpart and the fwnode graphs are compatible with the OF graph,
>> so the provided helpers can be used on all systems in theory. Assumed that
>> the system has valid fwnode graphs established before drm bridge drivers
>> are probed, and there has fwnode assigned to involved drm bridge instance.
>>
>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> ---
>>   drivers/gpu/drm/drm_bridge.c | 74 ++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_bridge.h     | 16 ++++++++
>>   2 files changed, 90 insertions(+)
>>
> [skipped]
>
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index 4baca0d9107b..a3f5d12a308c 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -26,6 +26,7 @@
>>   #include <linux/ctype.h>
>>   #include <linux/list.h>
>>   #include <linux/mutex.h>
>> +#include <linux/of.h>
>>   
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_encoder.h>
>> @@ -721,6 +722,8 @@ struct drm_bridge {
>>   	struct list_head chain_node;
>>   	/** @of_node: device node pointer to the bridge */
>>   	struct device_node *of_node;
>> +	/** @fwnode: fwnode pointer to the bridge */
>> +	struct fwnode_handle *fwnode;
> My comment is still the same: plese replace of_node with fwnode.

s/plese/please


Unless you can guarantee that *all* maintainers agree(welcome) with
the code changes involved by your proposal. Otherwise I'm going to
respect the domain specific maintainers to keep the code base as it
is.

I need the agreement of all other maintainers involved before I
could take any further action. I'm asking because I need to make sure
that such changes is what *everybody* wanted. As I have to respect
to respective maintainers(such as Daniel, Thomas, Maxime, Laurent
and all other maintainers of the drm miscellaneous).


>   It is more intrusive,

It is not only intrusive, but also annoying.

> however it will lower the possible confusion if the
> driver sets both of_node and fwnode.

The of_node and the fwnode can point to different thing, the potential
reason it the situation of them is not symmetrical.

  - On non-DT environment the of_node can point to NULL.
  - The reverse is also true, that is on DT environment the fwnode can also point to NULL
    if specific subsystem is not going to use it.
  - And USB display adapter can be using at any arch in theory, it can use both of them, or
    one of themm or neither of them.
  

This is a extremely flexible design, it's toward to future and also works with legacy.
So what's the confusion is?


> Also it will remove the necessity for helpers like drm_bridge_set_node().


Thedrm_bridge_set_node() is just a mimic to the device_set_node(), the 
struct device contains both of_node and fwnode as its data members.
I didn't see anyone complains about it, am I fail to understand something?


Or, let's put it straightforward, I'm going to follow your idea
if you could remove the of_node data member from the struct device.
Do you have the ability?


-- 
Best regards,
Sui

