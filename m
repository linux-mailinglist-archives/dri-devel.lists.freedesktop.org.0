Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7DE9F7F24
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 17:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE52410ED39;
	Thu, 19 Dec 2024 16:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j3MQm17k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F030A10ED38;
 Thu, 19 Dec 2024 16:15:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C0E3A41D81;
 Thu, 19 Dec 2024 16:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBC5C4CECE;
 Thu, 19 Dec 2024 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734624927;
 bh=o+xdoDzhAyW5Kcho4dZEyqpLXH34N9lPGzm1TKuiaC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3MQm17kEMix4Lu1GVlZUUMFVLTUwqQcryIcm/qtFm2NNM8U/4vjVW03G+K+mEc9e
 NJ/EiQFkP0vHzEvUmdIaatL7C3LG+qtBcOpUJKHo+RB2lQ7u9jYjbZC+wT9bS5/N/L
 sI41ETeoLeRw+LFIuNc/aaaZkkBki9QgIYBHIC57pI0Ac8t3iSkTxaW63CQXfo4T6S
 poHClpo1e1tjtFTRzNq8l23DHgQEH7+8kXiqbhaT5HLM//BkOloifH5J0G7l59gw0u
 IdCLgAKdThueSRZKE3Ela/25Y124mYNGTboIcgkzE7yatR6bGQR8++aqeB7kOLopBg
 54Zf4Qfs1ofFw==
Date: Thu, 19 Dec 2024 06:15:26 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] workqueue: Do not warn when cancelling WQ_MEM_RECLAIM
 work from !WQ_MEM_RECLAIM worker
Message-ID: <Z2RGnlAUB4vsXYCi@slm.duckdns.org>
References: <20241219093030.52080-1-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241219093030.52080-1-tursulin@igalia.com>
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

On Thu, Dec 19, 2024 at 09:30:30AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> After commit
> 746ae46c1113 ("drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM")
> amdgpu started seeing the following warning:
> 
>  [ ] workqueue: WQ_MEM_RECLAIM sdma0:drm_sched_run_job_work [gpu_sched] is flushing !WQ_MEM_RECLAIM events:amdgpu_device_delay_enable_gfx_off [amdgpu]
> ...
>  [ ] Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
> ...
>  [ ] Call Trace:
>  [ ]  <TASK>
> ...
>  [ ]  ? check_flush_dependency+0xf5/0x110
> ...
>  [ ]  cancel_delayed_work_sync+0x6e/0x80
>  [ ]  amdgpu_gfx_off_ctrl+0xab/0x140 [amdgpu]
>  [ ]  amdgpu_ring_alloc+0x40/0x50 [amdgpu]
>  [ ]  amdgpu_ib_schedule+0xf4/0x810 [amdgpu]
>  [ ]  ? drm_sched_run_job_work+0x22c/0x430 [gpu_sched]
>  [ ]  amdgpu_job_run+0xaa/0x1f0 [amdgpu]
>  [ ]  drm_sched_run_job_work+0x257/0x430 [gpu_sched]
>  [ ]  process_one_work+0x217/0x720
> ...
>  [ ]  </TASK>
> 
> The intent of the verifcation done in check_flush_depedency is to ensure
> forward progress during memory reclaim, by flagging cases when either a
> memory reclaim process, or a memory reclaim work item is flushed from a
> context not marked as memory reclaim safe.
> 
> This is correct when flushing, but when called from the
> cancel(_delayed)_work_sync() paths it is a false positive because work is
> either already running, or will not be running at all. Therefore
> cancelling it is safe and we can relax the warning criteria by letting the
> helper know of the calling context.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: fca839c00a12 ("workqueue: warn if memory reclaim tries to flush !WQ_MEM_RECLAIM workqueue")
> References: 746ae46c1113 ("drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM")
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v4.5+

Applied to wq/for-6.13-fixes.

Thanks.

-- 
tejun
