Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30075433A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 21:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A3B10E010;
	Fri, 14 Jul 2023 19:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2457710E010
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 19:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=zMjcmHfY3cLNP7cMX0zYg+SetcQ8/zS0sWVn8ienFv0=;
 b=Aypo7HNr5o/7e4BlWis8JBEIpYZrCTUSqhenqaTqsK9PFJ5FkHRqyCgWPW5QRYNev3oKuboxm3TgN
 I9LTIwf5VK1pFYnOrMi1m4Jz2RPovMI1l3trdGUhQlh9a1ZcStQ30VPbjcYEDCqmwMqnJ4OPwuZFoL
 +fYLI96QWOSlZco0/+gQtBCdat3trK6XkyqXWGdCylFanveMDE1gAXimp0aQMzDsseHqwb8voesEt7
 09iZV5OPx/CGyiYYpOA1zcKi9wNHgdCuHSNkccYZi5IYS1bXdcKYoSW0JuNZnbQGl0F3TChaLWdiYT
 8hJ6AiNkrd21RJWAfPJRH5D4GU8fjWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=zMjcmHfY3cLNP7cMX0zYg+SetcQ8/zS0sWVn8ienFv0=;
 b=OOzQz9ZeCWSGqDckYXFEHYbG8QU1bKmwhhrzeEH2AUNsDcwtx8zHE6G0TJ5c7LJGaHFyOLhpvYQSd
 GfRdRfKAw==
X-HalOne-ID: 130a949d-227d-11ee-a9e8-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 130a949d-227d-11ee-a9e8-b90637070a9d;
 Fri, 14 Jul 2023 19:31:50 +0000 (UTC)
Date: Fri, 14 Jul 2023 21:31:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Subject: Re: [PATCH v3 1/3] drm/panel: Fix IS_ERR() vs NULL check in
 nt35950_probe()
Message-ID: <20230714193148.GA158430@ravnborg.org>
References: <20230714014820.2186203-1-cuigaosheng1@huawei.com>
 <20230714014820.2186203-2-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714014820.2186203-2-cuigaosheng1@huawei.com>
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
Cc: neil.armstrong@linaro.org, quic_eberman@quicinc.com, quic_gurus@quicinc.com,
 sean@poorly.run, linux-arm-msm@vger.kernel.org, a39.skl@gmail.com,
 liviu.dudau@arm.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, james.qian.wang@arm.com,
 angelogioacchino.delregno@somainline.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gaosheng,
On Fri, Jul 14, 2023 at 09:48:18AM +0800, Gaosheng Cui wrote:
> The mipi_dsi_device_register_full() returns an ERR_PTR() on failure,
> we should use IS_ERR() to check the return value.

Correct - so the code is indeed wrong.

Can you update it so we print the error code as this can be very
helpful.

And then please use dev_probe_err() too.

	Sam

> 
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35950.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> index 8b108ac80b55..4903bbf1df55 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> @@ -571,7 +571,7 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>  		}
>  
>  		nt->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
> -		if (!nt->dsi[1]) {
> +		if (IS_ERR(nt->dsi[1])) {
>  			dev_err(dev, "Cannot get secondary DSI node\n");
>  			return -ENODEV;
>  		}
> -- 
> 2.25.1
