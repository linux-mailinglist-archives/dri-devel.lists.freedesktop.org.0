Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A5393CE3
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 08:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5A36F53E;
	Fri, 28 May 2021 06:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C666F53E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 06:07:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 3A47F1F43840
Subject: Re: [PATCH 0/4] drm/panfrost: Plumb cycle counters to userspace
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <997658d4-ba30-f150-7b15-183403d7ae94@collabora.com>
Date: Fri, 28 May 2021 08:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: airlied@linux.ie, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alyssa,

Will this be enough to implement GL_TIMESTAMP and GL_TIME_ELAPSED queries?

Guess the DDK implements these as WRITE_VALUE jobs, and there's also a 
soft job BASE_JD_REQ_SOFT_DUMP_CPU_GPU_TIME that I guess is used for 
glGet*(GL_TIMESTAMP). Other DRM drivers use an ioctl for that instead.

Regards,

Tomeu

On 5/27/21 10:38 PM, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> Mali has hardware cycle counters (and GPU timestamps) available for
> profiling. These are exposed in various ways:
> 
> - Kernel: As CYCLE_COUNT and TIMESTAMP registers
> - Job chain: As WRITE_VALUE descriptors
> - Shader (Midgard): As LD_SPECIAL selectors
> - Shader (Bifrost): As the LD_GCLK.u64 instruction
> 
> These form building blocks for profiling features, for example the
> ARB_shader_clock extension which accesses the counters from an
> application's shader.
> 
> The counters consume power, so it is recommended to disable the counters
> when not in use. To do so, we follow the strategy from mali_kbase: add a
> counter requirement to the job, start the counters only when required,
> and stop them as quickly as possible.
> 
> The new UABI will be used in Mesa. An implementation of ARB_shader_clock
> using this UABI is available as a pending upstream merge request [1].
> The implementation passes the relevant piglit test, validating both the
> kernel and mesa.
> 
> The main outstanding questing is the proper name. Performance monitoring
> ("PERMON") is the name used by kbase, but it's jargon-y and risks
> confusion with performance counters, an orthogonal mechanism. Cycle
> count is more descriptive and matches the actual hardware name, but
> obscures that the same mechanism is required for GPU timestamps. This
> bit of bikeshedding aside, I'm pleased with the patches.
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/merge_requests/11051
> 
> Alyssa Rosenzweig (4):
>    drm/panfrost: Add cycle counter job requirement
>    drm/panfrost: Add CYCLE_COUNT_START/STOP commands
>    drm/panfrost: Add permon acquire/release helpers
>    drm/panfrost: Handle PANFROST_JD_REQ_PERMON
> 
>   drivers/gpu/drm/panfrost/panfrost_device.h |  3 +++
>   drivers/gpu/drm/panfrost/panfrost_drv.c    | 10 +++++++---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c    | 20 ++++++++++++++++++++
>   drivers/gpu/drm/panfrost/panfrost_gpu.h    |  3 +++
>   drivers/gpu/drm/panfrost/panfrost_job.c    |  6 ++++++
>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  2 ++
>   include/uapi/drm/panfrost_drm.h            |  3 ++-
>   7 files changed, 43 insertions(+), 4 deletions(-)
> 
