Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2xRRL02ZjGkhrgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 15:59:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FB41255A9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 15:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F21188DE5;
	Wed, 11 Feb 2026 14:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a5L4cme9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE6D88DE5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 14:59:19 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-8c5386f1c9fso722044685a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 06:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770821959; x=1771426759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EGfUuSKK26aSiDkNR+do+em0hvWRNbIRgZtgATisbok=;
 b=a5L4cme9cYhs8YpCb5iL9wcFCPKinUIGqzBTojZB166IPHzagzP/3gFvq+VssOSGEt
 uKd7d/obdyPLqZCwJAo4NJsNXj/N6I5xvOfkmnx2gNqjPghw4rOm4+qxpU/qIA7bSv+n
 JjxgTlDMgFrmXc6+wqYuu1JhW2HxHaTl44FIP4jc8aFOPV2ay8IPUljQ0Fvw1jQWFVyM
 ltMLmbTs91e7Q28PYtscI7jAFj92zQtGztU2lgOJxu4n81Fjklwpwz3E0lTutwhCQRHC
 H9nBFQOumNz4JSUMih9UWgg8qLdi5xpOn8A2Jv6yTwjWyHJZWEopTPuArQHiF8rtlgmu
 ujSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770821959; x=1771426759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGfUuSKK26aSiDkNR+do+em0hvWRNbIRgZtgATisbok=;
 b=QUGMm2xndwf0t7jjTta5FVVE2kBfM2ExYq1jT8ouUaj4RUokPk7UjWOr6WI5vbsldv
 6LOhAB2p2v4gR2gGC2fMz6Rz5c+B/0Zr3Iprz53k6psiD8cDb2s8WBhZLs6qNVZQDJzN
 R/MyOBKADzbZgXh3+R168nE4J0w2SF0RmJo2zIihUY0NCMzH44bXt2pS6YOSfo+vYNch
 A1sI/Cr0L9XxKSs61ulUdDDW7DiMgiGudaTghoyKJnmsuT9YZTyGfw3cWgwDTOAEQIBw
 yldJeO7WmSxgZTsCEmGhfPNY67hmJoWxARJkS6R18JtvOzoKTj7UuihGa3Q+E21qIA6s
 Ekgw==
X-Gm-Message-State: AOJu0YwnyXTQTJT1tPiOfr3BM7j6KPxjx747QRTFUew4Dj8qmO5xQxqj
 WF45UXynUe2OVnfoQOd1sFVyL4I/DJYFj8XnqdLRcLo+SuoWs5wKkGfH
X-Gm-Gg: AZuq6aKAkvfnIEhz4063EfPkAHdloFEtx84XJZOzW/J50b6gf8Blg5D2SvMPo86vy4u
 XQb0URNW4KC97MXA6+TvjSuZz1AKUe301x2FYG+AH7/65aV78Kg+AuIVzeFNL2MwvOrexZcUcvX
 SJOGzsbXWfY9U8tRaPJV4XE7xPTyuUwyLBZPQ8cuMmZ29fxCxef/d+ifJUBIShhmdjw0bqYoeOH
 3AwYvXke8eF7CNidR7oZGTmR0ViyQGdTskUx9ZBp2bXlPGKwOfvUVrq0doZ0csf9pkg/uM7Ho8H
 V/fTGNB4tAC+f5220eRQrQPEkDIVVFGBFp0Uq9DmKQ8h4nb2cEojB2p1NvaUu8x+aNWOw5VuXi/
 QkbB06lUai61fzuDl1Ue9lXc+6ZzuiR6NsWvBCJmAwF6HWMVhG2+0w7HV3EODCUIcRSVnNgAZ/i
 SaONQvf/xXxTJjHpSa0lsbWQ7G37hsD+24ZaiXnCUdQxi3ojwhe03qrA==
X-Received: by 2002:a05:620a:4410:b0:8c5:3869:3f2e with SMTP id
 af79cd13be357-8cb28041564mr407145785a.42.1770821958690; 
 Wed, 11 Feb 2026 06:59:18 -0800 (PST)
Received: from [10.254.121.37] (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb2b0be7f6sm132176385a.3.2026.02.11.06.59.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Feb 2026 06:59:18 -0800 (PST)
Message-ID: <96407179-3ab9-4ba8-9b1c-171187683b41@gmail.com>
Date: Wed, 11 Feb 2026 15:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dma-buf: inline spinlock for fence protection v4
To: phasta@kernel.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-5-christian.koenig@amd.com>
 <ebfe7aa7f409513d5e04ac407700a8bbac76e948.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ebfe7aa7f409513d5e04ac407700a8bbac76e948.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: F1FB41255A9
X-Rspamd-Action: no action

On 2/11/26 10:50, Philipp Stanner wrote:
> On Tue, 2026-02-10 at 11:01 +0100, Christian König wrote:
...
>> Using a per-fence spinlock allows completely decoupling spinlock producer
>> and consumer life times, simplifying the handling in most use cases.
> 
> That's a good commit message btw, detailing what the motivation is.
> Would be great to see messages like that more frequently :]

