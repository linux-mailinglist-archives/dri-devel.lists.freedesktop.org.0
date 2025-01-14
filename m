Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E8A10399
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 11:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB8010E0D9;
	Tue, 14 Jan 2025 10:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="GMTGqzR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593A210E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 10:06:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso60100995e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 02:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736849191; x=1737453991;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pGF7TMHXHaR607oHfuwMOmGdwtsbN6KBQI05aHXIIr0=;
 b=GMTGqzR3jT9Pd/UHquju4y7eQ1iR1Ze0ZhIkxEyEq1zwaXndDljUQhx0BtsUBvcJhP
 2xkjq53GxtvNiA66mns+UF7+92Sgn5AKmRyT3ye9JB+EYsqOrqgqEcVXD1s3pxWtEX1g
 s1dkHgaApFtRVEqMCiKCw8Dkgzh3dfjBqMeEl1kjhkH57Bnj1qh/zniPvnweTlnq74jS
 zwENcspCx2xaMMwI54OIuFrBsJeyF/DxTKb0a/e0Lo3P3EcVQhLX+EmDBQb9+Zbbe1th
 QxAO6KXH+vUbFbovkuaIRROFEsfNUDeJf02lXEONyUwoHyGrN0AZ1rVv4tOhJaC1sIhe
 DvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736849191; x=1737453991;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pGF7TMHXHaR607oHfuwMOmGdwtsbN6KBQI05aHXIIr0=;
 b=mLR+1TGnZd8rE/t6cxEBYAobwI5Teqj3tVUmIZTIwODxapl3c5p3I97X4AdGO3pixc
 qxka6hYFP1H3BSp4AGmkjb4W4WdHwaeIYdHiD1s+PRQcreH6+C9rw/0dqmcEFzpWhLQD
 suAnof1fEoA0RHQtEEVdwTDWvDpUotEDbj/NM4+JuQX+O1L+gcuT5DLPQvj8B4PJDtJq
 fuohnlcb/nsV+XaNiJqPv/S/vA8tnB5KWoq7SDVXfYIHXBWeyVj6CW2gytOTjfZfLd3x
 j1L3foS8GCOEEb8wLbfJ5dbUo1Gc359OMU63Fr8ju1yWzYQWwJ4GmrEwJr2Ar8oj2eUN
 FQoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeBaZvL27XD2jO8yCPApJCRLvTDxPodzy7wY2ZiekEwF1EZEerhVuGB/FDE71NCieRPvCqjIvqemQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbv61Jhr7h2IF4gjdplEJHj6spDlJ4jv/OgNEVbKEF6lWFZFtM
 yb7JUmJAMY358pn7qLNTrur+QpghrNoSsxLu5GpDjFLz8PBsPSNAcsFrBl7aCEY8jDPOwH5n8Um
 QBMw=
X-Gm-Gg: ASbGncusjZsdHzMxDfqIF5T9MadhF19C+K09lV22zeqHHZxKW2/od8vMgXId4DbJXQX
 ue8BQoIigYtuad/LhqOhs6s4nuybryto5cVDMfwwYZarv4xMsds6v+WrUGmkz7Uw31mwrmSvbZR
 wiiQqlzcgDcsElmIkPW+B5Qm9oeZsKn0Ylo8tyb6AfKp8Zh2H8unKY26K+8N177MFccKXYIMFGV
 nEJFsdBLEdQA925vV6xnoymmMw7jzjyNVc19DQn02OAEzCM0OjtXSUnFWR6wdCD6GocO5Kv
X-Google-Smtp-Source: AGHT+IGWES4w4Tb6wu+63wyf9qnWp7Jx1/xOJuUE2Gvti85ptNgyJwSxc+QUJW1T7B/ecjeu+k5JkQ==
X-Received: by 2002:a05:600c:3b88:b0:435:192:63fb with SMTP id
 5b1f17b1804b1-436e2686662mr209391945e9.3.1736849190773; 
 Tue, 14 Jan 2025 02:06:30 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c6dbsm14687467f8f.55.2025.01.14.02.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 02:06:30 -0800 (PST)
Message-ID: <d65088a7-1ffd-4433-afbe-f4447b90e5b4@ursulin.net>
Date: Tue, 14 Jan 2025 10:06:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/gt: Ensure irqs' status does not change with
 spin_unlock
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
References: <5fnb3l7s5hr3yfehkpvf4jgcunm6qclxagvssdobvfxbwtjiyc@jzko7kb7svud>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <5fnb3l7s5hr3yfehkpvf4jgcunm6qclxagvssdobvfxbwtjiyc@jzko7kb7svud>
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


