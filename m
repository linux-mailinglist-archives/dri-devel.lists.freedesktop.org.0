Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55411574BED
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 13:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B98A1127F8;
	Thu, 14 Jul 2022 11:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8C91127DC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 11:26:27 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 656336601A3B;
 Thu, 14 Jul 2022 12:26:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657797985;
 bh=S3uu1fiJqnW9GfhBdNOm5ox+Kfz/PBBejcQCNxtJG7Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nmnLgvsJ7wUdm7PX1mVlONbq1I4u5c8cliefOUgywi8O7eQNZ9V+UIqkndktdgbcP
 I0dEshLOWiiUfvkV/+4U8lS3BJfHmZgWj3KVrMa/ccUIYo9Dnpb4HTLgtic2FTgNh7
 g5d+02tP+6EPQhfdPAcWyW0jpcfH2kHqBjomZ+ZuOvzEhVWZ2vJ9XBqB3laT4PSV/x
 wE27WhtoF+NNzOHG02pv3MTUxMxOvBeOAV4Al3aYiSSPgVfkd9x19nYDLM9Qlt0zBW
 OPk0gbvq517iOXDN2+v2c/sA8s86kGLxsltZPJRKhmMDcmNkBKg0OPz6pPN2wKSIEw
 tSgJZPher7yKQ==
