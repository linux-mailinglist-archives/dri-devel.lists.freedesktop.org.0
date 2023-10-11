Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0147C4B4C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 09:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8645910E476;
	Wed, 11 Oct 2023 07:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A8B10E476
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697008254; x=1728544254;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ml7Fp7eHHGupyYR1HlJpyyVZB1D65axD2PsS0w1/tPc=;
 b=Mbnml2FPOxhPTygHmPggHFQqq5nOeXlG80VS7hI585DijCKZfiam8ccI
 XZF2MtmpcFzAeOa5zdtd3VEpG9VNHHB6YP05GW1T2+FH9cDruXXTQen4g
 9KkPA/yb0sQOrmtmxPSY1pRDb8+Z7MFG4yO5QivioawPO8YNAUd6WsDp4
 U8NXgz6imkweGiTIjHsPvmUgJrU3hnUihRzlliNyMeBn0kcvBA2fCANF8
 9Lg2x6QlgO2pYpZkQIXR+kp/m9qRGJW74AXTw6ar7xusfFT8l7551IkKH
 eG2W1VpPKOmvIf3a3k/sfwrYGF974RnSNHY+P2Ii3XDYFgb7ioFAR1/cW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="451090803"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="451090803"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 00:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="824057686"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="824057686"
Received: from wprelogx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.229])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 00:10:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ma Ke <make_ruc2021@163.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/edid: fix a possible null pointer dereference
In-Reply-To: <20231011013316.4091845-1-make_ruc2021@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231011013316.4091845-1-make_ruc2021@163.com>
Date: Wed, 11 Oct 2023 10:10:30 +0300
Message-ID: <874jix63dl.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ma Ke <make_ruc2021@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023, Ma Ke <make_ruc2021@163.com> wrote:
> In drm_mode_std(), the return value of drm_gtf_mode(),
> drm_gtf_mode() and drm_cvt_mode() is assigned to mode,
> which will lead to a NULL pointer dereference on failure
> of drm_gtf_mode(), drm_gtf_mode() and drm_cvt_mode().
> Add a check to avoid null point dereference.
>
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 340da8257b51..e2c154c2b896 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3381,6 +3381,8 @@ static struct drm_display_mode *drm_mode_std(struct drm_connector *connector,
>  				    false);
>  		break;
>  	}
> +	if (!mode)
> +		return NULL;

This doesn't change anything.

BR,
Jani.


>  	return mode;
>  }

-- 
Jani Nikula, Intel
