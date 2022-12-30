Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19B659730
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 11:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D1B10E097;
	Fri, 30 Dec 2022 10:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C55310E097;
 Fri, 30 Dec 2022 10:20:48 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 76B746602CB4;
 Fri, 30 Dec 2022 10:20:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672395646;
 bh=b2pYw7lxG1ukVjBDBJg/njDZAVpbkFm8VnwKP2v/e9w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fq1wIC7/vqAd8KBxKeXj7E2/QwU7kJ4bT49hmoKNPBh6F8+QJbZswN05QfVEiRqb7
 gqD2snPO/zEl3/OjCgu5FpQMCLHSZfpX8wbujsX0r/aiiuSStcMAeGsuFMAixT6SNb
 RyyLbajafnYs8/r4jy4P1wSQCPsbjYkqHuUNaVNAVxrNvVYxNnvJT113yTxH1DOcA8
 3HwfGx3PpcVOqXKrHXn+kvf0KB1hEzMZnw2lVPL9z3FsatYq6U8vN+IDmG5q00a8t6
 CfJNELD8o5ioFJu1pwkO2NrbzPH45wEpZYEQamTMidoBw65GhTA3FHxG3o7jROGkuv
 HkP0PzQdwHzGg==
Date: Fri, 30 Dec 2022 11:20:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 04/20] drm/sched: Convert drm scheduler to use a
 work queue rather than kthread
Message-ID: <20221230112042.2ddd1946@collabora.com>
In-Reply-To: <20221222222127.34560-5-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Matthew,

On Thu, 22 Dec 2022 14:21:11 -0800
Matthew Brost <matthew.brost@intel.com> wrote:

> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> seems a bit odd but let us explain the reasoning below.
> 
> 1. In XE the submission order from multiple drm_sched_entity is not
> guaranteed to be the same completion even if targeting the same hardware
> engine. This is because in XE we have a firmware scheduler, the GuC,
> which allowed to reorder, timeslice, and preempt submissions. If a using
> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> apart as the TDR expects submission order == completion order. Using a
> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.

Oh, that's interesting. I've been trying to solve the same sort of
issues to support Arm's new Mali GPU which is relying on a FW-assisted
scheduling scheme (you give the FW N streams to execute, and it does
the scheduling between those N command streams, the kernel driver
does timeslice scheduling to update the command streams passed to the
FW). I must admit I gave up on using drm_sched at some point, mostly
because the integration with drm_sched was painful, but also because I
felt trying to bend drm_sched to make it interact with a
timeslice-oriented scheduling model wasn't really future proof. Giving
drm_sched_entity exlusive access to a drm_gpu_scheduler probably might
help for a few things (didn't think it through yet), but I feel it's
coming short on other aspects we have to deal with on Arm GPUs. Here
are a few things I noted while working on the drm_sched-based PoC:

- The complexity to suspend/resume streams and recover from failures
  remains quite important (because everything is still very asynchronous
  under the hood). Sure, you don't have to do this fancy
  timeslice-based scheduling, but that's still a lot of code, and
  AFAICT, it didn't integrate well with drm_sched TDR (my previous
  attempt at reconciling them has been unsuccessful, but maybe your
  patches would help there)
- You lose one of the nice thing that's brought by timeslice-based
  scheduling: a tiny bit of fairness. That is, if one stream is queuing
  a compute job that's monopolizing the GPU core, you know the kernel
  part of the scheduler will eventually evict it and let other streams
  with same or higher priority run, even before the job timeout
  kicks in.
- Stream slots exposed by the Arm FW are not exactly HW queues that run
  things concurrently. The FW can decide to let only the stream with the
  highest priority get access to the various HW resources (GPU cores,
  tiler, ...), and let other streams starve. That means you might get
  spurious timeouts on some jobs/sched-entities while they didn't even
  get a chance to run.

So overall, and given I'm no longer the only one having to deal with a
FW scheduler that's designed with timeslice scheduling in mind, I'm
wondering if it's not time to design a common timeslice-based scheduler
instead of trying to bend drivers to use the model enforced by
drm_sched. But that's just my 2 cents, of course.

Regards,

Boris
