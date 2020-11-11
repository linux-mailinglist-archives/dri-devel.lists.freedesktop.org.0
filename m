Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06872AF00B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 12:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD1A89FAD;
	Wed, 11 Nov 2020 11:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4610289FC3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 11:52:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABBqlRn045414;
 Wed, 11 Nov 2020 05:52:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605095567;
 bh=f3oRw/GQqK0NFZ7Hjl/YSkm5hMTT2sorMG68VScpX1E=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pxw3Tw3civ4a2JLP//puZF9ONbccR5IKtGd07ISc5X+wKB9WJ3Cm/UiVvePwczHxv
 8O9jCk2e+xJqHxxm45dHrCOUb0JbDKrCG7OgHKir+jAwpcT6JUMS4JyFczrTfh6pBD
 r2km3fWASCY6O0fP2m6f+Oe2f0JnmnwYl1Jqbyck=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABBqlaJ040699
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 05:52:47 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 05:52:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 05:52:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABBqj39003357;
 Wed, 11 Nov 2020 05:52:46 -0600
Subject: Re: [PATCH v2 4/6] drm/tidss: Set bus_format correctly from
 bridge/connector
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <20201109170601.21557-5-nikhil.nd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c331b05c-156d-e821-c7b7-c05db0466d74@ti.com>
Date: Wed, 11 Nov 2020 13:52:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109170601.21557-5-nikhil.nd@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 19:05, Nikhil Devshatwar wrote:
> When there is a chain of bridges attached to the encoder,
> the bus_format should be ideally set from the input format of the
> first bridge in the chain.
> 
> Use the bridge state to get the negotiated bus_format.
> If the bridge does not support format negotiation, error out
> and fail.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_encoder.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> index e278a9c89476..ba5b6fccabe7 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> @@ -22,6 +22,7 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
>  	struct drm_device *ddev = encoder->dev;
>  	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
>  	struct drm_display_info *di = &conn_state->connector->display_info;
> +	struct drm_bridge_state *bstate;
>  	struct drm_bridge *bridge;
>  	bool bus_flags_set = false;
>  
> @@ -41,17 +42,22 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
>  		break;
>  	}
>  
> -	if (!di->bus_formats || di->num_bus_formats == 0)  {
> -		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
> -			__func__);
> -		return -EINVAL;
> -	}
> -
> -	// XXX any cleaner way to set bus format and flags?
> -	tcrtc_state->bus_format = di->bus_formats[0];
>  	if (!bus_flags_set)
>  		tcrtc_state->bus_flags = di->bus_flags;
>  
> +	/* Copy the bus_format from the input_bus_format of first bridge */
> +	bridge = drm_bridge_chain_get_first_bridge(encoder);
> +	bstate = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
> +	if (bstate)
> +		tcrtc_state->bus_format = bstate->input_bus_cfg.format;
> +
> +	if (tcrtc_state->bus_format == 0 ||
> +	    tcrtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
> +
> +		dev_err(ddev->dev, "Bridge connected to the encoder did not specify media bus format\n");
> +		return -EINVAL;
> +	}
> +
>  	return 0;

We should also take the bus flags from the bridge state (next bridge's input_bus_cfg.flags).

And... If I read this right, we always fail if there's no bstate. So we could just do "if (!bstate)
fail;"

And if we always expect to have bstate, and get bus flags and formats from there, we don't need the
current drm_for_each_bridge_in_chain() loop or taking bus_flags from display info.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
