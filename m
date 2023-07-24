Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5093D75FCF8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 19:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E53E10E337;
	Mon, 24 Jul 2023 17:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E9C10E337
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YrKdfEJPkp8cxcYIrOqeYx8cgaV2LlCIos+ktOgi4tw=;
 b=saRRZ3U1tsP1vn/cPMCdIb5jqYhCpwBkqKLeCDsQkiB834DbR181G0Qm2Z9na9pbPBlgmdLUtecqX
 F8X2ubMsWwqSLyOCWsXY58d0xyqHduWLmCISSX0CjLRH/7FoXQFfKcAD2tYiUTt1khQQ4dK2IIfiak
 SJ+xexvx0x58FONQrs0WgRT2bSHDTNmBDOl2qQRSWflj5DB1fVF+WaZU/sZQ3McrF6OH5TOMkpj3jE
 uIOq9wyZHKJ+xuu5MrGFSqbuicnTtdL96MyJ+dOHg+EX2yn6b2pIeDW6JXn4ERcDUe7zRDnaWh87tq
 Fn/Pcbz/J6UkYCeK94wnS9h0LouZbSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YrKdfEJPkp8cxcYIrOqeYx8cgaV2LlCIos+ktOgi4tw=;
 b=bkdXlnVRZmif/n8pH0YuZcafk4/jZR/NeUeMmRYsGOiFrQKSVMi213IBNI+85h5xuSDLzQoKLkdag
 RfngfPYBw==
X-HalOne-ID: 7c739322-2a45-11ee-984b-55333ba73462
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 7c739322-2a45-11ee-984b-55333ba73462;
 Mon, 24 Jul 2023 17:14:03 +0000 (UTC)
Date: Mon, 24 Jul 2023 19:14:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Subject: Re: [PATCH v5 1/3] drm/panel: Fix IS_ERR() vs NULL check in
 nt35950_probe()
Message-ID: <20230724171402.GB692753@ravnborg.org>
References: <20230724140036.1022676-1-cuigaosheng1@huawei.com>
 <20230724140036.1022676-2-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724140036.1022676-2-cuigaosheng1@huawei.com>
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
On Mon, Jul 24, 2023 at 10:00:34PM +0800, Gaosheng Cui wrote:
> The mipi_dsi_device_register_full() returns an ERR_PTR() on failure,
> we should use IS_ERR() to check the return value.
> 
> By the way, use dev_err_probe instead of dev_err to print the error code.
> 
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35950.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> index 8b108ac80b55..2731ce02ce53 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> @@ -571,8 +571,8 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>  		}
>  
>  		nt->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
> -		if (!nt->dsi[1]) {
> -			dev_err(dev, "Cannot get secondary DSI node\n");
> +		if (IS_ERR(nt->dsi[1])) {
> +			dev_err_probe(dev, PTR_ERR(nt->dsi[1]), "Cannot get secondary DSI node\n");
>  			return -ENODEV;
This code should return the error code we get from
mipi_dsi_device_register_full().

To do so use:
	
	return dev_err_probe(...);

Please fix and sorry for not noticing before.

	Sam
