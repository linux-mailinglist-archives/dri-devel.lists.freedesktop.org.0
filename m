Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C27AFB50E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1700410E495;
	Mon,  7 Jul 2025 13:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jLkNWj/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D137810E495;
 Mon,  7 Jul 2025 13:47:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2AC8861460;
 Mon,  7 Jul 2025 13:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82BEC4CEF4;
 Mon,  7 Jul 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751896051;
 bh=NkJ28C6WWVMhFFn2trWWf6jY+uHY6XH7e1z7DoddFtA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jLkNWj/eSCL6Op2B7n+OrHoC1annBvQxj4QC8Z6bqxoENFIw5wQA0O/ujXkebp7DQ
 YORxsB710egtIKAPSJxQP3v77rtnW8nU9vYiDabPH2OJiMdMQarG50yNOZSaCIyvo7
 AqSkt31ClNyES1eafiZBXFgOW/IO6dDf9YLbtPYlkGRJLNTqMDi6Rd2chTfH6MZkE0
 SBmXJhRPCOqdksUpsIFDRhw09NGKnC6yd69eIwJZeTwCoXd1+Y1LhTRVUbu6XbglOH
 O0W9AB6sVUJsjlbEfPoWnswdFLbqHax8E5zzoaOg+2M2aNo+XmyVnDep/y/X1JrmIn
 HjZrl3Jo8HsUQ==
Message-ID: <89b0a4bf-2a66-4610-93d2-8f2f096592a3@kernel.org>
Date: Mon, 7 Jul 2025 15:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/nouveau: Remove waitque for sched teardown
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250707134221.34291-2-phasta@kernel.org>
 <20250707134221.34291-9-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250707134221.34291-9-phasta@kernel.org>
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

On 7/7/25 3:42 PM, Philipp Stanner wrote:
> struct nouveau_sched contains a waitque needed to prevent
> drm_sched_fini() from being called while there are still jobs pending.
> Doing so so far would have caused memory leaks.
> 
> With the new memleak-free mode of operation switched on in
> drm_sched_fini() by providing the callback
> nouveau_sched_fence_context_kill() the waitque is not necessary anymore.
> 
> Remove the waitque.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Doesn't this break the driver until fixed up by the subsequent patch?

