Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7268DC8ED20
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 15:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52B510E090;
	Thu, 27 Nov 2025 14:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZrZ1hEDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EDD10E090
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764254822;
 bh=hwKfPUK9XP5smqr1F+3cZ8XAh2eWQIcFGCqiJkJAIBA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZrZ1hEDRrH1vXJg+BizTRU77ljQ8bFu4W2AI7mzU7gHQGrpm0OLGkp81NKCA8JBgD
 gmaI5nnh5kDCQgLODBCTNyrWjNNvU0rCCfCOMtQ20IDXuzj9OAKJM8llBxFy0DKP2x
 rZ05NsmqJfA5/nF0dOiJP0x/KyEGMVzuwmgka2rvXFI6zZ8dXejo+NCUB7IzK5Qp0A
 f6A7H6778gnYjMUlnEoEmVmxLugEJCMiPq3bPhkn7nz7ooRtSHDykZfExTdJY8ll4l
 3Gb1fuydKu1h5AeKlpqPROAwu1Ac/lp8PBuEe78VvoheoVgTNFpMaVm6Q5TqoX7r+O
 wrIKWnw40p5kA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 96FA117E0ED5;
 Thu, 27 Nov 2025 15:47:01 +0100 (CET)
Date: Thu, 27 Nov 2025 15:46:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: Re: [PATCH v2 7/8] drm/panthor: Make sure we resume the tick when
 new jobs are submitted
Message-ID: <20251127154658.4b90cc57@fedora>
In-Reply-To: <CAPaKu7SDz8MjHdpEUGBmNfh6Z2EC4CB6vXo74ZzVQUOC_=9nHg@mail.gmail.com>
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
 <20251112115142.1270931-8-boris.brezillon@collabora.com>
 <CAPaKu7SDz8MjHdpEUGBmNfh6Z2EC4CB6vXo74ZzVQUOC_=9nHg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 26 Nov 2025 14:57:32 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> >  static void queue_stop(struct panthor_queue *queue,
> > @@ -3202,6 +3215,18 @@ queue_run_job(struct drm_sched_job *sched_job)
> >
> >                 group_schedule_locked(group, BIT(job->queue_idx));
> >         } else {
> > +               u32 queue_mask = BIT(job->queue_idx);
> > +               bool resume_tick = group_is_idle(group) &&
> > +                                  (group->idle_queues & queue_mask) &&
> > +                                  !(group->blocked_queues & queue_mask) &&
> > +                                  sched->resched_target == U64_MAX;  
> The logic here should be the same as the first part of
> group_schedule_locked. I wonder if we can refactor that as well.

I addressed everything you pointed out, except for this. The tests in
group_schedule_locked() are two intricated with the rest of the logic to
be easily extracted into some helper. I'm happy to review such a patch
though.

> 
> > +
> > +               /* We just added something to the queue, so it's no longer idle. */
> > +               group->idle_queues &= ~BIT(job->queue_idx);  
> group->idle_queues &= queue_mask;
> 
> > +
> > +               if (resume_tick)
> > +                       sched_resume_tick(ptdev);
> > +
> >                 gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1);
> >                 if (!sched->pm.has_ref &&
> >                     !(group->blocked_queues & BIT(job->queue_idx))) {
