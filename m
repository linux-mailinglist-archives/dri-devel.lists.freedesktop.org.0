Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF013B03851
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6145510E40A;
	Mon, 14 Jul 2025 07:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EhlMU/ff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D5010E40A;
 Mon, 14 Jul 2025 07:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kNu4ciieAmVmAX384OtVQLrQgqSzLa9OpQru6nvVToo=; b=EhlMU/ffNzflSw2pPjbrPmm/Lj
 HalTnHmRgc/U0t3I4LYq3cfve7s977052+w4xCz+GAVwh6C4IcXsxNf+wqvWpOhbYbwylY4xugFxo
 MRYixr7T7DqrlY8uoYIaGOjmVV9YcdlqPnypHHHbkQT0EBrVWCkTVDxFkeakIWGP98qivAbvhFH1p
 O/m6OTOp6QmbhsEBcawK4zUHJEi0R5GeHENdPmsvuCgjp5PFDeIyDnnSwPo8AMLc0iyuhYsohNig+
 5L9N9rxpK/w3wCRBG4KW06XReAgThlt4DjYwInPe+QB1LpSSXGhou3tex0jZ3UJVQ7PpEBaCwmxbr
 5XlgLpcQ==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ubDzh-00GKBw-VX; Mon, 14 Jul 2025 09:53:02 +0200
Message-ID: <bb726035-6dd3-4d18-90f4-bd6a890b6c23@igalia.com>
Date: Mon, 14 Jul 2025 08:53:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Avoid double re-lock on the job free path
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250711150949.48667-1-tvrtko.ursulin@igalia.com>
 <d59b7550-5833-4377-9d94-33161f375604@igalia.com>
 <7df6a7ea-658a-435a-9b4e-49a3d1b4677f@kernel.org>
 <c3e224e6-cb88-405b-9008-62d0ef26a1fe@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c3e224e6-cb88-405b-9008-62d0ef26a1fe@igalia.com>
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


On 12/07/2025 14:12, Maíra Canal wrote:
> Hi Danilo,
> 
> On 7/11/25 16:22, Danilo Krummrich wrote:
>> On 7/11/25 9:08 PM, Maíra Canal wrote:
>>> Hi Tvrtko,
>>>
>>> On 11/07/25 12:09, Tvrtko Ursulin wrote:
>>>> Currently the job free work item will lock sched->job_list_lock 
>>>> first time
>>>> to see if there are any jobs, free a single job, and then lock again to
>>>> decide whether to re-queue itself if there are more finished jobs.
>>>>
>>>> Since drm_sched_get_finished_job() already looks at the second job 
>>>> in the
>>>> queue we can simply add the signaled check and have it return the 
>>>> presence
>>>> of more jobs to be freed to the caller. That way the work item does not
>>>> have to lock the list again and repeat the signaled check.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>> v2:
>>>>   * Improve commit text and kerneldoc. (Philipp)
>>>>   * Rename run free work helper. (Philipp)
>>>
>>> Maybe, would it be possible not to rename it? Otherwise, I won't be able
>>> to use the function name `drm_sched_run_free_queue()` in the
>>> DRM_GPU_SCHED_STAT_NO_HANG series.
>>>
>>> Not a big deal, but it would ease reintroducing
>>> `drm_sched_run_free_queue()` if the series lands after this patch.
>>
>> Do you intend to land your series through a different tree?
> 
> No, I plan to land my series in drm-misc-next. I'm just waiting our
> discussion with König to settle down before pushing it. However, if
> Tvrtko doesn't mind, we can arrange to push this patch after my series.
> 
> But again, not a big deal, I can rebase it later.

Your series has more patches, and is more important, so I am fine to 
wait a few days and rebase after you land it.

Regards,

Tvrtko

