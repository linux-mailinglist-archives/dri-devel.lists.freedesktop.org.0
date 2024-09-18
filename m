Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60CF97BE15
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 16:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DDC10E25C;
	Wed, 18 Sep 2024 14:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSs5nERF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C5C10E25C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726670508; x=1758206508;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Yb8eyRdxtOJzqhnudCaGpPOz0dj7OYCBAoyoFfQ38Hk=;
 b=kSs5nERFOt54qckCk0QAiMQfvpaqbKPCSpwZrG6Wf3HHC20CaMGW9/qx
 aWhGxXzwOyCslb1Bh05AcbDavcGdtwIHUcA+W7RQLmBmZPxp74bzlDSDl
 KlZnRqhlErKFzm/1Wtri8VVQT8l58k/WZMIC72KoSU6qmjeJNXFCAhjdd
 UyF69xee5Y1s+wVZflM146OvLswYn2vUJHhNpvffXYFgrLch+Rc/RTi24
 NEccy3U8B5weEEdKUEjkxRzEvNG5P023hs+Vhg3SIy/0WORn6Lc2qjFtA
 zeTR1FUG0OSG4uLzQW/h74lT2Dc7wkMDwgByH7AJsb6US6LUPLNuMQtZH Q==;
X-CSE-ConnectionGUID: K79z6sulQMOaqsfnIaktuA==
X-CSE-MsgGUID: GpTXEEa9Q0Wdge96wTjGYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29481692"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29481692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:41:47 -0700
X-CSE-ConnectionGUID: 9T6HdIa3QWKOL6X3194RDQ==
X-CSE-MsgGUID: 35+t4a3CSGWc8iRHW+eQzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69200353"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:41:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dakr@kernel.org,
 pstanner@redhat.com, dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
In-Reply-To: <20240918133956.26557-1-christian.koenig@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240918133956.26557-1-christian.koenig@amd.com>
Date: Wed, 18 Sep 2024 17:41:41 +0300
Message-ID: <87h6adausa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 18 Sep 2024, "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.c=
om> wrote:
> Tearing down the scheduler with jobs still on the pending list can
> lead to use after free issues. Add a warning if drivers try to
> destroy a scheduler which still has work pushed to the HW.
>
> When there are still entities with jobs the situation is even worse
> since the dma_fences for those jobs can never signal we can just
> choose between potentially locking up core memory management and
> random memory corruption. When drivers really mess it up that well
> let them run into a BUG_ON().
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index f093616fe53c..8a46fab5cdc8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct drm_gpu_scheduler *sch=
ed)
>=20=20
>  	drm_sched_wqueue_stop(sched);
>=20=20
> +	/*
> +	 * Tearing down the scheduler wile there are still unprocessed jobs can
> +	 * lead to use after free issues in the scheduler fence.
> +	 */
> +	WARN_ON(!list_empty(&sched->pending_list));

drm_WARN_ON(sched->dev, ...) would identify the device, which I presume
would be helpful in multi-GPU systems.

BR,
Jani.

> +
>  	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>  		struct drm_sched_rq *rq =3D sched->sched_rq[i];
>=20=20
>  		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list)
> +		list_for_each_entry(s_entity, &rq->entities, list) {
> +			/*
> +			 * The justification for this BUG_ON() is that tearing
> +			 * down the scheduler while jobs are pending leaves
> +			 * dma_fences unsignaled. Since we have dependencies
> +			 * from the core memory management to eventually signal
> +			 * dma_fences this can trivially lead to a system wide
> +			 * stop because of a locked up memory management.
> +			 */
> +			BUG_ON(spsc_queue_count(&s_entity->job_queue));
> +
>  			/*
>  			 * Prevents reinsertion and marks job_queue as idle,
>  			 * it will removed from rq in drm_sched_entity_fini
>  			 * eventually
>  			 */
>  			s_entity->stopped =3D true;
> +		}
>  		spin_unlock(&rq->lock);
>  		kfree(sched->sched_rq[i]);
>  	}

--=20
Jani Nikula, Intel
