Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6F9D2755
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A370510E64A;
	Tue, 19 Nov 2024 13:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="LWJzjkjH";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="iZglcV0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A94210E64A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732024119;
 bh=uxPYMz50tQtYPkam2Dzp47t
 dHrab6uocPajZdktbKp4=; b=LWJzjkjHJ6revrprsL69YxT3f5VMeLvfF5xSw/vZl8NeUJJAUc
 eufj+AMGCZNan1Bp9YiP5p93pF098sxgDa/bspVPkJamyC0lVGmLB5SGgLp59lp6/hjuL85hE5O
 GPA9FU4EMuQVcMmT3jv4ydmW8QdmE1t6vWqGMun2k07BAfV44IOlSLaIg989c1WdwHZE3fhUG+Z
 QLkq5mKqPKI9VZAAkCHv5N7cm53KK3ZQJty8KuJctK+OdebqDlS34XqnmaSLBJhmA1mqhsWhbhU
 xlRTUmmqO6Vs495PymNr7GgWIRfvoBSmd0a/fIqwPl7Fauasf9hzk3Y85GmfYuUsocw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732024119; bh=uxPYMz50tQtYPkam2Dzp47t
 dHrab6uocPajZdktbKp4=; b=iZglcV0RKFP5rx7rHK5I0mKvV5o9/EVA9tKVh+MaiuRTSzxZin
 fpX51SZXC/yo58tAumklf9ymk705jfKO5LDA==;
Message-ID: <efea9c76-b250-4d05-9206-8b82df3c7478@damsy.net>
Date: Tue, 19 Nov 2024 14:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/sched: store the drm client_id in
 drm_sched_fence
To: Steven Price <steven.price@arm.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org, l.stach@pengutronix.de, matt.coster@imgtec.com,
 frank.binns@imgtec.com, yuq825@gmail.com, robdclark@gmail.com,
 kherbst@redhat.com, lyude@redhat.com, boris.brezillon@collabora.com,
 mwen@igalia.com, mcanal@igalia.com, thomas.hellstrom@linux.intel.com,
 tvrtko.ursulin@igalia.com
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-3-pierre-eric.pelloux-prayer@amd.com>
 <ac489a34-08c6-4454-9e94-16a0bb3d18ad@arm.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <ac489a34-08c6-4454-9e94-16a0bb3d18ad@arm.com>
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



Le 15/11/2024 à 13:23, Steven Price a écrit :
> On 14/11/2024 10:01, Pierre-Eric Pelloux-Prayer wrote:
>> This will be used in a later commit to trace the drm client_id in
>> some of the gpu_scheduler trace events.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c   |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  3 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c      |  8 +++++---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h      |  3 ++-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  2 +-
>>   drivers/gpu/drm/imagination/pvr_job.c        |  2 +-
>>   drivers/gpu/drm/imagination/pvr_queue.c      |  5 +++--
>>   drivers/gpu/drm/imagination/pvr_queue.h      |  2 +-
>>   drivers/gpu/drm/lima/lima_gem.c              |  2 +-
>>   drivers/gpu/drm/lima/lima_sched.c            |  6 ++++--
>>   drivers/gpu/drm/lima/lima_sched.h            |  3 ++-
>>   drivers/gpu/drm/msm/msm_gem_submit.c         |  8 +++++---
>>   drivers/gpu/drm/nouveau/nouveau_sched.c      |  3 ++-
>>   drivers/gpu/drm/panfrost/panfrost_drv.c      |  2 +-
>>   drivers/gpu/drm/scheduler/sched_fence.c      |  4 +++-
>>   drivers/gpu/drm/scheduler/sched_main.c       |  6 ++++--
>>   drivers/gpu/drm/v3d/v3d_submit.c             |  2 +-
>>   drivers/gpu/drm/xe/xe_sched_job.c            |  3 ++-
>>   include/drm/gpu_scheduler.h                  | 12 ++++++++++--
>>   19 files changed, 51 insertions(+), 27 deletions(-)
> 
> panthor appears to be missing from this list and it has two calls to
> drm_sched_job_init().

Indeed, I missed it.

Thanks,
Pierre-Eric

> 
> I haven't checked if there any others missing.
> 
> Steve
