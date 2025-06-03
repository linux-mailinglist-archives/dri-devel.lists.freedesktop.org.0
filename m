Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F8ACC69D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAFE10E002;
	Tue,  3 Jun 2025 12:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="moYHNIfQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8829E10E002;
 Tue,  3 Jun 2025 12:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3R4jvd6JYkZHXfkzmmFwAMxCRYwFoMqOrLZIQkaTPxE=; b=moYHNIfQIoN8CK1g/hcybM5tuo
 o4MPAARPnntUblpOUGgjxW5AajPumT+Oq0L38C9Uo+KK1wZb6iAk1+REG0qSEug147hKkuRuVgG/8
 I/rQGkLcS6NpmbxBmGpR2voROPO3yIwpNWdltMfwMjV7NpuzXDaeVEjGHPsBlVcaGyvhaQqLgpio0
 /l4ZwZlx2c827MLMGqObG9Dxp3xwiXtgImWl79FgLpJH+JjMK2bbiLQDFIJtPUPVO1ibFpZFB+Iat
 G2stxWCnxQqAS4fGB5HTsw1a2lNUcho3sN11RKqpR/7oQ1BAU/ELWo44oVgQtt0e9WuSGP5/C3/D8
 51u3WPgQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uMQjo-00Gfg8-3b; Tue, 03 Jun 2025 14:27:28 +0200
Message-ID: <fae980fa-e173-4921-90e2-6a4f6b8833a8@igalia.com>
Date: Tue, 3 Jun 2025 13:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] drm/sched: Avoid memory leaks by canceling
 job-by-job
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250603093130.100159-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250603093130.100159-2-phasta@kernel.org>
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


On 03/06/2025 10:31, Philipp Stanner wrote:
> An alternative version to [1], based on Tvrtko's suggestion from [2].
> 
> I tested this for Nouveau. Works.
> 
> I'm having, however, bigger problems properly porting the unit tests and
> have seen various explosions. In the process I noticed that some things
> in the unit tests aren't right and a bit of a larger rework will be
> necessary (for example, the timedout job callback must signal the
> timedout fence, remove it from the list and so on).

General approach I follow when implementing any mock component is to 
implement only as much is needed for a test to pass. Only add more and 
rework when a test/functionality is added which requires it.

Specifically for timedout callback signaling I see that I had exactly 
that added in the patch you linked as [2].
  > Anyways. Please comment on the general idea.

I am obviously okay with it. :) Especially now that you verified it 
works well for nouveau.

What I am not that ecstatic about is only getting the Suggested-by 
credit in 1/6. Given it is basically my patch with some cosmetic changes 
like the kernel doc and the cancel loop extracted to a helper.

> @Tvrtko: As briefly brainstormed about on IRC, if you'd be willing to
> take care of the unit tests patch, I could remove that one (and,
> maaaaybe, the warning print patch) from the series and we could merge
> this RFC's successor version %N once it's ready. What do you think?

Okay in principle but the first thing I would suggest you could try is 
to take my unit tests adaptations from [2] verbatim. Benefit of keeping 
everything in one series is more confidence we are merging a solid 
thing. But I can take it on myself as a follow up too if you want.

Regards,

Tvrtko

> 
> P.
> 
> [1] https://lore.kernel.org/dri-devel/20250522082742.148191-2-phasta@kernel.org/
> [2] https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/
> 
> Philipp Stanner (6):
>    drm/sched: Avoid memory leaks with cancel_job() callback
>    drm/sched/tests: Implement cancel_job()
>    drm/sched: Warn if pending list is not empty
>    drm/nouveau: Make fence container helper usable driver-wide
>    drm/nouveau: Add new callback for scheduler teardown
>    drm/nouveau: Remove waitque for sched teardown
> 
>   drivers/gpu/drm/nouveau/nouveau_fence.c       | 35 +++++----
>   drivers/gpu/drm/nouveau/nouveau_fence.h       |  7 ++
>   drivers/gpu/drm/nouveau/nouveau_sched.c       | 35 +++++----
>   drivers/gpu/drm/nouveau/nouveau_sched.h       |  9 +--
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  8 +--
>   drivers/gpu/drm/scheduler/sched_main.c        | 37 ++++++----
>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 71 +++++++------------
>   drivers/gpu/drm/scheduler/tests/sched_tests.h |  4 +-
>   include/drm/gpu_scheduler.h                   |  9 +++
>   9 files changed, 115 insertions(+), 100 deletions(-)
> 

