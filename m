Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948F887210
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 18:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6312A11267F;
	Fri, 22 Mar 2024 17:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rdAfQ0go";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC6111267F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 17:44:30 +0000 (UTC)
Message-ID: <6bf102a4-6419-4083-8918-4f7c76cfa9a1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711129466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PY6nVDHCq/qSJ+48AqHLnmlfMZvsVTkfL11T5Qo/EVw=;
 b=rdAfQ0gooNC/k3rqjlvMmwCWwDtK1V49qy4f604/A0namyb/dAp/yFJCe0+poPSCccTox+
 9Jm70vgPxKW0mBDWU1z8Lvh+pxA1pZxqkj2G1swJQnwrUKpCOXsbm+0LwwOFrptfv0MKNk
 xd6ie8z+iPIO2qs3y3YTNk1ttx2SwTs=
Date: Sat, 23 Mar 2024 01:43:56 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] software node: Implement device_get_match_data fwnode
 callback
Content-Language: en-US
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
 <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
 <ZftG6Q5AaG71dhWq@smile.fi.intel.com>
 <9644da91-f367-4083-a3e4-4d0677c8cbca@linux.dev>
 <Zf2uUwcMgIpo6rVh@smile.fi.intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <Zf2uUwcMgIpo6rVh@smile.fi.intel.com>
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


On 2024/3/23 00:14, Andy Shevchenko wrote:
> On Fri, Mar 22, 2024 at 05:00:05PM +0800, Sui Jingfeng wrote:
>> On 2024/3/21 04:28, Andy Shevchenko wrote:
> ...
>
>>>>>> By replacing it with device_get_match_data() and creating a software
>>>>>> graph that mimics the OF graph, everything else works fine, except that
>>>>>> there isn't an out-of-box replacement for the of_device_get_match_data()
>>>>>> function. Because the software node backend of the fwnode framework lacks
>>>>>> an implementation for the device_get_match_data callback.
>>>>> .device_get_match_data
>>>>>
>>>>>> Implement device_get_match_data fwnode callback fwnode callback to fill
>>>>> .device_get_match_data
>>>> OK, thanks a lot.
>>>>
>>>>>> this gap. Device drivers or platform setup codes are expected to provide
>>>>>> a "compatible" string property. The value of this string property is used
>>>>>> to match against the compatible entries in the of_device_id table. Which
>>>>>> is consistent with the original usage style.
>>>>> Why do you need to implement the graph in the board file?
>>>> It can be inside the chip, there is no clear cut.\
>>> Which chip? Flash memory / ROM or you meant something like FPGA here?
>>> For the latter there is another discussion on how to use DT overlays
>>> in ACPI-enabled environments for the FPGA configurations.
>> There are some hardware resource or software entity is created on the
>> driver runtime. But DT or DT overlays are compiled before device driver
>> get loaded. GPIO-emulated-I2C is just an example, this is kind of driver
>> level knowledge on the runtime. With the GPIO or programmable some
>> hardware IP unit, device driver authors can change the connection relationship
>> at their will at the runtime. While with DT, every thing has to be sure
>> before the compile time.
>>
>> DT overlays can be a alternative solution, but this doesn't conflict with
>> this patch. This patch won't assume how device drives go to use it, and
>> allow device driver creating device instead enumerating by DT. In one
>> word: "flexibility".
> Software nodes in general for the device driver / platform quirks.

The real problem is that we probably shouldn't make an assumption
how does the user is going to use the infrastructure, right?

You could say it is *mostly* for quirks or whatever, Like the
./drivers/i2c/busses/i2c-cht-wc.c. But software nodes *can* also
be something else.


Can we stop restricting its usage by limited understanding or someone personal judgement?

A workaround or quirk may be enough for some corner usage. Vladimir is also encounter similar problem, right?


> They are not designed for what you are talking about here.


I have never hint anything about any real applications, the materials
and/or talk given here is just for example purpose.

What we are doing here is to keep the three back-ends aligned.



> Consider using SSDT / DT overlays instead.
>
NAK,

When developers are doing task 'A' , reviewers ask them to do task 'B'.
And when developers doing task 'B', reviewers then recommend that the tool
'C'  is a better alternative.
...
...

This is not good.


As I have read the lengthy thread in link [1] as you pointed to me.

The boring coding review is just as the following scheme:

1) Asking details about what they do with software nodes impolitely.
2) Wasting time to talk about irreverent things by brute force.
3) Tell everybody that software nodes are not designed for what you application.
4) Recommending DT overlays or something else.

Again, this is non-technical discussion, the time being wasting is not worthwhile.
And the judgements being given is irrelevant to the *patch itself*.

[1] https://lore.kernel.org/lkml/20230223203713.hcse3mkbq3m6sogb@skbuf/

-- 
Best regards,
Sui

