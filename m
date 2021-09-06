Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E324C4020AA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 22:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50C589C37;
	Mon,  6 Sep 2021 20:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1627589C37
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 20:19:03 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id a5e2fe20-0f4f-11ec-9416-0050568cd888;
 Mon, 06 Sep 2021 20:18:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 312A1194CF3;
 Mon,  6 Sep 2021 22:18:53 +0200 (CEST)
Date: Mon, 6 Sep 2021 22:19:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/6] drm/edid: Add cea_sad helpers for freq/length
Message-ID: <YTZ3tJh2ZSLNQEMc@ravnborg.org>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-4-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210906193529.718845-4-msp@baylibre.com>
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

Hi Markus,

On Mon, Sep 06, 2021 at 09:35:26PM +0200, Markus Schneider-Pargmann wrote:
> This patch adds two helper functions that extract the frequency and word
> length from a struct cea_sad.
> 
> For these helper functions new defines are added that help translate the
> 'freq' and 'byte2' fields into real numbers.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 57 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     | 18 ++++++++++--
>  2 files changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 81d5f2524246..2389d34ce10e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4666,6 +4666,63 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
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
> +int drm_cea_sad_get_sample_rate(struct cea_sad *sad)

It would be nice to use const struct cea_sad *sad here.

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
> +/**
> + * drm_cea_sad_get_uncompressed_word_length - Extract word length
> + * @sad: Pointer to the cea_sad struct
> + *
> + * Extracts the cea_sad byte2 field and returns the word length for an
> + * uncompressed stream.
> + *
> + * Note: This function may only be called for uncompressed audio.
Can you check or this and WARN (or drm_WARN) if this is not the case?

> + *
> + * Return: Word length in bits or a negative errno if parsing failed.
> + */
> +int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad)
Again, consider to use const.

	Sam

> +{
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
> index 759328a5eeb2..bed091a749ef 100644
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
> +
>  struct drm_encoder;
>  struct drm_connector;
>  struct drm_connector_state;
> @@ -374,6 +386,8 @@ struct drm_display_mode;
>  
>  int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
>  int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> +int drm_cea_sad_get_sample_rate(struct cea_sad *sad);
> +int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad);
>  int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);
>  
> -- 
> 2.33.0
