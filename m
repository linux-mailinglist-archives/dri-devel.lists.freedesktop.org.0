Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79634A5AE5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B452F10E2D6;
	Tue,  1 Feb 2022 11:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE8B89AC3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:08:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E317481221;
 Tue,  1 Feb 2022 12:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1643713730;
 bh=CypZtW4lGyHuEY8NWyn1OY8shyxQqqRreVTuRo2WZ54=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IYWs766pSqTXXUuKwGf8L9OgXvf2+HOfSR851gK2lub7ZdIvrxpuGE5O7IjO7Jo7a
 YPKB1ITwMS3WyXtIU7bQeBnStJKJJgydQ57irXz/+LIuWg74QC7/0w6RLCJ57uMcNl
 x9du5/XCaGqUQkA44NADsBcfIVVN+S3u+AdY/i/I/C+UlpYQK4PYziQtLbYxVfwnk2
 7fDyWOtbEupnctgoIau5FZ21/cX41cY49xipXEkLIRfw3L5uBIrK3APj0DvqdllQVm
 oI1Px79gqlo+F5dQzgG5vQpSlhF5ybw3lofd4xaXJiFSC325hQpzSDiqjx7p9jJ8Ae
 22WvBoG8fB1mQ==
Message-ID: <d6dd6782-8352-785d-f3c4-0bed2f9b54c6@denx.de>
Date: Tue, 1 Feb 2022 12:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/panel: simple: Assign data from panel_dpi_probe()
 correctly
Content-Language: en-US
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 dri-devel@lists.freedesktop.org
References: <20220201110153.3479-1-cniedermaier@dh-electronics.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220201110153.3479-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 12:01, Christoph Niedermaier wrote:
> In the function panel_simple_probe() the pointer panel->desc is
> assigned to the passed pointer desc. If function panel_dpi_probe()
> is called panel->desc will be updated, but further on only desc
> will be evaluated. So update the desc pointer to be able to use
> the data from the function panel_dpi_probe().
> 
> Fixes: 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")
> 
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9e46db5e359c..3c08f9827acf 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -588,6 +588,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>   		err = panel_dpi_probe(dev, panel);
>   		if (err)
>   			goto free_ddc;
> +		desc = panel->desc;
>   	} else {
>   		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
>   			panel_simple_parse_panel_timing_node(dev, panel, &dt);

Reviewed-by: Marek Vasut <marex@denx.de>
