Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676FA98C541
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 20:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA5D10E31F;
	Tue,  1 Oct 2024 18:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="t46XZxX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7074C10E18F;
 Tue,  1 Oct 2024 18:23:01 +0000 (UTC)
Message-ID: <1779a56a-8735-4c65-a2fd-1e56ae6064b0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1727806979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTxaEB9e/RX1sZqNNlBGxHMF2E6oC94MODrfEEuSFh4=;
 b=t46XZxX532GVLmQY1IpZDd/lJaTR2dJMAmq0MhjcEJDfOF+IzhOLi9GSHJ/Esq9bMA2t4H
 jOu9mCzwtJ5szbQBmKddoaPcQIDpMBRJTAIpmbfSygoGluJvcQZhxkrcxkhC7WM1eM7uvA
 SDidsSHWvFCeAy3QG6Ho4Jl8jd2Zj6s=
Date: Wed, 2 Oct 2024 02:22:44 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v15 11/19] drm/etnaviv: Add etnaviv_gem_obj_remove() helper
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
 <20240908094357.291862-12-sui.jingfeng@linux.dev>
 <45b8eb9a0a2b91d85f9dd6b7e66a1796398fa27c.camel@pengutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <45b8eb9a0a2b91d85f9dd6b7e66a1796398fa27c.camel@pengutronix.de>
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

On 2024/10/1 22:21, Lucas Stach wrote:
> Am Sonntag, dem 08.09.2024 um 17:43 +0800 schrieb Sui Jingfeng:
>> Which is corresonding to the etnaviv_gem_obj_add()
>>
> While symmetry is nice,


Thanks a lot for understanding and review my patch.


> it's still not really symmetric,

patch 0016 will try try to make it symmetric.
It will do this uniformly for all etnaviv GEM buffer objects.


> as this
> function isn't exported into the PRIME parts of the driver like
> etnaviv_gem_obj_add().

Yes, exactly.

> Given that I don't really see how this patch
> improves code legibility.

When the reference counter of a GEM buffer object decrease to 0,
the drm_gem_object_free() will be get called. which in turn,
etnaviv_gem_free_object() will get called.

The etnaviv_gem_free_object() will remove the GEM BO node
from the 'priv->gem_list' without checking if it has been
added into the list.

The data field of the struct etnaviv_gem_object::gem_node
will be all ZERO under such a case.

When drm/etnaviv import a shared buffer from an another driver.
etnaviv_gem_prime_import_sg_table() will be get called. But it
could fails before the "etnaviv_gem_obj_add(dev, &etnaviv_obj->base)"
get executed. The fails might either due to out of memory or
drm_prime_sg_to_page_array() failed.


Those fails will lead to NULL pointer de-reference, as we will
use uninitialized data member(say the 'gem_node') of an GEM
buffer object.

This is also the reason why we want to add it into the
etnaviv_drm_private::gem_list immediately after an etnaviv
GEM buffer object is successfully created.

> Regards,
> Lucas
>
>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> index 39cfece67b90..3732288ff530 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -19,6 +19,8 @@
>>   static struct lock_class_key etnaviv_shm_lock_class;
>>   static struct lock_class_key etnaviv_userptr_lock_class;
>>   
>> +static void etnaviv_gem_obj_remove(struct drm_gem_object *obj);
>> +
>>   static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
>>   {
>>   	struct drm_device *dev = etnaviv_obj->base.dev;
>> @@ -555,15 +557,12 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
>>   {
>>   	struct drm_device *drm = obj->dev;
>>   	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>> -	struct etnaviv_drm_private *priv = obj->dev->dev_private;
>>   	struct etnaviv_vram_mapping *mapping, *tmp;
>>   
>>   	/* object should not be active */
>>   	drm_WARN_ON(drm, is_active(etnaviv_obj));
>>   
>> -	mutex_lock(&priv->gem_lock);
>> -	list_del(&etnaviv_obj->gem_node);
>> -	mutex_unlock(&priv->gem_lock);
>> +	etnaviv_gem_obj_remove(obj);
>>   
>>   	list_for_each_entry_safe(mapping, tmp, &etnaviv_obj->vram_list,
>>   				 obj_node) {
>> @@ -595,6 +594,16 @@ void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
>>   	mutex_unlock(&priv->gem_lock);
>>   }
>>   
>> +static void etnaviv_gem_obj_remove(struct drm_gem_object *obj)
>> +{
>> +	struct etnaviv_drm_private *priv = to_etnaviv_priv(obj->dev);
>> +	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>> +
>> +	mutex_lock(&priv->gem_lock);
>> +	list_del(&etnaviv_obj->gem_node);
>> +	mutex_unlock(&priv->gem_lock);
>> +}
>> +
>>   static const struct vm_operations_struct vm_ops = {
>>   	.fault = etnaviv_gem_fault,
>>   	.open = drm_gem_vm_open,

-- 
Best regards,
Sui

