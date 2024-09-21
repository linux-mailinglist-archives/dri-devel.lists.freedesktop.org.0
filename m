Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49D97DEAF
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 22:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266DE10E10D;
	Sat, 21 Sep 2024 20:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b9PO1gPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8603810E10D
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 20:02:22 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53661ac5ba1so3251479e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726948940; x=1727553740; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kTuF7VDXjW3MP//Do+X4ZOnzlFNZp1xwHs6Kru9/7Nk=;
 b=b9PO1gPgHxLHYBWijHofxRR4HnP3yeQoPkFFyskdTHX/W1ZIhLvOaOwHgR1/u/Fj6u
 htj5ce8aqzy3iWVzeHmwzGjm1r7YnOaVrOoBZtPs/LAfSN5uiARL9iE9morVubPenU5S
 ZowO+k5ehqiy67QH27XXLUKmmn6gvTzrhxzE10/AZHoSOvyVaMwWFB0o0WUPHqSK3oZV
 k1hfKEMtRmLa/ZSVVvDrF71RxqnN21aSp22fu14oVMpqV1AbxHwhY6O9+t2iICbKVexc
 0GJTQ2q56B+d4I8fu++i0ZK6DnlUq2pAhd543yIJarKI6B6lpSboAqYuCcynyY2MzJGP
 GU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726948940; x=1727553740;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kTuF7VDXjW3MP//Do+X4ZOnzlFNZp1xwHs6Kru9/7Nk=;
 b=k1qodUgWdnvFuyG36iZd435B9+1jINbiOunHJNQpaj8P3pqfZjbyB5AUBqlX9vfPnO
 6LKC6GONCWJPQhzmGlDWVJSQijk6lYvjXtGoM12sKXUPC51zl2TmT1HQ07FWCRteOTPy
 x6RBu0Q1jhd1ZnY/6OMq4CT98axkxk8oo92KNolna9H3iFGNyB7PhSeoPJc1UGbNLmC2
 A74MqVhe6uHQ6+bC1z7Jg3VS2IsdoEEe0vf5EK8tLfEGQr/PDYs/rZ8Twuo++OrOLmvh
 /DaDe4LCc4dFWWwDWeHU39PXU4mzuJRRhgui45DDOjz/b6rpeGv7uzApS1j96Mob9BSA
 32Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH/TqkMq6i+G9PGF0wqTt9ulqq0Sx10TLWA2PzKg+3dIPFRu4kfy5dePIDmYr0i2wx/2hjlWq0HNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxasVoxjESnJhKc4KZPJAopVVmR+kPl3U49O8k0VuYcBwxAJNYu
 QuOgP+UDf5YrmgeBRI356/H2fOy176qfI6b2/dkpelZyzdtWaoZw7/M2wIpMbzE=
X-Google-Smtp-Source: AGHT+IEDzyk+nJzl32SGwrI75keSU5xM11P46cZbubinLNPy/qZYltSBZ5PHAiu73gulR1QeFvg7+g==
X-Received: by 2002:a05:6512:114b:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-536ac320139mr3789472e87.40.1726948940203; 
 Sat, 21 Sep 2024 13:02:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870b8cc0sm2685207e87.271.2024.09.21.13.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 13:02:18 -0700 (PDT)
Date: Sat, 21 Sep 2024 23:02:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: tjakobi@math.uni-bielefeld.de
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, 
 Denis Benato <benato.denis96@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm: panel-orientation-quirks: Add quirk for AYA NEO
 2 model
Message-ID: <gnllphvuffajfbh3aczda5z7t3ytjexf5a6wuuzsz6pla6e2kz@m564uc2ogn4q>
References: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
 <2b35545b77a9fd8c9699b751ca282226dcecb1dd.1726492131.git.tjakobi@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b35545b77a9fd8c9699b751ca282226dcecb1dd.1726492131.git.tjakobi@math.uni-bielefeld.de>
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

On Mon, Sep 16, 2024 at 03:18:51PM GMT, tjakobi@math.uni-bielefeld.de wrote:
> From: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> 
> Add quirk orientation for AYA NEO 2. The name appears without spaces in
> DMI strings. That made it difficult to reuse the 2021 match. Also the
> display is larger in resolution.
> 
> Tested by the JELOS team that has been patching their own kernel for a
> while now and confirmed by users in the AYA NEO and ChimeraOS discord
> servers.
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 2166208a961d..3044927c0c5c 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -184,6 +184,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* AYA NEO AYANEO 2 */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
> +		},
> +		.driver_data = (void *)&lcd1200x1920_rightside_up,

I thought that AYANEO should come after AYADEVICE, but the array doesn't
seem really sorted. Thus:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If I hear no objections and if noone beats me, I'll apply the series
within few days.


>  	}, {	/* AYA NEO 2021 */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYADEVICE"),
> -- 
> 2.44.2
> 

-- 
With best wishes
Dmitry
