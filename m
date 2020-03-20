Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42518CC7C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 12:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F5B6EB06;
	Fri, 20 Mar 2020 11:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B996EB05;
 Fri, 20 Mar 2020 11:13:40 +0000 (UTC)
IronPort-SDR: oUCtmEqZFLxodeil+E94p0i8KYK1RRNcGBbLRg6AFbaqSGjt8Mg2yrkwIX5i2xpqIhBI0FVgPU
 a7W/5GtmWhdg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 04:13:38 -0700
IronPort-SDR: sNria2I5u1fs3HKy9Ek03GTqh83ttAEQUk4PEfutDwzTPL1WYfcSMSQZ3ZSPyNDx70dC49tPOO
 6JEm58iht4CQ==
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; d="scan'208";a="418682929"
Received: from rkamins1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.41.98])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 04:13:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [Intel-gfx] [PATCH v7 05/18] video/hdmi: Add Unpack only function
 for DRM infoframe
In-Reply-To: <20200211074657.231405-6-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
 <20200211074657.231405-6-gwan-gyeong.mun@intel.com>
Date: Fri, 20 Mar 2020 13:13:35 +0200
Message-ID: <87k13fcm8w.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Feb 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> It adds an unpack only function for DRM infoframe for dynamic range and
> mastering infoframe readout.
> It unpacks the information data block contained in the binary buffer into
> a structured frame of the HDMI Dynamic Range and Mastering (DRM)
> information frame.
>
> In contrast to hdmi_drm_infoframe_unpack() function, it does not verify
> a checksum.
>
> It can be used for unpacking a DP HDR Metadata Infoframe SDP case.
> DP HDR Metadata Infoframe SDP uses the same Dynamic Range and Mastering
> (DRM) information (CTA-861-G spec.) such as HDMI DRM infoframe.
> But DP SDP header and payload structure are different from HDMI DRM
> Infoframe. Therefore unpacking DRM infoframe for DP requires skipping of
> a verifying checksum.
>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Bartlomiej, can I have your ack for merging this via drm-intel along
with the rest of the series, please?

BR,
Jani.


> ---
>  drivers/video/hdmi.c | 58 +++++++++++++++++++++++++++++++-------------
>  include/linux/hdmi.h |  2 ++
>  2 files changed, 43 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 9c82e2a0a411..9818836d82b7 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -1775,20 +1775,18 @@ hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
>  }
>  
>  /**
> - * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
> + * hdmi_drm_infoframe_unpack_only() - unpack binary buffer to a HDMI DRM infoframe
>   * @frame: HDMI DRM infoframe
>   * @buffer: source buffer
>   * @size: size of buffer
>   *
> - * Unpacks the information contained in binary @buffer into a structured
> + * Unpacks the information data block contained in binary @buffer into a structured
>   * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
> - * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
> - * specification.
>   *
>   * Returns 0 on success or a negative error code on failure.
>   */
> -static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> -				     const void *buffer, size_t size)
> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
> +				   const void *buffer, size_t size)
>  {
>  	const u8 *ptr = buffer;
>  	const u8 *temp;
> @@ -1797,23 +1795,13 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
>  	int ret;
>  	int i;
>  
> -	if (size < HDMI_INFOFRAME_SIZE(DRM))
> -		return -EINVAL;
> -
> -	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> -	    ptr[1] != 1 ||
> -	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> -		return -EINVAL;
> -
> -	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
> +	if (size < HDMI_DRM_INFOFRAME_SIZE)
>  		return -EINVAL;
>  
>  	ret = hdmi_drm_infoframe_init(frame);
>  	if (ret)
>  		return ret;
>  
> -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
> -
>  	frame->eotf = ptr[0] & 0x7;
>  	frame->metadata_type = ptr[1] & 0x7;
>  
> @@ -1837,6 +1825,42 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(hdmi_drm_infoframe_unpack_only);
> +
> +/**
> + * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
> + * @frame: HDMI DRM infoframe
> + * @buffer: source buffer
> + * @size: size of buffer
> + *
> + * Unpacks the information contained in binary @buffer into a structured
> + * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
> + * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
> + * specification.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> +				     const void *buffer, size_t size)
> +{
> +	const u8 *ptr = buffer;
> +	int ret;
> +
> +	if (size < HDMI_INFOFRAME_SIZE(DRM))
> +		return -EINVAL;
> +
> +	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> +	    ptr[1] != 1 ||
> +	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> +		return -EINVAL;
> +
> +	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
> +		return -EINVAL;
> +
> +	ret = hdmi_drm_infoframe_unpack_only(frame, ptr + HDMI_INFOFRAME_HEADER_SIZE,
> +					     size - HDMI_INFOFRAME_HEADER_SIZE);
> +	return ret;
> +}
>  
>  /**
>   * hdmi_infoframe_unpack() - unpack binary buffer to a HDMI infoframe
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index 9918a6c910c5..afb43efc03e0 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -219,6 +219,8 @@ ssize_t hdmi_drm_infoframe_pack(struct hdmi_drm_infoframe *frame, void *buffer,
>  ssize_t hdmi_drm_infoframe_pack_only(const struct hdmi_drm_infoframe *frame,
>  				     void *buffer, size_t size);
>  int hdmi_drm_infoframe_check(struct hdmi_drm_infoframe *frame);
> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
> +				   const void *buffer, size_t size);
>  
>  enum hdmi_spd_sdi {
>  	HDMI_SPD_SDI_UNKNOWN,

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
