Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7547DD153
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7137B10E125;
	Tue, 31 Oct 2023 16:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B87910E125
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:13:43 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39VGDY9f129042;
 Tue, 31 Oct 2023 11:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1698768814;
 bh=hfNbY2AmnmOKK0h6VK9HtZx1Vqfd5+Nfz21HDYq/4xA=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=EBZnQQoYJi7WPOLBNKcqfKCQQbC46uBoGqv9Zk2gU7+niavim+2aYmXuF+MNbDPMP
 BfcRVQDkDY0n4Pvot9dWM/snVmaVVVhLrybPw5Z/L6tyftFU3R6/IKqvGX1Ky6sQZp
 lTydj0gPEfJYzEtlKE1EFMfzPzNZjwqUW4sPucPg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39VGDYQV081239
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 31 Oct 2023 11:13:34 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 31
 Oct 2023 11:13:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 31 Oct 2023 11:13:34 -0500
Received: from [10.249.132.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39VGDURk016065;
 Tue, 31 Oct 2023 11:13:31 -0500
Message-ID: <c7932fed-176f-e113-9a80-f6c5528a9414@ti.com>
Date: Tue, 31 Oct 2023 21:43:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/tilcdc: Fix irq free on unload
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg
 <sam@ravnborg.org>
References: <20230919-lcdc-v1-1-ba60da7421e1@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20230919-lcdc-v1-1-ba60da7421e1@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19-Sep-23 12:42, Tomi Valkeinen wrote:
> The driver only frees the reserved irq if priv->irq_enabled is set to
> true. However, the driver mistakenly sets priv->irq_enabled to false,
> instead of true, in tilcdc_irq_install(), and thus the driver never
> frees the irq, causing issues on loading the driver a second time.
> 
> Fixes: b6366814fa77 ("drm/tilcdc: Convert to Linux IRQ interfaces")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

Regards
Aradhya

>  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index fe56beea3e93..83233bdc0526 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -138,7 +138,7 @@ static int tilcdc_irq_install(struct drm_device *dev, unsigned int irq)
>  	if (ret)
>  		return ret;
>  
> -	priv->irq_enabled = false;
> +	priv->irq_enabled = true;
>  
>  	return 0;
>  }
> 
> ---
> base-commit: 0663e1da5ba8e6459e3555ac12c62741668c0d30
> change-id: 20230919-lcdc-9e09e94f4e93
> 
> Best regards,

