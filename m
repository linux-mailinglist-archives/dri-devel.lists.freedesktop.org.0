Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A7DA1BA30
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 17:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA07610E9DD;
	Fri, 24 Jan 2025 16:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9A8010E9DD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 16:18:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFC38497;
 Fri, 24 Jan 2025 08:19:18 -0800 (PST)
Received: from [10.1.29.18] (e122027.cambridge.arm.com [10.1.29.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5EDF3F5A1;
 Fri, 24 Jan 2025 08:18:47 -0800 (PST)
Message-ID: <2500738a-5251-4f30-b36a-44dbfcaf0a84@arm.com>
Date: Fri, 24 Jan 2025 16:18:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] drm/panthor: Fix race condition when gathering
 fdinfo group samples
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
 <20250123225325.3271764-6-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250123225325.3271764-6-adrian.larumbe@collabora.com>
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

On 23/01/2025 22:53, Adrián Larumbe wrote:
> Commit e16635d88fa0 ("drm/panthor: add DRM fdinfo support") failed to
> protect access to groups with an xarray lock, which could lead to
> use-after-free errors.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index e6c08a694e41..1d283b4bab86 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2865,6 +2865,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>  	if (IS_ERR_OR_NULL(gpool))
>  		return;
>  
> +	xa_lock(&gpool->xa);
>  	xa_for_each(&gpool->xa, i, group) {
>  		mutex_lock(&group->fdinfo.lock);
>  		pfile->stats.cycles += group->fdinfo.data.cycles;
> @@ -2873,6 +2874,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>  		group->fdinfo.data.time = 0;
>  		mutex_unlock(&group->fdinfo.lock);
>  	}
> +	xa_unlock(&gpool->xa);
>  }
>  
>  static void group_sync_upd_work(struct work_struct *work)

