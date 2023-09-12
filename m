Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE579D0E4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 14:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351FE10E415;
	Tue, 12 Sep 2023 12:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E94E10E415;
 Tue, 12 Sep 2023 12:18:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FF826607326;
 Tue, 12 Sep 2023 13:18:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694521101;
 bh=mnP4Q6AtJQO9a5dqOec94l43iG1/sE3gl0zC4U5Bt+Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ur7Ndl838dwISncmGct52sbwJvcbRHoqFaGlO0tUlfRgCdrPUff7G9vfo7+GzA4VX
 YETJJ1j3rMpMnKWHamsx0+QeXT9qxSSStfOTaRtRKYsLSVw97aPXzhebbixRVS3dJL
 Gbi6Xelk6A9hqInA0UI82MsfTCsJl30JvHXyWib4jHWe0Vp+xsCzwuVdP6L3SJfPdp
 pXwXQZBPcOo8Umlcu5xsGTj0jDkoI+X/7rL7KREDwfSGE66MeXbJxFNG5SBIF5wrv9
 E0HNDFtEnObVngyZFroUeF3i6cGX4aN2wJ96oUZeUBZtKQQjunVfj/VHKABKHQSzv4
 MIDTwbbY8ZdDg==
Date: Tue, 12 Sep 2023 14:18:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <20230912141818.10827d1d@collabora.com>
In-Reply-To: <ZQBBgsrohAqIAppA@pollux>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
 <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
 <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
 <20230912121357.4cc10dec@collabora.com> <ZQBBgsrohAqIAppA@pollux>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, donald.robson@imgtec.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023 12:46:26 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> > I'm a bit worried that leaving this single vs multi-threaded wq
> > decision to drivers is going to cause unnecessary pain, because what
> > was previously a granted in term of run/cleanup execution order (thanks
> > to the kthread+static-drm_sched_main-workflow approach) is now subject
> > to the wq ordering guarantees, which depend on the wq type picked by
> > the driver.  
> 
> Not sure if this ends up to be much different. The only thing I could think of
> is that IIRC with the kthread implementation cleanup was always preferred over
> run.

Given the sequence in drm_sched_main(), I'd say that cleanup and run
operations are naturally interleaved when both are available, but I
might be wrong.

> With a single threaded wq this should be a bit more balanced.

With a single threaded wq, it's less clear, because each work
reschedules itself for further processing, but it's likely to be more
or less interleaved. Anyway, I'm not too worried about cleanup taking
precedence on run or the other way around, because the limited amount
of HW slots (size of the ring-buffer) will regulate that.

> 
> With a multi-threaded wq it's still the same, but run and cleanup can run
> concurrently,

What I'm worried about is that ^. I'm not saying it's fundamentally
unsafe, but I'm saying drm_sched hasn't been designed with this
concurrency in mind, and I fear we'll face subtle bugs if we go from
kthread to multi-threaded-wq+run-and-cleanup-split-in-2-work-items.

> which has the nice side effect that free_job() gets out of the
> fence signaling path. At least as long as the workqueue has max_active > 1.

Oh, yeah, I don't deny using a multi-threaded workqueue has some
benefits, just saying it might be trickier than it sounds.

> Which is one reason why I'm using a multi-threaded wq in Nouveau.

Note that I'm using a multi-threaded workqueue internally at the moment
to deal with all sort of interactions with the FW (Mali HW only has a
limited amount of scheduling slots, and we need to rotate entities
having jobs to execute so every one gets a chance to run on the GPU),
but this has been designed this way from the ground up, unlike
drm_sched_main() operations, which were mostly thought as a fixed
sequential set of operations. That's not to say it's impossible to get
right, but I fear we'll face weird/unexpected behavior if we go from
completely-serialized to multi-threaded-with-pseudo-random-processing
order.

> 
> That latter seems a bit subtile, we probably need to document this aspect of
> under which conditions free_job() is or is not within the fence signaling path.

Well, I'm not even sure it can be clearly defined when the driver is
using the submit_wq for its own work items (which can be done since we
pass an optional submit_wq when calling drm_sched_init()). Sure, having
max_active >= 2 should be enough to guarantee that the free_job work
won't block the run_job one when these are the 2 only works being
queued, but what if you have many other work items being queued by the
driver to this wq, and some of those try to acquire resv locks? Could
this prevent execution of the run_job() callback, thus preventing
signaling of fences? I'm genuinely asking, don't know enough about the
cmwq implementation to tell what's happening when work items are
blocked (might be that the worker pool is extended to unblock the
situation).

Anyway, documenting when free_job() is in the dma signalling path should
be doable (single-threaded wq), but at this point, are we not better
off considering anything called from the submit_wq as being part of the
dma signalling path, so we can accommodate with both cases. And if
there is cleanup processing that require taking dma_resv locks, I'd be
tempted to queue that to a driver-specific wq (which is what I'm doing
right now), just to be safe.
