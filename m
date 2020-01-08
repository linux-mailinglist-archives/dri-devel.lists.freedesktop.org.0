Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE718135FDA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA5F6E94C;
	Thu,  9 Jan 2020 17:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3244A6E2D7;
 Wed,  8 Jan 2020 13:59:30 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CDE15511EA4AE1C5E960;
 Wed,  8 Jan 2020 21:59:23 +0800 (CST)
Received: from [127.0.0.1] (10.177.131.64) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 8 Jan 2020
 21:59:19 +0800
Subject: Re: [PATCH next] drm/i915/gtt: add missing include file asm/smp.h
To: Jani Nikula <jani.nikula@linux.intel.com>, <airlied@linux.ie>,
 <chris@chris-wilson.co.uk>
References: <20200108133610.92714-1-chenzhou10@huawei.com>
 <877e22qczw.fsf@intel.com>
From: Chen Zhou <chenzhou10@huawei.com>
Message-ID: <6081a507-c11a-749e-df6a-c59649ee5d65@huawei.com>
Date: Wed, 8 Jan 2020 21:59:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <877e22qczw.fsf@intel.com>
X-Originating-IP: [10.177.131.64]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/1/8 21:44, Jani Nikula wrote:
> On Wed, 08 Jan 2020, Chen Zhou <chenzhou10@huawei.com> wrote:
>> Fix build error:
>> lib/crypto/chacha.c: In function chacha_permute:
>> lib/crypto/chacha.c:65:1: warning: the frame size of 3384 bytes is larger than 2048 bytes [-Wframe-larger-than=]
>>  }
>>   ^
> 
> IMO this needs a better explanation of why not having the include leads
> to the above failure.
> 
> BR,
> Jani.
> 

Sorry, i made a mistake. The error is as follows:

drivers/gpu/drm/i915/gt/intel_ggtt.c: In function ggtt_restore_mappings:
drivers/gpu/drm/i915/gt/intel_ggtt.c:1239:3: error: implicit declaration of function wbinvd_on_all_cpus; did you mean wrmsr_on_cpus? [-Werror=implicit-function-declaration]
   wbinvd_on_all_cpus();
   ^~~~~~~~~~~~~~~~~~
   wrmsr_on_cpus


Thanks,
Chen Zhou

>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 1a2b5dc..9ef8ed8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -6,6 +6,7 @@
>>  #include <linux/stop_machine.h>
>>  
>>  #include <asm/set_memory.h>
>> +#include <asm/smp.h>
>>  
>>  #include "intel_gt.h"
>>  #include "i915_drv.h"
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
