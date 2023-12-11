Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4804880C7E5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1D510E3BE;
	Mon, 11 Dec 2023 11:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E985110E3BE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702293913; x=1733829913;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZKKHSy8u6AApm+0u1oj28bXhn4Df0nBx9tTAbRVh6xU=;
 b=P+lROJPf2uphEItTqJQefccSlOld5J8wTQ3bnaTypSk/LyylsxiQiU/o
 2KgBw2+GCg5xemA0hwfLa2C6iz6Lzgip3EiIWIjbTo24YbAascpStp4bH
 G9ZsZdiB7tA2TGjj4BbkQQMj3+5o/inim++ZKh4mFaA3ayG8Qx+NWsnnA
 UuhFWgCBOrIrmzd5VKcs/PooC0w6kvUXQ0556KIZnS4R2b1y0iZ4amUSm
 F9gKAn9DY9cgIukQBEsc/yjsX6EcjgIIPdvx6BUr5ZU4ef5MrIBdviXNe
 9O4v2bpI4UdVnhmO8N0NZN/6XFP6kg7bHdzECrvul9fV8ga6q2r9F5w9A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379627070"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="379627070"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="891091660"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="891091660"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.128.67])
 ([10.249.128.67])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:25:12 -0800
Message-ID: <daba3227-a4ad-45c6-afd3-fa84bc1f45f5@linux.intel.com>
Date: Mon, 11 Dec 2023 12:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] accel/qaic: Drop the reference to BO in error path of
 create BO IOCTL
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <20231208163457.1295993-5-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231208163457.1295993-5-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 08.12.2023 17:34, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Do not free BO explicitly in error path, just drop its reference, cleanup
> will be taken care by DRM as we have registered for ->free() callback.
> This patch makes sure that there is only one code path for BO to be freed.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_data.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 89ab8fa19315..7faa00705c1d 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -574,6 +574,9 @@ static void qaic_free_sgt(struct sg_table *sgt)
>  {
>  	struct scatterlist *sg;
>  
> +	if (!sgt)
> +		return;
> +
>  	for (sg = sgt->sgl; sg; sg = sg_next(sg))
>  		if (sg_page(sg))
>  			__free_pages(sg_page(sg), get_order(sg->length));
> @@ -717,7 +720,7 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>  
>  	ret = drm_gem_handle_create(file_priv, obj, &args->handle);
>  	if (ret)
> -		goto free_sgt;
> +		goto free_bo;
>  
>  	bo->handle = args->handle;
>  	drm_gem_object_put(obj);
> @@ -726,10 +729,8 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>  
>  	return 0;
>  
> -free_sgt:
> -	qaic_free_sgt(bo->sgt);
>  free_bo:
> -	kfree(bo);
> +	drm_gem_object_put(obj);
>  unlock_dev_srcu:
>  	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
>  unlock_usr_srcu:
