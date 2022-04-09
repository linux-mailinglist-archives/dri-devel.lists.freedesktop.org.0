Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF69A4FA1ED
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 05:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0060710F291;
	Sat,  9 Apr 2022 03:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA2110F29A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 03:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=FX3cqX4S7epeuGCz1Fea2yx6H2ka0HMbbiNoPvzP1uA=; b=KgEVUdVWhsH5UoUVkVNZZM0qX/
 Focy0Nv/2gIV8NL0fQi7EnQWLwE9qErAhBNRQ2LUZZ/kNuDpmFZH8/3aG/G7h+ci7kx4iKm7WUIC8
 qmrxXx9oaobb95V8oCdkrdDUvifLIyimPQ0Fr3qZWTtRgz5U/AZ4131M11Ehzr0dIBs/EuzZ+tQmm
 HQk3flXNiHSOp4pweU2RFUjfhZkH2zcYfcuNm5nDB2G7w/EhBnP3QRtImlQ1j4QQmmAK306k8Kz5D
 YVnJpKHwrsLrjMKpUoQfLaCsYHn7hs6W0U7v0GMNbZK9s5x+xdpIHY02jaO2caP+CLiXIrb1IcihA
 R4iQ0qMg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd1Vv-00AOJ1-Bo; Sat, 09 Apr 2022 03:11:51 +0000
Message-ID: <95c21c24-7d60-45fa-0b28-b6ae7928a85c@infradead.org>
Date: Fri, 8 Apr 2022 20:11:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/gma500: select framebuffer dependency
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220409025948.3179636-1-james.hilliard1@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220409025948.3179636-1-james.hilliard1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/8/22 19:59, James Hilliard wrote:
> This appears to be needed for video output to function correctly.

More proof/justification?

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/gpu/drm/gma500/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> index 0cff20265f97..ff8c7b6e87f5 100644
> --- a/drivers/gpu/drm/gma500/Kconfig
> +++ b/drivers/gpu/drm/gma500/Kconfig
> @@ -7,6 +7,8 @@ config DRM_GMA500
>  	select ACPI_VIDEO if ACPI
>  	select BACKLIGHT_CLASS_DEVICE if ACPI
>  	select INPUT if ACPI
> +	select FB

Preferably
	depends on FB

There are a few instances of an arch (or board) selecting FB,
which makes some sense, but other drivers shouldn't be doing
that IMO.

> +	select FB_EFI if EFI
>  	help
>  	  Say yes for an experimental 2D KMS framebuffer driver for the
>  	  Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and

thanks.
-- 
~Randy
