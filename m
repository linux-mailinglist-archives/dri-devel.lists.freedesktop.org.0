Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB727B0247A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 21:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EBB10E2E8;
	Fri, 11 Jul 2025 19:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gIP38Bs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4091010E2E8;
 Fri, 11 Jul 2025 19:22:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 73F3C61435;
 Fri, 11 Jul 2025 19:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E743C4CEED;
 Fri, 11 Jul 2025 19:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752261750;
 bh=wF36NXWOC+bCZ0vNVaO1YnU0JC4xfPBalCNaVK0lS7c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gIP38Bs7L0Qlqip4WafPrZZQewNUpI+xkM+GJcD9jjLS/ioQY6W0pRP2um091USFy
 zaC93Nsel+Kk9f2j1Ng7q3XYJX4BBmHxbmIWIY/LNDhYHH3x6K12nTXenyCr4v9jGy
 I12CbY5IltLQS1jo0WlaoTCSoF1L6EK3CcsejHOAJdEe2z9ZB0l03ctMZzXzTLrAq5
 3AN6QlzcWCdM5bMDjTMBmiwEEU0cxtGOvgmJ9/PNzgmgrOmrQGY+W+VGP7LlMA0EAe
 XuIrcHgg26W7U+Gc4JAIAZGmzjkDMcW7P9Ga2zznF75Q6YfUeI/GtXOAr3jleE7ohB
 XFiywvyXWWlUg==
Message-ID: <7df6a7ea-658a-435a-9b4e-49a3d1b4677f@kernel.org>
Date: Fri, 11 Jul 2025 21:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Avoid double re-lock on the job free path
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250711150949.48667-1-tvrtko.ursulin@igalia.com>
 <d59b7550-5833-4377-9d94-33161f375604@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <d59b7550-5833-4377-9d94-33161f375604@igalia.com>
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

On 7/11/25 9:08 PM, Maíra Canal wrote:
> Hi Tvrtko,
> 
> On 11/07/25 12:09, Tvrtko Ursulin wrote:
>> Currently the job free work item will lock sched->job_list_lock first time
>> to see if there are any jobs, free a single job, and then lock again to
>> decide whether to re-queue itself if there are more finished jobs.
>>
>> Since drm_sched_get_finished_job() already looks at the second job in the
>> queue we can simply add the signaled check and have it return the presence
>> of more jobs to be freed to the caller. That way the work item does not
>> have to lock the list again and repeat the signaled check.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>> v2:
>>   * Improve commit text and kerneldoc. (Philipp)
>>   * Rename run free work helper. (Philipp)
> 
> Maybe, would it be possible not to rename it? Otherwise, I won't be able
> to use the function name `drm_sched_run_free_queue()` in the
> DRM_GPU_SCHED_STAT_NO_HANG series.
> 
> Not a big deal, but it would ease reintroducing
> `drm_sched_run_free_queue()` if the series lands after this patch.

Do you intend to land your series through a different tree?
