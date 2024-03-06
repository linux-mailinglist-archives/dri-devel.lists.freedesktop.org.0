Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208887324C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 10:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3337410E89E;
	Wed,  6 Mar 2024 09:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuaaJn85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400A810E81E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709716627; x=1741252627;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IUe3cAnoMPthLD2FcvfY1gDuS5k9Mc7AV8gDfGAWObY=;
 b=TuaaJn85bbZdN6zPtEp5+1CReL9vu9kl5UWdfa1y/ktkRdY1+VYkB3XR
 7XBw3Ztn6UUxVtYsBo+8YZszjUZu+mQeQhH9d945So2FGbWTAp2brCiw6
 TRBp8k38iQ73lxZGBcL2P0ZBabNPjqVuEh1VA/8eH7v/fKhLXdKhaW8bu
 ava9oYR1F8bSVxQOckAGa82E8aKEeUAce7Ox+gxuSoGprjftlPYmtqWhj
 XOp5iQdMZkcf6LwtYlubDeXz+hYoqpLAJO0+E0FOd75yDIEpYO1PM4+MW
 MKCekUblXhaQIzjsZ4D2VplsoxQVpBHssVCgq0PpeUNVM8BfBpmoT91JC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="7260732"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="7260732"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 01:17:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9855181"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 01:17:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] drm/edid: Add a function to match EDID with
 identity
In-Reply-To: <20240306004347.974304-3-hsinyi@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306004347.974304-1-hsinyi@chromium.org>
 <20240306004347.974304-3-hsinyi@chromium.org>
Date: Wed, 06 Mar 2024 11:16:59 +0200
Message-ID: <87sf13zpmc.fsf@intel.com>
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
> Create a type drm_edid_ident as the identity of an EDID. Currently it
> contains panel id and monitor name.
>
> Create a function that can match a given EDID and an identity:
> 1. Reject if the panel id doesn't match.
> 2. If name is not null in identity, try to match it in the detailed timing
>    blocks. Note that some panel vendors put the monitor name after
>    EDID_DETAIL_MONITOR_STRING.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v3->v4:
> 1. add a type drm_edid_ident
> 2. match name -> match identity. Modify function to use edid iterators.
> ---
>  drivers/gpu/drm/drm_edid.c | 76 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     |  8 ++++
>  2 files changed, 84 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f9e09f327f81..5e7e69e0e345 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -102,6 +102,11 @@ struct detailed_mode_closure {
>  	int modes;
>  };
>  
> +struct drm_edid_ident_closure {
> +	const struct drm_edid_ident *ident;
> +	bool matched;
> +};

More like drm_edid_match_closure.

> +
>  #define LEVEL_DMT	0
>  #define LEVEL_GTF	1
>  #define LEVEL_GTF2	2
> @@ -5455,6 +5460,77 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
>  		    connector->audio_latency[0], connector->audio_latency[1]);
>  }
>  
> +static void
> +match_identity(const struct detailed_timing *timing, void *data)
> +{
> +	struct drm_edid_ident_closure *closure = data;
> +	unsigned int i, j;
> +	const char *str = closure->ident->name;
> +	unsigned int buflen = strlen(str);
> +	unsigned int size = ARRAY_SIZE(timing->data.other_data.data.str.str);
> +
> +	if (buflen > size ||
> +	    !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_NAME) ||
> +	      is_display_descriptor(timing, EDID_DETAIL_MONITOR_STRING)))
> +		return;
> +
> +	for (i = 0; i < buflen; i++) {
> +		char c = timing->data.other_data.data.str.str[i];
> +
> +		if (c != str[i] ||  c == '\n')
> +			break;
> +		}
> +
> +		if (i == buflen) {

This will never be true.

> +			/* Allow trailing white spaces. */
> +			for (j = i; j < size; j++) {
> +				char c = timing->data.other_data.data.str.str[j];
> +
> +				if (c == '\n') {
> +					closure->matched = true;
> +					return;
> +				} else if (c != ' ') {
> +					break;
> +				}
> +			}
> +			if (j == size) {
> +				closure->matched = true;
> +				return;
> +			}
> +	}

Please let's use strcmp and friends instead of reinventing our own:

const char *name = closure->ident->name;
int name_len = strlen(name);
const char *desc = timing->data.other_data.data.str.str;
int desc_len = ARRAY_SIZE(timing->data.other_data.data.str.str);

if (name_len > desc_len)
	return;

if (strncmp(name, desc, name_en))
	return;

for (i = name_len; i < desc_len; i++) {
	if (!isspace(desc[i]) && !desc[i])
        	return;
}

closure->matched = true;


> +}
> +
> +/**
> + * drm_edid_match_identity - match drm_edid with given identity
> + * @drm_edid: EDID
> + * @ident: the EDID identity to match with
> + *
> + * Check if the EDID matches with the given identity.
> + *
> + * Return: True if the given identity matched with EDID, false otherwise.
> + */
> +bool drm_edid_match_identity(const struct drm_edid *drm_edid,
> +			     const struct drm_edid_ident *ident)

Can we please just call this drm_edid_match()? Is the _identity in the
name somehow helpful?

> +{
> +	if (!drm_edid || edid_extract_panel_id(drm_edid->edid) != ident->panel_id)
> +		return false;

Side note, edid_extract_panel_id() could now be made to take struct
drm_edid.

> +
> +	/* Match with name only if it's not NULL. */
> +	if (ident->name) {
> +		struct drm_edid_ident_closure closure = {
> +			.ident = ident,
> +			.matched = false,
> +		};
> +
> +		drm_for_each_detailed_block(drm_edid, match_identity, &closure);
> +
> +		return closure.matched;
> +	}
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_edid_match_identity);
> +
>  static void
>  monitor_name(const struct detailed_timing *timing, void *data)
>  {
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 9686a7cee6a6..01825a8954b6 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -312,6 +312,12 @@ struct edid {
>  	u8 checksum;
>  } __packed;
>  
> +/* EDID matching */
> +struct drm_edid_ident {
> +	u32 panel_id;
> +	const char *name;
> +};
> +
>  #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
>  
>  /* Short Audio Descriptor */
> @@ -412,6 +418,8 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>  			  struct i2c_adapter *adapter);
>  const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter);
>  u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
> +bool drm_edid_match_identity(const struct drm_edid *drm_edid,
> +			     const struct drm_edid_ident *ident);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter);
>  struct edid *drm_edid_duplicate(const struct edid *edid);

-- 
Jani Nikula, Intel
