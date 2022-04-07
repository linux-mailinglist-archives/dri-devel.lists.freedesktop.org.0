Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715E64F7DB4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3063A10E512;
	Thu,  7 Apr 2022 11:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8129E10E512
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649330147;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=HiSVc0ytRqP1ZR3LiiFmgC32MkGIQ9+sLPFAabHsH64=;
 b=MhhqRxpQgrGpuKy6t/DDwUDbj44Y9UGf9+tq9+E1aLIJNo99vBMaJtlsOBflf32q24
 CxMrQn2TVBi943FcTKdwHxFOegQk21tTFQETYsQRv/9fN95NGlZI7QWNB7ua9OrA+dYY
 lgVFnNTJEtLWmIC4/tClzYIxs0XDPUH5CkAHUXiLQb9zlKor5ZHFYFwKFXiBzP3L+hV8
 SxI9uZHqjy4LTAvdaZ/kCXpR/Z/MpScDn8N/rhtpqeCCsj0B6DGQqRsv7hjHqabUouF0
 py4HCPZ5ab92OQm7hd6r9f4nuQgxSIw2AVvYpgmrSkJuZGe9wbyHL1QmaRhQrvXkdUAr
 ZfQA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8MRqg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id k708cfy37BFjjwz
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 7 Apr 2022 13:15:45 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v17 4/6] drm/bridge: dw-hdmi: handle unusable or
 non-configured CSC module
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <0a8e4e32-cc86-e901-364b-d1e6e2bd37b5@baylibre.com>
Date: Thu, 7 Apr 2022 13:15:44 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <0AB1B9C7-3FCC-4466-91FC-71A63D2376DF@goldelico.com>
References: <cover.1649262368.git.hns@goldelico.com>
 <8de76ca2b478016f4dbed84e37db231e7810e56c.1649262368.git.hns@goldelico.com>
 <0a8e4e32-cc86-e901-364b-d1e6e2bd37b5@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Paul Boddie <paul@boddie.org.uk>, Maxime Ripard <maxime@cerno.tech>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 letux-kernel@openphoenux.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

