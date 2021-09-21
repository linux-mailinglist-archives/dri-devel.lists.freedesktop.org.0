Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43CA4130F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 11:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A106E91C;
	Tue, 21 Sep 2021 09:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59216E91C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:49:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="284334833"
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="284334833"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 02:49:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="549418557"
Received: from unknown (HELO localhost) ([10.251.218.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 02:49:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v2 3/6] drm/edid: Add cea_sad helpers for freq/length
In-Reply-To: <20210920084424.231825-4-msp@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210920084424.231825-1-msp@baylibre.com>
 <20210920084424.231825-4-msp@baylibre.com>
Date: Tue, 21 Sep 2021 12:49:31 +0300
Message-ID: <87mto6tg0k.fsf@intel.com>
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

On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> This patch adds two helper functions that extract the frequency and word
> length from a struct cea_sad.
>
> For these helper functions new defines are added that help translate the
> 'freq' and 'byte2' fields into real numbers.
>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>
> Notes:
>     Changes v1 -> v2:
>     - Use const struct pointers.
>     - Add a check whether the format is actually uncompressed or not.
>
>  drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     | 18 ++++++++--
>  2 files changed, 90 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 6325877c5fd6..28df422fbc03 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4666,6 +4666,80 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
>  }
>  EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
>  
> +/**
> + * drm_cea_sad_get_sample_rate - Extract the sample rate from cea_sad
> + * @sad: Pointer to the cea_sad struct
> + *
> + * Extracts the cea_sad frequency field and returns the sample rate in Hz.
> + *
> + * Return: Sample rate in Hz or a negative errno if parsing failed.
> + */
> +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
> +{
> +	switch (sad->freq) {
> +	case CEA_SAD_FREQ_32KHZ:
> +		return 32000;
> +	case CEA_SAD_FREQ_44KHZ:
> +		return 44100;
> +	case CEA_SAD_FREQ_48KHZ:
> +		return 48000;
> +	case CEA_SAD_FREQ_88KHZ:
> +		return 88200;
> +	case CEA_SAD_FREQ_96KHZ:
> +		return 96000;
> +	case CEA_SAD_FREQ_176KHZ:
> +		return 176400;
> +	case CEA_SAD_FREQ_192KHZ:
> +		return 192000;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
> +
> +static bool drm_cea_sad_is_uncompressed(const struct cea_sad *sad)
> +{
> +	switch (sad->format) {
> +	case HDMI_AUDIO_CODING_TYPE_STREAM:
> +	case HDMI_AUDIO_CODING_TYPE_PCM:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/**
> + * drm_cea_sad_get_uncompressed_word_length - Extract word length
> + * @sad: Pointer to the cea_sad struct
> + *
> + * Extracts the cea_sad byte2 field and returns the word length for an
> + * uncompressed stream.
> + *
> + * Note: This function may only be called for uncompressed audio.
> + *
> + * Return: Word length in bits or a negative errno if parsing failed.
> + */
> +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad)
> +{
> +	if (!drm_cea_sad_is_uncompressed(sad)) {
> +		DRM_WARN("Unable to get the uncompressed word length for a compressed format: %u\n",
> +			 sad->format);
> +		return -EINVAL;
> +	}
> +
> +	switch (sad->byte2) {
> +	case CEA_SAD_UNCOMPRESSED_WORD_16BIT:
> +		return 16;
> +	case CEA_SAD_UNCOMPRESSED_WORD_20BIT:
> +		return 20;
> +	case CEA_SAD_UNCOMPRESSED_WORD_24BIT:
> +		return 24;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
> +
>  /**
>   * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync delay
>   * @connector: connector associated with the HDMI/DP sink
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index deccfd39e6db..7b7d71a7154d 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -361,12 +361,24 @@ struct edid {
>  
>  /* Short Audio Descriptor */
>  struct cea_sad {
> -	u8 format;
> +	u8 format; /* See HDMI_AUDIO_CODING_TYPE_* */
>  	u8 channels; /* max number of channels - 1 */
> -	u8 freq;
> +	u8 freq; /* See CEA_SAD_FREQ_* */
>  	u8 byte2; /* meaning depends on format */
>  };
>  
> +#define CEA_SAD_FREQ_32KHZ  BIT(0)
> +#define CEA_SAD_FREQ_44KHZ  BIT(1)
> +#define CEA_SAD_FREQ_48KHZ  BIT(2)
> +#define CEA_SAD_FREQ_88KHZ  BIT(3)
> +#define CEA_SAD_FREQ_96KHZ  BIT(4)
> +#define CEA_SAD_FREQ_176KHZ BIT(5)
> +#define CEA_SAD_FREQ_192KHZ BIT(6)
> +
> +#define CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
> +#define CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
> +#define CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)

I suggest adding DRM_ prefixes here.

BR,
Jani.

> +
>  struct drm_encoder;
>  struct drm_connector;
>  struct drm_connector_state;
> @@ -374,6 +386,8 @@ struct drm_display_mode;
>  
>  int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
>  int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
> +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad);
>  int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);

-- 
Jani Nikula, Intel Open Source Graphics Center
