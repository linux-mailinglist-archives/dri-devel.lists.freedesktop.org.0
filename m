Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDBLGUKrhWlhEwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:50:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16057FBAC2
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B7510E5CA;
	Fri,  6 Feb 2026 08:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="nZvzWU0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9899E10E5C0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 08:50:06 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so4072705e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 00:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1770367805; x=1770972605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tHlK973Ey81Wj/d00/lSW5LjxdZrZHEalvUFfxeAv8E=;
 b=nZvzWU0m+cunfpnyndDilNrZjg7vLQWKnC9OmyKy0w0jx82Stlkji8c57rcYN6ssbX
 k/+hlEOYuOUqovJ8bjRp6s08QObuNk4aM3CrjMEMy/aqeTaxB+mNS5umviuUBuo1g5wg
 vIRt0VgIuXnhCVBg7AynTRry9pqC8m9vZSLwuURCWL8hiQU3UQf09LMoWBGc32x/BD3p
 Mc6zDKZIEGYR0JqWfE6+CO4qoL9ZZpr2Y86sWo5ea8EnCWAxtx7fcMhvtR0YW6IX482b
 o/2j3mH0Xapt7qN67Tz/jDufbgcmXKo8fE1fLJO755ghn5xDLIWP6sQNApXizFxf+1Vy
 Ws7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770367805; x=1770972605;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tHlK973Ey81Wj/d00/lSW5LjxdZrZHEalvUFfxeAv8E=;
 b=CSUweRqFojWdhZeHYGEMEvw+/GptpbUd90GlWjeZD1mJdKSXsatjPljxFYR4uo39Uz
 qG17erq+kwozfM1Hz6HhzG6DS9wNDLny3tVieQdn5jAw6vQEyYqtW6wPX5lteV0wKYRq
 abcwkOIfZhUHj82DKaqvhpstcgFDKfjg8ztk1a3GFTP/Bm9BnpKs6wKXHvaFxgtIxcra
 Pxo8J1j9yUYnzFv4zhsu6HtjfzeJQfY5T/wnldtz4clxfyBLSxkjWN2YPeGu6M7F/2tV
 8QWzwrehfcenk5hOa9vAR+Fy2qoQbocEV+H/Y6TTQWxdEl66w20qsfzXy47q6+0rsKa8
 815Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+hKrj+BScSJterWX9GnTUR2RK9asFfWnV3Kr/RAy6gZi2DGq6mUlji0UABej7S8wtILAYCOamH4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo7bq+svzIzk1+RGSmdx6uWs2lI6nYk2Nol40P6ivfY7TAkNXa
 OzerTu4VDkydxiNXMIa5b8QZGGAsqWmqHEcieiJB1pk+PsQS9W3uGhALvrxBry5Efnc=
X-Gm-Gg: AZuq6aIup+Y41X9FgMuhY4NJeJIdNBrx7fCV1bf5UPEZDiFmzyGRdIHiFnAnfpJCpoR
 TR4CxpYGj61bbDU7ebKiQQr/+h/1HsyDjxlYnU1SDOU9ppoAjf5C1h3o/29mXvrOv9K6LtNIMcG
 L/Gu/BLCW8MDizBZNPUtMhUJ7eTwnvVGC3JQzo1rU0aMKK0amYVkJZjUfDytizacBm1Oh6ZJI+y
 reEkh6fm3Q27/9io4Gcf3NA7EjDRTiWMA+ukX/s7a19eb2BbJ26HWr3PXwzDhcMoqtEdQIDUwTH
 oMeoHBMNgcRK69Np+ncq9ojuJIq3xtGOqxnA8EvhVzEbXiQ7tSHmKJsiVwgXWGKxttF2Yzx1WmF
 7/QPzQujK7Xqnwl7Oz83TR4CAaQax6jEjprcmrwUKo2kcAEZMRI/jePKtOHsUA+aXW0eQkBa25h
 XNlTM6M39ezEqz+d5UsZBfsd+Nq1ByqqkDVQTdUozhWj7x
X-Received: by 2002:a05:600c:3e12:b0:476:d494:41d2 with SMTP id
 5b1f17b1804b1-4832021d67dmr22837885e9.29.1770367804831; 
 Fri, 06 Feb 2026 00:50:04 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483179dbdcfsm144385355e9.0.2026.02.06.00.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 00:50:04 -0800 (PST)
Message-ID: <8bf7b705-bfcd-4e8e-b9d1-2bb82268d490@ursulin.net>
Date: Fri, 6 Feb 2026 08:50:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/gem: Make drm_gem_objects_lookup() self-cleaning
 on failure v5
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260205154215.1460845-1-srinivasan.shanmugam@amd.com>
 <321402ae-bb5f-44e5-b7ac-a775c5cf0ab4@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <321402ae-bb5f-44e5-b7ac-a775c5cf0ab4@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:srinivasan.shanmugam@amd.com,m:alexander.deucher@amd.com,m:amd-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:email,ursulin.net:dkim,ursulin.net:mid]
