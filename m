Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F968756F7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 20:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFE210EF41;
	Thu,  7 Mar 2024 19:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="fLR491Ky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC8710FE1E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 19:20:24 +0000 (UTC)
Message-ID: <45f59f31-1f03-4a96-adb6-25c7cdd5e8a1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1709839221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnFnbqDeKPmVvi03N+VBYRVISwQV8TV/BYHIxfxeVJo=;
 b=fLR491KyRBd+vuj8QblEQG+I3EUMqpmzX4/kZPi2b4kFpWdfqOZPkLeLkSFaHXbbxDR2av
 hMmBeUV/mrETplF47OVMIQLbBa+PcklOjWcl0Vm8FU0TmRLCuTaogLLkIOyM8qgIrw2PB3
 SUkHxI+kqGAdhh7nm8CaTKrYZ9mrVA8=
Date: Fri, 8 Mar 2024 03:20:07 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] drm/bridge: Add fwnode based helpers to get the
 next bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
 <20240307172334.1753343-2-sui.jingfeng@linux.dev>
 <CAA8EJpp8tsHi0RhsJXG+r6nOsV3AUC_n6jNHL0Cr6Ku2h3NMog@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJpp8tsHi0RhsJXG+r6nOsV3AUC_n6jNHL0Cr6Ku2h3NMog@mail.gmail.com>
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


On 2024/3/8 02:43, Dmitry Baryshkov wrote:
>> +
>>   MODULE_AUTHOR("Ajay Kumar<ajaykumar.rs@samsung.com>");
>>   MODULE_DESCRIPTION("DRM bridge infrastructure");
>>   MODULE_LICENSE("GPL and additional rights");
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index 3606e1a7f965..d4c95afdd662 100644
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
>>          struct list_head chain_node;
>>          /** @of_node: device node pointer to the bridge */
>>          struct device_node *of_node;
> In my opinion, if you are adding fwnode, we can drop of_node
> completely. There is no need to keep both of them.


But the 'struct device' have both of them contained, we should *follow the core*, right?
They are two major firmware subsystems (DT and ACPT), both are great and large, right?
Personally, I think the drm_bridge should embeds 'struct device', after all, drm bridge
are mainly stand for display bridges device. And also to reflect what you said: "to
reflect the hardware perfectly" and remove some boilerplate.

I think I'm not good enough to do such a big refactor, sorry. I believe that Maxime
and Laurent are the advanced programmers who is good enough to do such things, maybe
you can ask them for help?

Beside this, other reviews are acceptable and will be fixed at the next version,
thanks a lot for review.


Best Regards,
Sui

