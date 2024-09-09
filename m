Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BF8971961
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 14:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D45B10E51B;
	Mon,  9 Sep 2024 12:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8MuItam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CA210E51D;
 Mon,  9 Sep 2024 12:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725885165; x=1757421165;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KHaICYJXR9iYmH086DbtJWq/Y7KA5lt5pMVA3G9kupU=;
 b=L8MuItamT4wKu3TG5wowcgWhINEbm/ziVr3bj2DWEPb81ZiJj4FwIYrT
 wwcKheWaK8kEh9u0RUpOeWw3TFfFgmjAKLgwAI9f1rOFKBUMMLt9fPM0q
 qSLBuoksCy3Eaa1zzf2sgDZ0bHwV6rJSz2GJp/oz0f94EDpxRv83Jugk+
 eSRLyGePXeiDkI+BpFcjKRs8N/mDzz1nS0YxwImvRTsVhxpUc7SyIDv1N
 pR6sRhqsFfSFhiijJ2UyVPO/L3jKTa74PGpN2EeXJ8IF6s8ztD6vJq7bE
 y5JL3KryKqNMthVBT+HM58lZxcHKetj70dw93zXnSgALA13J8o8dGjwC8 Q==;
X-CSE-ConnectionGUID: a6GlD5baRiSk/ifdJmRUag==
X-CSE-MsgGUID: Fg1M0jWsT9iL783bFq30pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24126536"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24126536"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 05:32:38 -0700
X-CSE-ConnectionGUID: jzJe5r/pSx+W6AfbDHI/XQ==
X-CSE-MsgGUID: TTrlGAapTvCZKONcnlwyrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="104119170"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.166.204])
 ([10.245.166.204])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 05:32:35 -0700
Message-ID: <aeeccacb-f2c0-410b-ad63-6e39705dd77e@linux.intel.com>
Date: Mon, 9 Sep 2024 14:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/4] drm/sched: Always increment correct scheduler score
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Nirmoy Das <nirmoy.das@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-4-tursulin@igalia.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240906180618.12180-4-tursulin@igalia.com>
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


On 9/6/2024 8:06 PM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Entities run queue can change during drm_sched_entity_push_job() so make
> sure to update the score consistently.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: d41a39dda140 ("drm/scheduler: improve job distribution with multiple queues")
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.9+
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 62b07ef7630a..2a910c1df072 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -586,7 +586,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  	ktime_t submit_ts;
>  
>  	trace_drm_sched_job(sched_job, entity);
> -	atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
>  
>  	/*
> @@ -612,6 +611,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  
>  		rq = entity->rq;
>  
> +		atomic_inc(rq->sched->score);
>  		drm_sched_rq_add_entity(rq, entity);
>  		spin_unlock(&entity->rq_lock);
>  
