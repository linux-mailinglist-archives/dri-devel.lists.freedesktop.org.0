Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B47A94760
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 11:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BFC10E010;
	Sun, 20 Apr 2025 09:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="AS5dK+IK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639B310E010
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 09:32:29 +0000 (UTC)
Received: from localhost (unknown [10.10.165.8])
 by mail.ispras.ru (Postfix) with ESMTPSA id ABE754076726;
 Sun, 20 Apr 2025 09:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru ABE754076726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1745141546;
 bh=fWQY42eWCmlkXVWhry1af/CWnxEZndFo/0hIOaKShAU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=AS5dK+IKYudFHNvytmLk+fqj7yxTBZjUdVJCcuHfpJwstkabClzSTiwtPwAfKq/Ni
 1uTL0d3nV+qGrUEpkz09E1oWlkkcgtdcDsX8bZzKHIUDIwRKpfFhQISndwdTZ2QQpQ
 +kYUP272fI7LfR9Y2z3cZgPezv/ClCT/kEpObEJA=
Date: Sun, 20 Apr 2025 12:32:26 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux@martijnvandeventer.nl, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com,
 neil.armstrong@linaro.org, Furkan Kardame <f.kardame@manjaro.org>,
 Anastasia Belova <abelova@astralinux.ru>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
Message-ID: <mpoae5tfugsnvdyv5yzmiifr242mc62gouqqvql7ucjtdxo7b2@7y4plckbcdbn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
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

Martin Blumenstingl wrote:
> @@ -360,6 +360,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  
>  uninstall_irq:
>  	free_irq(priv->vsync_irq, drm);
> +dsi_encoder_remove:
> +	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> +		meson_encoder_dsi_remove(priv);
> +hdmi_encoder_remove:
> +	meson_encoder_hdmi_remove(priv);
> +unbind_components:
> +	if (has_components)
> +		component_unbind_all(dev, drm);

As 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
states, it seems invalid to call component_unbind_all() before
drm_dev_put(). Wouldn't this patch reintroduce the problem here?

In that sense the diff proposed by Martijn <linux@martijnvandeventer.nl>
behaves more correctly.


I've also found this thread [1] with another error path fixing patch. It
was suggested to improve that fix with managed drm device [2] interfaces but
AFAICS using devm_drm_dev_alloc() will reintroduce the problem mentioned
in 6a044642988b, too.

I think [1] should be applied as well with Martijn's patch?

[1]: https://lore.kernel.org/dri-devel/20240809124725.17956-1-abelova@astralinux.ru/T/#u
[2]: https://lore.kernel.org/dri-devel/20240828110421.14956-1-abelova@astralinux.ru/T/#u


Thanks!

> +cvbs_encoder_remove:
> +	meson_encoder_cvbs_remove(priv);
>  exit_afbcd:
>  	if (priv->afbcd.ops)
>  		priv->afbcd.ops->exit(priv);
> @@ -374,13 +384,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  free_drm:
>  	drm_dev_put(drm);
>  
> -	meson_encoder_dsi_remove(priv);
> -	meson_encoder_hdmi_remove(priv);
> -	meson_encoder_cvbs_remove(priv);
> -
> -	if (has_components)
> -		component_unbind_all(dev, drm);
> -
>  	return ret;
>  }
>  
> -- 
> 2.49.0
