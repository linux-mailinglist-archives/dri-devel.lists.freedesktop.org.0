Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E3987453
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6811B10EB3C;
	Thu, 26 Sep 2024 13:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JJe+jNtr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A17910EB3C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:18:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53653682246so1247569e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727356678; x=1727961478; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6F9ROkrOgLwAEiiMBw5UKjMmbtjSJsYbLK3BwJz59BY=;
 b=JJe+jNtrYO8Dh7QL+uA0fTheoCJ0S2fe18Cq3GUECwjp4Ys+BttO5/3Zyo1A7PdtFH
 XlPBuMqBaTY1XnJAlmZZJwKQ3zOYUaUVtkIpJDQanY7Sy0bV0F9U3sHDjs3d6nxZVACZ
 ZwvKEtuwxRVCvpdKHHyHbPf5ebyOXZjJHIiJIq9gJSsu+4TtovlxdFDjIRkVobLq0d9e
 xzgZaIVySPpTcUVZumrxEA4cqy3dtV/bV1en2wiKlteGuXGSCQS9o8JlaA+7wqftW5nj
 iQelrEZt8wxBgHSNE+0A1dU3mEcWhDoJgF1B0o9JZqYIAnURv1Okj3fupQ7PKILcnWNp
 79Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727356678; x=1727961478;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6F9ROkrOgLwAEiiMBw5UKjMmbtjSJsYbLK3BwJz59BY=;
 b=C4pdy5GpxY/+3EPiSgY6tpUAxTQUOCz2iFi9NgJjkORdwYUp42oD4RnTs3oGmqKDLn
 Vpk++CKnSgeUl7E2T66Zhpx+6p8CVHTg3WFGXX6UZzq0EcVfjSWDaiOBl+j++3oHJIvZ
 cH70mfA3UHznSrdNKjt/NzyL7eb8TBRJ7HeDM/weXYqrcmAQ2DbBCQakx2VKhf/px1ad
 BBK7bGmnsK8Y6Rv0brQEdj+GPIZU8pGz7EopHBoFKMRDV0ZYBFRnTfRbCO3Mgoifpk+P
 pc5SH2tquyuQH7R/hQ4SllmKJA7SAPTTPpM7Mz1gtwXZXdv0NHkHw04MvhfFr8awiniC
 t8WA==
X-Gm-Message-State: AOJu0YyJlfMDj1Fm6sM7tqiULrZQMq2EbuGL3YZfrZ39tAEDaiBLoin6
 /nXYcxNqOSdTaZXv3lcxvWFRub6ckaD+71O3447EJKSczBm8CusI+1OW6hILuD0=
X-Google-Smtp-Source: AGHT+IGwsKLuFlQNfCazagq4cx04nrYn9gcVWfkrYXRM+DVR4pNB1kJbY+0ExKGDNDYOSrGsJuswdg==
X-Received: by 2002:ac2:4e01:0:b0:536:562d:dd11 with SMTP id
 2adb3069b0e04-53873b02f2cmr4208275e87.11.1727356678349; 
 Thu, 26 Sep 2024 06:17:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a86489aesm800888e87.184.2024.09.26.06.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:17:57 -0700 (PDT)
Date: Thu, 26 Sep 2024 16:17:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Marco Rodolfi <marco.rodolfi@tuta.io>
Subject: Re: [PATCH] [v3] drm: panel-orientation-quirks: Correctly handle
 rotation for DeckHD equipped LCDs units
Message-ID: <ndvfmcfe3bzxoirhboavj2lwtaqabhbq63uuzk6fok7jpjkymc@prexx6y5leqa>
References: <20240926065629.206839-1-marco.rodolfi@tuta.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926065629.206839-1-marco.rodolfi@tuta.io>
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

On Thu, Sep 26, 2024 at 08:56:29AM GMT, Marco Rodolfi wrote:
> Orientation quirk code take panel resolution into account when
> determining panel orientation. Add orientation configuration for the
> popular aftermarket DeckHD panel, which resolution (1200x1920) differs
> from the standard panel (800x1280).
> 
> Signed-off-by: Marco Rodolfi <marco.rodolfi@tuta.io>

Hmm, two identical patches?

Let's leave it to the comitter discretion.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3860a8ce1e2d..32582dbdc184 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -420,13 +420,20 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
>  		},
>  		.driver_data = (void *)&lcd1280x1920_rightside_up,
> -	}, {	/* Valve Steam Deck (Jupiter) */
> +	}, {	/* Valve Steam Deck (Jupiter) Stock Display */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* Valve Steam Deck (Jupiter) DeckHD Display */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_rightside_up,
>  	}, {	/* Valve Steam Deck (Galileo) */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> -- 
> 2.46.2
> 

-- 
With best wishes
Dmitry
