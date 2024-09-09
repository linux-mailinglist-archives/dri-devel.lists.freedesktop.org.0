Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9448A970FF9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B477710E2FD;
	Mon,  9 Sep 2024 07:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeuaEMzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D4210E2FD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 07:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725867578; x=1757403578;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RiD2W5cm7ORoR6DJBKgPlV0gjZv3FnjVx+Rnl87vOcQ=;
 b=FeuaEMzWeOXlZBU0HBZF+Fyl25QiRi535XfBUAM2ykhoZuDWwMWe0+/y
 plQP5gTuqtES9Wgxb2RA17YVBPo+DgTeyeNVQNeEYAFL2sS49tn3RuS2G
 kXUkt7KsGJalfLUKassq08wh8zxYpeLsqQvk7DC6LGZGfeJ1DUrMZGA4R
 O07l76f0+PbGUaU+KV70nzNbg/7lnp6J/m67IsOu08r5Nkxuu1hTW8Ptb
 /3BTPZnGdoFdgF6IKhM1g9iYlwgfzn2F9xDRPxOYj/qOtVTqHbNUpVAlv
 is/jF3PXATKR+RcQxvPYO9yQXWjA859PK1hMusu8PhZlAAgv64qBirwPF Q==;
X-CSE-ConnectionGUID: bgNrpUHRR3qAovIeBBmBBA==
X-CSE-MsgGUID: PwG7i9EEQf6EoO9yQsJjIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35135409"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="35135409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:39:37 -0700
X-CSE-ConnectionGUID: SsRybWOSQ56/LtMdihn0sA==
X-CSE-MsgGUID: gd9/a/KITH2+Ip6Ta53C5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="71377491"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:39:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Simona Vetter
 <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/ipuv3/parallel: Fix an error handling path in
 imx_pd_probe()
In-Reply-To: <1cdd8523443d8850c5531462b30064cb2058924a.1725651992.git.christophe.jaillet@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1cdd8523443d8850c5531462b30064cb2058924a.1725651992.git.christophe.jaillet@wanadoo.fr>
Date: Mon, 09 Sep 2024 10:39:28 +0300
Message-ID: <87cyldmg27.fsf@intel.com>
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

On Fri, 06 Sep 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> If component_add() fails, we need to undo a potential previous
> drm_edid_alloc() call.
>
> Add an error handling path and the missing drm_edid_free(), as already done
> in the reomve function.

See commit fe30fabf229f ("drm/imx: parallel-display: drop edid override
support").

BR,
Jani.


>
> Fixes: 42e08287a318 ("drm/ipuv3/parallel: convert to struct drm_edid")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> index 91d7808a2d8d..6d51203f7f0f 100644
> --- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> +++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> @@ -350,7 +350,15 @@ static int imx_pd_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, imxpd);
>  
> -	return component_add(dev, &imx_pd_ops);
> +	ret = component_add(dev, &imx_pd_ops);
> +	if (ret)
> +		goto free_edid;
> +
> +	return 0;
> +
> +free_edid:
> +	drm_edid_free(imxpd->drm_edid);
> +	return ret;
>  }
>  
>  static void imx_pd_remove(struct platform_device *pdev)

-- 
Jani Nikula, Intel
