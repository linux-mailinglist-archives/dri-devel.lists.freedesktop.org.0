Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA75979194
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 16:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4066910E040;
	Sat, 14 Sep 2024 14:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="EqFXdrlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B3410E040
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 14:44:37 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4X5Yq56Prkz9tDK;
 Sat, 14 Sep 2024 16:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1726325073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihSJ9eF4ScrNd9BOfaQDzUXZj/8RZhBWCPJuGCfS0ZQ=;
 b=EqFXdrlxdQ6rsT3KnO5yBD4xwPzuUalpJb2o2+7Ub8HK+QTu9k3ROi0oU3OxCBT8vH+By7
 xZgW2B1Z9gGQie0vzhLjixm6mbk6ZBy/Dykl9EvhUQfOzFXziUQfITgkaakZ9NtDEoyQ2Q
 fIBTx0RIirLVRKW2MMMQoE/scsQ9+cDJx020mqDrcBfR7UdL2+xbH/UHFD8Hif3Q8F5WKZ
 47HKnU+wfNSQh2yT9sXna8CSAJ1zRk/fTWdsEjsS8eTyFFzGyQFJ9bfdMVKZCiHL3g48ia
 4RaNa5lo83TzhCP4tvgJERDEbSqLgWC85jPGvhEJN/hpIHTcpVdq+9qeHiwa8A==
Message-ID: <aa44441a-fca2-476d-9ad9-c4eb69a5ae83@mailbox.org>
Date: Sat, 14 Sep 2024 16:44:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/sched: Fix dynamic job-flow control race
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Asahi Lina <lina@asahilina.net>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>, open list <linux-kernel@vger.kernel.org>
References: <20240913165326.8856-1-robdclark@gmail.com>
 <fa243d3e-abe2-47d9-928f-70e24065baf1@mailbox.org>
 <CAF6AEGtFJu5DEuA+Urv7zdrsO-zV-y0o0wQnTdGojTNjwwRqNQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <CAF6AEGtFJu5DEuA+Urv7zdrsO-zV-y0o0wQnTdGojTNjwwRqNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: y15k1xc6apq5unq74trq3f3cycbg7zzq
X-MBO-RS-ID: ee693a0b81cceefaf31
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

On 2024-09-13 19:28, Rob Clark wrote:
> On Fri, Sep 13, 2024 at 10:03 AM Michel Dänzer
> <michel.daenzer@mailbox.org> wrote:
>>
>> On 2024-09-13 18:53, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Fixes a race condition reported here: https://github.com/AsahiLinux/linux/issues/309#issuecomment-2238968609
>>>
>>> The whole premise of lockless access to a single-producer-single-
>>> consumer queue is that there is just a single producer and single
>>> consumer.  That means we can't call drm_sched_can_queue() (which is
>>> about queueing more work to the hw, not to the spsc queue) from
>>> anywhere other than the consumer (wq).
>>>
>>> This call in the producer is just an optimization to avoid scheduling
>>> the consuming worker if it cannot yet queue more work to the hw.  It
>>> is safe to drop this optimization to avoid the race condition.
>>>
>>> Suggested-by: Asahi Lina <lina@asahilina.net>
>>> Fixes: a78422e9dff3 ("drm/sched: implement dynamic job-flow control")
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index ab53ab486fe6..1af1dbe757d5 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1020,8 +1020,7 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
>>>                     struct drm_sched_entity *entity)
>>>  {
>>> -     if (drm_sched_can_queue(sched, entity))
>>> -             drm_sched_run_job_queue(sched);
>>> +     drm_sched_run_job_queue(sched);
>>>  }
>>>
>>>  /**
>>
>> The entity parameter is unused now.
> 
> Right.. and we probably should collapse drm_sched_wakeup() and
> drm_sched_run_job_queue()..

I looked into that as well, seems fine to leave them separate for now though.


> But this fix needs to be cherry picked back to a bunch of release
> branches, so I intentionally avoided refactoring as part of the fix.

Fixing up the drm_sched_wakeup caller(s) when backporting doesn't seem like a big deal.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
