Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHBTG0aUmGlaJwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:05:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B026A1698FC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B106910E818;
	Fri, 20 Feb 2026 17:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hrfC/lma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0725C10E818
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 17:05:05 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-437711e9195so1574147f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771607104; x=1772211904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o+HBjN23l1KfsJluyfGxMQlJXd1Qi9Br3IvjbInHA4Q=;
 b=hrfC/lmaKxE01uW8Iflrky82sg1dpMPhvNVi8nZXmzQfx9gcfRM5FMcUqJxyVqkWjp
 fKn+sxvOp40Eb3bwe7mv+1+fTBKjJfQIwDc957d9Z0xoQNZR+o9HVmAHPAoABIZe5UNA
 5DiH0Id0D/92gE75pyAjotLYtnLJKiwQL4yp2iTCVBgt0K9dQHmfJdthOL7OpgbvBJsB
 0MTKPCcDIGb6fChuUlf2/4xmJRhD58Cl+sA9BEL5HJgvuPOwauyxE+MiSLiI3n/c706x
 vvdGYTCd7ygVCXxjoKdo0cOUyQMvPFsem+cQ7j5GmGl7IhifLXmuTu9r3k2bI1RgUD0K
 zeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771607104; x=1772211904;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o+HBjN23l1KfsJluyfGxMQlJXd1Qi9Br3IvjbInHA4Q=;
 b=IMaXpL7NlXY1xjEJTsYlvzM8bKSq2hWHeo57ZeAwVQSLuIS4+frHnuf4zV2agLqDUw
 XhLXogK35LfPBO39NuEkGTq73l2omHhoZ7zgbHDEttCNZLYHyCMqKYORiDXDoWzZtyBE
 JYGWX7enAEFp1uKbm2rfV/HQkQnO+p19wZZwC2gpQ6INIuhNIBk2MnNg8Vi/i8aEYCpa
 IOpCzd5KP61fXo9bvPP7EbkV71QI6nsubPVSotYlqURF6J3a3wqm4SUXkLbUUrrbpmZS
 DEm20eImpyz2r26H65pw2xNKf0QpQZ/HaEv/IlIBneKhQ1wsi41XGv1LnEGRkM0clHCs
 S2nA==
X-Gm-Message-State: AOJu0Yzm9lnmon1r/EXBgioVLrdLMBq4LGx+AIzkVJQ4c1g/awf56i/X
 wy4oTJe4cyHKyzNpLZV/ODsXd1xqh5tVP34GTl49sfJHic1Dquu9I7Ee
X-Gm-Gg: AZuq6aJMwefrRRZVKx8MOEqVV2bgp2kpYQL2QeAKQ+5rhfvgwRNIMQI02PoNHk6HWNX
 D2hhgJKRHBhJEud6p56IL7blXKeAr7ghvMtWSSB2DG5xYbBRXhTQ/7fABu7FU0aquiyvLMPFQnD
 V179JRWfPEhPAix+BCs5MbvEP6vs2VZwzp8CAemVW2rmswHZi/TVNB0bWX0iHI/On6MU9HpjArN
 +grmRS7mz1EwNWndXivAtraVMbmxWG37rrBe46cDuOuP03KEd3XAtkbEjniteV9ZEeXehV4kIrp
 K5xPfGUASzygkol0ZH9dJ9hpDFohydQLVO7dReAHTYrvydfEW/riXNDBWH++1pqnjLN9yK/zb3R
 j+yvKOLYt95ft4FbQJuwpZ/L5IYFKr+SO3IS3zJyXeEepU0PfviqkP6sFgxqAxGu54Vwq0lUOJ+
 p/nswTwyATRUGIMVXoan5S35iMGTvpDsU6ipOtWxLQzABLoiCRgqQmW9lR2/kKhF9xEklMww==
X-Received: by 2002:a05:6000:26cd:b0:436:369f:39f9 with SMTP id
 ffacd0b85a97d-4396f1a70b5mr1003099f8f.57.1771607104091; 
 Fri, 20 Feb 2026 09:05:04 -0800 (PST)
Received: from [10.247.12.125] ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8075sm54619238f8f.29.2026.02.20.09.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 09:05:03 -0800 (PST)
Message-ID: <9b952d44-6fc6-4594-9e16-78d529290c9d@gmail.com>
Date: Fri, 20 Feb 2026 17:05:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20260220022631.2205037-1-yiconghui@gmail.com>
 <20260220022631.2205037-2-yiconghui@gmail.com>
 <d27ae98b-b401-4110-b233-a8da2dd3de05@amd.com>