X-Rspamd-Queue-Id: 16057FBAC2
X-Rspamd-Action: no action


On 06/02/2026 08:09, Christian König wrote:
> On 2/5/26 16:42, Srinivasan Shanmugam wrote:
>> drm_gem_objects_lookup() can allocate the output array and take
>> references on GEM objects before it fails.
>>
>> If an error happens part-way through, callers previously had to clean up
>> partially created results themselves. This relied on subtle and
>> undocumented behavior and was easy to get wrong.
>>
>> Make drm_gem_objects_lookup() clean up on failure. The function now
>> drops any references it already took, frees the array, and sets
>> *objs_out to NULL before returning an error.
>>
>> On success, behavior is unchanged. Existing callers remain correct and
>> their error cleanup paths simply do nothing when *objs_out is NULL.
>>
>> v3: Move partial-lookup cleanup into objects_lookup(), perform reference
>> dropping outside the lock, and remove reliance on __GFP_ZERO or implicit
>> NULL handling. (Christian)
>>
>> v4: Use goto-style error handling in objects_lookup(), drop partial
>> references outside the lock, and simplify drm_gem_objects_lookup()
>> cleanup by routing failures through err_free_handles as suggested.
>> (Christian)
>>
>> v5: Rebase on drm-misc-next, drop the ret local variable. (Christian)
>>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
>> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> 
> One little nit pick below, apart from that:
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Same opinion on the nit pick as Christian and with that the rest LGTM:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> 
>> ---
>>   drivers/gpu/drm/drm_gem.c | 45 +++++++++++++++++++++++++++------------
>>   1 file changed, 31 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 7ff6b7bbeb73..5895ae09c27d 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -783,7 +783,7 @@ EXPORT_SYMBOL(drm_gem_put_pages);
>>   static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>>   			  struct drm_gem_object **objs)
>>   {
>> -	int i, ret = 0;
>> +	int i;
>>   	struct drm_gem_object *obj;
>>   
>>   	spin_lock(&filp->table_lock);
>> @@ -791,16 +791,23 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>>   	for (i = 0; i < count; i++) {
>>   		/* Check if we currently have a reference on the object */
>>   		obj = idr_find(&filp->object_idr, handle[i]);
>> -		if (!obj) {
>> -			ret = -ENOENT;
>> -			break;
>> -		}
>> +		if (!obj)
>> +			goto err;
>> +
>>   		drm_gem_object_get(obj);
>>   		objs[i] = obj;
>>   	}
>> +
>>   	spin_unlock(&filp->table_lock);
>> +	return 0;
>>   
>> -	return ret;
>> +err:
>> +	spin_unlock(&filp->table_lock);
>> +
>> +	while (i--)
>> +		drm_gem_object_put(objs[i]);
>> +
>> +	return -ENOENT;
>>   }
>>   
>>   /**
>> @@ -825,27 +832,37 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>>   			   int count, struct drm_gem_object ***objs_out)
>>   {
>>   	struct drm_gem_object **objs;
>> -	u32 *handles;
>> +	u32 *handles = NULL;
> 
> I might be missing something but setting handles to NULL looks superfluous to me and we now have static checkers warning about superfluous initialization.
> 
> Regards,
> Christian.
> 
>>   	int ret;
>>   
>> +	*objs_out = NULL;
>> +
>>   	if (!count)
>>   		return 0;
>>   
>> -	objs = kvmalloc_array(count, sizeof(struct drm_gem_object *),
>> -			     GFP_KERNEL | __GFP_ZERO);
>> +	objs = kvmalloc_array(count, sizeof(*objs), GFP_KERNEL);
>>   	if (!objs)
>>   		return -ENOMEM;
>>   
>> -	*objs_out = objs;
>> -
>>   	handles = vmemdup_array_user(bo_handles, count, sizeof(u32));
>> -	if (IS_ERR(handles))
>> -		return PTR_ERR(handles);
>> +	if (IS_ERR(handles)) {
>> +		ret = PTR_ERR(handles);
>> +		goto err_free_objs;
>> +	}
>>   
>>   	ret = objects_lookup(filp, handles, count, objs);
>> +	if (ret)
>> +		goto err_free_handles;
>> +
>>   	kvfree(handles);
>> -	return ret;
>> +	*objs_out = objs;
>> +	return 0;
>>   
>> +err_free_handles:
>> +	kvfree(handles);
>> +err_free_objs:
>> +	kvfree(objs);
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_gem_objects_lookup);
>>   
> 

