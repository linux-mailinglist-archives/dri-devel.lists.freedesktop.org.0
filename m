Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415EA58D708
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AA0CDB89;
	Tue,  9 Aug 2022 10:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m11885.qiye.163.com (mail-m11885.qiye.163.com
 [115.236.118.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E145BCDB44
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 10:02:33 +0000 (UTC)
Received: from [192.168.111.100] (unknown [58.22.7.114])
 by mail-m11885.qiye.163.com (Hmail) with ESMTPA id B6C864C0A76;
 Tue,  9 Aug 2022 18:02:28 +0800 (CST)
Message-ID: <6b3e82f9-6902-fd5c-c67d-e2c42c995133@rock-chips.com>
Date: Tue, 9 Aug 2022 18:02:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.1
Subject: Re: [Linaro-mm-sig] Re: [PATCH v2] drm/gem: Fix GEM handle release
 errors
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220803083237.3701-1-jeffy.chen@rock-chips.com>
 <c7cb225b-7f21-8d9a-773b-efc655e6332c@amd.com>
 <7cd16264-fa84-7b50-f3ed-64f7f22dcef2@rock-chips.com>
 <64bf4e4b-4e22-0ff0-5f92-76f603c04ec0@amd.com>
 <cd806954-e94e-aec8-2b0c-4047da9a92ec@rock-chips.com>
 <0e284f57-e03c-f128-f6e7-52a58edbcd54@amd.com>
 <71e47fe6-440b-e9ea-cd66-8362c41428ca@amd.com>
From: Chen Jeffy <jeffy.chen@rock-chips.com>
In-Reply-To: <71e47fe6-440b-e9ea-cd66-8362c41428ca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhlMVh5LS0tMTE4dHU8ZSVUTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDI6KRw5Aj0wPy0WDDoQFBgz
 DUkKFDVVSlVKTU1LS0hCSE9CT01KVTMWGhIXVREeHR0CVRgTHhU7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPTkJINwY+
X-HM-Tid: 0a82820e436a2eb9kusnb6c864c0a76
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 8/9 星期二 17:08, Christian König wrote:
> Hi Jeffy,
> 
> Am 09.08.22 um 09:55 schrieb Christian König:
>> [SNIP]
>>>>
>>>>>
>>>>>
>>>>> So we are allowing GEM object to have multiple handles, and GEM 
>>>>> object could have at most one dma-buf, doesn't that means that 
>>>>> dma-buf could map to multiple handles?
>>>>
>>>> No, at least not for the same GEM file private. That's the reason 
>>>> why the rb is indexed by the dma_buf object and not the handle.
>>>>
>>>> In other words the rb is so that you have exactly one handle for 
>>>> each dma_buf in each file private.
>>>
>>> I don't think so, because if user get multiple handles for the same 
>>> GEM obj and use drm_gem_prime_handle_to_fd() for those handles
>>
>> Mhm, that works? This is illegal and should have been prevented somehow.
> 
> At least I see the problem now. I'm just not sure how to fix it.
> 
> Your v2 patch indeed prevents leakage of the drm_prime_member for the 
> additional handles, but those shouldn't have been added in the first place.
> 
> The issue is that with this we make it unpredictable which handle is 
> returned. E.g. if we have handle 2,5,7 it can be that because of 
> re-balancing the tree sometimes 2 and sometimes 5 is returned.

Maybe cache the latest returned handle in the obj(after 
drm_gem_prime_fd_to_handle), and clear it when that handle been deleted 
in drm_gem_handle_delete()?

Something like:
drm_gem_prime_fd_to_handle
   handle = drm_prime_lookup_buf_handle(buf)
   obj = obj_from_handle(handle)
   if !obj->primary_handle
     obj->primary_handle = handle
   return obj->primary_handle

Or maybe limit GEM obj with a single lifetime handle?

> 
> That's not really a good idea and breaks a couple of assumptions as far 
> as I know.
> 
> Ideas?
> 
> Thanks,
> Christian.
> 