Content-Language: en-US
From: Yicong Hui <yiconghui@gmail.com>
In-Reply-To: <d27ae98b-b401-4110-b233-a8da2dd3de05@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B026A1698FC
X-Rspamd-Action: no action

>> +
>>   /**
>>    * dma_fence_chain_find_seqno - find fence chain node by seqno
>>    * @pfence: pointer to the chain node where to start
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index 2d4ab745fdad..322f64b72775 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>   {
>>   	struct drm_syncobj_timeline_array *args = data;
>>   	struct drm_syncobj **syncobjs;
>> +	unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
>> +				   DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
>>   	uint64_t __user *points = u64_to_user_ptr(args->points);
>> +	uint64_t __user *handles = u64_to_user_ptr(args->handles);
>>   	uint32_t i;
>>   	int ret;
>>   
>>   	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>>   		return -EOPNOTSUPP;
>>   
>> -	if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
>> +	if (args->flags & ~valid_flags)
>>   		return -EINVAL;
>>   
>>   	if (args->count_handles == 0)
>> @@ -1680,6 +1683,22 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>   		uint64_t point;
> 
> Make a local variable "int error" here.
> 
> ...
> 
>> +			int64_t error = 0;
> 
> The error code is an int and only 32bits.
Understood, will change that!

> 
>> +
>> +			if (fence)
>> +				error = dma_fence_chain_find_error(fence);
>> +
>> +			ret = copy_to_user(&handles[i], &error, sizeof(int64_t));
> 
> The handles are also only 32bits!
Ah, that's my mistake. Was thrown off by the __u64 in the struct definition but it is obvious now that it is a u32. Fixed as well!

> 
>> +			ret = ret ? -EFAULT : 0;
>> +			if (ret) {
>> +				dma_fence_put(fence);
>> +				break;
>> +			}
>> +
>> +		}
>> +
>>   		chain = to_dma_fence_chain(fence);
>>   		if (chain) {
> 
> In this code path whenever point is assigned something do a "error = dma_fence_get_status(fence);" and then eventually copy the error to userspace after copying the point.
> 

Hi! Were you thinking something that looks a little bit like this?

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 2d4ab745fdad..b74e491f9d8b 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
  {
  	struct drm_syncobj_timeline_array *args = data;
  	struct drm_syncobj **syncobjs;
+	unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
+				  DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
  	uint64_t __user *points = u64_to_user_ptr(args->points);
+	uint32_t __user *handles = u64_to_user_ptr(args->handles);
  	uint32_t i;
-	int ret;
+	int ret, error;
  
  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
  		return -EOPNOTSUPP;
  
-	if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
+	if (args->flags & ~valid_flags)
  		return -EINVAL;
  
  	if (args->count_handles == 0)
@@ -1681,6 +1684,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
  
  		fence = drm_syncobj_fence_get(syncobjs[i]);
  		chain = to_dma_fence_chain(fence);
+
  		if (chain) {
  			struct dma_fence *iter, *last_signaled =
  				dma_fence_get(fence);
@@ -1688,6 +1692,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
  			if (args->flags &
  			   DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
  				point = fence->seqno;
+				error = dma_fence_get_status(fence);
+
  			} else {
  				dma_fence_chain_for_each(iter, fence) {
  					if (iter->context != fence->context) {
@@ -1702,16 +1708,28 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
  				point = dma_fence_is_signaled(last_signaled) ?
  					last_signaled->seqno :
  					to_dma_fence_chain(last_signaled)->prev_seqno;
+
+				error = dma_fence_get_status(last_signaled);
  			}
  			dma_fence_put(last_signaled);
  		} else {
  			point = 0;
+			error = fence ? dma_fence_get_status(fence) : 0;
  		}
  		dma_fence_put(fence);
+
  		ret = copy_to_user(&points[i], &point, sizeof(uint64_t));
  		ret = ret ? -EFAULT : 0;
  		if (ret)
  			break;
+
+		if (args->flags & DRM_SYNCOBJ_QUERY_FLAGS_ERROR) {
+			ret = copy_to_user(&handles[i], &error, sizeof(*handles));
+
+			ret = ret ? -EFAULT : 0;
+			if (ret)
+				break;
+		}
  	}
  	drm_syncobj_array_free(syncobjs, args->count_handles);
  
