Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKMuFaNugWkrGQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 04:42:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090DFD431A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 04:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2F810E4E9;
	Tue,  3 Feb 2026 03:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="abKlhYYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268DC10E4E6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 03:42:23 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-34f2a0c4574so5160054a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 19:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770090143; x=1770694943;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mQQ9Yn0qN8mFWXLqjsawjzfjPTO4eluX+BjJlD5wAq0=;
 b=abKlhYYZNHFmFSGIG9THBxUOoF3/CBbeKMZS9OedMtFtZbKcmJZTaFfXhyKYC65MUX
 4of+U54PMsg2jPptaTWe5vH4lgqhNZGFG0c6D4pHacYRu2sVw8t7kskXTP4QOoDPzjgC
 vEJy6/HwP1XP2wiFgdnHBSMfYyz0EtyKFb0d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770090143; x=1770694943;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQQ9Yn0qN8mFWXLqjsawjzfjPTO4eluX+BjJlD5wAq0=;
 b=Bq11rmBe57N9sVQUDB/WwLWI1/lz16jJA92Q6sQGrKEbnoKVNPp+AJL128fFvK4IA4
 hw31iqvgJ2goTH5846FfxNnqLnL/YWniU6feVJAYzS7nMt4Mr2bydnyfTIZEpkP9vARl
 BGvgY7Yc/Iq7dVXu9MYpfv8VHMRUM1y+9ZiEqe8kQUNVaPZQENkF+TVg/9v3StRblUyQ
 KNf317SA6QVQChWWjYYLe0x2JSbV81G8VYArcVpfsNf3Jtr73YbtBMCZsGnZ1S5yeeP7
 2uAFVlf3YrHwIRlX21s6apPgl28wPDKHGiaxHcabhaX597etft9yerdhcZTo5HRcPeJh
 7F9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2XdOPnUdhUl+sFDXaEtuPKrKur+5XlOQv9aWjiR7LEsmLbH++Sp6f1ykbZaFWLM8ek3mdt3k0L5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg45ycTou1gT+5yKyRkHNGobiqpLnGGL8FW37Gz5rpJt63Yqtz
 7B4D0RxNpeqNCFXPFtJUhfvmO499jDvZ8cNflD8HMoRAIkaWKpBS0Pqd6LAcKDdaOg==
X-Gm-Gg: AZuq6aIwtlT3ttOVXkZ/ehuKLjeMlaCBsbDV3JajywOohikxTK7/+apfRxNezoYw2rd
 EfrX08WpHN2cDQi+ljVUkiKE6pWAR59ud7ggDd1Nhsqw5hnW3NiBAd9GHIGbu9cAGCEJq3mzCOQ
 CpUm7xwPQJ1Ro+jdlpdcAsUiMAQ+bMP4Z+tzKV6ultkNw6RB3Wgaf0UxjwtgdMnrXZO7dZ9Gele
 vl/RntW66nJkxPdEDOElxpoLlhqRcOYR+ss6jNkOKyquTYeoeKyc5lsWOyZsIVzbnp5TIKVPVZi
 jszyOgFr+cteqznSFb480mSW91wCaxbu3ZDguFAdBy9IulP6Tz0Dq9ezSJr6hGwtLWVK82/dzKS
 OfkLHj/kDozBeXoK+LEF0JaZq2r0ewmVeQtKOtR3seOa9wYl/zpUEU7xT/v8yyy+EokZxOQGMCz
 UcZGr3vWbYhoMfEty8smlMrf+r28U1O78qiw7IwD3H215ofQ5nKA==
X-Received: by 2002:a17:90b:4a4e:b0:340:d578:f299 with SMTP id
 98e67ed59e1d1-3543b2dcba2mr12892974a91.3.1770090142638; 
 Mon, 02 Feb 2026 19:42:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad8e:5863:2270:6d7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3547b10364csm342726a91.10.2026.02.02.19.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 19:42:22 -0800 (PST)
Date: Tue, 3 Feb 2026 12:42:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
Message-ID: <nbk32ecg6wgdghnsr4amj5wufk4t7pavbsuqjvc6ulychjr6jh@zyyrzqbjes4i>
References: <20260127073341.2862078-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127073341.2862078-1-senozhatsky@chromium.org>
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
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tfiga@chromium.org,m:senozhatsky@chromium.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[senozhatsky@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 090DFD431A
X-Rspamd-Action: no action

On (26/01/27 16:33), Sergey Senozhatsky wrote:
> We sometimes get into a situtation where GPU hangcheck fails to
> recover GPU:
> 
> [..]
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
> [..]
> 
> The problem is that msm_job worker is blocked on gpu->lock
> 
> INFO: task ring0:155 blocked for more than 122 seconds.
> Not tainted 6.6.99-08727-gaac38b365d2c #1
> task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
> Call trace:
> __switch_to+0x108/0x208
> schedule+0x544/0x11f0
> schedule_preempt_disabled+0x30/0x50
> __mutex_lock_common+0x410/0x850
> __mutex_lock_slowpath+0x28/0x40
> mutex_lock+0x5c/0x90
> msm_job_run+0x9c/0x140
> drm_sched_main+0x514/0x938
> kthread+0x114/0x138
> ret_from_fork+0x10/0x20
> 
> which is owned by recover worker, which is waiting for DMA fences
> from a memory reclaim path, under the very same gpu->lock
> 
> INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-worker:154.
> task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
> Call trace:
> __switch_to+0x108/0x208
> schedule+0x544/0x11f0
> schedule_timeout+0x1f8/0x770
> dma_fence_default_wait+0x108/0x218
> dma_fence_wait_timeout+0x6c/0x1c0
> dma_resv_wait_timeout+0xe4/0x118
> active_purge+0x34/0x98
> drm_gem_lru_scan+0x1d0/0x388
> msm_gem_shrinker_scan+0x1cc/0x2e8
> shrink_slab+0x228/0x478
> shrink_node+0x380/0x730
> try_to_free_pages+0x204/0x510
> __alloc_pages_direct_reclaim+0x90/0x158
> __alloc_pages_slowpath+0x1d4/0x4a0
> __alloc_pages+0x9f0/0xc88
> vm_area_alloc_pages+0x17c/0x260
> __vmalloc_node_range+0x1c0/0x420
> kvmalloc_node+0xe8/0x108
> msm_gpu_crashstate_capture+0x1e4/0x280
> recover_worker+0x1c0/0x638
> kthread_worker_fn+0x150/0x2d8
> kthread+0x114/0x138
> 
> So no one can make any further progress.
> 
> Forbid recover/fault worker to enter memory reclaim (under
> gpu->lock) to address this deadlock scenario.

Gentle ping.
