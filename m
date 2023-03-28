Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BD6CCBEA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 23:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE7310E48E;
	Tue, 28 Mar 2023 21:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B5C10E48E;
 Tue, 28 Mar 2023 21:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680037718; x=1711573718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6GLo3d35oVtHdFhb6UNpuguyDFJRdNOuxUvgwUhlmnY=;
 b=LglhwN39RVgEo5FLlQyQGAK7E30JKuG6QDcXLAacgGymVQqdiPyM9BsR
 PktPGUQtOjjF+E9K7+bhDXyds1N41adi2+hJ+URoTDczRt1nyf2HfXu9c
 VKXxaTb6EWB3IoGbaTMokBgLTqN2h3QtU2NZGHGsSWlQCc8ciB5r4OP8w
 ovFBAEz9OkSGFT24L602Kk3rloMh1zso3/DQcrU/Ce8AgNKUHgXLyZLWB
 DV9L2v1qD9FpjwpnrJNLFjoBkmNbM2S9P1JR3Mcfl5gX0DD7vHum0dfVl
 xnEZd8Qm1wxv/atGHEvT9cggufuivuepzgqofbUPRr4oC+NU1Hw5O+e4J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338193558"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="338193558"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="827628736"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="827628736"
Received: from fhannebi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.50.224])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:08:36 -0700
Date: Tue, 28 Mar 2023 23:08:11 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Min Li <lm0963hack@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915: fix race condition UAF in
 i915_perf_add_config_ioctl
Message-ID: <ZCNXO/NJecxaGwep@ashyti-mobl2.lan>
References: <20230328093627.5067-1-lm0963hack@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328093627.5067-1-lm0963hack@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 05:36:27PM +0800, Min Li wrote:
> Userspace can guess the id value and try to race oa_config object creation
> with config remove, resulting in a use-after-free if we dereference the
> object after unlocking the metrics_lock.  For that reason, unlocking the
> metrics_lock must be done after we are done dereferencing the object.
> 
> Signed-off-by: Min Li <lm0963hack@gmail.com>

I think we should also add

Fixes: f89823c21224 ("drm/i915/perf: Implement I915_PERF_ADD/REMOVE_CONFIG interface")
Cc: <stable@vger.kernel.org> # v4.14+

Andi

> ---
>  drivers/gpu/drm/i915/i915_perf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 824a34ec0b83..93748ca2c5da 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4634,13 +4634,13 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
>  		err = oa_config->id;
>  		goto sysfs_err;
>  	}
> -
> -	mutex_unlock(&perf->metrics_lock);
> +	id = oa_config->id;
>  
>  	drm_dbg(&perf->i915->drm,
>  		"Added config %s id=%i\n", oa_config->uuid, oa_config->id);
> +	mutex_unlock(&perf->metrics_lock);
>  
> -	return oa_config->id;
> +	return id;
>  
>  sysfs_err:
>  	mutex_unlock(&perf->metrics_lock);
> -- 
> 2.25.1
