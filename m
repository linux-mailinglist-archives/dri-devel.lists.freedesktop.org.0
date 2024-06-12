Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE99E904FD7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 12:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C7510E811;
	Wed, 12 Jun 2024 10:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OQ9rwEhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F78210E80B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 10:00:10 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57a4d7ba501so8766550a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 03:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718186408; x=1718791208;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xtkoLYi56Gb4t3muOmnreb1huw+7WnGftj0vPOA7vRs=;
 b=OQ9rwEhG56n3Gzp5a38Y3C2JT9ZV8R66wbsep82t1dKZJMjEI26xcDb1I9uotTkGto
 we0W/ath+TeQ3SIMPclSP7tEF//YKyHd2fQbNHEr6+42TFi2SCoLt/yzorkwC2P5SLxP
 9PlIgVJCW5PYm5OfMJcuMmmfAypl41OAENsY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718186408; x=1718791208;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xtkoLYi56Gb4t3muOmnreb1huw+7WnGftj0vPOA7vRs=;
 b=paJYMmw+cCf808JhmuxXuMA4GSMfMd1qf17vMQzQfQZvS5QDGu9Acwc8G5ixC0D78a
 2hkn2qU0wT+h5Zwon8N8Pa3phVXf03y3AfRLzUpcH1KYbstxKfqNlm72K1l7F+X2EcXI
 BLSkCnbtOwOmEYj71GY9GgWD3htD5uRpr0TbUPdX8bc03OvwQMZEdErso2yYseEJuMD2
 a7MiHl1G3HZg4ZKrym4sHUOIRAFAZwq9xT+6jgXQX/CJK2vBNBSBS+QXttCbByQkuz0h
 fHYLqDlPLLGfJ3eYpzSD3Nzd7VeGrsbd4d+5iqkG8dO2vTrTxjFmlW+r7Hzk2RrWO86l
 /dwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq1MbT+yeVsk6UNkON7uArR+QqgaLDzKzBPm+y/cz39m1vTUsuY58kVBfHmeBAnKVchy2O97RHYS6QBBC4AOECFOJHu4+LbJexl3Jklob8
X-Gm-Message-State: AOJu0Yy5xFIbdJXC0Cf294rAU7WFd+aHRX07xWu/9fmxaWdlIcZX5LAT
 ck4S6yuwWDxkH9YtRiwD8/9fpcQx7qH2UbCfXBONEuhP00ZP0mwasQW8YA6GaQA=
X-Google-Smtp-Source: AGHT+IHc1i3jdjgN0IJMEKImJ5ipL45jrcDRmDyN+VZ9dMp6DRIOoTEWRBbRnIfcpii2gs/JMAT5Rg==
X-Received: by 2002:a50:9e84:0:b0:57c:6740:f47c with SMTP id
 4fb4d7f45d1cf-57ca97936a9mr988147a12.27.1718186408087; 
 Wed, 12 Jun 2024 03:00:08 -0700 (PDT)
Received: from [192.168.1.83] ([85.148.28.6]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c8d3aec50sm3870119a12.37.2024.06.12.03.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 03:00:07 -0700 (PDT)
Message-ID: <a2a51ff4-f369-4ed3-b3bd-373fbb590424@amarulasolutions.com>
Date: Wed, 12 Jun 2024 12:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] devres: Refactor using guards
To: Lucas Stach <l.stach@pengutronix.de>, gregkh@linuxfoundation.org,
 rafael@kernel.org, dri-devel@lists.freedesktop.org
Cc: trivial@kernel.org, linux-amarula@amarulasolutions.com
References: <20240611093710.1066510-1-andrea.calabrese@amarulasolutions.com>
 <81e1972e636a2d81f34de059a24ac27133da4bb0.camel@pengutronix.de>
