Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC2BE8DA5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9062210EBF3;
	Fri, 17 Oct 2025 13:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="InUSUo1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E2F10EBF3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:31:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760707883; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cA8gQU09JcjQZz1JabcviO/KCSTGhzI+pUlI3HOMzeJBtw8UidAXTOW7dpVClxvRIjt4HrC4PiXppfAVxGiShXdquUMq8FrliaxepZSHFPNL6oMMu81CQri4tdyNBT3m+R2lDd/wJySTHFUaUxB1h/7z6aFI9VuoIalfQxGfPXE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760707883;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=x1cWuNO4XpjtKs69aIru+eH0AzOJuQ7vJ59pfMSrQtk=; 
 b=hpbKPxKpwBnUaKGnuG3teQlbKmGwU+fCCZhYcTQximUysBi746jFUu5X9QOyuYTXc6m85GfTOI181H62HILOwTFC8eKrCm1hktAt+Ks4/scYlNh1go10lLRis+kpEGMCajtjsmlds41+29+W6On7SvAPUz+0ozAI0aDxIum7/M4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760707883; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=x1cWuNO4XpjtKs69aIru+eH0AzOJuQ7vJ59pfMSrQtk=;
 b=InUSUo1Wnjhm/FeVYt/RCbklMVVSWzqHYWPhOhZlNPGiT0TmT1Pu+uW10NQpe5+D
 QNMg4reU8jabd5NxPOXtxrpGdnUJKX3J26ZKuEksgi04pxPQ04+L/a5yYPBvRVasJtH
 KzqG8liWREDo5E9gQU0sjoL3O1JO6ssAZqcnv48s=
Received: by mx.zohomail.com with SMTPS id 1760707880254267.0064007186272;
 Fri, 17 Oct 2025 06:31:20 -0700 (PDT)
Date: Fri, 17 Oct 2025 14:31:10 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v6 04/12] drm/panfrost: Handle error when allocating AS
 number
Message-ID: <p252igaqigmqo6axea35lqsy6ht67xgpu32r3hxn2t7eiqt3qd@vx6ngti3ljvw>
References: <20251015000930.356073-1-adrian.larumbe@collabora.com>
 <20251015000930.356073-5-adrian.larumbe@collabora.com>
 <f1cad54b-5f25-4a1a-9e61-c96d72ac3637@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1cad54b-5f25-4a1a-9e61-c96d72ac3637@arm.com>
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

On 17.10.2025 14:25, Steven Price wrote:
> On 15/10/2025 01:09, Adrián Larumbe wrote:
> > If we reach the beginning of the LRU AS list, then return an error.
> >
> > Reviewed-by: Steven Price <steven.price@arm.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_job.c     | 6 +++++-
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c     | 5 +++--
> >  drivers/gpu/drm/panfrost/panfrost_mmu.h     | 2 +-
> >  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 8 ++++++--
> >  4 files changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 0722f297d142..d53e9db945ad 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -217,7 +217,11 @@ static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
> >  		goto err_hwsubmit;
> >  	}
> >
> > -	cfg = panfrost_mmu_as_get(pfdev, job->mmu);
> > +	ret = panfrost_mmu_as_get(pfdev, job->mmu);
> > +	if (ret < 0)
> > +		goto err_hwsubmit;
> > +
> > +	cfg = ret;
> >
> >  	panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > index 1d696eeea2fa..cf272b167feb 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > @@ -258,7 +258,7 @@ static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
> >  	}
> >  }
> >
> > -u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
> > +int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
> >  {
> >  	int as;
> >
> > @@ -300,7 +300,8 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
> >  			if (!atomic_read(&lru_mmu->as_count))
> >  				break;
> >  		}
> > -		WARN_ON(&lru_mmu->list == &pfdev->as_lru_list);
> > +		if (WARN_ON(&lru_mmu->list == &pfdev->as_lru_list))
> > +			return -EBUSY;
>
> I was about to apply this series, but sparse told me that this is
> broken. We're holding the as_lock here, so we need to drop that before
> returning.

Thanks for catching this, I think going forward I should make a point of always running
sparse on a patch series before sending it out to the ML.

Adrian

> Thanks,
>
> Steve
>
> >
> >  		list_del_init(&lru_mmu->list);
> >  		as = lru_mmu->as;
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> > index 022a9a74a114..e6e6966a0cca 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> > @@ -16,7 +16,7 @@ void panfrost_mmu_fini(struct panfrost_device *pfdev);
> >  void panfrost_mmu_reset(struct panfrost_device *pfdev);
> >  void panfrost_mmu_suspend_irq(struct panfrost_device *pfdev);
> >
> > -u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
> > +int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
> >  void panfrost_mmu_as_put(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
> >
> >  struct panfrost_mmu *panfrost_mmu_ctx_get(struct panfrost_mmu *mmu);
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> > index 718eb44b40f8..7020c0192e18 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> > @@ -130,9 +130,11 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
> >  		goto err_vunmap;
> >  	}
> >
> > -	perfcnt->user = user;
> > +	ret = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
> > +	if (ret < 0)
> > +		goto err_vunmap;
> >
> > -	as = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
> > +	as = ret;
> >  	cfg = GPU_PERFCNT_CFG_AS(as) |
> >  	      GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_MANUAL);
> >
> > @@ -164,6 +166,8 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
> >  	/* The BO ref is retained by the mapping. */
> >  	drm_gem_object_put(&bo->base);
> >
> > +	perfcnt->user = user;
> > +
> >  	return 0;
> >
> >  err_vunmap:
