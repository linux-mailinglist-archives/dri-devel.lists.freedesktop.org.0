Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GO6CFiXjWkG5AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:03:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234812BAA5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE40788A72;
	Thu, 12 Feb 2026 09:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="j7PhREay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C17F88A72
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 09:03:11 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so3438285f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 01:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1770886990; x=1771491790; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HTUilNAe4IDeb/F1rvdrNpZ6rY/d/aViUlbwLpih+Tc=;
 b=j7PhREaykj+GTPFAPMrOLFRr/fbKL+ExnTCp7PAeOp4sEpA2sgWDmUvJ0WrjMbRD7d
 DMQLT80Qug37IY+5iVaOQpgedwerk02QX3yqDQyBiiZQzWUehHYS+PV8r0x4p5BEEfzO
 BrapQfnRWbNDSDMWspJ1FIJbAgxOhy4GzurZvtj5YjD0KZJ1PfF0fE1enu+sjhr7//J/
 6cn0uPo4jFYyJifeJLXvSZQr67XFr2mfP++KXoezweW2mL8BlRByRobPJDFQsaDgpS2O
 giPtoquCtLSvUqokdDDIbXqW0gjFWtnwsudDqHKEd+vpl+IopUBcWcgj/RfYxNgHE8Q8
 dhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770886990; x=1771491790;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HTUilNAe4IDeb/F1rvdrNpZ6rY/d/aViUlbwLpih+Tc=;
 b=Nh7Tx2I17yPveIc85Mnjs6FRB86gtazD9QGr0W03K4koZkQaESMyPaBWHUOiKK7z7U
 8mAEZ2ZCsnuP0GENFRqh5mN1Du3+qgRAxnUKcGIGt/n6Qtx0YVREflIcCRPRlGhu+qTr
 ZmWiCog3Ife0ospR2h46z/1hbY9LA/LM4/bI9UW37jsu0nT5Lm6yMUh8sdjS+0u63jZh
 YvsyhBKzvcoUtH90/qlHwa2dhlvoFG6n207UhT6c90zFho05mdQi3SL8FEuoh/kNnNCV
 oWqLnZT02sZyjsQvatGEH1P9HuOOw+WGdJd5xGIuBtLd/v8iQHECBFyCOlB1QU9TOEvF
 u4OA==
X-Gm-Message-State: AOJu0Yxr1F7dClY7W3EdCOCJSq2u2CtF1sf1+pGaWCnEWpBIMPetbrrr
 S97LRBvx+dIFZNh4tS9aZTmszluRQVFrJBcPm9Ql6x4L/yHHcocwz9LDGf1doKkx0b8AjqxmCRy
 JBkAnDjU=
X-Gm-Gg: AZuq6aIJmem2wy0frc1ypvmZdTyW8cIQxzjwYiHlbs8i5Qr/u9o2vgRAYbAU+PEjLUG
 5wj8c0WvEoobuuEcyJyClkv1ryHiNzNMld1TRctN09SLp8+jUrINyGaZSR5ibPMP4nEjh6eNfZ8
 UU/ynImHpGrKczrsTcICuva23bYYNH/WFtLEsYuGWdmSh5pM/lkaez3BFfq+vhU5CApk7t0I+Rb
 jYZOoBF7KLKM5tyI00fHyW+tJQsGYuvAGOKIngpp95lkfqhfAG0Sx52tE4NiyM5chiERNwEXMaq
 QrTS+bMQ+3HwpG5XvZOOn0Usx0NhcaDsiN7iCBh4mJVxHralxYaVOqEHNisJZxDDywFKnnoLhKb
 nqDwdxsujvT4NlIDNDjDKykKcyjpFC04FBnaF4oJRKrFmIUoJ0efIZJ4jn36VZUr4WY3tHFF0UE
 S0qJYBSvjJDmUd4eYlML22cbBKjyuCKlKLOUXreqC8ltby
X-Received: by 2002:a05:600c:19ca:b0:480:4a4f:c36f with SMTP id
 5b1f17b1804b1-4836570f25fmr24694975e9.21.1770886989617; 
 Thu, 12 Feb 2026 01:03:09 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d77f9sm195670835e9.3.2026.02.12.01.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:03:09 -0800 (PST)
Message-ID: <b60e30a1-7c5f-4335-b565-ed527dee5fc1@ursulin.net>
Date: Thu, 12 Feb 2026 09:03:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v5
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@kernel.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-2-christian.koenig@amd.com>
 <f1345723cc5a61cdec5a6f168f71a323b822b7e2.camel@mailbox.org>
 <f357c2fc-3c72-42ac-b079-849222de4c6e@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <f357c2fc-3c72-42ac-b079-849222de4c6e@gmail.com>
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
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@kernel.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,linaro.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MAILSPIKE_FAIL(0.00)[131.252.210.177:query timed out];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:mid,ursulin.net:dkim]
X-Rspamd-Queue-Id: 7234812BAA5
X-Rspamd-Action: no action


On 11/02/2026 15:43, Christian König wrote:

8><

>>> +	 */
>>> +	RCU_INIT_POINTER(fence->ops, ops);
>>>   	INIT_LIST_HEAD(&fence->cb_list);
>>>   	fence->lock = lock;
>>>   	fence->context = context;
>>> @@ -1129,11 +1152,12 @@ EXPORT_SYMBOL(dma_fence_init64);
>>>    */
>>>   const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>>>   {
>>> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>>> -			 "RCU protection is required for safe access to returned string");
>>> +	const struct dma_fence_ops *ops;
>>>   
>>> +	/* RCU protection is required for safe access to returned string */
>>> +	ops = rcu_dereference(fence->ops);
>>>   	if (!dma_fence_test_signaled_flag(fence))
>>> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
>>> +		return (const char __rcu *)ops->get_driver_name(fence);
>>>   	else
>>>   		return (const char __rcu *)"detached-driver";
>>>   }
>>> @@ -1161,11 +1185,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>>>    */
>>>   const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>>>   {
>>> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>>> -			 "RCU protection is required for safe access to returned string");
>>> +	const struct dma_fence_ops *ops;
>>>   
>>> +	/* RCU protection is required for safe access to returned string */
>>> +	ops = rcu_dereference(fence->ops);
>>>   	if (!dma_fence_test_signaled_flag(fence))
>>> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
>>> +		return (const char __rcu *)ops->get_driver_name(fence);
>>>   	else
>>>   		return (const char __rcu *)"signaled-timeline";
>>>   }
>>
>> Did we make any progress in our conversation about removing those two
>> functions and callbacks? They're only used by i915.
> 
> Actually they are mostly used by the trace points and debugfs, so we certainly can't remove them.
> 
> But I'm really wondering why the heck i915 is using them?

Mostly directed to Philipp - by using you mean calling the helpers? I 
thought I mentioned before the synce fence uapi (SYNC_IOC_FILE_INFO) 
actually relies on the names. Sync fence was in fact the easiest way to 
trigger the use after free as a posted the IGT to show it last year. So 
to remove we would need to prove no existing userspace uses that.

Regards,

Tvrtko