Yeah, but they are not so easy to write.

>>  	trace_dma_fence_init(fence);
>> @@ -1091,7 +1094,7 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>   * dma_fence_init - Initialize a custom fence.
>>   * @fence: the fence to initialize
>>   * @ops: the dma_fence_ops for operations on this fence
>> - * @lock: the irqsafe spinlock to use for locking this fence
>> + * @lock: optional irqsafe spinlock to use for locking this fence
>>   * @context: the execution context this fence is run on
>>   * @seqno: a linear increasing sequence number for this context
>>   *
>> @@ -1101,6 +1104,10 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>   *
>>   * context and seqno are used for easy comparison between fences, allowing
>>   * to check which fence is later by simply using dma_fence_later().
>> + *
>> + * It is strongly discouraged to provide an external lock. This is only allowed
> 
> "strongly discouraged […] because this does not decouple lock and fence
> life times." ?

Good point, added some more text.
 
>> + * for legacy use cases when multiple fences need to be prevented from
>> + * signaling out of order.
> 
> I think our previous discussions revealed that the external lock does
> not even help with that, does it?

Well only when you provide a ->signaled() callback in the dma_fence_ops.

The reason we have so much different approaches in the dma_fence handling is because it is basically the unification multiple different driver implementations which all targeted more or less different use cases.

>> + * for legacy use cases when multiple fences need to be prevented from
>> + * signaling out of order.
>>   */
>>  void
>>  dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
>> index 02af347293d0..c49324505b20 100644
>> --- a/drivers/dma-buf/sync_debug.h
>> +++ b/drivers/dma-buf/sync_debug.h
>> @@ -47,7 +47,7 @@ struct sync_timeline {
>>  
>>  static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
>>  {
>> -	return container_of(fence->lock, struct sync_timeline, lock);
>> +	return container_of(fence->extern_lock, struct sync_timeline, lock);
> 
> You're sure that this will never have to check for the flag?

Yes, the code would have crashed before if anything than a sync_pt created by sync_pt_create was encountered here.

We could drop the wrapper, move the cast to the only place where it matters and document the why and what with a code comment.... but this is all dead code which breaks some of the fundamental dma-fence rules and it is only left here because we can't break the UAPI.
>>  static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 88c842fc35d5..6eabbb1c471c 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -34,7 +34,8 @@ struct seq_file;
>>   * @ops: dma_fence_ops associated with this fence
>>   * @rcu: used for releasing fence with kfree_rcu
>>   * @cb_list: list of all callbacks to call
>> - * @lock: spin_lock_irqsave used for locking
>> + * @extern_lock: external spin_lock_irqsave used for locking
> 
> Add a "(deprecated)" ?

Done.

> 
>> + * @inline_lock: alternative internal spin_lock_irqsave used for locking
>>   * @context: execution context this fence belongs to, returned by
>>   *           dma_fence_context_alloc()
>>   * @seqno: the sequence number of this fence inside the execution context,
>> @@ -49,6 +50,7 @@ struct seq_file;
>>   * of the time.
>>   *
>>   * DMA_FENCE_FLAG_INITIALIZED_BIT - fence was initialized
>> + * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of external one
>>   * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
>>   * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
>>   * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
>> @@ -66,7 +68,10 @@ struct seq_file;
>>   * been completed, or never called at all.
>>   */
>>  struct dma_fence {
>> -	spinlock_t *lock;
>> +	union {
>> +		spinlock_t *extern_lock;
>> +		spinlock_t inline_lock;
>> +	};
>>  	const struct dma_fence_ops __rcu *ops;
>>  	/*
>>  	 * We clear the callback list on kref_put so that by the time we
>> @@ -100,6 +105,7 @@ struct dma_fence {
>>  
>>  enum dma_fence_flag_bits {
>>  	DMA_FENCE_FLAG_INITIALIZED_BIT,
>> +	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
> 
> Just asking about a nit: what's the order here, always alphabetically?

In which the flags are used in the code flow.

>>  	DMA_FENCE_FLAG_SEQNO64_BIT,
>>  	DMA_FENCE_FLAG_SIGNALED_BIT,
>>  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>> @@ -381,11 +387,12 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>>   * dma_fence_spinlock - return pointer to the spinlock protecting the fence
>>   * @fence: the fence to get the lock from
>>   *
>> - * Return the pointer to the extern lock.
>> + * Return either the pointer to the embedded or the external spin lock.
>>   */
>>  static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
>>  {
>> -	return fence->lock;
>> +	return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
>> +		&fence->inline_lock : fence->extern_lock;
> 
> I personally am not a fan of using '?' for anything longer than 1 line
> and think that
> 
> if (condition)
>   return a;
> 
> return b;
> 
> is much better readable.

Mhm, I disagree in this particular case. Especially that you have both possibilities side by side makes it more readable I think.

Regards,
Christian.

