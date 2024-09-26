Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D968986C0F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 07:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF17E10E1E4;
	Thu, 26 Sep 2024 05:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d5xFuvug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CFC10E1E4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 05:30:03 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5389917ef34so342138e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 22:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727328601; x=1727933401; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BLGpx2MG2mB0m/vxfD5XP2O/qjBn4GKBLH+1ggyjio0=;
 b=d5xFuvugWeM3wl32xWzh3a+DeUcKHrkn7PmT6fivuk1o5W5RnX78A9aLbROgbXM9Va
 EVis7TdyMlLFzk77Unwqd874PZZ7juL+jxp3N2ru7lgHFsyUN3bQcD+N/zbBBXYMJ0s9
 yfmJb/0Y4UJ8KhGMCP2cq9ldqtnW11OjAgJeFpolPg2n2+TaaBVJQkIU+Xt9GlplZJo9
 T4P96FTkgJF5f8Hporl7BmQlwNdwxATbSl8I8n+TBvw9uZnbADqj4gWjaeVBEoJoOBH3
 OPhgRoLN2gpG1pEa7Rz4o2YL6yjKnnJftlO/yCrm4mqnrWMUXyzZ8aANZGeZW9lJkO+d
 v0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727328601; x=1727933401;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLGpx2MG2mB0m/vxfD5XP2O/qjBn4GKBLH+1ggyjio0=;
 b=ucEqgEjq9kfvLqKmC8FK5W7xDI1j6+CSetOBebjFR0KN9k4A6dbSalZzkIRm3eebZe
 EClVtJ4KA6Ab9iCCFFlek06YZwNXBn9y+Vmh5q/mgXtuKO7VE//giXovrQbeOVSwUJOG
 eVq8+lBQcU5kpc1ldfFKxdtsRah2HvmvCXc6VwgwcKbNSWcsngABbZIYLl/9YVT/8fre
 VV3/4uEVlxF9AbCOz8kVwSYJKNDL+NZS29lnRitH3JnV9Sge3FqrH3UT6UIGDcMI8ltt
 INtYzsOhE3dzxst7sD9SC5o4pOx7JFTXSSAGxd51yNsBXMPf3kAPgG+J7BQgIhaXOwwe
 E8fQ==
X-Gm-Message-State: AOJu0YyEz/7IH6ssVrFdxNeqfjcfltJXnmq2L3tzkApdX0sxzkrUYvjw
 L2NS1ikUC606AdlZNA+DLJPsJI84Z0ixBsQqkXaJ3WOmP9Dit+eNySZtfITSh5c=
X-Google-Smtp-Source: AGHT+IEjQTRM7jnYF53juQgIWWWJBmqaQ2m61T6zPZmdScBpSsvA5nzetZiArf+jpMpcv3iS9DObaw==
X-Received: by 2002:a05:6512:1044:b0:536:55a8:6f78 with SMTP id
 2adb3069b0e04-53870499ab3mr3126497e87.17.1727328601317; 
 Wed, 25 Sep 2024 22:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a864d9fcsm709084e87.264.2024.09.25.22.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 22:29:59 -0700 (PDT)
Date: Thu, 26 Sep 2024 08:29:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Marco Rodolfi <marco.rodolfi@tuta.io>
Subject: Re: [PATCH] [V2] drm: panel-orientation-quirks: Also handle rotation
 for DeckHD equipped LCDs units
Message-ID: <63xa36w6jee3pmxxkp6abeiozymlokom4dyivrksouoz6fesf5@oleqbk2wjwab>
References: <20240801071002.35814-2-marco.rodolfi.1992@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801071002.35814-2-marco.rodolfi.1992@gmail.com>
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

On Thu, Aug 01, 2024 at 09:10:03AM GMT, Marco Rodolfi wrote:
> From: Marco Rodolfi <marco.rodolfi@tuta.io>
> 
> This patch also take account of the different resolution for the
> aftermarket DeckHD panel, which hasn't been accounted for yet in kernel,
> since these quirks are applied based on BIOS information + panel
> resolution.
> 
> This patch correct that problem and make the panel oriented the right
> way.

Please improve the commit message (see
Documentation/process/submitting-patches.rst).

For example:

Orientation quirk code take panel resolution into account when
determining panel orientation. Add orientation configuration for the
popular aftermarket DeckHD panel, which resolution (1200x1920) differs
from the standard panel (800x1280).

> 
> Changes in V2:
> Had some issues with gmail and this mailinglist that I completely
> mistyped the panel resolution in the original patch. It is still a 16:10
> panel, not a 16:9, so the original one is wrong. It's fixed now.
> 
> Signed-off-by: Marco Rodolfi <marco.rodolfi@tuta.io>
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
> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
>  	}, {	/* Valve Steam Deck (Galileo) */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry
