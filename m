Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BBDA7F501
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 08:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F8110E1E6;
	Tue,  8 Apr 2025 06:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ty7tgOXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C11510E1E6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 06:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744093908; x=1775629908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qp6kXPHYlHXPp7a4478Yj9Dljvp12+lbJBxpArDsEe8=;
 b=Ty7tgOXz17tO31UUP55zL39/hvc07tVMltVrP0NPsvhi9M6qudgixLu5
 rJHfG49XQyd47icBsSyRlPN3bXOVoPOyH2OfK2qfDHrXbFd4V9zpsJ4sl
 rQQmxBjTk+ug9tsQTOy30TxPbb7uLKGY5c+cHfvMW2M+g1lI9ZqK7hHIS
 4/klvgr6dxCRVwVZa4d3OnaNes7QK8cBHIb04NzG4XH3bmRLi1ayVuizo
 q9Xk0Trkclw36pQS7hc9pYW/4OBIxVgozZ3IIHXFbmJt1aJCXgBiB6Rmc
 Q4TvkYLaRIIAFhP9E/snJpgQIQCBs92NPvzUuSI3pjgnoom1ohAUuqtmf A==;
X-CSE-ConnectionGUID: ZfW6zBYmSYC1tJd0bpRmrA==
X-CSE-MsgGUID: FRCUlBxpQtKbAvJYDiPgqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44651581"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="44651581"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 23:31:45 -0700
X-CSE-ConnectionGUID: +PcuRtnpRtWPMDSdAcuhYQ==
X-CSE-MsgGUID: SAIzYws+TWOd8sbrt8R1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="128503219"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 23:31:42 -0700
Date: Tue, 8 Apr 2025 09:31:40 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: jiangfeng@kylinos.cn
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, andrealmeid@igalia.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Fix the length of event_string in
 drm_dev_wedged_event()
Message-ID: <Z_TCzOg2Q7Aeh-G1@black.fi.intel.com>
References: <20250408013219.26006-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408013219.26006-1-jiangfeng@kylinos.cn>
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

On Tue, Apr 08, 2025 at 09:32:19AM +0800, jiangfeng@kylinos.cn wrote:
> From: Feng Jiang <jiangfeng@kylinos.cn>
> 
> The format of the event_string value is `WEDGED=<method1>[,..,<methodN>]`,
> so method should be appended after 'WEDGED=' rather than overwriting it.

It's already appending it, the fix is rather for the potential array
overflow. So please update this in commit message.

> Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>  drivers/gpu/drm/drm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..58babdab9e66 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -549,7 +549,8 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
>  			break;
>  
> -		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
> +		len += scnprintf(event_string + len,
> +				sizeof(event_string) - len, "%s,", recovery);

Now that we allow 100 characters, you can keep this as a single line.

Raag
