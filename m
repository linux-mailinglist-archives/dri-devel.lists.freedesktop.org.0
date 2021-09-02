Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905903FE9DF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 09:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA2D6E461;
	Thu,  2 Sep 2021 07:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1810 seconds by postgrey-1.36 at gabe;
 Thu, 02 Sep 2021 06:19:15 UTC
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CDA6E453
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 06:19:15 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1mLg43-0002iY-Fn; Thu, 02 Sep 2021 06:19:11 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
 by jain.kot-begemot.co.uk with esmtps
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1mLg3x-00060b-Ah; Thu, 02 Sep 2021 07:19:07 +0100
Subject: Re: [PATCH] drm/ttm: provide default page protection for UML
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 linux-um@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210902020129.25952-1-rdunlap@infradead.org>
 <9faacbc8-3346-8033-5b4d-60543eae959e@cambridgegreys.com>
 <f978cae5-7275-6780-8a17-c6e61247bce7@infradead.org>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <0887903c-483d-49c7-0d35-f59be2f85bac@cambridgegreys.com>
Date: Thu, 2 Sep 2021 07:19:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f978cae5-7275-6780-8a17-c6e61247bce7@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailman-Approved-At: Thu, 02 Sep 2021 07:17:51 +0000
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

On 02/09/2021 06:52, Randy Dunlap wrote:
> On 9/1/21 10:48 PM, Anton Ivanov wrote:
>> On 02/09/2021 03:01, Randy Dunlap wrote:
>>> boot_cpu_data [struct cpuinfo_um (on UML)] does not have a struct
>>> member named 'x86', so provide a default page protection mode
>>> for CONFIG_UML.
>>>
>>> Mends this build error:
>>> ../drivers/gpu/drm/ttm/ttm_module.c: In function 
>>> ‘ttm_prot_from_caching’:
>>> ../drivers/gpu/drm/ttm/ttm_module.c:59:24: error: ‘struct cpuinfo_um’ 
>>> has no member named ‘x86’
>>>    else if (boot_cpu_data.x86 > 3)
>>>                          ^
>>>
>>> Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for 
>>> page-based iomem")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Huang Rui <ray.huang@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: Jeff Dike <jdike@addtoit.com>
>>> Cc: Richard Weinberger <richard@nod.at>
>>> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
>>> Cc: linux-um@lists.infradead.org
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_module.c |    4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> --- linux-next-20210901.orig/drivers/gpu/drm/ttm/ttm_module.c
>>> +++ linux-next-20210901/drivers/gpu/drm/ttm/ttm_module.c
>>> @@ -53,6 +53,9 @@ pgprot_t ttm_prot_from_caching(enum ttm_
>>>       if (caching == ttm_cached)
>>>           return tmp;
>>> +#ifdef CONFIG_UML
>>> +    tmp = pgprot_noncached(tmp);
>>> +#else
>>>   #if defined(__i386__) || defined(__x86_64__)
>>>       if (caching == ttm_write_combined)
>>>           tmp = pgprot_writecombine(tmp);
>>> @@ -69,6 +72,7 @@ pgprot_t ttm_prot_from_caching(enum ttm_
>>>   #if defined(__sparc__)
>>>       tmp = pgprot_noncached(tmp);
>>>   #endif
>>> +#endif
>>>       return tmp;
>>>   }
>>
>> Patch looks OK.
>>
>> I have a question though - why all of DRM is not !UML in config. Not 
>> like we can use them.
> 
> I have no idea about that.
> Hopefully one of the (other) UML maintainers can answer you.

Touche.

We will discuss that and possibly push a patch to !UML that part of the 
tree. IMHO it is not applicable.

A.

> 
> thanks.


-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/
