Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3058D574B9A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 13:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41770112877;
	Thu, 14 Jul 2022 11:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2B010E071
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 11:12:49 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 65E0E6601A3B;
 Thu, 14 Jul 2022 12:12:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657797167;
 bh=ofHlqQBpp6w/LA7oamUpNLobhMVnwMZheJEW2td7o8w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hxx6klICvRWNySKOsGblV95bRhvescjpQujgbjCRX5WR8cHK8YBCFmePUXLNdZAUJ
 8daIIbAvbjJdtaHbNLzzU0MZYK+UI12ZPzThokFgSrbD/XPnJLOBcBEsWz2ab7+7O0
 4pGavv5mW0qgixNldFjda4Bhuu0VqYBN5qjr2v6OBe7bn4cuKsO0n01rsTVrm1omn/
 Y3xawh772Qm9CHqZrASorTMJykvqxsrsNbXeui+7WBpStCqCyqMac4K2QWHt2cTAMj
 Ab1AAc/1FTdxBUVEwNjnQyH81x2MyqKV8xz0t10xb7F6E8IrwW37akgsIi1RKXqAIM
 L4WYLItI2jFKQ==
Message-ID: <67b3a842-66aa-2336-3955-d5aa760cdd4b@collabora.com>
Date: Thu, 14 Jul 2022 13:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 03/10] drm/edid: Add cea_sad helpers for freq/length
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712111223.13080-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/07/22 13:12, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds two helper functions that extract the frequency and word
> length from a struct cea_sad.
> 
> For these helper functions new defines are added that help translate the
> 'freq' and 'byte2' fields into real numbers.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 73 ++++++++++++++++++++++++++++++++++++++
>   include/drm/drm_edid.h     | 14 ++++++++
>   2 files changed, 87 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index bc43e1b32092..79316d7f1fd8 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4916,6 +4916,79 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
>   }
>   EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
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
> +static bool drm_cea_sad_is_pcm(const struct cea_sad *sad)
> +{
> +	switch (sad->format) {
> +	case HDMI_AUDIO_CODING_TYPE_PCM:
> +		return true;
> +	default:
> +		return false;
> +	}

Are you sure that you need this helper? That's used only in one function...
...if you really need this one, though, I don't think that using a switch
is the best option here.

Unless anyone is against that (please, reason?), I would be for doing it like:

	return sad->format == HDMI_AUDIO_CODING_TYPE_PCM;

Everything else looks good to me (and working, too).

Cheers,
Angelo
