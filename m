Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B6C4BDA33
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90F210E3E1;
	Mon, 21 Feb 2022 14:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EE110E3E1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:30:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7B35C1F437AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453811;
 bh=30ZWPYBlO//VJMyIsttgH0MbJuCyxlDhqahcFdfPAB8=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=QJ6FOiPGUU7GGQDnQyd25ReRL5cH58XE8TzWDM1npSemzXh2egj1zhpwbhRMJ3Lmj
 tGyN1oFN9mF0tG6VDxUVdN8TacgsCaX2KGZrq4FOKM0PpZ+ITOMvuYoLHx0sW4X50P
 bA2TeDFRtsOV7b8gmAd2R/FvIEEsb3frNQixEvLY3kFlBrqVyB6H5edaNR/BIygDKM
 LO3Yhv3xuemjuPMN8qiK2zbsaiGuUEqSFg4Ct8YletOTNm+haNpLY91tPyNoi39gMm
 lBHbS6w5WSg0DevFAz7riBOae+Le7wrfV0DaRNq8tb1J0dUvWO01J5qQoy2Ev9ala1
 ig10zEz/2uVrQ==
Message-ID: <a7605c9f-55f9-c7cc-f2b9-89ddbffb4927@collabora.com>
Date: Mon, 21 Feb 2022 15:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 04/19] video/hdmi: Add audio_infoframe packing for DP
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-5-granquet@baylibre.com>
Content-Language: en-US
In-Reply-To: <20220218145437.18563-5-granquet@baylibre.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
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
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/video/hdmi.c        | 83 ++++++++++++++++++++++++++++---------
>   include/drm/drm_dp_helper.h |  2 +
>   include/linux/hdmi.h        |  7 +++-
>   3 files changed, 72 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 947be761dfa40..63e74d9fd210e 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -21,6 +21,7 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> +#include <drm/drm_dp_helper.h>
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
> @@ -479,6 +486,44 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
>   }
>   EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
>   
> +/**
> + * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
> + *                                    displayport

This fits in one line (82 cols is ok)... but, anyway, please capitalize D and P
in the DisplayPort word.

> + *
> + * @frame HDMI Audio infoframe

You're almost there! You missed a colon after each description.
Also, I personally like seeing indented descriptions as, in my opinion, this
enhances human readability, as it's a bit more pleasing to the eye... but
it's not a requirement, so you be the judge.

* @frame:      HDMI Audio infoframe
* @sdp:        Secondary data packet......
* @dp_version: DisplayPort version......

Please fix.

> + * @sdp secondary data packet for display port. This is filled with the
> + * appropriate data
> + * @dp_version Display Port version to be encoded in the header
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
> +	// Secondary-data packet header

Please, C-style comments:

	/* Secondary-data packet header */

Thanks,
Angelo
