Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2DA1A16B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 11:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CB710E276;
	Thu, 23 Jan 2025 10:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgMZ5Fqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0067810E276;
 Thu, 23 Jan 2025 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737626738; x=1769162738;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Oi9/D0PWYyy7brJ0Vu9h1l6qWwLdFOLmHoN6QamUPlE=;
 b=XgMZ5FqmzJtFeNSVYd/sgVh9rqAjMAODtjFfG1yQtcVvKmI2QJtQGwo4
 cKSj4M1fdgrVuOpQeUJi9Jw8Ym1vNVrYuDm2NJI2dKNwKUB7Wne43z+b3
 Fpd9YqjbH4O3phmkPRV2UmlnKkz0MyJN0RCA23OSh/7nJHdeD+UGQ3MzL
 s69slAg/K+suPpNBCB2Qdc1t4lKHvUmXk737B9QEz+pTinXs3lkvtOFtT
 Az36y133mdy8U4+7zWB7KF7pQ9ivztYad/2wTtJFSysGGmC411TYFnLcH
 7E7XZ1KUWAlwSc0T7EG7TlxI47Ntgao922qrKyitnthzyztta8Xc8SUbO g==;
X-CSE-ConnectionGUID: DGLRafO0RMGsxlL0SNLYzQ==
X-CSE-MsgGUID: +DjwDdXKT3iF3OrlgTdsSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49108662"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="49108662"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 02:05:37 -0800
X-CSE-ConnectionGUID: 0nbPCXCIS0ay8X7qslfq7Q==
X-CSE-MsgGUID: MDiba6P7ROqZRshMBJWnlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="138278355"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.98])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 02:05:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
Date: Thu, 23 Jan 2025 12:05:29 +0200
Message-ID: <87tt9pn8uu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.

This might be one of the few places where the old functions and the old
return value was used in a sensible manner.

BR,
Jani.

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
> index 29555b9f03c8c42681c17c4a01e74a966cf8611f..a31ab3f41efb71fd5f936c24ba5c3b8ebea68a5e 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
> @@ -163,17 +163,16 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  			break;
>  		}
>  
> -		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
> -
> +		res = drm_dp_dpcd_read_data(aux_dev->aux, pos, buf, todo);
>  		if (res <= 0)
>  			break;
>  
> -		if (copy_to_iter(buf, res, to) != res) {
> +		if (copy_to_iter(buf, todo, to) != todo) {
>  			res = -EFAULT;
>  			break;
>  		}
>  
> -		pos += res;
> +		pos += todo;
>  	}
>  
>  	if (pos != iocb->ki_pos)
> @@ -211,12 +210,11 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  			break;
>  		}
>  
> -		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
> -
> +		res = drm_dp_dpcd_write_data(aux_dev->aux, pos, buf, todo);
>  		if (res <= 0)
>  			break;
>  
> -		pos += res;
> +		pos += todo;
>  	}
>  
>  	if (pos != iocb->ki_pos)

-- 
Jani Nikula, Intel