Content-Language: en-US
From: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
In-Reply-To: <81e1972e636a2d81f34de059a24ac27133da4bb0.camel@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On 12/06/2024 11:26, Lucas Stach wrote:
> Am Dienstag, dem 11.06.2024 um 11:37 +0200 schrieb Andrea Calabrese:
>> Code refactoring using the recent guard and scoped_guard macros
>> for automatic cleanup of the spinlocks. This does not change the
>> effective behaviour of the kernel, but guarantees a cleaned-up exit from
>> each lock, automatically avoiding potential deadlocks.
>>
>> Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
>>
>> ---
>> Changed commit message from V2. Also changed title, shortened the file
>> name.
>>
>> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
>> index 3df0025d12aa..a98720e0cb2b 100644
>> --- a/drivers/base/devres.c
>> +++ b/drivers/base/devres.c
>> @@ -194,14 +194,12 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
>>   {
>>   	struct devres_node *node;
>>   	struct devres_node *tmp;
>> -	unsigned long flags;
>>   
>>   	if (!fn)
>>   		return;
>>   
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> -	list_for_each_entry_safe_reverse(node, tmp,
>> -			&dev->devres_head, entry) {
>> +	guard(spinlock)(&dev->devres_lock);
> This is not equivalent to the current code. You are dropping the
> _irqsave part of the locking scheme, totally changing the semantics
> here. This issue is present in multiple places in this patch.
>
> Regards,
> Lucas
I don't see where is the issue here, as I am using both guard and 
scoped_guard similarly to how they are used in 
drivers/gpio/gpiolib-cdev.c, which I took as a reference for the usage 
of the construct. If so, probably we may  both be using it wrong.
>> +	list_for_each_entry_safe_reverse(node, tmp, &dev->devres_head, entry) {
>>   		struct devres *dr = container_of(node, struct devres, node);
>>   
>>   		if (node->release != release)
>> @@ -210,7 +208,6 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
>>   			continue;
>>   		fn(dev, dr->data, data);
>>   	}
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>>   }
>>   EXPORT_SYMBOL_GPL(devres_for_each_res);
>>   
>> @@ -243,11 +240,9 @@ EXPORT_SYMBOL_GPL(devres_free);
>>   void devres_add(struct device *dev, void *res)
>>   {
>>   	struct devres *dr = container_of(res, struct devres, data);
>> -	unsigned long flags;
>>   
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> +	guard(spinlock)(&dev->devres_lock);
>>   	add_dr(dev, &dr->node);
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>>   }
>>   EXPORT_SYMBOL_GPL(devres_add);
>>   
>> @@ -287,11 +282,8 @@ void * devres_find(struct device *dev, dr_release_t release,
>>   		   dr_match_t match, void *match_data)
>>   {
>>   	struct devres *dr;
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> +	guard(spinlock)(&dev->devres_lock);
>>   	dr = find_dr(dev, release, match, match_data);
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>>   
>>   	if (dr)
>>   		return dr->data;
>> @@ -318,16 +310,14 @@ void * devres_get(struct device *dev, void *new_res,
>>   {
>>   	struct devres *new_dr = container_of(new_res, struct devres, data);
>>   	struct devres *dr;
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> -	dr = find_dr(dev, new_dr->node.release, match, match_data);
>> -	if (!dr) {
>> -		add_dr(dev, &new_dr->node);
>> -		dr = new_dr;
>> -		new_res = NULL;
>> +	scoped_guard(spinlock, &dev->devres_lock) {
>> +		dr = find_dr(dev, new_dr->node.release, match, match_data);
>> +		if (!dr) {
>> +			add_dr(dev, &new_dr->node);
>> +			dr = new_dr;
>> +			new_res = NULL;
>> +		}
>>   	}
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>>   	devres_free(new_res);
>>   
>>   	return dr->data;
>> @@ -353,15 +343,13 @@ void * devres_remove(struct device *dev, dr_release_t release,
>>   		     dr_match_t match, void *match_data)
>>   {
>>   	struct devres *dr;
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> -	dr = find_dr(dev, release, match, match_data);
>> -	if (dr) {
>> -		list_del_init(&dr->node.entry);
>> -		devres_log(dev, &dr->node, "REM");
>> +	scoped_guard(spinlock, &dev->devres_lock) {
>> +		dr = find_dr(dev, release, match, match_data);
>> +		if (dr) {
>> +			list_del_init(&dr->node.entry);
>> +			devres_log(dev, &dr->node, "REM");
>> +		}
>>   	}
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>>   
>>   	if (dr)
>>   		return dr->data;
>> @@ -516,7 +504,6 @@ static void release_nodes(struct device *dev, struct list_head *todo)
>>    */
>>   int devres_release_all(struct device *dev)
>>   {
>> -	unsigned long flags;
>>   	LIST_HEAD(todo);
>>   	int cnt;
>>   
>> @@ -528,9 +515,9 @@ int devres_release_all(struct device *dev)
>>   	if (list_empty(&dev->devres_head))
>>   		return 0;
>>   
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> -	cnt = remove_nodes(dev, dev->devres_head.next, &dev->devres_head, &todo);
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>> +	scoped_guard(spinlock, &dev->devres_lock) {
>> +		cnt = remove_nodes(dev, dev->devres_head.next, &dev->devres_head, &todo);
>> +	}
>>   
>>   	release_nodes(dev, &todo);
>>   	return cnt;
>> @@ -552,7 +539,6 @@ int devres_release_all(struct device *dev)
>>   void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
>>   {
>>   	struct devres_group *grp;
>> -	unsigned long flags;
>>   
>>   	grp = kmalloc(sizeof(*grp), gfp);
>>   	if (unlikely(!grp))
>> @@ -568,9 +554,8 @@ void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
>>   	if (id)
>>   		grp->id = id;
>>   
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> +	guard(spinlock)(&dev->devres_lock);
>>   	add_dr(dev, &grp->node[0]);
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>>   	return grp->id;
>>   }
>>   EXPORT_SYMBOL_GPL(devres_open_group);
>> @@ -609,17 +594,14 @@ static struct devres_group * find_group(struct device *dev, void *id)
>>   void devres_close_group(struct device *dev, void *id)
>>   {
>>   	struct devres_group *grp;
>> -	unsigned long flags;
>>   
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> +	guard(spinlock)(&dev->devres_lock);
>>   
>>   	grp = find_group(dev, id);
>>   	if (grp)
>>   		add_dr(dev, &grp->node[1]);
>>   	else
>>   		WARN_ON(1);
>> -
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>>   }
>>   EXPORT_SYMBOL_GPL(devres_close_group);
>>   
>> @@ -635,19 +617,16 @@ EXPORT_SYMBOL_GPL(devres_close_group);
>>   void devres_remove_group(struct device *dev, void *id)
>>   {
>>   	struct devres_group *grp;
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> -
>> -	grp = find_group(dev, id);
>> -	if (grp) {
>> -		list_del_init(&grp->node[0].entry);
>> -		list_del_init(&grp->node[1].entry);
>> -		devres_log(dev, &grp->node[0], "REM");
>> -	} else
>> -		WARN_ON(1);
>>   
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>> +	scoped_guard(spinlock, &dev->devres_lock) {
>> +		grp = find_group(dev, id);
>> +		if (grp) {
>> +			list_del_init(&grp->node[0].entry);
>> +			list_del_init(&grp->node[1].entry);
>> +			devres_log(dev, &grp->node[0], "REM");
>> +		} else
>> +			WARN_ON(1);
>> +	}
>>   
>>   	kfree(grp);
>>   }
>> @@ -668,11 +647,10 @@ EXPORT_SYMBOL_GPL(devres_remove_group);
>>   int devres_release_group(struct device *dev, void *id)
>>   {
>>   	struct devres_group *grp;
>> -	unsigned long flags;
>>   	LIST_HEAD(todo);
>>   	int cnt = 0;
>>   
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> +	guard(spinlock)(&dev->devres_lock);
>>   
>>   	grp = find_group(dev, id);
>>   	if (grp) {
>> @@ -683,12 +661,9 @@ int devres_release_group(struct device *dev, void *id)
>>   			end = grp->node[1].entry.next;
>>   
>>   		cnt = remove_nodes(dev, first, end, &todo);
>> -		spin_unlock_irqrestore(&dev->devres_lock, flags);
>> -
>>   		release_nodes(dev, &todo);
>>   	} else {
>>   		WARN_ON(1);
>> -		spin_unlock_irqrestore(&dev->devres_lock, flags);
>>   	}
>>   
>>   	return cnt;
>> @@ -860,7 +835,6 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
>>   {
>>   	size_t total_new_size, total_old_size;
>>   	struct devres *old_dr, *new_dr;
>> -	unsigned long flags;
>>   
>>   	if (unlikely(!new_size)) {
>>   		devm_kfree(dev, ptr);
>> @@ -906,20 +880,17 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
>>   	 * The spinlock protects the linked list against concurrent
>>   	 * modifications but not the resource itself.
>>   	 */
>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>> +	scoped_guard(spinlock, &dev->devres_lock) {
>> +		old_dr = find_dr(dev, devm_kmalloc_release, devm_kmalloc_match, ptr);
>> +		if (!old_dr) {
>> +			kfree(new_dr);
>> +			WARN(1, "Memory chunk not managed or managed by a different device.");
>> +			return NULL;
>> +		}
>>   
>> -	old_dr = find_dr(dev, devm_kmalloc_release, devm_kmalloc_match, ptr);
>> -	if (!old_dr) {
>> -		spin_unlock_irqrestore(&dev->devres_lock, flags);
>> -		kfree(new_dr);
>> -		WARN(1, "Memory chunk not managed or managed by a different device.");
>> -		return NULL;
>> +		replace_dr(dev, &old_dr->node, &new_dr->node);
>>   	}
>>   
>> -	replace_dr(dev, &old_dr->node, &new_dr->node);
>> -
>> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>> -
>>   	/*
>>   	 * We can copy the memory contents after releasing the lock as we're
>>   	 * no longer modifying the list links.
