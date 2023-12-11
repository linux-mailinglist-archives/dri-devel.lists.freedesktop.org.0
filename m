Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19080C7E9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A1810E3CC;
	Mon, 11 Dec 2023 11:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD0A10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702293973; x=1733829973;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=thyc33+JNJuMYcup1DCq5LuFnsera4+2RhPzNSYO7KE=;
 b=abiEaduSBxtMMJ2LOzIqV0McDVhCGQNBCayHHRoIrmKSzdlVNubjTSd/
 2mr0S5KAK6DBVytdXHSprBUaRxSOAiuEnzpVFBp2vYtDPwxilXfbq/bOt
 BuxbLlxx5TZTiSPGryvq/8BE8I2gZW+EY9Rw73XLhFyo5GYQbldCz2idC
 /W9MG6HTMP9Nd9nHp1AeHZiGv97mnN6De04gPoF8teJQ57ffTDti4o4Tg
 uGvqvz93PGsQElBtHSZNretJlnphnveASb2m3B4vrzVZJApm9Yxvi7RyV
 1DftpetB4xnw6bS2biU9ojoEaeSQAVjUhjW5ehG4PW6yBJloYA+rfa4SX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379627191"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="379627191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="891091822"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="891091822"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.128.67])
 ([10.249.128.67])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:26:12 -0800
Message-ID: <88d98dbf-7dac-490c-b4b9-caeb59402d4a@linux.intel.com>
Date: Mon, 11 Dec 2023 12:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] accel/qaic: Call drm_gem_create_mmap_offset() once
 for each BO
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <20231208163457.1295993-6-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231208163457.1295993-6-quic_jhugo@quicinc.com>
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
> Every time QAIC_MMAP_BO ioctl is called for a BO,
> drm_gem_create_mmap_offset() is called. Calling
> drm_gem_create_mmap_offset() more then once for a BO seems redundant.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_data.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 7faa00705c1d..f88d925c8001 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -718,6 +718,10 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>  	if (ret)
>  		goto free_bo;
>  
> +	ret = drm_gem_create_mmap_offset(obj);
> +	if (ret)
> +		goto free_bo;
> +
>  	ret = drm_gem_handle_create(file_priv, obj, &args->handle);
>  	if (ret)
>  		goto free_bo;
> @@ -745,7 +749,7 @@ int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>  	struct drm_gem_object *obj;
>  	struct qaic_device *qdev;
>  	struct qaic_user *usr;
> -	int ret;
> +	int ret = 0;
>  
>  	usr = file_priv->driver_priv;
>  	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
> @@ -767,9 +771,7 @@ int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>  		goto unlock_dev_srcu;
>  	}
>  
> -	ret = drm_gem_create_mmap_offset(obj);
> -	if (ret == 0)
> -		args->offset = drm_vma_node_offset_addr(&obj->vma_node);
> +	args->offset = drm_vma_node_offset_addr(&obj->vma_node);
>  
>  	drm_gem_object_put(obj);
>  
