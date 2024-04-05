Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7698995A0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 08:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F7C10E734;
	Fri,  5 Apr 2024 06:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Le9DIkoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7178010E734
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712299142; x=1743835142;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qjHXKf80q2i+A22Y8MSVszlm2vd2W7EFjAzHqaUzq6Q=;
 b=Le9DIkoXQfSJfRXTTEsRdagKHEdylPfraIXWXV2MzRgxUkUUXH8PKkPL
 MhHM4FnoWa7hs1HLbwLq57GJk2NCzyR4uFlO1FFJBtgg7bJn9RhFBpQk8
 LY1iCheztVqqoWBWO8bixsss4tpPsvoug0kUZSSc2bXviPedaU36Bab97
 2tXYIxJiyYmPQ15hbb0sH517S4njco16Y4k4HHoKnk3tMJmTiCrX3ikls
 us7DEf4N4UNDXlMCiMZRiyjJrh8R4OlQ7qf8eip3XIWpYORt6qz3l4AAB
 WGxE/mOjQNk2ibi/PGl8Cy1i54FJ/mO4s7zgEPQYeOwX0P0elv6HuQDC4 Q==;
X-CSE-ConnectionGUID: aw6GfwXxQ8mnhjGMXPnmLg==
X-CSE-MsgGUID: eYQ2BG3ISxGq9uC7biyczw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7462116"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7462116"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:39:02 -0700
X-CSE-ConnectionGUID: xrX9obNSRqqoDv3gtsv9PA==
X-CSE-MsgGUID: opOVcdcKSNuYe5Htls/Ftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="23737340"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.41.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:38:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/7] drm/edid: Test for EDID header in
 drm_edit_probe_custom()
In-Reply-To: <20240404150857.5520-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240404150857.5520-1-tzimmermann@suse.de>
 <20240404150857.5520-3-tzimmermann@suse.de>
Date: Fri, 05 Apr 2024 09:38:56 +0300
Message-ID: <87h6ggcnzz.fsf@intel.com>
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

On Thu, 04 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> EDID read functions do not validate their return data. So they might
> return the required number of bytes of probing, but with invalid
> data. Therefore test for the presence of an EDID header similar to
> the code in edid_block_check().

I don't think the point of drm_probe_ddc() ever was to validate
anything. It reads one byte to see if there's any response. That's all
there is to it.

All EDID validation happens in the _drm_do_get_edid() when actually
reading the EDID.

I don't think I like duplicating this behaviour in both the probe and
the EDID read. And I'm not sure why we're giving drivers the option to
pass a parameter whether to validate or not. Just why?

BR,
Jani.


>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_edid.c | 50 +++++++++++++++++++++++++++++---------
>  include/drm/drm_edid.h     |  2 +-
>  2 files changed, 39 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a3e9333f9177a..4e12d4b83a720 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1758,6 +1758,18 @@ static void edid_header_fix(void *edid)
>  	memcpy(edid, edid_header, sizeof(edid_header));
>  }
>  
> +static int edid_header_score(const u8 *header)
> +{
> +	int i, score = 0;
> +
> +	for (i = 0; i < sizeof(edid_header); i++) {
> +		if (header[i] == edid_header[i])
> +			score++;
> +	}
> +
> +	return score;
> +}
> +
>  /**
>   * drm_edid_header_is_valid - sanity check the header of the base EDID block
>   * @_edid: pointer to raw base EDID block
> @@ -1769,14 +1781,8 @@ static void edid_header_fix(void *edid)
>  int drm_edid_header_is_valid(const void *_edid)
>  {
>  	const struct edid *edid = _edid;
> -	int i, score = 0;
>  
> -	for (i = 0; i < sizeof(edid_header); i++) {
> -		if (edid->header[i] == edid_header[i])
> -			score++;
> -	}
> -
> -	return score;
> +	return edid_header_score(edid->header);
>  }
>  EXPORT_SYMBOL(drm_edid_header_is_valid);
>  
> @@ -2612,17 +2618,37 @@ EXPORT_SYMBOL(drm_edid_free);
>   * drm_edid_probe_custom() - probe DDC presence
>   * @read_block: EDID block read function
>   * @context: Private data passed to the block read function
> + * @validate: True to validate the EDID header
>   *
>   * Probes for EDID data. Only reads enough data to detect the presence
> - * of the EDID channel.
> + * of the EDID channel. Some EDID block read functions do not fail,
> + * but return invalid data if no EDID data is available. If @validate
> + * has been specified, drm_edid_probe_custom() validates the retrieved
> + * EDID header before signalling success.
>   *
>   * Return: True on success, false on failure.
>   */
> -bool drm_edid_probe_custom(read_block_fn read_block, void *context)
> +bool drm_edid_probe_custom(read_block_fn read_block, void *context, bool validate)
>  {
> -	unsigned char out;
> +	u8 header[8] = {0, 0, 0, 0, 0, 0, 0, 0};
> +	int ret;
> +	size_t len = 1;
> +
> +	if (validate)
> +		len = sizeof(header); // read full header
> +
> +	ret = read_block(context, header, 0, len);
> +	if (ret)
> +		return false;
> +
> +	if (validate) {
> +		int score = edid_header_score(header);
> +
> +		if (score < clamp(edid_fixup, 0, 8))
> +			return false;
> +	}
>  
> -	return (read_block(context, &out, 0, 1) == 0);
> +	return true;
>  }
>  EXPORT_SYMBOL(drm_edid_probe_custom);
>  
> @@ -2635,7 +2661,7 @@ EXPORT_SYMBOL(drm_edid_probe_custom);
>  bool
>  drm_probe_ddc(struct i2c_adapter *adapter)
>  {
> -	return drm_edid_probe_custom(drm_do_probe_ddc_edid, adapter);
> +	return drm_edid_probe_custom(drm_do_probe_ddc_edid, adapter, false);
>  }
>  EXPORT_SYMBOL(drm_probe_ddc);
>  
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 4d1797ade5f1d..299278c7ee1c2 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -412,7 +412,7 @@ static inline void drm_edid_decode_panel_id(u32 panel_id, char vend[4], u16 *pro
>  
>  bool
>  drm_edid_probe_custom(int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
> -		      void *context);
> +		      void *context, bool validate);
>  bool drm_probe_ddc(struct i2c_adapter *adapter);
>  struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,

-- 
Jani Nikula, Intel
