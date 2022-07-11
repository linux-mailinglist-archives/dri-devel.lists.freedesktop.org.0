Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2156FBAF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CB68D377;
	Mon, 11 Jul 2022 09:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029768D377
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657532052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ajj+vcHD2SjgR91KloH7EXcA6NIzzKWwkXRERtZQ3vQ=;
 b=eli8Jfc7eqFj+rVrVTP7KcGZGdwVvAX96+AnaaXq/bXp/vdv9q+ndilkAMRAI/Q5b+tyLa
 kEnCvgv6atDYrqpl3xf+PliYS9uWj6jIUmsKLypoWcvXqFU42b3q2mQKvdMdk1eeUBkpgT
 B9MiexuunVlcPui8/T6aQn6Eow2WKbw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-6DHB8C8RPKmJuaIzEZ7L9w-1; Mon, 11 Jul 2022 05:34:00 -0400
X-MC-Unique: 6DHB8C8RPKmJuaIzEZ7L9w-1
Received: by mail-wm1-f72.google.com with SMTP id
 n18-20020a05600c501200b003a050cc39a0so2437431wmr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ajj+vcHD2SjgR91KloH7EXcA6NIzzKWwkXRERtZQ3vQ=;
 b=Z1s6OHd4TYO4k0XhOEqHAZOkRZmUQApqbsriZR/5Q87ZYSLkd2R/+bFwmaEfvpotHl
 DYip6DmmmbtoVXiLD4qq8PbVuECT5s2xe/hmVML6UjvAJK3u3rCDebFZaqNNHUWJ6YPt
 02eqnitS/el9lUadKRtgTTRdbtl9Z77Y2EwJRxYXS90hQSNHnb3mBVz0gL1KPiQn7hyL
 c9HXljN6SepedVcLCvOwkgt36rbu56guqCLT5WmbBGe2PzRL6WgyLt5C+4w3P2I1Gvu3
 JqbrEO3LSOm+0s7vw5UKkwBUaRPKPu0S/uh73pZrV3UhBuM+Rd6bZKGQTVxZ0SNWluxu
 z3/g==
X-Gm-Message-State: AJIora/QBttcRkocNlhSLD/ay7ArCwCIkjXzV086xd8FWqc7356wuF+j
 Xuy92ZmOsdBLvTzMTppgZ9Lx2sxtVCLiY3ORLFo+iAzyMlm2JTZ06hzGdi0AAqsCwX2AtUlKU/U
 5MAiGa3FPj4JOOAAxjtnSG9uCsjYh
X-Received: by 2002:a7b:c314:0:b0:3a0:5750:1b4a with SMTP id
 k20-20020a7bc314000000b003a057501b4amr14754180wmj.20.1657532038621; 
 Mon, 11 Jul 2022 02:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sGs79u/exA+X2gTLtgwTNdc+xM89fmwlJKvwsIIjmZKRrBloPItUuzzJRsS1in3ZlPSOi7fg==
X-Received: by 2002:a7b:c314:0:b0:3a0:5750:1b4a with SMTP id
 k20-20020a7bc314000000b003a057501b4amr14754158wmj.20.1657532038369; 
 Mon, 11 Jul 2022 02:33:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c502300b003a2d0f0ccaesm10049919wmr.34.2022.07.11.02.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 02:33:58 -0700 (PDT)
Message-ID: <b34a6aa0-bfa9-ad68-c181-9649f276a561@redhat.com>
Date: Mon, 11 Jul 2022 11:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/mgag200: Don't read-back PCI option register before
 writing
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20220708072114.13960-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220708072114.13960-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2022 09:21, Thomas Zimmermann wrote:
> Remove the read operation from mgag200_init_pci_options(). It was
> incorrectly added while refactoring the code. Reading the PCI option
> register clears the register's new value and subsequently leads to
> re-writing the old value.
> 

Looks good to me.
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: ce19021fd99a ("drm/mgag200: Move PCI-option setup into model-specific code")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 73e8e4e9e54b..251a1bb648cc 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -28,12 +28,6 @@ int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
>   	struct device *dev = &pdev->dev;
>   	int err;
>   
> -	err = pci_read_config_dword(pdev, PCI_MGA_OPTION, &option);
> -	if (err != PCIBIOS_SUCCESSFUL) {
> -		dev_err(dev, "pci_read_config_dword(PCI_MGA_OPTION) failed: %d\n", err);
> -		return pcibios_err_to_errno(err);
> -	}
> -
>   	err = pci_write_config_dword(pdev, PCI_MGA_OPTION, option);
>   	if (err != PCIBIOS_SUCCESSFUL) {
>   		dev_err(dev, "pci_write_config_dword(PCI_MGA_OPTION) failed: %d\n", err);

