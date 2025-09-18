Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FB9B84EF1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAAA10E8C1;
	Thu, 18 Sep 2025 13:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E95B610E8C1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:58:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44B731A25;
 Thu, 18 Sep 2025 06:58:41 -0700 (PDT)
Received: from [10.1.32.53] (e122027.cambridge.arm.com [10.1.32.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 414293F673;
 Thu, 18 Sep 2025 06:58:48 -0700 (PDT)
Message-ID: <8434d14e-827d-4652-b4f8-06e2aa4caa41@arm.com>
Date: Thu, 18 Sep 2025 14:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Introduce Panfrost JM contexts
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
References: <20250917191859.500279-1-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250917191859.500279-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 17/09/2025 20:18, Adrián Larumbe wrote:
> This patch series brings the notion of JM contexts into Panfrost.
> UM will be able to create contexts, get a handle for them and attach
> it to a job submission. Contexts describe basic HW resource assignment
> to jobs, but at the moment that includes priorities only.
> 
> There's a MR for a Mesa commit series that makes use of these changes:
> https://lore.kernel.org/dri-devel/20250904001054.147465-1-adrian.larumbe@collabora.com/
> 
> Discussion of the previous patch series revision can be found at:
> https://lore.kernel.org/dri-devel/20250912132002.304187-1-adrian.larumbe@collabora.com/

Pushed to drm-misc-next.

Thanks,
Steve

> 
> Changelog:
> v4:
>  - Iterate over all the indices for the scheduler entity array when creating,
>  releasing or otherwise destroying a job context, in case someone would want to
>  implement compute support in the future.
>  - Add R-b tags to other patches.
> v3:
>  - Cut down number of available contexts per file to 64.
>  - Conservatively restored JS thread priority back to 8.
>  - Rework of the context destruction and scheduler entity release
>  logic to avoid races and that no new jobs are run after ctx destruction.
>  - Refactor privilege checks when allowing high context priorities.
>  - Checked that uapi struct padding fields are zeroed in ioctls
> 
> v2:
>  - Core and L2 cache affinities are not longer part of the context uAPI
>  - Individual JS priorites are no longer possible, and the same context
>  priority is applied onto all the JS and scheduler entities.
>  - Minor changes in the debugfs knob to reflect all the above.
> 
> Boris Brezillon (4):
>   drm/panfrost: Introduce uAPI for JM context creation
>   drm/panfrost: Introduce JM contexts for manging job resources
>   drm/panfrost: Expose JM context IOCTLs to UM
>   drm/panfrost: Display list of device JM contexts over debugfs
> 
>  drivers/gpu/drm/panfrost/panfrost_device.h |  11 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 150 +++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 195 +++++++++++++++++----
>  drivers/gpu/drm/panfrost/panfrost_job.h    |  25 ++-
>  include/uapi/drm/panfrost_drm.h            |  50 ++++++
>  5 files changed, 391 insertions(+), 40 deletions(-)
> 
> 
> base-commit: a3ae3384be7704fcf41279f13190bd8a11204bea
> --
> 2.51.0

