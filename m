Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2FED0A890
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 15:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2696210E12A;
	Fri,  9 Jan 2026 14:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="VWCv/clu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1304 seconds by postgrey-1.36 at gabe;
 Fri, 09 Jan 2026 14:03:14 UTC
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk
 [188.40.203.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA6310E12A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Reply-To; bh=A/80kF8GWUS/DtbnUxr7PN3/rX4dMds1BGbjqDNuhLw=; b=VWCv/cludNpBulMt
 fg1H3VhU6ZWc5nbEzMiqjCNUGR3b3ulDWlCzGzSU1auoHjv/3taQcd0EolFfqAfmeZtPg1UTU5wgM
 5+An26V8LDfM+jew3yRSrm4ItTNhxRyYdSvf+unH7LfKYYb/UChdO37Z5+/plXPC6iJiKesTzermz
 eqUMxptPDeA8m/903LISeR/LW2UUxZaher4XgH3g0hAYKHBVtyaKxPFO3wXeypdN0aQkgn+zMf3JD
 WX6zDpNRioNSSsfefwHUPhr7cT7SGiJ+i0hFUmwWUR5RRA4mgLAEBFDZs3qwlQhbVy+PScywIPn+A
 fzXAiycIlYkXnKQIAw==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1veCjy-00BxeA-4s; Fri, 09 Jan 2026 13:41:22 +0000
Message-ID: <f2f2d79b-fcbc-4785-83db-b2a0dc3436a8@codethink.co.uk>
Date: Fri, 9 Jan 2026 13:41:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: fix missing 'host1x_context_device_bus_type'
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: simona@ffwll.ch, airlied@gmail.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com
References: <20260109124507.403728-1-ben.dooks@codethink.co.uk>
 <48679d960d98c3134e5a3fcc6c6238c66f0b61af@intel.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <48679d960d98c3134e5a3fcc6c6238c66f0b61af@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 09/01/2026 12:52, Jani Nikula wrote:
> On Fri, 09 Jan 2026, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>> The drivers/gpu/host1x/context_bus.c does not include
>> any declaration of host1x_context_device_bus_type, and
>> after including "context.h" it also showed that there
>> are two definitons in the kernel, so fix those two
>>
>> Change context.h to include the correct definiton of
>> host1x_context_device_bus_type by including
>> <linux/host1x_context_bus.h> in context.h
>>
>> Fixes the following sparse warning:
>> drivers/gpu/host1x/context_bus.c:9:23: warning: symbol 'host1x_context_device_bus_type' was not declared. Should it be static?
>>
>> Fixes: 3d70eb8e60c6d009c988 ("gpu: host1x: Make host1x_context_device_bus_type constant")
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   drivers/gpu/host1x/context.h     | 3 +--
>>   drivers/gpu/host1x/context_bus.c | 2 ++
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
>> index 3e03bc1d3bac..5215922905ed 100644
>> --- a/drivers/gpu/host1x/context.h
>> +++ b/drivers/gpu/host1x/context.h
>> @@ -10,11 +10,10 @@
>>   
>>   #include <linux/mutex.h>
>>   #include <linux/refcount.h>
>> +#include <linux/host1x_context_bus.h>
>>   
>>   struct host1x;
>>   
>> -extern struct bus_type host1x_context_device_bus_type;
>> -
>>   struct host1x_memory_context_list {
>>   	struct mutex lock;
>>   	struct host1x_memory_context *devs;
>> diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
>> index 7cd0e1a5edd1..89f61b1f7d33 100644
>> --- a/drivers/gpu/host1x/context_bus.c
>> +++ b/drivers/gpu/host1x/context_bus.c
>> @@ -6,6 +6,8 @@
>>   #include <linux/device.h>
>>   #include <linux/of.h>
>>   
>> +#include "context.h"
> 
> Shouldn't this and context.c just include <linux/host1x_context_bus.h>?
> context_bus.c doesn't need anything from context.h, and context.h
> doesn't really need <linux/host1x_context_bus.h> either.

Possibly, removing the defn from context.h and doing that would work.

> BR,
> Jani.
> 
>> +
>>   const struct bus_type host1x_context_device_bus_type = {
>>   	.name = "host1x-context",
>>   };
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
