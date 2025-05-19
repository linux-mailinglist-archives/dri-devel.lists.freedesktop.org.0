Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D6ABC28B
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 17:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7B110E3DD;
	Mon, 19 May 2025 15:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b3RV5Eel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B390810E3E0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 15:34:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BA688629CA;
 Mon, 19 May 2025 15:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39CBC4CEE9;
 Mon, 19 May 2025 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747668850;
 bh=DCOXc0NI85IirLGyEljEzY9WQiSNKDiEnqVOnUu/m3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b3RV5Eel0fRFAkNCz4y4TnLwMba2dLb2Z9V3fdlQQ01oIS0ksDvAylw8NW9GKVl2a
 O2/79xLZk9kPlrqpXdMvAQu91DNczO9c6ec2UIldFeR/xZSGngnGR229ZJhegd3qy2
 55INKOWUdP2EJAhpMWpfot6Vw06zEI773hwPviEC6K62wAlcpho/DeZRdW3YVcuB72
 S5KlrSck15l398iSRn1fFOR6lgjYo9tbSABI2YeXzC2JS1PWSeZIk8RF44OxXMiIlQ
 0fMxCx62syEtDCT065nvjIYn3U/yz82gCbcSfKzSJhwUuR945JSnkkHHv7vVXVzcK7
 sAROn48AzFrtQ==
Date: Mon, 19 May 2025 17:34:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 03/10] drm/sched: add device name to the
 drm_sched_process_job event
Message-ID: <aCtPbUaah-bmcEMk@pollux>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-4-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424083834.15518-4-pierre-eric.pelloux-prayer@amd.com>
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

On Thu, Apr 24, 2025 at 10:38:15AM +0200, Pierre-Eric Pelloux-Prayer wrote:
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index f56e77e7f6d0..713df3516a17 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  			     __field(uint64_t, id)
>  			     __field(u32, job_count)
>  			     __field(int, hw_job_count)
> +			     __string(dev, dev_name(sched_job->sched->dev))

Using the sched_job->sched pointer here and in other trace events implies that
the trace event must not be called before the sched_job->sched has been set,
i.e. in drm_sched_job_arm().

Please document this for the corresponding trace events.
