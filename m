Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5CC4020B5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 22:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D03889C29;
	Mon,  6 Sep 2021 20:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E77589C29
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 20:30:30 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3fc01c45-0f51-11ec-a02a-0050568c148b;
 Mon, 06 Sep 2021 20:30:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 05B32194CF3;
 Mon,  6 Sep 2021 22:30:19 +0200 (CEST)
Date: Mon, 6 Sep 2021 22:30:26 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 4/6] video/hdmi: Add audio_infoframe packing for DP
Message-ID: <YTZ6YvifP0EqGBzR@ravnborg.org>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-5-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210906193529.718845-5-msp@baylibre.com>
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

On Mon, Sep 06, 2021 at 09:35:27PM +0200, Markus Schneider-Pargmann wrote:
> Similar to HDMI, DP uses audio infoframes as well which are structured
> very similar to the HDMI ones.
> 
> This patch adds a helper function to pack the HDMI audio infoframe for
> DP, called hdmi_audio_infoframe_pack_for_dp().
> hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> packs the payload only and can be used for HDMI and DP.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/video/hdmi.c | 87 +++++++++++++++++++++++++++++++++++---------
>  include/linux/hdmi.h |  4 ++
>  2 files changed, 73 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 947be761dfa4..59c4341549e4 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -387,6 +387,28 @@ int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
>  }
>  EXPORT_SYMBOL(hdmi_audio_infoframe_check);
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
>  /**
>   * hdmi_audio_infoframe_pack_only() - write HDMI audio infoframe to binary buffer
>   * @frame: HDMI audio infoframe
> @@ -404,7 +426,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
>  ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
>  				       void *buffer, size_t size)
>  {
> -	unsigned char channels;
>  	u8 *ptr = buffer;
>  	size_t length;
>  	int ret;
> @@ -420,28 +441,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
>  
>  	memset(buffer, 0, size);
>  
> -	if (frame->channels >= 2)
> -		channels = frame->channels - 1;
> -	else
> -		channels = 0;
> -
>  	ptr[0] = frame->type;
>  	ptr[1] = frame->version;
>  	ptr[2] = frame->length;
>  	ptr[3] = 0; /* checksum */
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
>  	hdmi_infoframe_set_checksum(buffer, length);
>  
> @@ -479,6 +485,51 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
>  }
>  EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
>  
> +/**
> + * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
> + *                                    displayport
> + *
> + * @frame HDMI Audio infoframe
> + * @header Header buffer to be used
> + * @header_size Size of header buffer
> + * @data Data buffer to be used
> + * @data_size Size of data buffer
> + * @dp_version Display Port version to be encoded in the header
> + *
> + * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
> + * fills both header and data buffer with the required data.
> + *
> + * Return: Number of total written bytes or a negative errno on failure.
> + */
> +ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
> +					 void *header, size_t header_size,
> +					 void *data, size_t data_size,
> +					 u8 dp_version)
> +{
> +	int ret;
> +	u8 *hdr_ptr = header;
> +
> +	ret = hdmi_audio_infoframe_check(frame);
> +	if (ret)
> +		return ret;
> +
> +	if (header_size < 4 || data_size < frame->length)
> +		return -ENOSPC;
> +
> +	memset(header, 0, header_size);
> +	memset(data, 0, data_size);
> +
> +	// Secondary-data packet header
> +	hdr_ptr[1] = frame->type;
> +	hdr_ptr[2] = 0x1B;  // As documented by DP spec for Secondary-data Packets
Any constant we could use or define and use here?
Hard coding 0x1b is the less desireable option.

	Sam

> +	hdr_ptr[3] = (dp_version & 0x3f) << 2;
> +
> +	hdmi_audio_infoframe_pack_payload(frame, data);
> +
> +	return frame->length + 4;
> +}
> +EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
> +
>  /**
>   * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
>   * @frame: HDMI vendor infoframe
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index c8ec982ff498..f576a0b08c85 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -334,6 +334,10 @@ struct hdmi_audio_infoframe {
>  int hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame);
>  ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
>  				  void *buffer, size_t size);
> +ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
> +					 void *header, size_t header_size,
> +					 void *data, size_t data_size,
> +					 u8 dp_version);
>  ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
>  				       void *buffer, size_t size);
>  int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame);
> -- 
> 2.33.0
