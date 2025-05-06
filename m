Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0D0AAA802
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 02:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCAB10E4A6;
	Tue,  6 May 2025 00:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Zp+seyqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 451 seconds by postgrey-1.36 at gabe;
 Tue, 06 May 2025 00:45:40 UTC
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAF210E4A6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 00:45:40 +0000 (UTC)
Date: Mon, 5 May 2025 17:37:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1746491876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M07/lP+pXzvLKJ6uRYjE6pVpy0jyE1Nr96MIfImu5yo=;
 b=Zp+seyqpmpxE6ZLjPBDYQUu3UlszR3XLBaWYn68BioqvHFuUitbsK5SpB+OVkUNtKKTAnp
 TW66J3b7O9mIVW1ddaY3Ekd7sKNTVesPbtjvZucLxh6MGdk/DeXoKxZtLMEJ1gUEuOTBho
 /LvH68sHxgYGAp4JbatDZkshM7WUIDI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org, 
 christian.koenig@amd.com, Johannes Weiner <hannes@cmpxchg.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <xa5d2zjyihtihuqu4zd63fqnwxwx57ss7rrfpiiubki3cxib25@kkgn26b2xcso>
References: <20250502034046.1625896-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502034046.1625896-1-airlied@gmail.com>
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

On Fri, May 02, 2025 at 01:35:59PM +1000, Dave Airlie wrote:
> Hey all,
> 
> This is my second attempt at adding the initial simple memcg/ttm
> integration.
> 
> This varies from the first attempt in two major ways:
> 
> 1. Instead of using __GFP_ACCOUNT and direct calling kmem charges
> for pool memory, and directly hitting the GPU statistic,

Why was the first attempt abandoned? What was the issue with the above
approach?

> Waiman
> suggested I just do what the network socket stuff did, which looks
> simpler. So this adds two new memcg apis that wrap accounting.
> The pages no longer get assigned the memcg, it's owned by the
> larger BO object which makes more sense.

The issue with this approach is that this new stat is only exposed in
memcg. For networking, there are interfaces like /proc/net/sockstat and
/proc/net/protocols which expose system wide network memory usage. I
think we should expose this new "memory used by gpus" at the system
level possibly through /proc/meminfo.

> 
> 2. Christian suggested moving it up a layer to avoid the pool business,
> this was a bit tricky, since I want the gfp flags, but I think it only
> needs some of them and it should work. One other big difference is that
> I aligned it with the dmem interaction, where it tries to get space in
> the memcg before it has even allocated any pages,

I don't understand the memcg reference in the above statement. Dmem is a
separate cgroup controller orthogonal to memcg.

> I'm not 100% sure
> this is how things should be done, but it was easier, so please let 
> me know if it is wrong.
> 
> This still doesn't do anything with evictions except ignore them,
> and I've some follows up on the old thread to discuss more on them.
> 
> Dave.
> 
