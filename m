Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC66B0387
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2383E10E5CC;
	Wed,  8 Mar 2023 09:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2171610E5CC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678269491; x=1709805491;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pZyVPEEWN847EU+VtMs2axVi8WRcs92TdSJoLK4IpVI=;
 b=aQTiBCqRO8wo3Ry/HXGBG2rSptKLDNFhgSS7Uvpp5x6N5c+3T4P0ooh0
 0Rn7gJAsyGL9US1Ao0Z5Akl4O80TtNpoNM8SKD8M/vLkjlO1CLDCVIa7x
 sh84Gc7HgdP6ch5byRsmn40pe/huE9FZzhfzVCs8B3nsnv3exMraP9z9p
 yXsuHvUHZmqPeOyhlMhImNg7VX/CQOtmqRi+i/Dnp1VFxqvzaazADJL/c
 ldII9ZSXCP6J+4k/NiTPcqpw2Ez16aHJGdq+ArX5/b9hMO5C6ee2I6It7
 ZOW2k0TR/6rzpzO4/imWHDPd9376BVF0ygNGMP1sebNVmYQpekAmhKRAq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398693148"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="398693148"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 01:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787059832"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="787059832"
Received: from lcojocar-mobl.ger.corp.intel.com (HELO [10.251.219.243])
 ([10.251.219.243])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 01:57:49 -0800
Message-ID: <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
Date: Wed, 8 Mar 2023 10:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-03-07 15:25, Asahi Lina wrote:
> drm_sched_fini() currently leaves any pending jobs dangling, which
> causes segfaults and other badness when job completion fences are
> signaled after the scheduler is torn down.
>
> Explicitly detach all jobs from their completion callbacks and free
> them. This makes it possible to write a sensible safe abstraction for
> drm_sched, without having to externally duplicate the tracking of
> in-flight jobs.
>
> This shouldn't regress any existing drivers, since calling
> drm_sched_fini() with any pending jobs is broken and this change should
> be a no-op if there are no pending jobs.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 27 +++++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 5c0add2c7546..0aab1e0aebdd 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1119,10 +1119,33 @@ EXPORT_SYMBOL(drm_sched_init);
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
>   	struct drm_sched_entity *s_entity;
> +	struct drm_sched_job *s_job, *tmp;
>   	int i;
>   
> -	if (sched->thread)
> -		kthread_stop(sched->thread);
> +	if (!sched->thread)
> +		return;
> +
> +	/*
> +	 * Stop the scheduler, detaching all jobs from their hardware callbacks
> +	 * and cleaning up complete jobs.
> +	 */
> +	drm_sched_stop(sched, NULL);
> +
> +	/*
> +	 * Iterate through the pending job list and free all jobs.
> +	 * This assumes the driver has either guaranteed jobs are already stopped, or that
> +	 * otherwise it is responsible for keeping any necessary data structures for
> +	 * in-progress jobs alive even when the free_job() callback is called early (e.g. by
> +	 * putting them in its own queue or doing its own refcounting).
> +	 */
> +	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
> +		spin_lock(&sched->job_list_lock);
> +		list_del_init(&s_job->list);
> +		spin_unlock(&sched->job_list_lock);
> +		sched->ops->free_job(s_job);
> +	}

I would stop the kthread first, then delete all jobs without spinlock 
since nothing else can race against sched_fini?

If you do need the spinlock, It would need to guard list_for_each_entry too.

> +
> +	kthread_stop(sched->thread);
>   
>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>   		struct drm_sched_rq *rq = &sched->sched_rq[i];
>
