Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE33FE8E9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 07:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C116E433;
	Thu,  2 Sep 2021 05:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DAF6E433
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 05:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=sgTKkkf0r5JkALe/VjT0WHHTHP9n5mBqeJ9Npmgcuv4=; b=MLlUF6k3yfZe7Seqrk0nmq1ebQ
 7MKnmI74GYUYiJwDRbEvs+DOf+c8G3ju1YMiyS3Zb36jHnQTWweDjwdl8lP6s8pMeR6o6pPd/aUB4
 IwlBDRUs1THpDhfzl0jWgd4Zt09bEwdOAwRkDwZmz6x9pvQFsvJ9JUzS4wcb664pSawFPttsq/aay
 BbZIgiGvGr04mM8WI665QYkzqGjcHpJEma270Fk6tNUP662ky1B1B8YgNA+43US81kxFhzoNzOjDF
 eReZrg725pdovNt9V1mm2JyuNeZAW/7yYkrPj1d+JGK4mmpImWhPPBDazFO7hpnMnTPpQENOxDoi/
 gOeckJKw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfeS-008agS-38; Thu, 02 Sep 2021 05:52:40 +0000
Subject: Re: [PATCH] drm/ttm: provide default page protection for UML
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 linux-um@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210902020129.25952-1-rdunlap@infradead.org>
 <9faacbc8-3346-8033-5b4d-60543eae959e@cambridgegreys.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f978cae5-7275-6780-8a17-c6e61247bce7@infradead.org>
Date: Wed, 1 Sep 2021 22:52:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9faacbc8-3346-8033-5b4d-60543eae959e@cambridgegreys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 9/1/21 10:48 PM, Anton Ivanov wrote:
> On 02/09/2021 03:01, Randy Dunlap wrote:
>> boot_cpu_data [struct cpuinfo_um (on UML)] does not have a struct
>> member named 'x86', so provide a default page protection mode
>> for CONFIG_UML.
>>
>> Mends this build error:
>> ../drivers/gpu/drm/ttm/ttm_module.c: In function ‘ttm_prot_from_caching’:
>> ../drivers/gpu/drm/ttm/ttm_module.c:59:24: error: ‘struct cpuinfo_um’ has no member named ‘x86’
>>    else if (boot_cpu_data.x86 > 3)
>>                          ^
>>
>> Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Huang Rui <ray.huang@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: Jeff Dike <jdike@addtoit.com>
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
>> Cc: linux-um@lists.infradead.org
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> ---
>>   drivers/gpu/drm/ttm/ttm_module.c |    4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> --- linux-next-20210901.orig/drivers/gpu/drm/ttm/ttm_module.c
>> +++ linux-next-20210901/drivers/gpu/drm/ttm/ttm_module.c
>> @@ -53,6 +53,9 @@ pgprot_t ttm_prot_from_caching(enum ttm_
>>       if (caching == ttm_cached)
>>           return tmp;
>> +#ifdef CONFIG_UML
>> +    tmp = pgprot_noncached(tmp);
>> +#else
>>   #if defined(__i386__) || defined(__x86_64__)
>>       if (caching == ttm_write_combined)
>>           tmp = pgprot_writecombine(tmp);
>> @@ -69,6 +72,7 @@ pgprot_t ttm_prot_from_caching(enum ttm_
>>   #if defined(__sparc__)
>>       tmp = pgprot_noncached(tmp);
>>   #endif
>> +#endif
>>       return tmp;
>>   }
> 
> Patch looks OK.
> 
> I have a question though - why all of DRM is not !UML in config. Not like we can use them.

I have no idea about that.
Hopefully one of the (other) UML maintainers can answer you.

thanks.
-- 
~Randy

