Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D0F9054BD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E6910E85E;
	Wed, 12 Jun 2024 14:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="GWCZxACd";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="4jneAI5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bunu.damsy.net (bunu.damsy.net [51.159.160.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B8E10E85E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202404r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1718201166;
 bh=WzjwWXBUGQzIwx9ZMZphqlw
 4OrOmakBlGBvcv7ZXV4k=; b=GWCZxACd3F76VY/ObBibzd2BUjGyo6q2FA6Wan0xFVsR7eSe+E
 rF3obPyAaJxhMUWPGV1STGLb4NTCa0AlyAzxe4LmthCIXQ7VhvcGyGTX06OOuOeBFkAhHNCFOJY
 tF0Y3ncb3EJYF06pD1GyFSy87rDbkYG0y5YDE4kNW3ls8EZnLTsoYVwUTgm6aRjNhCveC548ZhJ
 aUDqS/uuvmTcmNGmbglTgPYNxvTJ6ewO2KKal18w/H8FuEFDK4PgaKMTSAPqo04iA8aCxNET6a3
 8aChzjg1ZO0v2WLdOTpF8Sb91I8YR4OFEjf4GxNIT78hLwUjah7e/2drMPhUwSLDwQA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202404e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1718201166; bh=WzjwWXBUGQzIwx9ZMZphqlw
 4OrOmakBlGBvcv7ZXV4k=; b=4jneAI5yz8tbvCeStLgs3YvA3uSg3CYlXNdmrRADMPuf0M9wXk
 pL7EHw9xythLhVwJyBoiWLGAa+Nedw7f2VBg==;
Message-ID: <944f62a1-0302-40e0-8dcf-ab4582976b1b@damsy.net>
Date: Wed, 12 Jun 2024 16:06:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Improve gpu_scheduler trace events
To: Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org
References: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
 <Zmcqci2xjmfp9UCo@phenom.ffwll.local>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <Zmcqci2xjmfp9UCo@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

Le 10/06/2024 à 18:31, Daniel Vetter a écrit :
 > On Mon, Jun 10, 2024 at 03:26:53PM +0200, Pierre-Eric Pelloux-Prayer 
wrote:
 >> v3: 
https://lists.freedesktop.org/archives/dri-devel/2024-June/456792.html
 >>
 >> Changes since v3:
 >> * trace device name instead of drm_device primary index
 >> * no pointer deref in the TP_printk anymore. Instead the fence 
context/seqno
 >> are saved in TP_fast_assign
 >
 > Some high-level comments:
 >
 > - Quick summary of the what, why and how in the cover letter would be
 >    great.
Oops, I forgot to copy-paste the cover letter from v3.

Here it is, maybe whe 'Why' is missing? I'll improve it for v5.
----
The main ideas implemented are: trace dependencies between jobs and
identify the GPU running jobs (because 'ring' is not a unique attribute).

Changes from v2:
* dropped all amdgpu changes. The goal here is to make the gpu_scheduler
trace events usable by a tool, without dependencies on driver-specific
events
* dropped the vblank related changes. I'll post a separate series to
cover drm/vblank events later.
* reworked fence printing so it's coherent between all events.
* added a dev_index to let the tools parsing the events which GPU is
running a job. It wasn't needed before the gpu scheduler switch to
workqueues because the queue pid was enough to identify the hardware queue.
* dropped the changes to trace the "why" of a dependency. I implemented
a version based on Sima's suggestion using xa_tag_pointer but I'm not
convinced it's really useful, so I'm dropping it for now.

Open questions:
* assuming the new fence printing format is agreed on,
should we add some code to preserve the old format?
* checkpatch doesn't like the indentation in the last patch, because
everything is vertically aligned to 'TP_fast_assign('. How to best fix it?

    WARNING: Statements should start on a tabstop
    #82: FILE: drivers/gpu/drm/scheduler/gpu_scheduler_trace.h:80:
    +        unsigned long idx;
----



 >
 > - Link to the userspace, once you have that. At least last time we 
chatted
 >    that was still wip.

Userspace is at 
https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37

Note that most of it also works fine without these patches, but some 
features will be lacking:
* job dependencies
* multi-GPU system won't work as expected on 6.8+ kernels

The tool depends on amdgpu, but the part using these events can work on 
any driver using gpu_scheduler.
I tried to use it on a RPi3 but couldn't figure out how to get the 
system to use v3d :/

I've also opened an issue in gpuvis issue tracker to get more feedback 
about these events.

 >
 > - Maybe most important to make this actually work, work well, and work
 >    long-term: I think we should clearly commit to these tracepoints being
 >    stable uapi, and document that by adding a stable tracepoint 
section in
 >    the drm uapi book.
You mean, Documentation/gpu/drm-uapi.rst?

I can send a v5 with an updated cover letter and a new patch updating 
the documentation.

Thanks,
Pierre-Eric


 >
 >    And then get acks from a pile of driver maintainers that they really
 >    think this is a good idea and has a future. Should also help with
 >    getting good review on the tracepoints themselves.
 >
 >    Otherwise I fear we'll miss the mark again and still force 
userspace to
 >    hand-roll tracing for every driver, or maybe worse, even specific 
kernel
 >    versions.
 >
 > Cheers, Sima
 >
 >>
 >> Pierre-Eric Pelloux-Prayer (3):
 >>    drm/sched: add device name to the drm_sched_process_job event
 >>    drm/sched: cleanup gpu_scheduler trace events
 >>    drm/sched: trace dependencies for gpu jobs
 >>
 >>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 97 +++++++++++++++----
 >>   drivers/gpu/drm/scheduler/sched_entity.c      |  8 +-
 >>   drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
 >>   3 files changed, 84 insertions(+), 23 deletions(-)
 >>
 >> --
 >> 2.40.1
 >>
 >
