Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BA1546CD5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 20:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3167610F451;
	Fri, 10 Jun 2022 18:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0128F10E421;
 Fri, 10 Jun 2022 18:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654887500; x=1686423500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TFTUfa302tvVz+u5KAsxdw2I2H3RPoBI2UySHe6ZrcI=;
 b=Q+yATk94TmBDp0d3KRB3qeZo1iKlyesJepiUNRotWvVf4xqFa9SsdUvy
 dj6ntFpKj3h3oquK3iwOz5ImLfL/Kr5VVK6yjVzRR1bRFQATgAQe7h/Zc
 iiJwDHAowMAgwcbTFjrJYoanfE9B+ZJP9LRbIYGb/6D25lCUjn9X9rF4u
 WSQNLIGkhXh1tSxW+9O1mDFtZnirUjYNU/tIteYfyOIn851IDQ6U8gFiL
 4VE8IIuD35GyEoOwjFeBed47GoGpI2Qp3m4BABHsLYE8LESptSZ5mXQAR
 jGAyncptVl97XzHtP0sWFTWmyJvm6AIzcBSADIPlAEifybhxL8Wkwo+OP w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="266486400"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="266486400"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 11:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="586339165"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga007.fm.intel.com with SMTP; 10 Jun 2022 11:58:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 21:58:15 +0300
Date: Fri, 10 Jun 2022 21:58:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 02/15] drm/edid: abstract cea data block collection size
Message-ID: <YqOUR/siKAe8pIw5@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <5339ab3249400a3c41001967e7ff2611b58e0425.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5339ab3249400a3c41001967e7ff2611b58e0425.1654674560.git.jani.nikula@intel.com>
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

On Wed, Jun 08, 2022 at 10:50:32AM +0300, Jani Nikula wrote:
> Add a function to get the cea data block collection size.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c57f6333ea7d..002816509fc8 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4482,6 +4482,20 @@ __cea_db_iter_current_block(const struct cea_db_iter *iter)
>  	return NULL;
>  }
>  
> +/*
> + * References:
> + * - CTA-861-H section 7.3.3 CTA Extension Version 3
> + */
> +static int cea_db_collection_size(const u8 *cta)
> +{
> +	u8 d = cta[2];
> +
> +	if (d < 4 || d > 127)
> +		return 0;
> +
> +	return d - 4;
> +}
> +
>  /*
>   * References:
>   * - VESA E-EDID v1.4
> @@ -4492,15 +4506,19 @@ static const void *__cea_db_iter_edid_next(struct cea_db_iter *iter)
>  	const u8 *ext;
>  
>  	drm_edid_iter_for_each(ext, &iter->edid_iter) {
> +		int size;
> +
>  		/* Only support CTA Extension revision 3+ */
>  		if (ext[0] != CEA_EXT || cea_revision(ext) < 3)
>  			continue;
>  
> -		iter->index = 4;
> -		iter->end = ext[2];
> -		if (iter->end < 4 || iter->end > 127)
> +		size = cea_db_collection_size(ext);
> +		if (!size)
>  			continue;
>  
> +		iter->index = 4;
> +		iter->end = iter->index + size;
> +
>  		return ext;
>  	}
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
