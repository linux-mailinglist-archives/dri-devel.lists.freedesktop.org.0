Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 235A911B774
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 17:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8206EB73;
	Wed, 11 Dec 2019 16:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509616EB73
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 16:08:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 08:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="210811890"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 11 Dec 2019 08:08:16 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Dec 2019 18:08:16 +0200
Date: Wed, 11 Dec 2019 18:08:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Johan Korsnes <jkorsnes@cisco.com>
Subject: Re: [PATCH v2] video: hdmi: indicate applicability in avi infoframe
 log
Message-ID: <20191211160816.GK1208@intel.com>
References: <20191211094842.165087-1-jkorsnes@cisco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211094842.165087-1-jkorsnes@cisco.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Hans Verkuil <hansverk@cisco.com>, Martin Bugge <marbugge@cisco.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 10:48:42AM +0100, Johan Korsnes wrote:
> When logging the AVI InfoFrame, clearly indicate whether or not
> attributes are active/"in effect". The specification is given in
> CTA-861-G Section 6.4: Format of Version 2, 3 & 4 AVI InfoFrames.
> =

> Attribute         Bytes    Requirement
> Ext. Colorimetry  EC0..EC2 Colorimetry (C0,C1) set to Extended.
> IT Contents Type  CN0,CN1  IT Content (ITC) set to True.
> RGB Quant. Range  Q0,Q1    Color Space (Y0..Y2) set to RGB.
> YCC Quant. Range  YQ0,YQ1  Color space (Y0..Y2) set to YCbCr.
> =

> Example log output with patch applied:
> HDMI infoframe: Auxiliary Video Information (AVI), version 2, length 13
>     colorspace: RGB
>     scan mode: No Data
>     colorimetry: ITU709
>     picture aspect: 16:9
>     active aspect: Same as Picture
>     itc: IT Content
>     extended colorimetry: N/A (0x0)
>     quantization range: Full
>     nups: Unknown Non-uniform Scaling
>     video code: 16
>     ycc quantization range: N/A (0x0)
>     hdmi content type: Graphics
>     pixel repeat: 0
>     bar top 0, bottom 0, left 0, right 0
> =

> Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
> Cc: Hans Verkuil <hansverk@cisco.com>
> Cc: Martin Bugge <marbugge@cisco.com>
> =

> ---
> v1 -> v2:
>  * Indicate applicability not only for ext. colorimetry
> ---
>  drivers/video/hdmi.c | 40 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 8 deletions(-)
> =

> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 9c82e2a0a411..491a77b28a9b 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -1209,16 +1209,40 @@ static void hdmi_avi_infoframe_log(const char *le=
vel,
>  	hdmi_log("    active aspect: %s\n",
>  			hdmi_active_aspect_get_name(frame->active_aspect));
>  	hdmi_log("    itc: %s\n", frame->itc ? "IT Content" : "No Data");
> -	hdmi_log("    extended colorimetry: %s\n",
> -			hdmi_extended_colorimetry_get_name(frame->extended_colorimetry));
> -	hdmi_log("    quantization range: %s\n",
> -			hdmi_quantization_range_get_name(frame->quantization_range));
> +
> +	if (frame->colorimetry =3D=3D HDMI_COLORIMETRY_EXTENDED)
> +		hdmi_log("    extended colorimetry: %s\n",
> +			 hdmi_extended_colorimetry_get_name(frame->extended_colorimetry));
> +	else
> +		hdmi_log("    extended colorimetry: N/A (0x%x)\n",
> +			 frame->extended_colorimetry);
> +
> +	if (frame->colorspace =3D=3D HDMI_COLORSPACE_RGB)
> +		hdmi_log("    quantization range: %s\n",
> +			 hdmi_quantization_range_get_name(frame->quantization_range));
> +	else
> +		hdmi_log("    quantization range: N/A (0x%x)\n",
> +			 frame->quantization_range);
> +
>  	hdmi_log("    nups: %s\n", hdmi_nups_get_name(frame->nups));
>  	hdmi_log("    video code: %u\n", frame->video_code);
> -	hdmi_log("    ycc quantization range: %s\n",
> -			hdmi_ycc_quantization_range_get_name(frame->ycc_quantization_range));
> -	hdmi_log("    hdmi content type: %s\n",
> -			hdmi_content_type_get_name(frame->content_type));
> +
> +	if (frame->colorspace =3D=3D HDMI_COLORSPACE_YUV422 ||
> +	    frame->colorspace =3D=3D HDMI_COLORSPACE_YUV444 ||
> +	    frame->colorspace =3D=3D HDMI_COLORSPACE_YUV420)

ocd nit: order 444||422||420 or 420||422||444

> +		hdmi_log("    ycc quantization range: %s\n",
> +			 hdmi_ycc_quantization_range_get_name(frame->ycc_quantization_range));
> +	else
> +		hdmi_log("    ycc quantization range: N/A (0x%x)\n",
> +			 frame->ycc_quantization_range);

CTA-861-G does recommend that we set YQ to match Q when trasmitting
RGB. So not sure "N/A" is entirely accurate here. However we also
found out that following that recommendation did break some crappy
sinks which get confused when they see RGB + YQ!=3D0. So now we follow
that recommendation only for HDMI 2.0+ sinks. Anyways, as long as the
raw value is present I guess we can stil spot such cases from the logs.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +
> +	if (frame->itc)
> +		hdmi_log("    hdmi content type: %s\n",
> +			 hdmi_content_type_get_name(frame->content_type));
> +	else
> +		hdmi_log("    hdmi content type: N/A (0x%x)\n",
> +			 frame->content_type);
> +
>  	hdmi_log("    pixel repeat: %u\n", frame->pixel_repeat);
>  	hdmi_log("    bar top %u, bottom %u, left %u, right %u\n",
>  			frame->top_bar, frame->bottom_bar,
> -- =

> 2.23.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
