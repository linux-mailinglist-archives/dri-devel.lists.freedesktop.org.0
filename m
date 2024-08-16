Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C1954EF2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 18:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA0110E809;
	Fri, 16 Aug 2024 16:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="fQ4Kdvd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1902 seconds by postgrey-1.36 at gabe;
 Fri, 16 Aug 2024 16:35:40 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A8C10E809;
 Fri, 16 Aug 2024 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YapGZO0Srwp4BKeV3mXt3+YPH0r2w1SHKvZfpKm6uPs=; b=f
 Q4Kdvd65A1kz1qesPYewylBGETxZfTnYN8w1mjWJZIbKI5lNjY2QXSaHFnj9oQVPR+HU0DtiBbdfZ
 pnpNlpldEp01yRG1xIMKObPPB5+VFFF4jlOPuNfW4e/6NvjlRp/vOaHp6726VXhn41kTqxV+y3hzX
 y+0i8VLPqszzpxTJ8MYVEAMwkPd+oPaNYYSrBX99RJbjXDKpig2aMmxO92h0JMVVndBazxWdhFxHw
 BjebFojKy5Pc7wmX+YbQXzS0CxLwhPzMHqp5K4ZXQGYJMuFClVL15iJllefr0X2IVIIxKiE7GIqyE
 68vFRoPjuvslqENmw4Kk25BAE+Rv6K2oA==;
Received: from [2a01:799:962:4900:815f:3dd0:60d8:6458] (port=56900)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1sezOb-009xdy-IR;
 Fri, 16 Aug 2024 18:01:45 +0200
Message-ID: <6134a8e2-42ae-4e93-8007-01c19509a8bc@tronnes.org>
Date: Fri, 16 Aug 2024 18:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/86] drm/mi0283qt: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-29-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20240816125408.310253-29-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/16/24 14:22, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/tiny/mi0283qt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
> index cdc5423990ca..f1461c55dba6 100644
> --- a/drivers/gpu/drm/tiny/mi0283qt.c
> +++ b/drivers/gpu/drm/tiny/mi0283qt.c

<snip>

> @@ -226,7 +228,7 @@ static int mi0283qt_probe(struct spi_device *spi)
>  
>  	spi_set_drvdata(spi, drm);
>  
> -	drm_fbdev_dma_setup(drm, 0);
> +	drm_client_setup(drm, NULL);

Would it be possible for drm_dev_register() to handle the client setup
so drivers won't have to? struct drm_driver could have a field for
drivers that want a different color format.

Noralf.

>  
>  	return 0;
>  }
