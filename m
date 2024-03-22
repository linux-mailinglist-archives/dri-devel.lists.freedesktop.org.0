Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE528868B5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 10:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E124410E83D;
	Fri, 22 Mar 2024 09:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="TvFyWswn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9A610E83D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:00:19 +0000 (UTC)
Message-ID: <9644da91-f367-4083-a3e4-4d0677c8cbca@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711098017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkGU8SEVxsquTva3VrVV1kZXNieUSV+Fr4bifOxZdIU=;
 b=TvFyWswnkmmZsZqyOV+fEQaWYgqlnQI40uVAj5T15qroJN4DfwvDXA/3Jj81M/TCL804O7
 6mh+5NJGfCvwNXBmoZpJa7LENLT3Sm1ZaZbI3uXlr63TEoIiCDw/1rk7UfS3z+wZt4KTXy
 wRp9ebHr8zCTLOGaOP1tv98GEThSIbA=
Date: Fri, 22 Mar 2024 17:00:05 +0800
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
 <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
 <ZftG6Q5AaG71dhWq@smile.fi.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ZftG6Q5AaG71dhWq@smile.fi.intel.com>
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


On 2024/3/21 04:28, Andy Shevchenko wrote:
>>>> By replacing it with device_get_match_data() and creating a software
>>>> graph that mimics the OF graph, everything else works fine, except that
>>>> there isn't an out-of-box replacement for the of_device_get_match_data()
>>>> function. Because the software node backend of the fwnode framework lacks
>>>> an implementation for the device_get_match_data callback.
>>> .device_get_match_data
>>>
>>>> Implement device_get_match_data fwnode callback fwnode callback to fill
>>> .device_get_match_data
>> OK, thanks a lot.
>>
>>>> this gap. Device drivers or platform setup codes are expected to provide
>>>> a "compatible" string property. The value of this string property is used
>>>> to match against the compatible entries in the of_device_id table. Which
>>>> is consistent with the original usage style.
>>> Why do you need to implement the graph in the board file?
>> It can be inside the chip, there is no clear cut.\
> Which chip? Flash memory / ROM or you meant something like FPGA here?
> For the latter there is another discussion on how to use DT overlays
> in ACPI-enabled environments for the FPGA configurations.


There are some hardware resource or software entity is created on the
driver runtime. But DT or DT overlays are compiled before device driver
get loaded. GPIO-emulated-I2C is just an example, this is kind of driver
level knowledge on the runtime. With the GPIO or programmable some
hardware IP unit, device driver authors can change the connection relationship
at their will at the runtime. While with DT, every thing has to be sure
before the compile time.

DT overlays can be a alternative solution, but this doesn't conflict with
this patch. This patch won't assume how device drives go to use it, and
allow device driver creating device instead enumerating by DT. In one
word: "flexibility".



-- 
Best regards,
Sui

