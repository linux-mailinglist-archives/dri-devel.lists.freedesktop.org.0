Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC91C4E8B
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8EB6E50D;
	Tue,  5 May 2020 06:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918726E0C5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 19:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=fRTAxMt+wwPpjAy5FUGbHC1yS2mrXc5N6zswIhz2qFU=; b=U2ubukdfAiDbK2ZjfknkSdIZZj
 AjopC+jkvMrXQ9FVjXXnq53WZIm9n3N/S2YQJnm/RKG/G+EQXXmsgzYD8d/VGzsFRGW6pbOTUSkis
 r5/Y2LaI40jPhkDuA357fVfgK3JufLYz/3iKIUWzdpi4apH2qJXL1DazqpydEoq1ixm2HuCjWAcAx
 /o+oh/BUZjVvqQgv0o6VmJggTTbI/eCgxIJ0OJZ592aAU5rNH3lcnY1bFd+JYoRIHEi5MpwxdtC1D
 N3crodKkBqcxylqmYqSVgaBvnUIxJqQnh7XoF4NWM2ikctoH4dUqcptCDvUTtK/FY0aIdAXirGDRy
 +MGsWUGQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVhCm-0007RJ-5H; Mon, 04 May 2020 19:56:44 +0000
Subject: Re: [v2 PATCH 1/2] drivers: drm: panel: Add ASUS TM5P5 NT35596 panel
 driver
To: Konrad Dybcio <konradybcio@gmail.com>
References: <20200504193816.126299-1-konradybcio@gmail.com>
 <20200504193816.126299-2-konradybcio@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a9a381eb-6d85-5c6e-f377-0b9815bd36a5@infradead.org>
Date: Mon, 4 May 2020 12:56:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504193816.126299-2-konradybcio@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/20 12:38 PM, Konrad Dybcio wrote:
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index a1723c1b5fbf8..3aa57a927c4bd 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -18,6 +18,16 @@ config DRM_PANEL_ARM_VERSATILE
>  	  reference designs. The panel is detected using special registers
>  	  in the Versatile family syscon registers.
>  
> +config DRM_PANEL_ASUS_Z00T_TM5P5_NT35596
> +        tristate "ASUS Z00T TM5P5 NT35596 panel"
> +        depends on GPIOLIB && OF
> +        depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +        help
> +          Say Y here if you want to enable support for the ASUS TMP5P5
> +          NT35596 1080x1920 video mode panel as found in some Asus
> +          Zenfone 2 Laser Z00T devices.
> +
>  config DRM_PANEL_BOE_HIMAX8279D
>  	tristate "Boe Himax8279d panel"
>  	depends on OF

Hi,

Please clean up the config entry indentation.
The keywords (tristate, depends, help) should all be indented with
one tab (not spaces) and the help text should be indented with
one tab + 2 spaces.

thanks.
-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
