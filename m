Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E78546D4F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2DE11397D;
	Fri, 10 Jun 2022 19:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96E21139A5;
 Fri, 10 Jun 2022 19:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654889682; x=1686425682;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oI7HIl3LTJLEGD/d8uo0j6DFUj4t5Z/yfRQlefEsOb8=;
 b=JG6a53f9OjHaTdOZ26XLOAvk4WbHCf3dr5IUiuz2NjIv+ZQOFNH/AgKv
 MS2lnZg2fF0sjtCEBtJ9Q8tnSFw/zLmXrv0mXWeUyki3b/uooma9hg1+w
 iIPKr329MKYanhJe8JUfzlQcEgMiFTpMVeQ2LU+uEomq3zyMvoED2gTx0
 1jlm+69M1KUb/9NerAEgWheUEgeaAxfdQQD5s98NFSxM1mTUzb1d26C3w
 nQc7BJfCiSSDHW4W0hb7hxLNP4aBkj7uXf1V26XpeDz45zdT2Qj+I+gnU
 ZUzWRENvGRIUCmj4IKVvLV+E0PFWb4Z2oRZF4F70+gSbnXRKDSg3DL1zs Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="257559429"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="257559429"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 12:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="610856867"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga008.jf.intel.com with SMTP; 10 Jun 2022 12:34:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 22:34:28 +0300
Date: Fri, 10 Jun 2022 22:34:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 14/15] drm/edid: take HF-EEODB extension count into
 account
Message-ID: <YqOcxDCNZY5btZf8@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <6b9ba99d9cc269e05aecf29e81566fc8ce9745a6.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b9ba99d9cc269e05aecf29e81566fc8ce9745a6.1654674560.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 10:50:44AM +0300, Jani Nikula wrote:
> Take the HF-EEODB extension count override into account.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5cac357e50b0..b7b1f0639115 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1629,6 +1629,19 @@ static int drm_edid_block_count(const struct drm_edid *drm_edid)
>  	/* Starting point */
>  	num_blocks = edid_block_count(drm_edid->edid);
>  
> +	/* HF-EEODB override */
> +	if (drm_edid->size >= edid_size_by_blocks(2)) {
> +		int eeodb;
> +
> +		/*
> +		 * Note: HF-EEODB may specify a smaller extension count than the
> +		 * regular one. Unlike in buffer allocation, here we can use it.
> +		 */

Such a sink would be in violation of the spec. But the spec does
explicitly say sources are to ignore the normal ext count in those
cases. So this would seem to do what the spec asks of us.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +		eeodb = edid_hfeeodb_block_count(drm_edid->edid);
> +		if (eeodb)
> +			num_blocks = eeodb;
> +	}
> +
>  	/* Limit by allocated size */
>  	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
