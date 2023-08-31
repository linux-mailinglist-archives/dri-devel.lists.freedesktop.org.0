Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C665978F5FE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 01:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8921910E6FC;
	Thu, 31 Aug 2023 23:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791D210E12A;
 Thu, 31 Aug 2023 23:07:05 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E35466071C9;
 Fri,  1 Sep 2023 00:07:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693523224;
 bh=fs0FwuY9MddiJkWRrbkwal+1lyXgqjXeNjci1Mj4awQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZyvnT8Ds+wR4bYMRfM/cEC8aCY2oub6jnsiup6uCxPbvv2Ge7cQpTNzHal/BldrFb
 Ju7w3Hgmmd2qq/XfPZsGGlO+8mYU1ANR9CN/JNEVOJhLSYSq9Vo/yUceTHDR3SkdqL
 3p0Ue/ah4IlxOAaNcTDqSdZpXsUP6CTiSZ6OUDFEQoL6FxMWZCwjS9Z3rA3crffcRN
 E2zOqZAAz/5mAFVwgpiTkSqNLZLnzMEJiwf7h81KOUGpobDVqPlhsCmtVgPXkUhPzA
 TIHK8ztI1wzA8qUjgbMQQDlnHr9Dfj0pUuS3kNNzxdfzrAQP8nJKCkyRKnKGhhD8X8
 gtxIPMpxcHuDA==
Date: Fri, 1 Sep 2023 00:07:01 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 3/6] drm/panfrost: Add fdinfo support for memory stats
Message-ID: <h67vxvmhcvcccnnoqxyfukhhnokqsaqacjhhgrh7bdypyjz6so@4vcy4kwtwrzq>
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-4-adrian.larumbe@collabora.com>
 <20230830122641.78d21f94@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230830122641.78d21f94@collabora.com>
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.08.2023 12:31, Boris Brezillon wrote:
>On Thu, 24 Aug 2023 02:34:46 +0100
>Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
>> A new DRM GEM object function is added so that drm_show_memory_stats can
>> provider more accurate memory usage numbers.
>
>  s/provider/provide/
>
>> 
>> Ideally, in panfrost_gem_status, the BO's purgeable flag would be checked
>> after locking the driver's shrinker mutex, but drm_show_memory_stats takes
>> over the drm file's object handle database spinlock, so there's potential
>> for a race condition here.
>
>Yeah, I don't think it matters much if we report a BO non-purgeable,
>and this BO becomes purgeable in the meantime. You'd have the same
>problem
>
>> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/panfrost/panfrost_drv.c |  9 +++++++--
>>  drivers/gpu/drm/panfrost/panfrost_gem.c | 12 ++++++++++++
>>  drivers/gpu/drm/panfrost/panfrost_gem.h |  1 +
>>  3 files changed, 20 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index 3fd372301019..93d5f5538c0b 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -440,11 +440,14 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>>  	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
>>  
>>  	if (args->retained) {
>> -		if (args->madv == PANFROST_MADV_DONTNEED)
>> +		if (args->madv == PANFROST_MADV_DONTNEED) {
>>  			list_move_tail(&bo->base.madv_list,
>>  				       &pfdev->shrinker_list);
>> -		else if (args->madv == PANFROST_MADV_WILLNEED)
>> +			bo->is_purgable = true;
>> +		} else if (args->madv == PANFROST_MADV_WILLNEED) {
>>  			list_del_init(&bo->base.madv_list);
>> +			bo->is_purgable = false;
>
>Should we really flag the BO as purgeable if it's already been evicted
>(args->retained == false)?

I checked what msm is doing, and I guess it shouldn't be marked as purgeable after eviction.
I didn't catch this at first because Freedreno isn't using drm_gem_shmem_madvise, but apparently
tracking whether a BO was already purged through an additional MADV state.

>> +		}
>>  	}
>>  
>>  out_unlock_mappings:
>> @@ -559,6 +562,8 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>>  	struct panfrost_device *pfdev = dev->dev_private;
>>  
>>  	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
>> +
>> +	drm_show_memory_stats(p, file);
>>  }
>>  
>>  static const struct file_operations panfrost_drm_driver_fops = {
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
>> index 3c812fbd126f..aea16b0e4dda 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
>> @@ -195,6 +195,17 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
>>  	return drm_gem_shmem_pin(&bo->base);
>>  }
>>  
>> +static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
>> +{
>> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
>> +	enum drm_gem_object_status res = 0;
>> +
>> +	res |= (bo->is_purgable) ? DRM_GEM_OBJECT_PURGEABLE : 0;
>
>Why not checking bo->base.madv here instead of adding an is_purgeable
>field?

I thought it would make the meaning more clear, but I guess there's no point in
duplicating information.

>> +
>> +	res |= (bo->base.pages) ? DRM_GEM_OBJECT_RESIDENT : 0;
>
>Does it make sense to have DRM_GEM_OBJECT_PURGEABLE set when
>DRM_GEM_OBJECT_RESIDENT is not?

Freedreno's msm_gem_status seems not to care about this because drm_show_memory_stats is already
handling this situation:

	if (s & DRM_GEM_OBJECT_RESIDENT) {
		if (obj->funcs && obj->funcs->rss)
			status.resident += obj->funcs->rss(obj);
		else
			status.resident += obj->size;
	} else {
		/* If already purged or not yet backed by pages, don't
		 * count it as purgeable:
		 */
		s &= ~DRM_GEM_OBJECT_PURGEABLE;
	}

>> +
>> +	return res;
>> +}
>>  static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>>  	.free = panfrost_gem_free_object,
>>  	.open = panfrost_gem_open,
>> @@ -206,6 +217,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>>  	.vmap = drm_gem_shmem_object_vmap,
>>  	.vunmap = drm_gem_shmem_object_vunmap,
>>  	.mmap = drm_gem_shmem_object_mmap,
>> +	.status = panfrost_gem_status,
>>  	.vm_ops = &drm_gem_shmem_vm_ops,
>>  };
>>  
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> index ad2877eeeccd..e06f7ceb8f73 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> @@ -38,6 +38,7 @@ struct panfrost_gem_object {
>>  
>>  	bool noexec		:1;
>>  	bool is_heap		:1;
>> +	bool is_purgable	:1;
>>  };
>>  
>>  struct panfrost_gem_mapping {
