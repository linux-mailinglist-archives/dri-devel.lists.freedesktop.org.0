Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4173E734F3D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 11:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB9D10E1CA;
	Mon, 19 Jun 2023 09:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B0E10E1C6;
 Mon, 19 Jun 2023 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687165920; x=1718701920;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=XlJtRLxJS+pnRJUHddiRBMiJzl1tgKQnykUH5eJThvE=;
 b=jT4kB5CTsOQNxX2o4BBJPn138noegG4fMrz6/t4BI63dO4lZ0lZzYUtZ
 fhK+ZkVl1MhDUmweMrijCYPf94qZMON4rmwyX3ZSLEy2U9Yfm53Q3R176
 /Nqd6JmV5i32Qr+/Qk683ZCSLjg8/JTVbf8U53l5FUuzjNZtFWSkOsPHY
 vTVLzI1ljKZi9ldAT0nPHAmTVQOpvUt+MxETIcBjdIZHX+VB2dMRlPIA3
 fMLuPFM/ZZi0xqZVde3H8Z3Zbh5HquR4u6DNXD6mdGQbZYS1VGzSq7M8c
 pYhDJwAZB8pozkwNPNQeC7SiCtjnw3HCXkF6oh8ko7inaQJJe6gsvw4s4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="423247771"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="423247771"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 02:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="691030609"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="691030609"
Received: from acarew-mobl.ger.corp.intel.com (HELO [10.213.214.207])
 ([10.213.214.207])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 02:11:55 -0700
Message-ID: <cd1c813f-3bb3-1b05-9f33-03dcfd934bea@linux.intel.com>
Date: Mon, 19 Jun 2023 10:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915: make i915_drm_client_fdinfo() reference
 conditional again
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>
References: <20230616093158.3568480-1-arnd@kernel.org>
 <ZIw2kdx9+DCmUZUV@ashyti-mobl2.lan>
 <ef849277-10ef-90db-fd6c-3646599e32ba@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ef849277-10ef-90db-fd6c-3646599e32ba@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/06/2023 12:17, Tvrtko Ursulin wrote:
> 
> On 16/06/2023 11:16, Andi Shyti wrote:
>> Hi Arnd,
>>
>> On Fri, Jun 16, 2023 at 11:31:47AM +0200, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The function is only defined if CONFIG_PROC_FS is enabled:
>>>
>>> ld.lld: error: undefined symbol: i915_drm_client_fdinfo
>>>>>> referenced by i915_driver.c
>>>>>>                
>>>>>> drivers/gpu/drm/i915/i915_driver.o:(i915_drm_driver) in archive 
>>>>>> vmlinux.a
>>>
>>> Use the PTR_IF() helper to make the reference NULL otherwise.
>>>
>>> Fixes: e894b724c316d ("drm/i915: Use the fdinfo helper")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> ---
>>>   drivers/gpu/drm/i915/i915_driver.c     | 2 +-
>>>   drivers/gpu/drm/i915/i915_drm_client.h | 2 --
>>>   2 files changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c 
>>> b/drivers/gpu/drm/i915/i915_driver.c
>>> index 75cbc43b326dd..0ad0c5885ec27 100644
>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>> @@ -1816,7 +1816,7 @@ static const struct drm_driver i915_drm_driver = {
>>>       .open = i915_driver_open,
>>>       .lastclose = i915_driver_lastclose,
>>>       .postclose = i915_driver_postclose,
>>> -    .show_fdinfo = i915_drm_client_fdinfo,
>>> +    .show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), 
>>> i915_drm_client_fdinfo),
>>>       .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>>       .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h 
>>> b/drivers/gpu/drm/i915/i915_drm_client.h
>>> index 4c18b99e10a4e..67816c912bca1 100644
>>> --- a/drivers/gpu/drm/i915/i915_drm_client.h
>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
>>> @@ -47,8 +47,6 @@ static inline void i915_drm_client_put(struct 
>>> i915_drm_client *client)
>>>   struct i915_drm_client *i915_drm_client_alloc(void);
>>> -#ifdef CONFIG_PROC_FS
>>>   void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file 
>>> *file);
>>> -#endif
>>
>> nice! This is becoming the new trend now.
>>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks for the fix and review! (And I got to learn about existence of 
> PTR_IF too.)
> 
> Andi will you merge once green or should I?

Pushed, thanks for the fixup and review!

Regards,

Tvrtko

