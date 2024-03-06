Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42890873258
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 10:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374EA10EA64;
	Wed,  6 Mar 2024 09:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AewuDwmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAD210EA0B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 09:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709716714; x=1741252714;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=D34rJ2jpo3Sm8BQKBLjmFR9WHBkOQ9Sy3+mtZWb4xy4=;
 b=AewuDwmDTN8N66Y5R9SfgUesvMF2OWWwrHQD+FcWoKG6zc6cmlxJ7WXV
 1fr6bz5XZ3TiQy9sbNbjmKy5kMkodpXAkUiWCclLGrhz7/0FWKcA7UFG8
 XBaK9vXAL2f/oDfsBsaACEFv7xS1G7MN03L3VpAY2M2bP8T7MuMaYFSRx
 EdIFvtwy06QMYllmo6gblY8t41zF3IwQWBBH+PfRvLlck9MFVwfqXwPAc
 tXa6nZTWcmso0z6dx3ielzu/y3bhVzrB23W1Co2trOYwxag9GqxwkXmSC
 /oGaoP/avBMjD+h5eXZlGvXNwuISDCjyumLZv8ZsshYO05J2VGjpX4Ftn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="7260804"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="7260804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 01:18:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="40677436"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 01:18:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] drm/edid: Match edid quirks with identity
In-Reply-To: <20240306004347.974304-4-hsinyi@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306004347.974304-1-hsinyi@chromium.org>
 <20240306004347.974304-4-hsinyi@chromium.org>
Date: Wed, 06 Mar 2024 11:18:26 +0200
Message-ID: <87plw7zpjx.fsf@intel.com>
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

On Tue, 05 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> Currently edid quirks are matched by panel id only.
>
> Modify it to match with identity so it's easier to be extended
> for more complex matching if required.
>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
> v4: new
> Per discussion https://lore.kernel.org/lkml/87a5nd4tsg.fsf@intel.com/
> ---
>  drivers/gpu/drm/drm_edid.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5e7e69e0e345..93a49b262dbe 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -114,13 +114,15 @@ struct drm_edid_ident_closure {
>  
>  #define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
>  { \
> -	.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
> -					     product_id), \
> +	.ident = { \
> +		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, \
> +						     vend_chr_2, product_id), \
> +	}, \
>  	.quirks = _quirks \
>  }
>  
>  static const struct edid_quirk {
> -	u32 panel_id;
> +	const struct drm_edid_ident ident;
>  	u32 quirks;
>  } edid_quirk_list[] = {
>  	/* Acer AL1706 */
> @@ -2921,16 +2923,17 @@ EXPORT_SYMBOL(drm_edid_duplicate);
>   * @drm_edid: EDID to process
>   *
>   * This tells subsequent routines what fixes they need to apply.
> + *
> + * Return: A u32 represents the quirks to apply.
>   */
>  static u32 edid_get_quirks(const struct drm_edid *drm_edid)
>  {
> -	u32 panel_id = edid_extract_panel_id(drm_edid->edid);
>  	const struct edid_quirk *quirk;
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
>  		quirk = &edid_quirk_list[i];
> -		if (quirk->panel_id == panel_id)
> +		if (drm_edid_match_identity(drm_edid, &quirk->ident))
>  			return quirk->quirks;
>  	}

-- 
Jani Nikula, Intel
