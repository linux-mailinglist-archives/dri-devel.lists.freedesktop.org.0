Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9D587DF1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 16:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AD82A307;
	Tue,  2 Aug 2022 14:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE8E18BF94
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 14:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659449525; x=1690985525;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dtqbIWIshtMdWZaXawlb0KolgEJHLzd9qo0q7OSwsjo=;
 b=Iexo7/JHG/SIWrbLVCKK/Ip8mAlLKgvewrYY47jBb3dmdkmxxCGot262
 3r8+CrkmWiYr/Yqw83Ip00V1ASVQU0n0baToJzCU4KKfWH5ahgnQIas9y
 CNA1F7QhKdq11R7XPdJVwrISyU7C6AN5J6SRAl58pUY+BKMcZwMWcxly8
 hq16RV70K/dkFw7mGcFMKDvIwQEybGMKGVG30+tv0EgFWVcJ9IyB7SK4k
 SEUZ5csBGqmubHdouJ93f2mwRjiB0iPxve/fKDvbrfBO54XBuhHi5zUsg
 vJj6ezN80AlQKpot+YdvwjzJo7jD6pD4lmg/vPcm8Qq+WV8Tq4aiPJm4g w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="269796756"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="269796756"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 07:12:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="661637859"
Received: from llaviniu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 07:11:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, deller@gmx.de,
 airlied@linux.ie
Subject: Re: [PATCH v15 03/11] drm/edid: Add cea_sad helpers for freq/length
In-Reply-To: <20220727045035.32225-4-rex-bc.chen@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-4-rex-bc.chen@mediatek.com>
Date: Tue, 02 Aug 2022 17:11:55 +0300
Message-ID: <87zggmenv8.fsf@intel.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022, Bo-Chen Chen <rex-bc.chen@mediatek.com> wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
>
> This patch adds two helper functions that extract the frequency and word
> length from a struct cea_sad.
>
> For these helper functions new defines are added that help translate the
> 'freq' and 'byte2' fields into real numbers.

I think we should stop adding a plethora of functions that deal with
sads like this.

There should probably be *one* struct that contains all the details you
and everyone need extracted. There should be *one* function that fills
in all the details. The struct should be placed in
connector->display_info, and the function should be called *once* from
update_display_info().

Ideally, the function shouldn't even be exposed from drm_edid.c, but if
you still need to deal with situations where you don't call connector
update, maybe it needs to be exposed.

BR,
Jani.


>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 63 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     | 14 +++++++++
>  2 files changed, 77 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index bc43e1b32092..2a6f92da5ff3 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4916,6 +4916,69 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
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
> +	case DRM_CEA_SAD_FREQ_32KHZ:
> +		return 32000;
> +	case DRM_CEA_SAD_FREQ_44KHZ:
> +		return 44100;
> +	case DRM_CEA_SAD_FREQ_48KHZ:
> +		return 48000;
> +	case DRM_CEA_SAD_FREQ_88KHZ:
> +		return 88200;
> +	case DRM_CEA_SAD_FREQ_96KHZ:
> +		return 96000;
> +	case DRM_CEA_SAD_FREQ_176KHZ:
> +		return 176400;
> +	case DRM_CEA_SAD_FREQ_192KHZ:
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
> + *
> + * Return: Word length in bits or a negative errno if parsing failed.
> + */
> +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad)
> +{
> +	if (sad->format != HDMI_AUDIO_CODING_TYPE_PCM) {
> +		DRM_WARN("Unable to get the uncompressed word length for format: %u\n",
> +			 sad->format);
> +		return -EINVAL;
> +	}
> +
> +	switch (sad->byte2) {
> +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT:
> +		return 16;
> +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT:
> +		return 20;
> +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT:
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
> index c2c43a4af681..779b710aed40 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -373,6 +373,18 @@ struct cea_sad {
>  	u8 byte2;
>  };
>  
> +#define DRM_CEA_SAD_FREQ_32KHZ  BIT(0)
> +#define DRM_CEA_SAD_FREQ_44KHZ  BIT(1)
> +#define DRM_CEA_SAD_FREQ_48KHZ  BIT(2)
> +#define DRM_CEA_SAD_FREQ_88KHZ  BIT(3)
> +#define DRM_CEA_SAD_FREQ_96KHZ  BIT(4)
> +#define DRM_CEA_SAD_FREQ_176KHZ BIT(5)
> +#define DRM_CEA_SAD_FREQ_192KHZ BIT(6)
> +
> +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
> +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
> +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
> +
>  struct drm_encoder;
>  struct drm_connector;
>  struct drm_connector_state;
> @@ -380,6 +392,8 @@ struct drm_display_mode;
>  
>  int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads);
>  int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
> +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
> +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad);
>  int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);

-- 
Jani Nikula, Intel Open Source Graphics Center
