Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81DFA4492C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4943B10E734;
	Tue, 25 Feb 2025 17:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VBOwjnmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69A410E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:58:28 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30a2594435dso443181fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740506307; x=1741111107; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1kr6d/FQy1Jy2g1Mw9U1HLC2PC/Dwa2yo10n3xo8EDY=;
 b=VBOwjnmzK3A3wWVRcy/d51uqH1jXUoAK6S1ilhaQG9sdvTRs7ne0KFj1D1oLUM55QN
 56j+voTIto3x0autOwxv454A9tqplSsIpa/NxzvRXp0WVytROrKj0UMJ9UZEJ+QrDJGj
 zO0BXQa7+jSKnGPCLXKDMTdQ8KO03fY1ybEeJPCzZ9roi+feHNVrXIa2sfEgPkfpWxhn
 sPbDpD8jHjIXdaV21sDtiQvnuR1UrseXBuNjHuWHPXdVbuUpLFP3NlPMciVmmpqxtPlI
 s0fv9wiTpye0smwHZAyyhtx+NH79hNXokxVwmUEU/qEq/DZknefQCD08oFBzmIkyo6KL
 ApUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506307; x=1741111107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kr6d/FQy1Jy2g1Mw9U1HLC2PC/Dwa2yo10n3xo8EDY=;
 b=r010KeDl/qmcQaI3F2Dn9ZICfej2XRRLFNYlbk0w3rYpEgYHAiRL8qaOeNMbY1JFyH
 U/yJuA6Xe3WHMv1/NIuiaaTvOHUMvTx4TZdnFioGTcGDuLvxPpcvdYVlVfA4GN/vWF1V
 vCOzuzKa0T6469gR+fQ9RCECDphMlS3xBPXSfngj/U8skax9viPfyhiPpjoNBoHwsiRx
 +N3xRgnH1CUPn7YQ/3JPv7qkFLPOHgNTxNaY8DojayNq23yxbRRqo02l9rPNQ7hJevGt
 NCoKkw1IcvpA1nqe4JpjZ/9gU4MO0wMopAVGSKYMt0PLFX0NvwhilTPAqyso3EGF/PiH
 M/TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsoW8o5gc6JjFz8zsv3psl62ClVZE1+obx5IQQ1aTl6TPPzTNMJpnsJVNGq3/4Z9PUJ+qmJo+u3wg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKlnVANGjb9MaR6rIEJKBr9nqE2ruilz4+M/kX8IFyRdSBtRME
 szg45T8zO5Q8YbItWV7Pw9eAN2qCUYt/k8MBtV3BCPfrEZaVLxv5iuXpqLW0W2E=
X-Gm-Gg: ASbGnctYVpYYCIch7pRpwxrdBLMZkvIT8/7wlxTUjADAftkW0sGwWO2xULHKldkMWm/
 D85YajaN1ZN25IPyh3xkJJEBWsNnH076DuOOaI+J9mrNw6epj+IQ6mzAIS4pnbpQenIyUDsrAtl
 EBeujJsVJobqLmN7gPGmEBXO1Z0zshYsa23zdpND0AiIs470QqQ91rMoWo/roDSOuzd6/hW43Sh
 pZ0iRLJ8h2TTCnIkK/5c5WYp5Gs/l65IC5Bw9vAPCpG9ev3A6wQ0SXpzNlyaGucXQ6fH0DDrr2p
 aBGRCdsqOoLtzjt6tXBovHbMPH1aw8T9BOOnatsyI/GQWbYoxCdI0BSMPvQ9Km6fSnbcTa8qfpH
 murSrRQ==
X-Google-Smtp-Source: AGHT+IGkHEvgIIfbZAqOgHLpKus9PcVasPLlY5V6IFk/rGEQb+8IEPE9UGG2WuATzUd3x9e1FtOaEw==
X-Received: by 2002:a05:6512:3ba1:b0:545:31d8:f384 with SMTP id
 2adb3069b0e04-546e418d42emr8418369e87.10.1740506306966; 
 Tue, 25 Feb 2025 09:58:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514f4ce7sm230452e87.159.2025.02.25.09.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:58:26 -0800 (PST)
Date: Tue, 25 Feb 2025 19:58:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 10/11] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
Message-ID: <ne35ljkudi5jta2cby7fgjzqsd5sjpwcjpwhv6kmedq6nomho5@txynsflvtc6f>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-11-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-11-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:23PM +0530, Ayushi Makhija wrote:
> The anx7625_link_bridge() checks if a device is a not a panel
> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> the bridge operations. However, on port 1 of the anx7625
> bridge, any device added is always treated as a panel
> bridge, preventing connector_detect function from being
> called. To resolve this, instead of just checking if it is a
> panel bridge, we should verify the type of panel bridge
> whether it is a DisplayPort or eDP panel. If the panel
> bridge is of the DisplayPort type, we should add
> DRM_BRIDGE_OP_HPD or DRM_BRIDGE_OP_DETECT to the bridge
> operations.
> 
> In the anx7625_sink_detect(), the device is checked to see
> if it is a panel bridge, and it always sends a "connected"
> status to the connector. When adding the DP port on port 1 of the
> anx7625, it incorrectly treats it as a panel bridge and sends an
> always "connected" status. Instead of checking the status on the
> panel bridge, it's better to check the hpd_status for connectors
> like DisplayPort. This way, it verifies the hpd_status variable
> before sending the status to the connector.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index d2655bf46842..9b6303267924 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>  
> -	if (ctx->pdata.panel_bridge)
> -		return connector_status_connected;
> -
>  	return ctx->hpd_status ? connector_status_connected :
>  				     connector_status_disconnected;
>  }
> @@ -2596,9 +2593,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
>  	platform->bridge.of_node = dev->of_node;
>  	if (!anx7625_of_panel_on_aux_bus(dev))
>  		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> -	if (!platform->pdata.panel_bridge)
> -		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> -					DRM_BRIDGE_OP_DETECT;
> +	if (!platform->pdata.panel_bridge ||
> +	    platform->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {

This is incorrect, because there can be other kinds of bridges in the DP
chain. I think it's better to check for !eDP instead.

> +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> +	}
>  	platform->bridge.type = platform->pdata.panel_bridge ?
>  				    DRM_MODE_CONNECTOR_eDP :
>  				    DRM_MODE_CONNECTOR_DisplayPort;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
