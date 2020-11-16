Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF62B4C89
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6B989C5E;
	Mon, 16 Nov 2020 17:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24E889C5E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:20:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605547217; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=891TLTq9X1+ikAVna/l6QbpmQq9NUBJi7SHWorFz7n8=;
 b=l4jzEmFbpua0Osy8EuaqxYBt5NvqDCCIQaVUkqGaSRmsDNayCQqHcAYhTgkkV1V7M8uyXQl6
 cgS4ZrtXehZIvWdtWUemsMWvwDF8oK1dP2eDlFVxn0MSpxMbFygBjQtTBcoGN48AwC4C1CGI
 NCfnyFAXBdYnxOabiNo9zjOXFKY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fb2b4cfc3c3b09004ccc78a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 17:20:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 37DCEC43460; Mon, 16 Nov 2020 17:20:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A0641C433C6;
 Mon, 16 Nov 2020 17:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A0641C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 16 Nov 2020 10:20:09 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/shrinker: Only iterate dontneed objs
Message-ID: <20201116172009.GB16856@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20201114193010.753355-1-robdclark@gmail.com>
 <20201114193010.753355-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114193010.753355-4-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 11:30:10AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where the GPU is mostly idle, all or nearly all buffer
> objects will be in the inactive list.  But if the system is under memory
> pressure (from something other than GPU), we could still get a lot of
> shrinker calls.  Which results in traversing a list of thousands of objs
> and in the end finding nothing to shrink.  Which isn't so efficient.
> 
> Instead split the inactive_list into two lists, one inactive objs which
> are shrinkable, and a second one for those that are not.  This way we
> can avoid traversing objs which we know are not shrinker candidates.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_debugfs.c      |  3 ++-
>  drivers/gpu/drm/msm/msm_drv.c          |  3 ++-
>  drivers/gpu/drm/msm/msm_drv.h          |  8 +++---
>  drivers/gpu/drm/msm/msm_gem.c          | 34 ++++++++++++++++++++------
>  drivers/gpu/drm/msm/msm_gem_shrinker.c |  7 +++---
>  5 files changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 64afbed89821..85ad0babc326 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -124,7 +124,8 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
>  	}
>  
>  	seq_printf(m, "Inactive Objects:\n");
> -	msm_gem_describe_objects(&priv->inactive_list, m);
> +	msm_gem_describe_objects(&priv->inactive_dontneed, m);
> +	msm_gem_describe_objects(&priv->inactive_willneed, m);
>  
>  	mutex_unlock(&priv->mm_lock);
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 4d808769e6ed..39a54f364aa8 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -465,7 +465,8 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>  
>  	priv->wq = alloc_ordered_workqueue("msm", 0);
>  
> -	INIT_LIST_HEAD(&priv->inactive_list);
> +	INIT_LIST_HEAD(&priv->inactive_willneed);
> +	INIT_LIST_HEAD(&priv->inactive_dontneed);
>  	mutex_init(&priv->mm_lock);
>  
>  	/* Teach lockdep about lock ordering wrt. shrinker: */
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index f869ed67b5da..ed18c5bed10f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -175,8 +175,9 @@ struct msm_drm_private {
>  	struct msm_perf_state *perf;
>  
>  	/*
> -	 * List of inactive GEM objects.  Every bo is either in the inactive_list
> -	 * or gpu->active_list (for the gpu it is active on[1])
> +	 * Lists of inactive GEM objects.  Every bo is either in one of the
> +	 * inactive lists (depending on whether or not it is shrinkable) or
> +	 * gpu->active_list (for the gpu it is active on[1])
>  	 *
>  	 * These lists are protected by mm_lock.  If struct_mutex is involved, it
>  	 * should be aquired prior to mm_lock.  One should *not* hold mm_lock in
> @@ -185,7 +186,8 @@ struct msm_drm_private {
>  	 * [1] if someone ever added support for the old 2d cores, there could be
>  	 *     more than one gpu object
>  	 */
> -	struct list_head inactive_list;
> +	struct list_head inactive_willneed;  /* inactive + !shrinkable */
> +	struct list_head inactive_dontneed;  /* inactive +  shrinkable */
>  	struct mutex mm_lock;
>  
>  	struct workqueue_struct *wq;
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 2795288b0a95..de8d2cfada24 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -17,6 +17,7 @@
>  #include "msm_gpu.h"
>  #include "msm_mmu.h"
>  
> +static void update_inactive(struct msm_gem_object *msm_obj);
>  
>  static dma_addr_t physaddr(struct drm_gem_object *obj)
>  {
> @@ -678,6 +679,12 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
>  
>  	madv = msm_obj->madv;
>  
> +	/* If the obj is inactive, we might need to move it
> +	 * between inactive lists
> +	 */
> +	if (msm_obj->active_count == 0)
> +		update_inactive(msm_obj);
> +
>  	msm_gem_unlock(obj);
>  
>  	return (madv != __MSM_MADV_PURGED);
> @@ -781,19 +788,31 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
>  void msm_gem_active_put(struct drm_gem_object *obj)
>  {
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> -	struct msm_drm_private *priv = obj->dev->dev_private;
>  
>  	might_sleep();
>  	WARN_ON(!msm_gem_is_locked(obj));
>  
>  	if (--msm_obj->active_count == 0) {
> -		mutex_lock(&priv->mm_lock);
> -		list_del_init(&msm_obj->mm_list);
> -		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> -		mutex_unlock(&priv->mm_lock);
> +		update_inactive(msm_obj);
>  	}
>  }
>  
> +static void update_inactive(struct msm_gem_object *msm_obj)
> +{
> +	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> +
> +	mutex_lock(&priv->mm_lock);
> +	WARN_ON(msm_obj->active_count != 0);
> +
> +	list_del_init(&msm_obj->mm_list);
> +	if (msm_obj->madv == MSM_MADV_DONTNEED)
> +		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
> +	else
> +		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);

Is the logic here inverted or is this just really confusing nomenclature? If it
is correct a comment might help remind us whats happening.

Jordan

> +
> +	mutex_unlock(&priv->mm_lock);
> +}
> +
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
>  {
>  	bool write = !!(op & MSM_PREP_WRITE);
> @@ -1099,7 +1118,8 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
>  	}
>  
>  	mutex_lock(&priv->mm_lock);
> -	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> +	/* Initially obj is idle, obj->madv == WILLNEED: */
> +	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
>  	mutex_unlock(&priv->mm_lock);
>  
>  	return obj;
> @@ -1169,7 +1189,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
>  	msm_gem_unlock(obj);
>  
>  	mutex_lock(&priv->mm_lock);
> -	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> +	list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
>  	mutex_unlock(&priv->mm_lock);
>  
>  	return obj;
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 9d51c1eb808d..81dfa57b6a0d 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -19,7 +19,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>  
>  	mutex_lock(&priv->mm_lock);
>  
> -	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
> +	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
>  		if (!msm_gem_trylock(&msm_obj->base))
>  			continue;
>  		if (is_purgeable(msm_obj))
> @@ -42,7 +42,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>  
>  	mutex_lock(&priv->mm_lock);
>  
> -	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
> +	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
>  		if (freed >= sc->nr_to_scan)
>  			break;
>  		if (!msm_gem_trylock(&msm_obj->base))
> @@ -96,7 +96,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>  	struct msm_drm_private *priv =
>  		container_of(nb, struct msm_drm_private, vmap_notifier);
>  	struct list_head *mm_lists[] = {
> -		&priv->inactive_list,
> +		&priv->inactive_dontneed,
> +		&priv->inactive_willneed,
>  		priv->gpu ? &priv->gpu->active_list : NULL,
>  		NULL,
>  	};
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
