Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA479D393
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 16:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F56110E231;
	Tue, 12 Sep 2023 14:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130E510E231;
 Tue, 12 Sep 2023 14:28:43 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 458EA660731A;
 Tue, 12 Sep 2023 15:28:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694528921;
 bh=3Nd0Cx1JHhlLbW4dObafjYxWAumLtuZmrxJ/jgnD9WU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e3k48OlduObXHZ4bhTq/X6t0g8YwX6Wl3y30Vcd74g6I46qWx4LYS/W2YUYL7rii6
 yX9xveG8tPsAtjaMLKCqTo6wkTk+JRoxZFJ6Qw/OH2lq/SU2mFGtoXxWJ7JGTtrFzq
 cUi6dlK/WjaLjlTbS939H7HlA1ARey3eaAM4IRcg33BeH3AJmoghRiek8V5qn/s7bl
 ZPwlO1WHYXM/gnqNjyvbaYoaWLRBxc281yYQgIHvCSF2Oap6WT2RVmorPstbtmog8g
 7qv+STd9SWPOs3kkK9fearUga8+0Gv+pnR5aJ0FfBiuOzbYhwHBv1AVbwFxGtOEyTi
 DRfp60+Qd1N9A==
Date: Tue, 12 Sep 2023 16:28:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <20230912162838.34135959@collabora.com>
In-Reply-To: <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
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
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Aug 2023 13:13:31 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> I think that's a misunderstanding. I'm not trying to say that it is 
> *always* beneficial to fill up the ring as much as possible. But I think 
> it is under certain circumstances, exactly those circumstances I 
> described for Nouveau.
> 
> As mentioned, in Nouveau the size of a job is only really limited by the 
> ring size, which means that one job can (but does not necessarily) fill 
> up the whole ring. We both agree that this is inefficient, because it 
> potentially results into the HW run dry due to hw_submission_limit == 1.
> 
> I recognize you said that one should define hw_submission_limit and 
> adjust the other parts of the equation accordingly, the options I see are:
> 
> (1) Increase the ring size while keeping the maximum job size.
> (2) Decrease the maximum job size while keeping the ring size.
> (3) Let the scheduler track the actual job size rather than the maximum 
> job size.
> 
> (1) results into potentially wasted ring memory, because we're not 
> always reaching the maximum job size, but the scheduler assumes so.
> 
> (2) results into more IOCTLs from userspace for the same amount of IBs 
> and more jobs result into more memory allocations and more work being 
> submitted to the workqueue (with Matt's patches).
> 
> (3) doesn't seem to have any of those draw backs.
> 
> What would be your take on that?
> 
> Actually, if none of the other drivers is interested into a more precise 
> way of keeping track of the ring utilization, I'd be totally fine to do 
> it in a driver specific way. However, unfortunately I don't see how this 
> would be possible.

I'm not entirely sure, but I think PowerVR is pretty close to your
description: jobs size is dynamic size, and the ring buffer size is
picked by the driver at queue initialization time. What we did was to
set hw_submission_limit to an arbitrarily high value of 64k (we could
have used something like ringbuf_size/min_job_size instead), and then
have the control flow implemented with ->prepare_job() [1] (CCCB is the
PowerVR ring buffer). This allows us to maximize ring buffer utilization
while still allowing dynamic-size jobs.

> 
> My proposal would be to just keep the hw_submission_limit (maybe rename 
> it to submission_unit_limit) and add a submission_units field to struct 
> drm_sched_job. By default a jobs submission_units field would be 0 and 
> the scheduler would behave the exact same way as it does now.
> 
> Accordingly, jobs with submission_units > 1 would contribute more than 
> one unit to the submission_unit_limit.
> 
> What do you think about that?
> 
> Besides all that, you said that filling up the ring just enough to not 
> let the HW run dry rather than filling it up entirely is desirable. Why 
> do you think so? I tend to think that in most cases it shouldn't make 
> difference.

[1]https://gitlab.freedesktop.org/frankbinns/powervr/-/blob/powervr-next/drivers/gpu/drm/imagination/pvr_queue.c#L502
