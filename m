Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A706078F4B5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 23:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC18010E6F2;
	Thu, 31 Aug 2023 21:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8FA10E6F2;
 Thu, 31 Aug 2023 21:34:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A778D660729F;
 Thu, 31 Aug 2023 22:34:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693517693;
 bh=Tr8cyPxFm6NZJjvBVjrX3JuZaQwyE6Fdkowrsree0xs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mn8k0oE/cQXiOiLUmMg2x4XuYG4KUdEds/qopnG47Q0gRnUUy59Ft3CrIFpPexG6c
 pWwEICfNLvNY4CR5bCqciVW+I8/LQcmeEyykG4yVKoHnpiDlUTwSgrRfi9G1/DmCF8
 i738yfgmrKIpxvNrmISsjPxyGgM5PWMZ+G+4/KkU1Lx1fzhYhr8tSOSjeePBAFzBQG
 QY9RoHaPuaJ+2Bsv++Pw3r1yW8c4bNOIeZsjnV4c2QJUGlDMtQvIRUzaFwaK836cW2
 EPog7es5q68Rc0HglgV/cpVdQhwU7+nYrqINO1tVsFEq+MTmPi1QWeDIT3Fx14U5IF
 m5xCT2YI6DK1g==
Date: Thu, 31 Aug 2023 22:34:51 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/6] drm/panfrost: Add fdinfo support GPU load metrics
Message-ID: <enzglusbu4anwaqyalsyan3bfzecbpxttnq5v2o65hun4foj7s@ql5byzj6krk2>
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-3-adrian.larumbe@collabora.com>
 <23f38307-3246-28a9-f396-5660acb21a18@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23f38307-3246-28a9-f396-5660acb21a18@arm.com>
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
Cc: kernel@collabora.com, tzimmermann@suse.de, sean@poorly.run,
 quic_abhinavk@quicinc.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.08.2023 16:54, Steven Price wrote:
>On 24/08/2023 02:34, Adrián Larumbe wrote:
>> The drm-stats fdinfo tags made available to user space are drm-engine,
>> drm-cycles, drm-max-freq and drm-curfreq, one per job slot.
>> 
>> This deviates from standard practice in other DRM drivers, where a single
>> set of key:value pairs is provided for the whole render engine. However,
>> Panfrost has separate queues for fragment and vertex/tiler jobs, so a
>> decision was made to calculate bus cycles and workload times separately.
>> 
>> Maximum operating frequency is calculated at devfreq initialisation time.
>> Current frequency is made available to user space because nvtop uses it
>> when performing engine usage calculations.
>> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 ++++
>>  drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ++
>>  drivers/gpu/drm/panfrost/panfrost_device.h  | 13 ++++++
>>  drivers/gpu/drm/panfrost/panfrost_drv.c     | 45 ++++++++++++++++++++-
>>  drivers/gpu/drm/panfrost/panfrost_job.c     | 30 ++++++++++++++
>>  drivers/gpu/drm/panfrost/panfrost_job.h     |  4 ++
>>  6 files changed, 102 insertions(+), 1 deletion(-)
>> 
>
>[...]
>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index a2ab99698ca8..3fd372301019 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -267,6 +267,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>>  	job->requirements = args->requirements;
>>  	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
>>  	job->mmu = file_priv->mmu;
>> +	job->priv = file_priv;
>>  
>>  	slot = panfrost_job_get_slot(job);
>>  
>> @@ -483,6 +484,14 @@ panfrost_open(struct drm_device *dev, struct drm_file *file)
>>  		goto err_free;
>>  	}
>>  
>> +	snprintf(panfrost_priv->fdinfo.engines[0].name, MAX_SLOT_NAME_LEN, "frg");
>> +	snprintf(panfrost_priv->fdinfo.engines[1].name, MAX_SLOT_NAME_LEN, "vtx");
>> +#if 0
>> +	/* Add compute engine in the future */
>> +	snprintf(panfrost_priv->fdinfo.engines[2].name, MAX_SLOT_NAME_LEN, "cmp");
>> +#endif
>
>I'm not sure what names are best, but slot 2 isn't actually a compute slot.
>
>Slot 0 is fragment, that name is fine.
>
>Slot 1 and 2 are actually the same (from a hardware perspective) but the
>core affinity of the two slots cannot overlap which means you need to
>divide the GPU in two to usefully use both slots. The only GPU that this
>actually makes sense for is the T628[1] as it has two (non-coherent)
>core groups.
>
>The upshot is that slot 1 is used for all of vertex, tiling and compute.
>Slot 2 is currently never used, but kbase will use it only for compute
>(and only on the two core group GPUs).

I think I might've be rushed to draw inspiration for this from a comment in panfrost_job.c:

int panfrost_job_get_slot(struct panfrost_job *job)
{
	/* JS0: fragment jobs.
	 * JS1: vertex/tiler jobs
	 * JS2: compute jobs
	 */
         [...]
}

Maybe I could rename the engine names to "fragment", "vertex-tiler" and "compute-only"?
There's no reason why I would skimp on engine name length, and anything more
descriptive would be just as good.

>Personally I'd be tempted to call them "slot 0", "slot 1" and "slot 2" -
>but I appreciate that's not very helpful to people who aren't intimately
>familiar with the hardware ;)

The downside of this is that both IGT's fdinfo library and nvtop will use the
engime name for display, and like you said these numbers might mean nothing to
someone who isn't acquainted with the hardware.

>Steve
>
>[1] And technically the T608 but that's even rarer and the T60x isn't
>(yet) supported by Panfrost.
