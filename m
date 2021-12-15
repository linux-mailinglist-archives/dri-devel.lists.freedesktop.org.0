Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FDB4764B1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 22:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0DF10FAC3;
	Wed, 15 Dec 2021 21:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B4710FAC3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 21:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=slN8KlAG/wgd1vHM4PNJ12OXam4tmufbrpTaVHTpKTo=; b=prB8s3G23vOELlqzEyhyjNWNll
 LKWHcCquferLZhfY06Lks/YVUdaLOZNz6g8AdrD7A3fJ9q+EMTF51I14ICP9AYjeG0P6saRF6Baqw
 lo0M190NFR97czMCNFq8YmvPIs2GcPRViSOQepavjqGByomZRPa6Q8WrEc6mg6JWJDg0C+Rp1Gwn+
 rkCPcRV5QOmS1BGBr/s/poqY3KmvqBwT4BX3hKr2sp4avswPb91nDobJh47BGAMEZQR1XYfA4UBP4
 v7lhyU4cNWUffTvRSohqvwDBlLXO/9Bu1mE5FlixwBCcj239t/EykI3KJJuH07Umrj15HbpzkQK0e
 v0yCMeNw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61446
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mxby0-0008S2-S2; Wed, 15 Dec 2021 22:37:40 +0100
Message-ID: <5b1d9578-1f74-a808-c4d4-6e8c38dd57fc@tronnes.org>
Date: Wed, 15 Dec 2021 22:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 11/60] drm/gud: Add support for the nomodeset kernel
 parameter
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-12-javierm@redhat.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20211215010008.2545520-12-javierm@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 15.12.2021 01.59, skrev Javier Martinez Canillas:
> According to disable Documentation/admin-guide/kernel-parameters.txt, this
> parameter can be used to disable kernel modesetting.
> 
> DRM drivers will not perform display-mode changes or accelerated rendering
> and only the systewm system framebuffer will be available if it was set-up.
> 
> But only a few DRM drivers currently check for nomodeset, make this driver
> to also support the command line parameter.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 

I don't understand why this is applicable to USB drivers, there's no way
the firmware can setup a framebuffer and continue pushing pixels over
USB when Linux has been given control over the USB bus?

The same argument goes for the SPI drivers in drm/tiny/ as well.

Noralf.

>  drivers/gpu/drm/gud/gud_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> index 3f9d4b9a1e3d..4d253d249512 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -446,6 +446,9 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	u32 *formats;
>  	int ret, i;
>  
> +	if (drm_firmware_drivers_only())
> +		return -ENODEV;
> +
>  	ret = usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
>  	if (ret)
>  		return ret;
> 
