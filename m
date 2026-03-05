Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIPUEVxAqWkP3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:35:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6620D84A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B239010EB91;
	Thu,  5 Mar 2026 08:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Jo4b4tkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4B210EB91
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:35:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-483a233819aso76275975e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 00:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772699735; x=1773304535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AJ7kziCJmU6DUEFzVrbnl92aleDcq4bLewZp19FKNx8=;
 b=Jo4b4tkz68UIcJ30qezHMxoPkthgAWvT3VhEIgKbG+HId/WwbA2q1+FH/E0lgs+lY4
 6bJXNYe3f9c0KkIfRdrFpFI5d1QJp3xY5q7AMqzFjZ+5Tt+PnED06FWbT+SeRP/oASjo
 BJcU6gaK5PO3YTWCuBmlAEZNbNf9Z5P9euT4mRXg0BNqufzfnuccMH7jj0QHlrM3UDKJ
 80iUQrMmbHXCWleZLSfM/RAYR/FpPj662hH8wvIFl9/2AB2wcrmaWIEihKb9UhBqB85Q
 5rqMvbfHwoUqWzzOQ8NsoghI0NbRR4LzEXjbL4frDCgs48bf7m2MBR9ydZYWdN0aJ3q2
 kJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772699735; x=1773304535;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AJ7kziCJmU6DUEFzVrbnl92aleDcq4bLewZp19FKNx8=;
 b=GacpWRk1qmicIvICXIcv7+1NoaG9TqkVMT3oGZcV9h4e16R7C3qjVVxAbzNP8GpY0p
 dBJSG3c/wWEioAOoSja4o9YuZ/XCZFEpt6WCqnuE/5UI1K+Crv38u95dahPCNOujb+zm
 t7pVk9weoySADcVGkCg06hX3gdXsX+WAXl4YdHgAMPiM9f6qRK89747Y3by/GUCMZQt9
 UsbDek2naPOfBXhpXQTIsWiZGt7+ZSdzTJ2ZvjZLZocfw+H/LRPGqZlmIjrbe84+azJh
 ldLjk1+oPpUeU2TVg0xa/FLSaDWBjQz5lwqwHVvlGyQKbtFIRfRnb6pxZYPRG6n8shLB
 WIvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0UQT32bCvrZrfHVscMx9pCo42oqAFgv6stpw2VkbRJP7Mnfx8TzWYQXjjUb3gLNF+jF+AprDDG7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrkPkChElXFE+oquslYrxHGdqOr4jm18w+Zc7ScRTlwFyI1aBE
 6f5KRpeDOEP4IRFQjuFQiA1k6s4B7vdMgMr5vz8PnTzAMUk6VWQhiYQu43tFajwY0Bo=
X-Gm-Gg: ATEYQzzGu2ny4CcqRTaT0BrqDncJHcqNd+imhvUnpd+/JfqTckaG8EHtEQJFuGIcCL7
 8BYsAvc0oGXoVtWCWenfP0tLvtdYCi8hyYvKn8MXU9jQXrUY01Pz1uhejeQ+7iOJ8ga+53H7Gt0
 pOBn0bp4JCSW8HBqdOhYQOwvHMH7R6/YcJESEVOjsymfCgkPMBt4cytyrxB3Hmw36XuVC7uk1ru
 Sh39hu6Fr9XLDHCoOAOSVaofWnc4NgaxG5j0gBh1kjd/GuUwyuit/wS7OajDIRw38y4Hr9p7MOv
 SwZdu7K45MkRxkzTxcnpUwj43+aMWY5aegmpC6O7XQb4AXVMDWKnxV1HEXj1VCOYBl11a9QxIA1
 /zs+1HUkyR/dkWjrdAdK+c+FqP0gVOzxhaXDZL2apcSZ3XxdNggBPLAPJe3KDMmCoR2Mt3y+Kg9
 WN5BWiWfeRxDT+PIG82+sWYHMhc2S5oVh9t2ItgX+X9gW8
X-Received: by 2002:a05:600c:a07:b0:47f:b737:5ce0 with SMTP id
 5b1f17b1804b1-4851988f31dmr81915425e9.23.1772699734857; 
 Thu, 05 Mar 2026 00:35:34 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb27a20sm57635465e9.9.2026.03.05.00.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 00:35:34 -0800 (PST)
Message-ID: <bbe1f0bc-60df-4930-b9ea-ab98747ea807@ursulin.net>
Date: Thu, 5 Mar 2026 08:35:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm_sched run_job and scheduling latency
To: Chia-I Wu <olvaffe@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
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
X-Rspamd-Queue-Id: AEA6620D84A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:olvaffe@gmail.com,m:intel-xe@lists.freedesktop.org,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ursulin.net:dkim,ursulin.net:mid]
X-Rspamd-Action: no action


On 04/03/2026 22:51, Chia-I Wu wrote:
> Hi,
> 
> Our system compositor (surfaceflinger on android) submits gpu jobs
> from a SCHED_FIFO thread to an RT gpu queue. However, because
> workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> to run_job can sometimes cause frame misses. We are seeing this on
> panthor and xe, but the issue should be common to all drm_sched users.
> 
> Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> meet future android requirements). It seems either workqueue needs to
> gain RT support, or drm_sched needs to support kthread_worker.
> 
> I know drm_sched switched from kthread_worker to workqueue for better

 From a plain kthread actually. Anyway, I suggested trying the 
kthread_worker approach a few times in the past but never got round 
implementing it. Not dual paths but simply replacing the workqueues with 
kthread_workers.

What is your thinking regarding how would the priority be configured? In 
terms of the default and mechanism to select a higher priority 
scheduling class.

Regards,

Tvrtko

> scaling when xe was introduced. But if drm_sched can support either
> workqueue or kthread_worker during drm_sched_init, drivers can
> selectively use kthread_worker only for RT gpu queues. And because
> drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> scaling issues.
> 
> Thoughts? Or perhaps this becomes less of an issue if all drm_sched
> users have concrete plans for userspace submissions..

