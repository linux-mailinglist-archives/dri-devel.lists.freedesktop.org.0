Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562229A5385
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 12:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C1610E039;
	Sun, 20 Oct 2024 10:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UnvccJQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85110E039
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 10:45:05 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb51e00c05so48402711fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729421103; x=1730025903; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FMxI1YT7fY8R2Gwx5nUSrhOH40ODKKKLqekW6RGCnQ4=;
 b=UnvccJQePmx4FkWmys3wppivf4ctKwpSclNrLdimSTkVlQPWjKDRl3UbLiVbI09I8M
 LOmlX2hrTfdQK891SyomgmMPadVuV9AY6b3FUT4clx9C8Jeox5hfxsbLN8Cam3qR9mQm
 cBZuiIZr0R0VhEEUyOzdFg0l41JE5lmp7YVMTepY3P1C3E4v1ZcksFBWBwkjjFlW2qnf
 cr+VGD1OgzPeZZ+894GfwF8iOPmIB2CiSY2FnrgJIXiiCrsmbvf/uca7GXYHBsuyMHIx
 khvo670w+iMNf9WfNjJsIMmhHnJAB5ajYsMm/VH3x6IXacbtotMDyxpBFo3xwMjF9eWo
 Pr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729421103; x=1730025903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMxI1YT7fY8R2Gwx5nUSrhOH40ODKKKLqekW6RGCnQ4=;
 b=VlYMrPiRZgTx4z2cprehIi9LCvUaOlT3OT/vQlL1eC8tkjoR9S5jWKEHjCl6rCV6HO
 8GoKDPknUwmZUzLmVxys0gxcHom86igwbDUTbXLQRi+FQPFybJIYvEnWrUg011HEQMpz
 hvpA2olvMP3Hjvhl44d0Ae0Ri7dxA8Llz7tyNhd7Xptg549N4wta7o0vR6AbemrlWjne
 7J0P/1D473XRon5QgUn8OXtCkZYNYK3kOiO6a2EgxqRh0gsYtI+Le4p6Aw0PsfEaIBe3
 ZSSr2tHliTmdRTT7BOwQtmUkjXONFmgbSZhqayH1lutcvlcPK6NSkDTrcoFjbiBlmntY
 00jg==
X-Gm-Message-State: AOJu0YyIlENVMMEwGV/SfSAE+4uKR6dSQmUS4qbxUx1YLApGM8tiQ1tU
 zzagasXDD+FCjYbzOfCoYQdaYgWQ9mTfAU9whaHgTsxFYr1rI87ZAa0Ok4nHG6U=
X-Google-Smtp-Source: AGHT+IEsJY83W2ZGtSSto4X5XtgrmNRhpxdoqC6ehrNq9gmJc1J4y4RXQiSZx2CaJIAqs/ELodb/xg==
X-Received: by 2002:a05:6512:689:b0:52e:936e:a237 with SMTP id
 2adb3069b0e04-53a15445207mr7030409e87.16.1729421103146; 
 Sun, 20 Oct 2024 03:45:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a223e55f5sm187782e87.34.2024.10.20.03.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 03:45:01 -0700 (PDT)
Date: Sun, 20 Oct 2024 13:44:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH RESEND] drm: panel: nv3052c: correct spi_device_id for
 RG35XX panel
Message-ID: <k2g5qgtat5ln2pdvgbnbqv6calqyen7soer6kpvdzzaielogca@7cmqnda5c6mp>
References: <20241020083836.175733-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020083836.175733-1-ryan@testtoast.com>
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

On Sun, Oct 20, 2024 at 09:37:41PM +1300, Ryan Walklin wrote:
> The Anbernic RG35XX devices use an SPI LCD panel from an unknown OEM,
> with an NV3052C driver chip.
> 
> As discussed previously, the integrating vendor and device name are
> preferred instead of the OEM serial. A previous patch corrected the
> device tree binding and of_device_id in the NV3052C driver, however the
> spi_device_id also needs correction.
> 
> Correct the spi_device_id for the RG35XX panel.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Fixes: 76dce2a9 ("drm: panel: nv3052c: Correct WL-355608-A8 panel compatible")

I had to fix the Fixes tag when applying the patch. It is recommended to
use 12 chars of the commit id. For example in my ~/.gitconfig I have the
following part, so `git log --pretty=fixes` gives me correct Fixes
line:

[pretty]
        fixes = %C(auto)commit %H%Creset%nFixes: %h (\"%s\")%nAuthor: %aN <%aE>%nDate: %aD%nComitter-Date: %cD%n%n%w(0,4,4)%b

> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index d3baccfe6286b..06e16a7c14a75 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -917,7 +917,7 @@ static const struct nv3052c_panel_info wl_355608_a8_panel_info = {
>  static const struct spi_device_id nv3052c_ids[] = {
>  	{ "ltk035c5444t", },
>  	{ "fs035vg158", },
> -	{ "wl-355608-a8", },
> +	{ "rg35xx-plus-panel", },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(spi, nv3052c_ids);
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
