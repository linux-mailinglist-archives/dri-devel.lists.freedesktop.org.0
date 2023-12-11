Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B9080C7B9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F20C10E396;
	Mon, 11 Dec 2023 11:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E617810E396
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702293195; x=1733829195;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rw6hN0YJgpm2GgI/4sZlg6GNUYV8OfaRR8D8Da6EGAk=;
 b=LqLPACvmnPMv+SOLnKR/H1+ErQ4Hiuh+N87XpElSxRJzIliSQQQMXmqT
 6EiMPB2nGkINCmaXf+acBbPI/Hh1Pgmn9odSn8uRQnTM6ivWMIyVs6VyE
 i8kWN1hqEmIuhKZQEa5tb/+BXOWDk2MQVacvtM+7uIWubjS0E9/iCCoQZ
 GzcXx/dfmUxxSlCgn/2VXbpZsg16xGI65BVBA2vdDxDizlDMC1DfxfgZz
 a0+LnfxW/AYR+G8uHKm0BpRycmdxY1hqVuT5tmhztClYgorImyGMKWZOI
 FuGBMYSragMl9DGLghkI2yTMkiiZHoLVAB+Y3h9sBDLs2AhD7RHw9CvN8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="458942319"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="458942319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="14391621"
Received: from mnielipi-mobl.ger.corp.intel.com (HELO [10.249.128.67])
 ([10.249.128.67])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:13:14 -0800
Message-ID: <8021d519-17f9-40ba-ab94-d073fd4ceba5@linux.intel.com>
Date: Mon, 11 Dec 2023 12:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Fix GEM import path code
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
 <20231208163101.1295769-2-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231208163101.1295769-2-quic_jhugo@quicinc.com>
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

On 08.12.2023 17:31, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Do not modify the size of dmabuf as it is immutable.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_data.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 4a8e43a7a6a4..d42f002bc0cf 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -777,7 +777,6 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
>  	struct dma_buf_attachment *attach;
>  	struct drm_gem_object *obj;
>  	struct qaic_bo *bo;
> -	size_t size;
>  	int ret;
>  
>  	bo = qaic_alloc_init_bo();
> @@ -795,13 +794,12 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
>  		goto attach_fail;
>  	}
>  
> -	size = PAGE_ALIGN(attach->dmabuf->size);
> -	if (size == 0) {
> +	if (!attach->dmabuf->size) {
>  		ret = -EINVAL;
>  		goto size_align_fail;
>  	}
>  
> -	drm_gem_private_object_init(dev, obj, size);
> +	drm_gem_private_object_init(dev, obj, attach->dmabuf->size);
>  	/*
>  	 * skipping dma_buf_map_attachment() as we do not know the direction
>  	 * just yet. Once the direction is known in the subsequent IOCTL to
