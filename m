Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0247B9C2AFE
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 08:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDBC10E341;
	Sat,  9 Nov 2024 07:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="BCNLZ9ry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8F110E33C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 07:24:03 +0000 (UTC)
Message-ID: <a078e53c-bf2b-48f1-9ffb-43772d98b898@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1731137041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQA4uRInbhiWJgjyq+46jhajSmEbDaEWDLgB2uSB8Ok=;
 b=BCNLZ9rywO4Od5GWlPJOnPsqGTlHJqBk7X3pj3k7XQ9dffMSrTahIKOkhM/P6QvdTt39QH
 c+/utM/iUFO+vl/gHnRumE/OfTvTkqLbPW3wEjcbiLap4Rrn+UphKB7eoAzXrHXZ6wJahr
 OFnNId4HWpIAa7PYsa0vlANW5D01Vlk=
Date: Sat, 9 Nov 2024 15:23:55 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v15 01/19] drm/etnaviv: Implement
 drm_gem_object_funcs::print_info()
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
 <20240908094357.291862-2-sui.jingfeng@linux.dev>
 <e4270c6629f4f7ac086e7a177374bdbc306226a0.camel@pengutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <e4270c6629f4f7ac086e7a177374bdbc306226a0.camel@pengutronix.de>
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

On 2024/10/1 21:04, Lucas Stach wrote:
> Hi Sui,
>
> Am Sonntag, dem 08.09.2024 um 17:43 +0800 schrieb Sui Jingfeng:
>> It will be called by drm_gem_print_info() if implemented, and it can
>> provide more information about the framebuffer objects.
> Etnaviv GEM BOs are not framebuffer objects.
>
>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 32 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.h |  2 +-
>>   2 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> index 4247a10f8d4f..543d881585b3 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -534,8 +534,40 @@ static const struct vm_operations_struct vm_ops = {
>>   	.close = drm_gem_vm_close,
>>   };
>>   
>> +static const char *etnaviv_gem_obj_caching_info(u32 flags)
>> +{
>> +	switch (flags & ETNA_BO_CACHE_MASK) {
>> +	case ETNA_BO_CACHED:
>> +		return "cached";
>> +	case ETNA_BO_UNCACHED:
>> +		return "uncached";
>> +	case ETNA_BO_WC:
>> +		return "write-combine";
> "write-combined" to be consistent with the other two.


OK,


>> +	default:
>> +		break;
>> +	}
>> +
>> +	return "unknown";
>> +}
>> +
>> +static void etnaviv_gem_object_info(struct drm_printer *p,
>> +				    unsigned int indent,
>> +				    const struct drm_gem_object *obj)
>> +{
>> +	const struct etnaviv_gem_object *etnaviv_obj;
>> +
>> +	etnaviv_obj = container_of(obj, struct etnaviv_gem_object, base);
>> +
>> +	drm_printf_indent(p, indent, "caching mode=%s\n",
>> +			  etnaviv_gem_obj_caching_info(etnaviv_obj->flags));
>> +	drm_printf_indent(p, indent, "active=%s\n",
>> +			  str_yes_no(is_active(etnaviv_obj)));
>> +	drm_printf_indent(p, indent, "vaddr=%p\n", etnaviv_obj->vaddr);
> Why should we expose the vaddr to userspace? I don't see why this would
> be relevant even as debug info and it leaks the kernel vmap area
> address, which could be abused to facilitate kernel exploits.


This is nearly a re-implement for the etnaviv_gem_describe(),

It's not intend to leak, but to give us a *hint* that
if a specific buffer object have been VMAP-ed and
we will know how many BOs have been vmap-ed.


> Regards,
> Lucas
>
>> +}
>> +
>>   static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
>>   	.free = etnaviv_gem_free_object,
>> +	.print_info = etnaviv_gem_object_info,
>>   	.pin = etnaviv_gem_prime_pin,
>>   	.unpin = etnaviv_gem_prime_unpin,
>>   	.get_sg_table = etnaviv_gem_prime_get_sg_table,
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
>> index a42d260cac2c..3f8fe19a77cc 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
>> @@ -68,7 +68,7 @@ struct etnaviv_gem_ops {
>>   	int (*mmap)(struct etnaviv_gem_object *, struct vm_area_struct *);
>>   };
>>   
>> -static inline bool is_active(struct etnaviv_gem_object *etnaviv_obj)
>> +static inline bool is_active(const struct etnaviv_gem_object *etnaviv_obj)
>>   {
>>   	return atomic_read(&etnaviv_obj->gpu_active) != 0;
>>   }

-- 
Best regards,
Sui

