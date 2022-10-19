Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCCE6050AE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 21:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053C910E068;
	Wed, 19 Oct 2022 19:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A8710E068;
 Wed, 19 Oct 2022 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666208794; x=1697744794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VszqsTkAfiSgPVYszADebbLWU+1a72KM5NnuJiGC49k=;
 b=GeCrjVQH+ZSLQiAj8JP4qljL3tKsSW4Y6z6n0NAnhpmpQN/CG73fRg4F
 yhsYR1LIoa7bokdu/2qWnA1IWEjsWW/N0UJht8bdcmU/VvoRvAyKcatYb
 SyvEEIMI/h291Lq+ztfds4KFfqHyndhnHZhN4EGCmd6AMBsqnVKrHG5Yy
 n8zAA0eChZDcyLDleUgHuw898Vkf35/ELx2yIT1gDasx3BKsItS5d71ip
 4xdorl3myEQWINoqEnz1Vin3zv8T8tTJK9U72zGCGBOOKIPXMxVUADZpo
 MxpRViBScLcAAurqmhFJQjaQpDvRt8Sjq1tHHbEQxSwCCcxjuJdM5D96Z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="289827554"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="289827554"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 12:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="958503915"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="958503915"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga005.fm.intel.com with SMTP; 19 Oct 2022 12:46:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 22:46:30 +0300
Date: Wed, 19 Oct 2022 22:46:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 08/15] drm/edid: add function for checking drm_edid
 validity
Message-ID: <Y1BUFl89xPjoLunK@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <1f11b4e6e91d526fb3646d7987be7148da3f7b47.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f11b4e6e91d526fb3646d7987be7148da3f7b47.1665496046.git.jani.nikula@intel.com>
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

On Tue, Oct 11, 2022 at 04:49:42PM +0300, Jani Nikula wrote:
> We've lacked a function for immutable validity check on drm_edid. Add
> one.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     |  1 +
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 616c1cdc7507..c3cf942186b7 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2040,6 +2040,36 @@ bool drm_edid_is_valid(struct edid *edid)
>  }
>  EXPORT_SYMBOL(drm_edid_is_valid);
>  
> +/**
> + * drm_edid_valid - sanity check EDID data
> + * @drm_edid: EDID data
> + *
> + * Sanity check an EDID. Cross check block count against allocated size and
> + * checksum the blocks.
> + *
> + * Return: True if the EDID data is valid, false otherwise.
> + */
> +bool drm_edid_valid(const struct drm_edid *drm_edid)
> +{
> +	int i;
> +
> +	if (!drm_edid)
> +		return false;
> +
> +	if (edid_size_by_blocks(__drm_edid_block_count(drm_edid)) != drm_edid->size)
> +		return false;

I Was consfued about the HF-EEODB crap for a bit but 
__drm_edid_block_count() does include that.

So looks sane
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +
> +	for (i = 0; i < drm_edid_block_count(drm_edid); i++) {
> +		const void *block = drm_edid_block_data(drm_edid, i);
> +
> +		if (!edid_block_valid(block, i == 0))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_edid_valid);
> +
>  static struct edid *edid_filter_invalid_blocks(struct edid *edid,
>  					       size_t *alloc_size)
>  {
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 05380681a4fb..a2e25e7e6ee5 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -606,6 +606,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
>  const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
>  const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
>  void drm_edid_free(const struct drm_edid *drm_edid);
> +bool drm_edid_valid(const struct drm_edid *drm_edid);
>  const struct edid *drm_edid_raw(const struct drm_edid *drm_edid);
>  const struct drm_edid *drm_edid_read(struct drm_connector *connector);
>  const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
