Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5E732FA7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 13:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CB910E0D3;
	Fri, 16 Jun 2023 11:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A290810E0D0;
 Fri, 16 Jun 2023 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686914278; x=1718450278;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SXaXEX0DfSvbMrmux/O66OLLANaDL5w3tNEEYOUNjWE=;
 b=Ah1DxGYJsEnk5jqqq8f6o05ng/gxvvOaC9O+5YriYZm7zDPcAMlek4ww
 IkSkl+xnUANZcsSVWMgnbLU39bGZyl1pJI/wUSxKASeX/WjTJRwNp/sDk
 s+n/OUqZPO3nj8N0ceLgZ82haFEzKhcNTbeUIxOcXUyVX9JWm8DxDXiKw
 yFxcruhUkM7cizxOfEeFrCgB5kaFT26WJX2iGFckV8MJcUP2F5k5IjCEJ
 c8tLLXFiTxtLZwsOq9A50xs4oRfMJ8OyZlBaXYW0zrgGm2UPf5++7t6vT
 0qONDj3WyVtN+EdN3XkuG+MWzxoGqnKuQzK5mmNMME8XB0dMO+VcrxJZA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339521882"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="339521882"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 04:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="837012168"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="837012168"
Received: from sdonohue-mobl.ger.corp.intel.com (HELO [10.213.214.201])
 ([10.213.214.201])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 04:17:53 -0700
Message-ID: <ef849277-10ef-90db-fd6c-3646599e32ba@linux.intel.com>
Date: Fri, 16 Jun 2023 12:17:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915: make i915_drm_client_fdinfo() reference
 conditional again
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>
References: <20230616093158.3568480-1-arnd@kernel.org>
 <ZIw2kdx9+DCmUZUV@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZIw2kdx9+DCmUZUV@ashyti-mobl2.lan>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/06/2023 11:16, Andi Shyti wrote:
> Hi Arnd,
> 
> On Fri, Jun 16, 2023 at 11:31:47AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The function is only defined if CONFIG_PROC_FS is enabled:
>>
>> ld.lld: error: undefined symbol: i915_drm_client_fdinfo
>>>>> referenced by i915_driver.c
>>>>>                drivers/gpu/drm/i915/i915_driver.o:(i915_drm_driver) in archive vmlinux.a
>>
>> Use the PTR_IF() helper to make the reference NULL otherwise.
>>
>> Fixes: e894b724c316d ("drm/i915: Use the fdinfo helper")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/gpu/drm/i915/i915_driver.c     | 2 +-
>>   drivers/gpu/drm/i915/i915_drm_client.h | 2 --
>>   2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index 75cbc43b326dd..0ad0c5885ec27 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -1816,7 +1816,7 @@ static const struct drm_driver i915_drm_driver = {
>>   	.open = i915_driver_open,
>>   	.lastclose = i915_driver_lastclose,
>>   	.postclose = i915_driver_postclose,
>> -	.show_fdinfo = i915_drm_client_fdinfo,
>> +	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), i915_drm_client_fdinfo),
>>   
>>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
>> index 4c18b99e10a4e..67816c912bca1 100644
>> --- a/drivers/gpu/drm/i915/i915_drm_client.h
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
>> @@ -47,8 +47,6 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
>>   
>>   struct i915_drm_client *i915_drm_client_alloc(void);
>>   
>> -#ifdef CONFIG_PROC_FS
>>   void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
>> -#endif
> 
> nice! This is becoming the new trend now.
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks for the fix and review! (And I got to learn about existence of 
PTR_IF too.)

Andi will you merge once green or should I?

Regards,

Tvrtko
