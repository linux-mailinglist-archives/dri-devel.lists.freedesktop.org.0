Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A71F8817CA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 20:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1CC10E057;
	Wed, 20 Mar 2024 19:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="nWJh5EdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F69B10E057
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 19:22:19 +0000 (UTC)
Message-ID: <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710962535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sLgrJY1ZHs50/OMosMO/w2/lI0zobbFbhfe2FQeSiw=;
 b=nWJh5EdR/NoeKbO6ajZVjvEdcrTpbnjzliR8Vg196YIG+UjS7Qjc4OZ7PidoKBChgAHQMo
 EeJhjVQv30LZq8FySDzflVzZEwmatx5h71eEX4JQkM+vFk5naj9XT9KJhrUJwWrphTiRPk
 KO7KxKja8+lBqyKn/Nx+A/HTKxw3OSY=
Date: Thu, 21 Mar 2024 03:22:05 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] software node: Implement device_get_match_data fwnode
 callback
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20240318234222.1278882-1-sui.jingfeng@linux.dev>
 <Zfq85f-Dp1S3CKuG@smile.fi.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <Zfq85f-Dp1S3CKuG@smile.fi.intel.com>
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


On 2024/3/20 18:39, Andy Shevchenko wrote:
> +Cc: Vladimir
>
> On Tue, Mar 19, 2024 at 07:42:22AM +0800, Sui Jingfeng wrote:
>> This makes it possible to support (and/or test) a few drivers that
>> originates from DT World on the x86-64 platform. Originally, those
>> drivers using the of_device_get_match_data() function to get match
>> data. For example, drivers/gpu/drm/bridge/simple-bridge.c and
>> drivers/gpu/drm/bridge/display-connector.c. Those drivers works very
>> well in the DT world, however, there is no counterpart to
>> of_device_get_match_data() when porting them to the x86 platform,
>> because x86 CPUs lack DT support.
> This is not true.
>
> First of all, there is counter part that called device_get_match_data().

Are you means that the acpi_fwnode_device_get_match_data() implementation?
As the fwnode API framework has three backend: OF, ACPI, and software node.
If you are hinting me that the acpi backend has the .device_get_match_data
implemented. Then you are right.


> Second, there *is* DT support for the _selected_ x86 based platforms.

Yeah, you maybe right again here. I guess you means that some special
hardware or platform may have a *limited* support?

Can you pointed it out for study of learning purpose?

To speak precisely, there are some drm display bridges drivers are
lack of the DT support on X86. Those display bridges belong to the
device drivers catalogs.

OK, I will update my commit message at the next version if possible,
and try my best to describe the problem precisely.

>> By replacing it with device_get_match_data() and creating a software
>> graph that mimics the OF graph, everything else works fine, except that
>> there isn't an out-of-box replacement for the of_device_get_match_data()
>> function. Because the software node backend of the fwnode framework lacks
>> an implementation for the device_get_match_data callback.
> .device_get_match_data
>
>> Implement device_get_match_data fwnode callback fwnode callback to fill
> .device_get_match_data


OK, thanks a lot.

>> this gap. Device drivers or platform setup codes are expected to provide
>> a "compatible" string property. The value of this string property is used
>> to match against the compatible entries in the of_device_id table. Which
>> is consistent with the original usage style.
> Why do you need to implement the graph in the board file?

It can be inside the chip, there is no clear cut.  I means that
the graph(including fwnode graph, OF graph or swnode graph) can
be used at anywhere. The examples given here may lead you to
think it is board specific, but it is not limited to board specific.

fwnode graph, OF graph and swnode graph, all of them are implements
of the graph. Its common that different hardware vendors bought the
some IP and has been integrated it into their SoC. So it can be inside
of the chip if you want *code sharing*.


Back to the patch itself, we want to keep the three backends aligned as 
much as possible. Is this reasonable enough?

> ...
>
> Have you seen this discussion?
> https://lore.kernel.org/lkml/20230223203713.hcse3mkbq3m6sogb@skbuf/
>

I really didn't have seen that thread before this patch is sent,
I'm a graphic developer, I'm mainly focus on graphics domain.

Previously, I have implemented similar functionality at the drivers
layer [1][2]. But as the instances grows,  I realized there is a
risk to introducing *boilerplate*.  So I send this patch. [1][2] can
be drop if this patch could be merged.

[1] https://patchwork.freedesktop.org/patch/575414/?series=129040&rev=1

[2] https://patchwork.freedesktop.org/patch/575411/?series=129040&rev=1


After a brief skim,  I guess we encounter similar problems. Oops!
In a nutshell, there is a need to *emulation* on X86 platform,
to suit the need of device-driver coding style of DT world.

Besides, at the swnode backend layer, we should not call
fwnode_property_read_string(), instead, we should usethe property_entry_read_string_array() function. Because the 
fwnode_property_read_string() is belong to upper layer.
While backend implementations should call functions from
bottom layer only.


-- 
Best regards,
Sui

