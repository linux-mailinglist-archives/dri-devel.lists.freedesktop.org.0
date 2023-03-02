Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 477996A7C61
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 09:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75EE10E105;
	Thu,  2 Mar 2023 08:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C88B10E105
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677745124; x=1709281124;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AJIhha6A26LHvReUGAtEuYQT9YfWAbHpjTV7TVDTj3E=;
 b=J3V34Z0seLpXUgTVj2y7rN6283FqigK9LfuRBp3eKfGiJe5l746Rddv8
 X2Sp/VeHYwEZqkNEWtoCV/N01kIcDcn5dvunGHG0TqfCVvHdF1nt3eDUZ
 rMJGzVIaDlGr2Ceb8ezyTB5qj1VnemkdJ7CDybIZ0AjiDxOZc2JDc5guI
 f2PtjVB8iTQ+YO2uPaKNFUZlnDthVhHv860fvb5QaKiHYQLmqstFulhGO
 srbTooWFCIfBM6Ulkg7O/BU50gOI4pAz9AZ5gW6sACw/KK+g2qfOokllO
 IhD2E4R7iL89XcaTjvSZIytuIs0G9G+kvbAClRy8q9MMcyLJBM/zQeRoe g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="318454258"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="318454258"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 00:18:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743755672"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="743755672"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 00:17:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Johan Hovold <johan+linaro@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/edid: fix info leak when failing to get panel id
In-Reply-To: <20230302074704.11371-1-johan+linaro@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230302074704.11371-1-johan+linaro@kernel.org>
Date: Thu, 02 Mar 2023 10:17:30 +0200
Message-ID: <874jr3worp.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Mar 2023, Johan Hovold <johan+linaro@kernel.org> wrote:
> Make sure to clear the transfer buffer before fetching the EDID to
> avoid leaking slab data to the logs on errors that leave the buffer
> unchanged.
>
> Fixes: 69c7717c20cc ("drm/edid: Dump the EDID when drm_edid_get_panel_id() has an error")
> Cc: stable@vger.kernel.org	# 6.2
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 3841aba17abd..8707fe72a028 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2797,7 +2797,7 @@ u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
>  	 * the EDID then we'll just return 0.
>  	 */
>  
> -	base_block = kmalloc(EDID_LENGTH, GFP_KERNEL);
> +	base_block = kzalloc(EDID_LENGTH, GFP_KERNEL);
>  	if (!base_block)
>  		return 0;

-- 
Jani Nikula, Intel Open Source Graphics Center
