Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E963B8DEF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 08:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C4B6E9C0;
	Thu,  1 Jul 2021 06:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881F26E9C0
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 06:56:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 04A511F43BBF;
 Thu,  1 Jul 2021 07:56:12 +0100 (BST)
Date: Thu, 1 Jul 2021 08:56:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 00/16] drm/panfrost
Message-ID: <20210701085608.1ae1a973@collabora.com>
In-Reply-To: <20210630062751.2832545-1-boris.brezillon@collabora.com>
References: <20210630062751.2832545-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Jun 2021 08:27:35 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> Bunch of improvements to make the panfrost driver more robust and allow
> queuing jobs at the HW level.
> 
> Changes in v6:
> * Collected acks/reviews
> * Got rid of the cancel_delayed_work() calls in the reset path
> 
> Changes in this v5:
> * Document what's excepted in the ->timedout_job() hook
> * Add a patch increasing the AS_ACTIVE polling timeout
> * Fix a few minor things here and there (see each commit for a detailed
>   changelog) and collect R-b/A-b tags
> 
> Changes in this v4:
> * fixing the reset serialization
> * fixing a deadlock in the reset path
> * moving the exception enum to a private header
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (15):
>   drm/sched: Document what the timedout_job method should do
>   drm/sched: Allow using a dedicated workqueue for the timeout/fault tdr
>   drm/panfrost: Make ->run_job() return an ERR_PTR() when appropriate
>   drm/panfrost: Get rid of the unused JS_STATUS_EVENT_ACTIVE definition
>   drm/panfrost: Drop the pfdev argument passed to
>     panfrost_exception_name()
>   drm/panfrost: Do the exception -> string translation using a table
>   drm/panfrost: Expose a helper to trigger a GPU reset
>   drm/panfrost: Use a threaded IRQ for job interrupts
>   drm/panfrost: Simplify the reset serialization logic
>   drm/panfrost: Make sure job interrupts are masked before resetting
>   drm/panfrost: Disable the AS on unhandled page faults
>   drm/panfrost: Reset the GPU when the AS_ACTIVE bit is stuck
>   drm/panfrost: Don't reset the GPU on job faults unless we really have
>     to
>   drm/panfrost: Kill in-flight jobs on FD close
>   drm/panfrost: Increase the AS_ACTIVE polling timeout
> 
> Steven Price (1):
>   drm/panfrost: Queue jobs on the hardware

Series queued to drm-misc-next.

> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   3 +-
>  drivers/gpu/drm/lima/lima_sched.c          |   3 +-
>  drivers/gpu/drm/panfrost/panfrost_device.c | 139 +++--
>  drivers/gpu/drm/panfrost/panfrost_device.h |  91 ++-
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 626 +++++++++++++++------
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    |  43 +-
>  drivers/gpu/drm/panfrost/panfrost_regs.h   |   3 -
>  drivers/gpu/drm/scheduler/sched_main.c     |  14 +-
>  drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
>  include/drm/gpu_scheduler.h                |  37 +-
>  12 files changed, 717 insertions(+), 256 deletions(-)
> 

