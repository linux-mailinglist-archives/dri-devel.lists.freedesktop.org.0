Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9866FB5367E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED88110E399;
	Thu, 11 Sep 2025 14:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgi2X8GZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BC210E39B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757602578; x=1789138578;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zDVdKYKUVEff1V0SJ9FmoaJKIfpA/0nEMD9NWc3py6Y=;
 b=cgi2X8GZUc1ecjiNzuGkwAgcaQw6udz8U97s+OzIV9TffJ4e9PdnisQS
 JFSQCRn2b4nDhZs9MZOkvGgh+BlqkxkymOTJAI11Ir8vZb2a8mqdQOXg2
 60GpxRZxEmbW4laSnxLTOknnvAP+AKMnqV+cQhG1Wm/avef8M2AujIvJJ
 lBRIOl4ygR5eSL8huxZYuPHBd0x4GHe6DR6EaHER52MbTRDeDBxu+N7Ox
 q2cn3bZvd+XRpsN1YtMrDnaEK0xxdBANY24aNiPycN9Cwhv0EjAKzGJRg
 EBxmpA14SwZT+4Qy3L3wNNzDRLXZneVCXje8jBJpAlcaZIgd5Ql+pEuKJ w==;
X-CSE-ConnectionGUID: /+xf0QdgSUmWTsHQ8PP+PQ==
X-CSE-MsgGUID: R9QQ1zTWTUOsPABqZDC7WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="58979150"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="58979150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 07:56:17 -0700
X-CSE-ConnectionGUID: 976Ki68DQwCZrZtNIDH7aw==
X-CSE-MsgGUID: Z0S6O1m7SkGVrb7mxn0KYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="177747008"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 07:56:13 -0700
Message-ID: <1d049b9b-e2aa-41f8-9785-9795524b56ef@linux.intel.com>
Date: Thu, 11 Sep 2025 16:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix an integer overflow in
 aie2_query_ctx_status_array()
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org, dan.carpenter@linaro.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20250909154531.3469979-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20250909154531.3469979-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 9/9/2025 5:45 PM, Lizhi Hou wrote:
> The unpublished smatch static checker reported a warning.
>
> drivers/accel/amdxdna/aie2_pci.c:904 aie2_query_ctx_status_array()
> warn: potential user controlled sizeof overflow
> 'args->num_element * args->element_size' '1-u32max(user) * 1-u32max(user)'
>
> Even this will not cause a real issue, it is better to put a reasonable
> limitation for element_size and num_element. Add condition to make sure
> the input element_size <= 4K and num_element <= 1K.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/aL56ZCLyl3tLQM1e@stanley.mountain/
> Fixes: 2f509fe6a42c ("accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_pci.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 87c425e3d2b9..6e39c769bb6d 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -898,6 +898,12 @@ static int aie2_query_ctx_status_array(struct amdxdna_client *client,
>   
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>   
> +	if (args->element_size > SZ_4K || args->num_element > SZ_1K) {
> +		XDNA_DBG(xdna, "Invalid element size %d or number of element %d",
> +			 args->element_size, args->num_element);
> +		return -EINVAL;
> +	}
> +
>   	array_args.element_size = min(args->element_size,
>   				      sizeof(struct amdxdna_drm_hwctx_entry));
>   	array_args.buffer = args->buffer;
