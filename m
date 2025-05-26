Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8E7AC3A6B
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 09:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E78910E0C0;
	Mon, 26 May 2025 07:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Yf2vxTeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C6A10E0C0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748243812;
 bh=8gn5LbBQEkFULJ3ZDscL8xrfAhay13lthhQ4R2fzu6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yf2vxTeE8XB/mF1FFWc66WR7Qx5PXfcbQakmz1Hr3A271Oum7mczEEa2YMkIawEz7
 SorgTiXjXF2TUd6yeKQbDG+GMstn3OIhK53RSMngJfIfvpwD++zyrcUob1GeEtIEye
 KxLhcN9hyI2BoUHvYIShwPjp2v6Jq9/wS6g/lVQFW+bVk9k9U1DEPt/i/6pZjoV5Ib
 7qIDp+NMdFFU0KALKUk3/9SUdhKpUCB+L8za5AJFbiN0FoQmsffZgMHd10DRN1tMXA
 GGyD7R331+gRUZjc0oL1pRCyhibF7glK92b1oCb9+CXSe28zBabogMG5KqFMu5JWHg
 g2ejRWvPg+ZnA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C6B1C17E0E89;
 Mon, 26 May 2025 09:16:51 +0200 (CEST)
Date: Mon, 26 May 2025 09:16:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Ashley Smith <ashley.smith@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, kernel@collabora.com, Daniel Stone
 <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/panthor: Make the timeout per-queue instead of
 per-job
Message-ID: <20250526091646.7020bcff@collabora.com>
In-Reply-To: <CAPj87rOw2UrabPVHBw0ymJEV3LZ29vzL5KK9T2K0znoEyDYeaw@mail.gmail.com>
References: <20250523150815.3066081-1-ashley.smith@collabora.com>
 <CAPj87rOw2UrabPVHBw0ymJEV3LZ29vzL5KK9T2K0znoEyDYeaw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Sat, 24 May 2025 16:03:37 +0100
Daniel Stone <daniel@fooishbar.org> wrote:

> Hi Ashley,
> 
> On Fri, 23 May 2025 at 16:10, Ashley Smith <ashley.smith@collabora.com> wrote:
> > The timeout logic provided by drm_sched leads to races when we try
> > to suspend it while the drm_sched workqueue queues more jobs. Let's
> > overhaul the timeout handling in panthor to have our own delayed work
> > that's resumed/suspended when a group is resumed/suspended. When an
> > actual timeout occurs, we call drm_sched_fault() to report it
> > through drm_sched, still. But otherwise, the drm_sched timeout is
> > disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> > how we protect modifications on the timer.
> >
> > One issue seems to be when we call drm_sched_suspend_timeout() from
> > both queue_run_job() and tick_work() which could lead to races due to
> > drm_sched_suspend_timeout() not having a lock. Another issue seems to
> > be in queue_run_job() if the group is not scheduled, we suspend the
> > timeout again which undoes what drm_sched_job_begin() did when calling
> > drm_sched_start_timeout(). So the timeout does not reset when a job
> > is finished.
> >
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Tested-by: Daniel Stone <daniels@collabora.com>
> > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")  
> 
> Unfortunately I have to revoke my T-b as we're seeing a pile of
> failures in a CI stress test with this, e.g.
> https://gitlab.freedesktop.org/daniels/mesa/-/jobs/77004047

Note that you need [1] too, which I don't see in your tree. Ashley, a
note for next time: when you have dependencies between patches, like is
the case here, it's usually better to post them in the same patchset,
so that:

1. They are applied in the right order
2. Cherry-pickers/reviewers know that they need to consider both to
have a working branch.

Regards,

Boris

[1]https://lkml.org/lkml/2025/5/15/742
