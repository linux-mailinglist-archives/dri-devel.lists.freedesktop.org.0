Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBA03B894A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 21:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634B46EA7B;
	Wed, 30 Jun 2021 19:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912886EA7D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7dBjEYR8h5WU2DJoDAVnZwPHbeXlfduyeJGFxFQR2/E=; b=BtjjiWA7g9Djbtfq0uAU4LB7IE
 BRYrYYW5k50d8WuUp2YaGNKDJJjBtY72nBtpK1emsnO0fCPJouprnew4qssbWJtgZvQeeEFICD/qF
 Zgqdx13+yx6RKKAr2P3F9kRZ9hIb0Bp3eZ8jjJyzKdB/gX6DueVwtRLADCMIlMA+oA4Fk8Gy8XCXv
 jzj1555pROqEihFCMKi/Qx64qiFy7JcbyPVs6n3f+IQIOq4PMNdc1FX5AZkBrF15VD6FsE6+SHZmc
 OgI1wlqjhbeItG8YC2m4FeLShRVYrkgK27AVMKzZk19X7ByVMh6U+IFvTImT66DmNWCvDeKJrgjHj
 Ln65cMXQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56174
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lygAZ-0000rt-HI; Wed, 30 Jun 2021 21:46:47 +0200
Subject: Re: [PATCH] drm/panel: db7430: Improve error reporting
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20210630191301.3664478-1-linus.walleij@linaro.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <94207150-5b2b-36d6-3d40-339ec1c3f4e4@tronnes.org>
Date: Wed, 30 Jun 2021 21:46:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630191301.3664478-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 30.06.2021 21.13, skrev Linus Walleij:
> This creates a macro wrapping mipi_dbi_command() such that we get
> some explicit error reporting if something goes wrong.
> 
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-samsung-db7430.c | 66 +++++++++++---------
>  1 file changed, 36 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-db7430.c b/drivers/gpu/drm/panel/panel-samsung-db7430.c
> index fe58263bd9cd..c42d43ab6a4f 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-db7430.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c
> @@ -90,9 +90,17 @@ static inline struct db7430 *to_db7430(struct drm_panel *panel)
>  	return container_of(panel, struct db7430, panel);
>  }
>  
> +#define db7430_command(db, cmd, seq...) \
> +({ \
> +	struct mipi_dbi *dbi = &db->dbi;	\
> +	int ret;				\
> +	ret = mipi_dbi_command(dbi, cmd, seq);  \
> +	if (ret)							\
> +		dev_err(db->dev, "failure in writing command %#02x\n", cmd); \
> +})
> +

I did a grep and there's only one mipi_dbi_command() caller that checks
the return code: mipi_dbi_poweron_reset_conditional().

Can you add the error reporting to mipi_dbi_command() instead? Instead
of drivers adding their own similar macros.

In that case I think you need to add a plain 'ret' at the end of the
macro for it to return the error code.

Noralf.
