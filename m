Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF08B9E86
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4FA11209C;
	Thu,  2 May 2024 16:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="wqzXVd5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D5511209C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 16:25:49 +0000 (UTC)
Message-ID: <e1d01191-fd96-4b17-b223-7147eb427315@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714667146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AN8xdb1IOqM8B6dtORjftXrgW+S1XF62ODJxIj/2mvU=;
 b=wqzXVd5DEvBRvixSMLLlWTtSgq/brVCrTYO0CwcEoU1bIfI4P/0GTCj0EvcN++fFrUIftl
 7BAWTBPa26LKnCFIkhmGZyYO6y6gRYlRJn60Tvdh57bRd5BfuKMYoAisAQiTmzmB9CHYs5
 DWXBOs7fmzOqAPxiIFY5X8IPZVFl5+M=
Date: Fri, 3 May 2024 00:25:17 +0800
MIME-Version: 1.0
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ce6a480d-80b3-46b0-a32d-26bc6480d02f@linux.dev>
 <ZiqrLfezhns4UycR@smile.fi.intel.com>
 <b5ffd984-4031-4a8a-adbc-75a1e1dfe765@linux.dev>
 <ZjD8eoO3TmuCUj-a@smile.fi.intel.com>
 <9e69b129-7539-4403-a621-bf3775aab995@linux.dev>
 <ZjNPiBvLF3WcBftn@smile.fi.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ZjNPiBvLF3WcBftn@smile.fi.intel.com>
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


On 2024/5/2 16:32, Andy Shevchenko wrote:
> On Wed, May 01, 2024 at 12:27:14AM +0800, Sui Jingfeng wrote:
>> On 2024/4/30 22:13, Andy Shevchenko wrote:
>>> On Fri, Apr 26, 2024 at 05:13:43AM +0800, Sui Jingfeng wrote:
> ...
>
>>> the former might be subdivided to "is it swnode backed or real fwnode one?"
>>>
>> Yeah,
>> On non-DT cases, it can be subdivided to swnode backed case and ACPI fwnode backed case.
>>
>>   - For swnode backed case: the device_get_match_data() don't has a implemented backend.
>>   - For ACPI fwnode backed case: the device_get_match_data() has a implemented backend.
>>
>> But the driver has *neither* software node support
> True.
>
>> nor ACPI support,
> Not true.

Why this is not true? Are you means that the panel-ilitek-ili9341 driver has ACPI support?
I'm asking because I don't see struct acpi_device_id related stuff in that source file,
am I miss something?


> So, slow down and take your time to get into the code and understand how it works.
>
>> so that the rotation property can not get and ili9341_dpi_probe() will fails.
>> So in total, this is not a 100% correct use of device property APIs.
>>
>> But I'm fine that if you want to leave(ignore) those less frequent use cases temporarily,
>> there may have programmers want to post patches, to complete the missing in the future.
>>
>> So, there do have some gains on non-DT cases.
>>
>>   - As you make it be able to compiled on X86 with the drm-misc-defconfig.
>>   - You cleanup the code up (at least patch 2 in this series is no obvious problem).
>>   - You allow people to modprobe it, and maybe half right and half undefined.
>>
>> But you do helps moving something forward, so congratulations for the wake up.

-- 
Best regards,
Sui