> Am 07.04.2022 um 10:28 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>=20
> Hi,
>=20
> On 06/04/2022 18:26, H. Nikolaus Schaller wrote:
>> From: Neil Armstrong <narmstrong@baylibre.com>
>> The dw-hdmi integrates an optional Color Space Conversion feature =
used
>> to handle color-space conversions.
>> On some platforms, the CSC isn't built-in or non-functional.
>> This adds the necessary code to disable the CSC functionality
>> and limit the bus format negotiation to force using the same
>> input bus format as the output bus format.
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 100 =
+++++++++++++++-------
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |   1 +
>>  include/drm/bridge/dw_hdmi.h              |   1 +
>>  3 files changed, 71 insertions(+), 31 deletions(-)
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index f50af40e10340..b5a665c5e406e 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -158,6 +158,8 @@ struct dw_hdmi {
>>  	struct hdmi_data_info hdmi_data;
>>  	const struct dw_hdmi_plat_data *plat_data;
>>  +	bool csc_available;		/* indicates if the CSC engine =
is usable */
>> +
>>  	int vic;
>>    	u8 edid[HDMI_EDID_LEN];
>> @@ -1009,9 +1011,10 @@ static int is_color_space_interpolation(struct =
dw_hdmi *hdmi)
>>    static bool is_csc_needed(struct dw_hdmi *hdmi)
>>  {
>> -	return is_color_space_conversion(hdmi) ||
>> -	       is_color_space_decimation(hdmi) ||
>> -	       is_color_space_interpolation(hdmi);
>> +	return hdmi->csc_available &&
>> +	       (is_color_space_conversion(hdmi) ||
>> +		is_color_space_decimation(hdmi) ||
>> +		is_color_space_interpolation(hdmi));
>>  }
>>    static void dw_hdmi_update_csc_coeffs(struct dw_hdmi *hdmi)
>> @@ -1064,6 +1067,9 @@ static void hdmi_video_csc(struct dw_hdmi =
*hdmi)
>>  	int interpolation =3D HDMI_CSC_CFG_INTMODE_DISABLE;
>>  	int decimation =3D 0;
>>  +	if (!hdmi->csc_available)
>> +		return;
>> +
>>  	/* YCC422 interpolation to 444 mode */
>>  	if (is_color_space_interpolation(hdmi))
>>  		interpolation =3D =
HDMI_CSC_CFG_INTMODE_CHROMA_INT_FORMULA1;
>> @@ -2665,6 +2671,7 @@ static u32 =
*dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>  					u32 output_fmt,
>>  					unsigned int *num_input_fmts)
>>  {
>> +	struct dw_hdmi *hdmi =3D bridge->driver_private;
>>  	u32 *input_fmts;
>>  	unsigned int i =3D 0;
>>  @@ -2683,62 +2690,81 @@ static u32 =
*dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>  	/* 8bit */
>>  	case MEDIA_BUS_FMT_RGB888_1X24:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB888_1X24;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
>> +		if (hdmi->csc_available) {
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
>> +		}
>>  		break;
>>  	case MEDIA_BUS_FMT_YUV8_1X24:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB888_1X24;
>> +		if (hdmi->csc_available) {
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_RGB888_1X24;
>> +		}
>>  		break;
>>  	case MEDIA_BUS_FMT_UYVY8_1X16:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB888_1X24;
>> +		if (hdmi->csc_available) {
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_RGB888_1X24;
>> +		}
>>  		break;
>>    	/* 10bit */
>>  	case MEDIA_BUS_FMT_RGB101010_1X30:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB101010_1X30;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV10_1X30;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY10_1X20;
>> +		if (hdmi->csc_available) {
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_YUV10_1X30;
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY10_1X20;
>> +		}
>>  		break;
>>  	case MEDIA_BUS_FMT_YUV10_1X30:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV10_1X30;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY10_1X20;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB101010_1X30;
>> +		if (hdmi->csc_available) {
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY10_1X20;
>> +			input_fmts[i++] =3D =
MEDIA_BUS_FMT_RGB101010_1X30;
>> +		}
>>  		break;
>>  	case MEDIA_BUS_FMT_UYVY10_1X20:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY10_1X20;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV10_1X30;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB101010_1X30;
>> +		if (hdmi->csc_available) {
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_YUV10_1X30;
>> +			input_fmts[i++] =3D =
MEDIA_BUS_FMT_RGB101010_1X30;
>> +		}
>>  		break;
>>    	/* 12bit */
>>  	case MEDIA_BUS_FMT_RGB121212_1X36:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB121212_1X36;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV12_1X36;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY12_1X24;
>> +		if (hdmi->csc_available) {
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_YUV12_1X36;
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY12_1X24;
>> +		}
>>  		break;
>>  	case MEDIA_BUS_FMT_YUV12_1X36:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV12_1X36;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY12_1X24;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB121212_1X36;
>> +		if (hdmi->csc_available) {
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY12_1X24;
>> +			input_fmts[i++] =3D =
MEDIA_BUS_FMT_RGB121212_1X36;
>> +		}
>>  		break;
>>  	case MEDIA_BUS_FMT_UYVY12_1X24:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_UYVY12_1X24;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV12_1X36;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB121212_1X36;
>> +		if (hdmi->csc_available) {
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_YUV12_1X36;
>> +			input_fmts[i++] =3D =
MEDIA_BUS_FMT_RGB121212_1X36;
>> +		}
>>  		break;
>>    	/* 16bit */
>>  	case MEDIA_BUS_FMT_RGB161616_1X48:
>>  		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB161616_1X48;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV16_1X48;
>> +		if (hdmi->csc_available)
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_YUV16_1X48;
>>  		break;
>>  	case MEDIA_BUS_FMT_YUV16_1X48:
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_YUV16_1X48;
>> -		input_fmts[i++] =3D MEDIA_BUS_FMT_RGB161616_1X48;
>> +		if (hdmi->csc_available)
>> +			input_fmts[i++] =3D MEDIA_BUS_FMT_YUV16_1X48;
>>  		break;
>>    	/*YUV 4:2:0 */
>> @@ -2767,15 +2793,24 @@ static int dw_hdmi_bridge_atomic_check(struct =
drm_bridge *bridge,
>>  {
>>  	struct dw_hdmi *hdmi =3D bridge->driver_private;
>>  -	hdmi->hdmi_data.enc_out_bus_format =3D
>> -			bridge_state->output_bus_cfg.format;
>> +	if (!hdmi->csc_available &&
>> +	    bridge_state->output_bus_cfg.format !=3D =
bridge_state->input_bus_cfg.format) {
>> +		dev_warn(hdmi->dev, "different input format 0x%04x & =
output format 0x%04x while CSC isn't usable, fallback to safe format\n",
>> +			 bridge_state->input_bus_cfg.format,
>> +			 bridge_state->output_bus_cfg.format);
>> +		hdmi->hdmi_data.enc_out_bus_format =3D =
MEDIA_BUS_FMT_FIXED;
>> +		hdmi->hdmi_data.enc_in_bus_format =3D =
MEDIA_BUS_FMT_FIXED;
>> +	} else {
>> +		hdmi->hdmi_data.enc_out_bus_format =3D
>> +				bridge_state->output_bus_cfg.format;
>>  -	hdmi->hdmi_data.enc_in_bus_format =3D
>> -			bridge_state->input_bus_cfg.format;
>> +		hdmi->hdmi_data.enc_in_bus_format =3D
>> +				bridge_state->input_bus_cfg.format;
>>  -	dev_dbg(hdmi->dev, "input format 0x%04x, output format =
0x%04x\n",
>> -		bridge_state->input_bus_cfg.format,
>> -		bridge_state->output_bus_cfg.format);
>> +		dev_dbg(hdmi->dev, "input format 0x%04x, output format =
0x%04x\n",
>> +			bridge_state->input_bus_cfg.format,
>> +			bridge_state->output_bus_cfg.format);
>> +	}
>>    	return 0;
>>  }
>> @@ -3481,6 +3516,9 @@ struct dw_hdmi *dw_hdmi_probe(struct =
platform_device *pdev,
>>  		hdmi->cec =3D platform_device_register_full(&pdevinfo);
>>  	}
>>  +	/* Get CSC useability from config0 register and permit override =
for platforms */
>> +	hdmi->csc_available =3D !plat_data->disable_csc || (config0 & =
HDMI_CONFIG0_CSC);
>> +
>>  	drm_bridge_add(&hdmi->bridge);
>>    	return hdmi;
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
>> index 1999db05bc3b2..279722e4d1898 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
>> @@ -541,6 +541,7 @@ enum {
>>    /* CONFIG0_ID field values */
>>  	HDMI_CONFIG0_I2S =3D 0x10,
>> +	HDMI_CONFIG0_CSC =3D 0x04,
>>  	HDMI_CONFIG0_CEC =3D 0x02,
>>    /* CONFIG1_ID field values */
>> diff --git a/include/drm/bridge/dw_hdmi.h =
b/include/drm/bridge/dw_hdmi.h
>> index 2a1f85f9a8a3f..b2f689cbe864c 100644
>> --- a/include/drm/bridge/dw_hdmi.h
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -157,6 +157,7 @@ struct dw_hdmi_plat_data {
>>  			     unsigned long mpixelclock);
>>    	unsigned int disable_cec : 1;
>> +	unsigned int disable_csc : 1;
>>  };
>>    struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>=20
> Is this really still needed now you filter correctly the possible
> modes in patch 1 ?

I had not tried to remove them because they were needed in [PATCH v16]
but indeed they are no longer needed. Something (which I personally
don't understand) may have blocked it so far, but it is not worth
further analyses.

So we can shrink the series and no need to touch drm/bridge: dw-hdmi:
any more!

I'll now post a new v18.

BR and thanks for review,
Nikolaus