Hi,

On 14/01/2025 09:00, Krzysztof Karas wrote:
> spin_unlock() function enables irqs regardless of their state

It doesn't, you confuse spin_unlock with spin_unlock_irq.

> before spin_lock() was called. This might result in an interrupt
> while holding a lock further down in the execution, as seen in
> GitLab issue #13399.
> 
> Try to remedy the problem by saving irq state before spin lock
> acquisition.

Please check guc_lrc_desc_unpin(). It gets called from the 
destroyed_worker_func as  hinted by lockdep in 13399. There is a plain 
spin_lock() in there (in contradiction with itself). Fixing that one may 
be all that is needed to fix this correctly.

If that turns out right then also:

Fixes: 2f2cc53b5fe7 ("drm/i915/guc: Close deregister-context race 
against CT-loss")
Cc: <stable@vger.kernel.org> # v6.9+

Regards,

Tvrtko

> 
> v2: add irqs' state save/restore calls to all locks/unlocks in
>   signal_irq_work() execution (Maciej)
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> This issue is hit rarely on CI and I was not able to reproduce
> it locally. There might be more places where we should save and
> restore irq state, so I am not adding "Closes" label for the
> issue yet.
> 
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   | 21 ++++++++++++-------
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  5 +++--
>   2 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> index cc866773ba6f..dd5542726b41 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -53,13 +53,15 @@ static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
>   
>   static void intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
>   {
> +	unsigned long flags;
> +
>   	if (!b->irq_engine)
>   		return;
>   
> -	spin_lock(&b->irq_lock);
> +	spin_lock_irqsave(&b->irq_lock, flags);
>   	if (!b->irq_armed)
>   		__intel_breadcrumbs_arm_irq(b);
> -	spin_unlock(&b->irq_lock);
> +	spin_unlock_irqrestore(&b->irq_lock, flags);
>   }
>   
>   static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
> @@ -76,10 +78,12 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
>   
>   static void intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
>   {
> -	spin_lock(&b->irq_lock);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&b->irq_lock, flags);
>   	if (b->irq_armed)
>   		__intel_breadcrumbs_disarm_irq(b);
> -	spin_unlock(&b->irq_lock);
> +	spin_unlock_irqrestore(&b->irq_lock, flags);
>   }
>   
>   static void add_signaling_context(struct intel_breadcrumbs *b,
> @@ -173,6 +177,7 @@ static void signal_irq_work(struct irq_work *work)
>   	const ktime_t timestamp = ktime_get();
>   	struct llist_node *signal, *sn;
>   	struct intel_context *ce;
> +	unsigned long flags;
>   
>   	signal = NULL;
>   	if (unlikely(!llist_empty(&b->signaled_requests)))
> @@ -226,10 +231,10 @@ static void signal_irq_work(struct irq_work *work)
>   			 * spinlock as the callback chain may end up adding
>   			 * more signalers to the same context or engine.
>   			 */
> -			spin_lock(&ce->signal_lock);
> +			spin_lock_irqsave(&ce->signal_lock, flags);
>   			list_del_rcu(&rq->signal_link);
>   			release = remove_signaling_context(b, ce);
> -			spin_unlock(&ce->signal_lock);
> +			spin_unlock_irqrestore(&ce->signal_lock, flags);
>   			if (release) {
>   				if (intel_timeline_is_last(ce->timeline, rq))
>   					add_retire(b, ce->timeline);
> @@ -254,11 +259,11 @@ static void signal_irq_work(struct irq_work *work)
>   		if (rq->engine->sched_engine->retire_inflight_request_prio)
>   			rq->engine->sched_engine->retire_inflight_request_prio(rq);
>   
> -		spin_lock(&rq->lock);
> +		spin_lock_irqsave(&rq->lock, flags);
>   		list_replace(&rq->fence.cb_list, &cb_list);
>   		__dma_fence_signal__timestamp(&rq->fence, timestamp);
>   		__dma_fence_signal__notify(&rq->fence, &cb_list);
> -		spin_unlock(&rq->lock);
> +		spin_unlock_irqrestore(&rq->lock, flags);
>   
>   		i915_request_put(rq);
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 12f1ba7ca9c1..e9102f7246f5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4338,10 +4338,11 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   static void guc_retire_inflight_request_prio(struct i915_request *rq)
>   {
>   	struct intel_context *ce = request_to_scheduling_context(rq);
> +	unsigned long flags;
>   
> -	spin_lock(&ce->guc_state.lock);
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   	guc_prio_fini(rq, ce);
> -	spin_unlock(&ce->guc_state.lock);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   }
>   
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