Message-ID: <8bc57373-70e4-8ab6-659f-0917dbf14c38@collabora.com>
Date: Thu, 14 Jul 2022 13:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 04/10] video/hdmi: Add audio_infoframe packing for DP
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712111223.13080-5-rex-bc.chen@mediatek.com>
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
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Similar to HDMI, DP uses audio infoframes as well which are structured
> very similar to the HDMI ones.
> 
> This patch adds a helper function to pack the HDMI audio infoframe for
> DP, called hdmi_audio_infoframe_pack_for_dp().
> hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> packs the payload only and can be used for HDMI and DP.
> 
> Also constify the frame parameter in hdmi_audio_infoframe_check() as
> it is passed to hdmi_audio_infoframe_check_only() which expects a const.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/video/hdmi.c         | 82 +++++++++++++++++++++++++++---------
>   include/drm/display/drm_dp.h |  2 +
>   include/linux/hdmi.h         |  7 ++-
>   3 files changed, 71 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 947be761dfa4..86805d77cc86 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -21,6 +21,7 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> +#include <drm/display/drm_dp.h>
>   #include <linux/bitops.h>
>   #include <linux/bug.h>
>   #include <linux/errno.h>
> @@ -381,12 +382,34 @@ static int hdmi_audio_infoframe_check_only(const struct hdmi_audio_infoframe *fr
>    *
>    * Returns 0 on success or a negative error code on failure.
>    */
> -int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
> +int hdmi_audio_infoframe_check(const struct hdmi_audio_infoframe *frame)
>   {
>   	return hdmi_audio_infoframe_check_only(frame);
>   }
>   EXPORT_SYMBOL(hdmi_audio_infoframe_check);
>   
> +static void
> +hdmi_audio_infoframe_pack_payload(const struct hdmi_audio_infoframe *frame,
> +				  u8 *buffer)
> +{
> +	u8 channels;
> +
> +	if (frame->channels >= 2)
> +		channels = frame->channels - 1;
> +	else
> +		channels = 0;
> +
> +	buffer[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> +	buffer[1] = ((frame->sample_frequency & 0x7) << 2) |
> +		 (frame->sample_size & 0x3);
> +	buffer[2] = frame->coding_type_ext & 0x1f;
> +	buffer[3] = frame->channel_allocation;
> +	buffer[4] = (frame->level_shift_value & 0xf) << 3;
> +
> +	if (frame->downmix_inhibit)
> +		buffer[4] |= BIT(7);
> +}
> +
>   /**
>    * hdmi_audio_infoframe_pack_only() - write HDMI audio infoframe to binary buffer
>    * @frame: HDMI audio infoframe
> @@ -404,7 +427,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
>   ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
>   				       void *buffer, size_t size)
>   {
> -	unsigned char channels;
>   	u8 *ptr = buffer;
>   	size_t length;
>   	int ret;
> @@ -420,28 +442,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
>   
>   	memset(buffer, 0, size);
>   
> -	if (frame->channels >= 2)
> -		channels = frame->channels - 1;
> -	else
> -		channels = 0;
> -
>   	ptr[0] = frame->type;
>   	ptr[1] = frame->version;
>   	ptr[2] = frame->length;
>   	ptr[3] = 0; /* checksum */
>   
> -	/* start infoframe payload */
> -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
> -
> -	ptr[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> -	ptr[1] = ((frame->sample_frequency & 0x7) << 2) |
> -		 (frame->sample_size & 0x3);
> -	ptr[2] = frame->coding_type_ext & 0x1f;
> -	ptr[3] = frame->channel_allocation;
> -	ptr[4] = (frame->level_shift_value & 0xf) << 3;
> -
> -	if (frame->downmix_inhibit)
> -		ptr[4] |= BIT(7);
> +	hdmi_audio_infoframe_pack_payload(frame,
> +					  ptr + HDMI_INFOFRAME_HEADER_SIZE);
>   
>   	hdmi_infoframe_set_checksum(buffer, length);
>   
> @@ -479,6 +486,43 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
>   }
>   EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
>   
> +/**
> + * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for DisplayPort
> + *
> + * @frame:      HDMI Audio infoframe
> + * @sdp:        secondary data packet for display port. This is filled with the
> + * appropriate: data

"This is filled with the appropriate data"

... well, that's pretty obvious, isn't it?
You're describing that this function is filling sdp in the description, so you
can just remove that part.

Also, "Secondary data packet for DisplayPort", please.


> + * @dp_version: Display Port version to be encoded in the header

We're not meaning "a display port", but really "DisplayPort": please remove
the space between "Display" and "Port" :-)

(here and in the description below)

> + *
> + * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
> + * fills the secondary data packet to be used for Display Port.
> + *
> + * Return: Number of total written bytes or a negative errno on failure.
> + */
> +ssize_t
> +hdmi_audio_infoframe_pack_for_dp(const struct hdmi_audio_infoframe *frame,
> +				 struct dp_sdp *sdp, u8 dp_version)
> +{
> +	int ret;
> +
> +	ret = hdmi_audio_infoframe_check(frame);
> +	if (ret)
> +		return ret;
> +
> +	memset(sdp->db, 0, sizeof(sdp->db));
> +
> +	/* Secondary-data packet header */
> +	sdp->sdp_header.HB0 = 0;
> +	sdp->sdp_header.HB1 = frame->type;
> +	sdp->sdp_header.HB2 = DP_SDP_AUDIO_INFOFRAME_HB2;
> +	sdp->sdp_header.HB3 = (dp_version & 0x3f) << 2;
> +
> +	hdmi_audio_infoframe_pack_payload(frame, sdp->db);
> +
> +	return frame->length + 4;

What's this magic number 4 about?

Please use a definition for that.

> +}
> +EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
> +
>   /**
>    * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
>    * @frame: HDMI vendor infoframe
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 9e3aff7e68bb..6c0871164771 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1536,6 +1536,8 @@ enum drm_dp_phy {
>   #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
>   /* 0x80+ CEA-861 infoframe types */
>   
> +#define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b
> +
>   /**
>    * struct dp_sdp_header - DP secondary data packet header
>    * @HB0: Secondary Data Packet ID
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index c8ec982ff498..2f4dcc8d060e 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -336,7 +336,12 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
>   				  void *buffer, size_t size);
>   ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
>   				       void *buffer, size_t size);
> -int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame);
> +int hdmi_audio_infoframe_check(const struct hdmi_audio_infoframe *frame);
> +
> +struct dp_sdp;
> +ssize_t
> +hdmi_audio_infoframe_pack_for_dp(const struct hdmi_audio_infoframe *frame,
> +				 struct dp_sdp *sdp, u8 dp_version);
>   
>   enum hdmi_3d_structure {
>   	HDMI_3D_STRUCTURE_INVALID = -1,

