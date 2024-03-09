Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA33D877019
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 10:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7D010FD28;
	Sat,  9 Mar 2024 09:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="uSUNaqL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796B110FD28
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 09:33:29 +0000 (UTC)
Message-ID: <7535b3ba-6bbb-411c-82a4-cd4ac45de1a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1709976806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ku3/mf8syFhzDXGsMD87IO9efzaJJWCG+R1Xp/7u4qU=;
 b=uSUNaqL3Dlk9kk3cXy6TMM/nULPd1TJgzG+cX6gxCONOyfWCOJHRxukYxDymxZFe3aagoX
 PQ7pWtD1aYYqxzefhTs9hr78HhHSfHZWX7VNTp+EgEGqfYgpMpicIpZqSkOUdAhA75xI1B
 V0g5+hntGUtW2BbeGz+r4LdOIrCMLRs=
Date: Sat, 9 Mar 2024 17:33:01 +0800
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
 <45f59f31-1f03-4a96-adb6-25c7cdd5e8a1@linux.dev>
 <CAA8EJpqq1-cEke6wEFZFDnpz4tFBcL6HF3=Qtf-8Q3WbogLS8A@mail.gmail.com>
 <c84fcdba-af50-4212-a8e3-f492c2b02ce4@linux.dev>
 <CAA8EJppTcPO3j7GpGcGbKPUjQ=3rTMMOrU1SYR3mtkWLztf2qQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJppTcPO3j7GpGcGbKPUjQ=3rTMMOrU1SYR3mtkWLztf2qQ@mail.gmail.com>
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


On 2024/3/8 04:40, Dmitry Baryshkov wrote:
>>> But really, there is nothing so hard about it:
>>> - Change of_node to fw_node, apply an automatic patch changing this in
>>> bridge drivers.
>>> - Make drm_of_bridge functions convert passed of_node and comp
>>>
>>> After this we can start cleaning up bridge drivers to use fw_node API
>>> natively as you did in your patches 2-4.
>> Yes, it's not so hard. But I'm a little busy due to other downstream developing
>> tasks. Sorry, very sorry!
>>
>> During the talk with you, I observed that you are very good at fwnode domain.
>> Are you willing to help the community to do something? For example, currently
>> the modern drm bridge framework is corrupted by legacy implement, is it possible
>> for us to migrate them to modern? Instead of rotting there? such as the lontium-lt9611uxc.c
>> which create a drm connector manually, not modernized yet and it's DT dependent.
>> So, there are a lot things to do.
> Actually, lontium-lt9611uxc.c does both of that 😉 It supports
> creating a connector and it as well supports attaching to a chain
> without creating a connector. Pretty nice, isn't it?


But why the drm_bridge_connector helpers and/or the drm_connector bridge can't suit you need?
Coding this way just add boilerplate into drm bridge subsystem, right?


The code path of "creating a connector" plus the code path of "not creating a connector"
forms a 'side-by-side' implementation imo.

Besides, I have repeated many times: the DT already speak everything.
Device drivers can completely know if there is a display connector OF device created and how many
display bridges in the whole chain. If there are connector device node in the DT, then it should
has a device driver bound to it(instead of create it manually) for a perfect implementation. As
you told me we should not *over play* the device-driver model, right?

