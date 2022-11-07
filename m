Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D478261FED4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018B010E3D8;
	Mon,  7 Nov 2022 19:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EEE10E3D8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667850207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T+MYGNwBR+Rwvao8mlrqDH2JgeLYoIf95UPfWCfEU38=;
 b=RJwDHjaHg8Ot7HsRrJbEs3VkkQeDfHRbKA8KEEjEdvHC62HnCuK4RIu+BspHk1afzpD5N8
 RcXol2FZUBWTiKSDpqFxgZMFgsDlNNrVifm1KKNapbIufwFzNFsho9zLq7svRjntRKKFdY
 nJCKq+6H9If9nu0MQ07UxrUedJEODLo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-XjJ3JVZ7OuSljRXQdwgBWQ-1; Mon, 07 Nov 2022 14:43:26 -0500
X-MC-Unique: XjJ3JVZ7OuSljRXQdwgBWQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so9161321edb.22
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 11:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T+MYGNwBR+Rwvao8mlrqDH2JgeLYoIf95UPfWCfEU38=;
 b=pJhhDayUiY1Iirtb8w2TPRN4HBeWRg8al87gMnsOBbX+CfuM3ibVRU8IrRQJClJnyp
 l0+90YuiFebUuWgpSVECnTkx95pZRG/Pkm2WzTPkqz3b5hTBBrvsJHfWIuMhLebgdUM6
 LOF4fm1CWrlzwYPVrpTjUXhyRnk+Bt5+brfI7m2WgnZu6uJlVp5RXC6bqHVE2l3aNPql
 Z81dkWdzQPpIb8nMn2SNKLdYsiEW3jX+QtIPaEaBgElOktDHjIVVTBq3TH8Ri0rTI5+q
 6XfLYFoVTtzPpI6Say/257OsbQiA4lNI4CDxj6xpfDLEyw0sGdu4cOmm3VrbanEBsBWf
 MkLw==
X-Gm-Message-State: ACrzQf2/TU71YLPd+5xMocktYTOMG5H9+2fchuShMiT+e023ONLXY4nX
 +lnmCyhAW6kJstU0JmxKjnionAg0C4kZ7+OrOF09nQxBJ54tFE6mQSy136E9pizPqKD55WNfvLn
 yQScEJ1qeYz0vwBWu1qE9xqPDUghU
X-Received: by 2002:a17:907:843:b0:73a:5b0e:8352 with SMTP id
 ww3-20020a170907084300b0073a5b0e8352mr50156234ejb.438.1667850205643; 
 Mon, 07 Nov 2022 11:43:25 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5XGEYvVOH24leZFvJk1jRnNxFGb8iDc1hjDsapTa1/D/RlUw0BoWIqz6C4vc7/k6hNl7gtEA==
X-Received: by 2002:a17:907:843:b0:73a:5b0e:8352 with SMTP id
 ww3-20020a170907084300b0073a5b0e8352mr50156220ejb.438.1667850205421; 
 Mon, 07 Nov 2022 11:43:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 et19-20020a170907295300b0077205dd15basm3807232ejc.66.2022.11.07.11.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 11:43:24 -0800 (PST)
Message-ID: <d2dd6f25-222e-322b-8af9-25d844224c75@redhat.com>
Date: Mon, 7 Nov 2022 20:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 22/26] drm: vboxvideo: Remove #ifdef guards for PM related
 functions
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175256.360839-1-paul@crapouillou.net>
 <20221107175256.360839-12-paul@crapouillou.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221107175256.360839-12-paul@crapouillou.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/7/22 18:52, Paul Cercueil wrote:
> Use the pm_sleep_ptr() macro to handle the .suspend / .resume callbacks.
> 
> This macro allows the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index f4f2bd79a7cb..79318441ed7e 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -102,7 +102,6 @@ static void vbox_pci_remove(struct pci_dev *pdev)
>  	vbox_hw_fini(vbox);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int vbox_pm_suspend(struct device *dev)
>  {
>  	struct vbox_private *vbox = dev_get_drvdata(dev);
> @@ -160,16 +159,13 @@ static const struct dev_pm_ops vbox_pm_ops = {
>  	.poweroff = vbox_pm_poweroff,
>  	.restore = vbox_pm_resume,
>  };
> -#endif
>  
>  static struct pci_driver vbox_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
>  	.probe = vbox_pci_probe,
>  	.remove = vbox_pci_remove,
> -#ifdef CONFIG_PM_SLEEP
> -	.driver.pm = &vbox_pm_ops,
> -#endif
> +	.driver.pm = pm_sleep_ptr(&vbox_pm_ops),
>  };
>  
>  DEFINE_DRM_GEM_FOPS(vbox_fops);

