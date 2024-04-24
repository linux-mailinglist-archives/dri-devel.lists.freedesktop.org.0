Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735458B1207
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 20:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D20B113D1A;
	Wed, 24 Apr 2024 18:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="LXGY0R4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFB1113D23
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 18:20:09 +0000 (UTC)
Message-ID: <66b0f579-1406-4f9f-97b5-7d21171610b8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713982806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66hZfsJzzaPzAu4YPowed7j50esceCBieSOQ5CkBk6Q=;
 b=LXGY0R4OQw1TJoHsEsVMLetaStGhGUWYVv5m/va0F+pVOenUX8l/CcNm4Bce5yQN+DOCug
 3FqeoS4iEkPELgv18RihZYGg1BZPIRb3dR9JxR2JAnNsKon8Bsag2m2nMifPnD2To0kKCh
 rYDAOpcsmS/aq0QX263XJgetenboGhc=
Date: Thu, 25 Apr 2024 02:19:51 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] software node: Implement device_get_match_data fwnode
 callback
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20240422164658.217037-1-sui.jingfeng@linux.dev>
 <Zie3ebHOEpWHj1qV@smile.fi.intel.com>
 <d5bc1e73-a553-451e-ab74-f5f0ca259c6b@linux.dev>
 <hcltp2bbxxg2t7ibmzgiib7mgbwgmvzwnnq6mochdh7c4h76r3@bxj6yk5zq64e>
 <ZikE4qOVO7rgIs9a@smile.fi.intel.com>
 <CAA8EJpr1FSjizAh6Dp5Bmux3NrGYh=BfHFL4D1fa87Og4ymY0w@mail.gmail.com>
 <Zikck2FJb4-PgXX0@smile.fi.intel.com>
 <kucey3jsydjye3ndflns3cqolcpizhnxgzz3fkmcatlnpbnwrk@22ulsqfh2vf6>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <kucey3jsydjye3ndflns3cqolcpizhnxgzz3fkmcatlnpbnwrk@22ulsqfh2vf6>
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


On 2024/4/25 00:34, Dmitry Baryshkov wrote:
> On Wed, Apr 24, 2024 at 05:52:03PM +0300, Andy Shevchenko wrote:
>> On Wed, Apr 24, 2024 at 04:34:39PM +0300, Dmitry Baryshkov wrote:
>>> On Wed, 24 Apr 2024 at 16:11, Andy Shevchenko
>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>> On Wed, Apr 24, 2024 at 12:37:16AM +0300, Dmitry Baryshkov wrote:
>>>>> On Wed, Apr 24, 2024 at 12:49:18AM +0800, Sui Jingfeng wrote:
>>>>>> On 2024/4/23 21:28, Andy Shevchenko wrote:
>>>>>>> On Tue, Apr 23, 2024 at 12:46:58AM +0800, Sui Jingfeng wrote:
>> ...
>>
>>>>> But let me throw an argument why this patch (or something similar) looks
>>>>> to be necessary.
>>>>>
>>>>> Both on DT and non-DT systems the kernel allows using the non-OF based
>>>>> matching. For the platform devices there is platform_device_id-based
>>>>> matching.
>>>>>
>>>>> Currently handling the data coming from such device_ids requires using
>>>>> special bits of code, e.g. platform_get_device_id(pdev)->driver_data to
>>>>> get the data from the platform_device_id. Having such codepaths goes
>>>>> against the goal of unifying DT and non-DT paths via generic property /
>>>>> fwnode code.
>>>>>
>>>>> As such, I support Sui's idea of being able to use device_get_match_data
>>>>> for non-DT, non-ACPI platform devices.
>>>> I'm not sure I buy this. We have a special helpers based on the bus type to
>>>> combine device_get_match_data() with the respective ID table crawling, see
>>>> the SPI and I²C cases as the examples.
>>> I was thinking that we might be able to deprecate these helpers and
>>> always use device_get_match_data().
>> True, but that is orthogonal to swnode match_data support, right?
>> There even was (still is?) a patch series to do something like a new
>> member to struct device_driver (? don't remember) to achieve that.
> Maybe the scenario was not properly described in the commit message,

No thecommit message is very clear, just you don't clear. Can't you see that 
only you are out of scope here and complaining with wrong hypothesis?

> or
> maybe I missed something.


No, you miss and mess everything.

> The usecase that I understood from the commit
> message was to use instatiated i2c / spi devices, which means
> i2c_device_id / spi_device_id.

It can also be platform device with manually assigned software node.

> The commit message should describe why
> the usecase requires using 'compatible' property and swnode. Ideally it
> should describe how these devices are instantiated at the first place.
>
Yes, I admit it, its not the first time you do such a thing.  I know you might
good at debating and directing blindly. But those skills are not really helpful.
As it brings ZERO benefits to the developers and end user of Linux kernel. What
the end user need is a good DRM driver and infrastructure like i915, amdgpu,
radeon, vc4, ast, X server or wayland etc.

Its fine to keep quite if you don't understand something very well, especially,
the for the things that not directly maintained by you. As you don't have to
responsible for it and you don't need to pay for the obligation. You might
deceive yourself to believe that you are reviewing, actually, you are just
wasting your time as well as other people's time.
  
If the the commit message is really matters to you, then do you thing about
the following series [1][2][3] ?

[1] https://patchwork.freedesktop.org/series/123812/
[2] https://patchwork.freedesktop.org/patch/579730/?series=130021&rev=2
[3] https://patchwork.freedesktop.org/series/123737/

How about the witting of its commit message, very well, right?
Think before you type, and type with the brain not with the emotion.

-- 
Best regards,
Sui

