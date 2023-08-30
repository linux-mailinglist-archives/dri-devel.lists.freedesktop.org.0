Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2690B78D331
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 08:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3521310E0DE;
	Wed, 30 Aug 2023 06:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EFE10E0DE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 06:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693375989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zDMwjc1qeSKVKGNyVJYoF/wnSkEGcFh3a/TxjrwSsFM=;
 b=G5SwSKwlzrI6e0nCnZXIDI9qNFj0ipRIFOkqA3Ee1GXEveQZNFJJsRf89DrAYNxpmPhxFL
 zcyGUo9Cwpis5EHDXAkWHeaK+J6AAxBG5Vad1PcV5UUr37bFSF2FWfFFxKBSPeNEXSF0ta
 zKr44y8nRAanSlyGSj3WD3BWefTKNc8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-dkyCKHBFPtCpvMdvykrsag-1; Wed, 30 Aug 2023 02:13:07 -0400
X-MC-Unique: dkyCKHBFPtCpvMdvykrsag-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fe4f953070so34862035e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 23:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693375986; x=1693980786;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zDMwjc1qeSKVKGNyVJYoF/wnSkEGcFh3a/TxjrwSsFM=;
 b=Ga/2bCHnKsyUWjImW4irTBRgKp+eFNLeXSrDSfdRaEhNeLmMf8QJLXPiWG6fmJGtBf
 O8nJH9udsbxu2EZc3JEEY3RMHcha6oQ57pgrPH4FCSE/p3oQLmICXShlYXTGkvImkq/d
 l5ErF0l7bIJLRztwgFyLMmfl6/7NdobGNMDc58xy6x0sBc2Rdpc1rquXLQ6LYE51RYN/
 g1+damhhV/GotT/tcTqNR4DN6HeDh6MBxR3p1MkgbrZGSubgMdS8wLcMQTleKBNvqUHD
 9P8Zpwvz2z+FTD707yeUFb7mMyhv9YkhE+fBxgEpkEzPxZEAouK4kY7sMIjsatbb2iWG
 kv2Q==
X-Gm-Message-State: AOJu0YwfdhiBtecX+VWDEzwkqqSU/VJkpmSVrzIzPmc+7JFkRGgrmen+
 rTuiWE3enaHt3Zj52ZRs4JBtcom+C3Nc048taHzyQehAV9GncWaxmFVp1VcmCWwFAsN3kl5f6vS
 nFfkm7KNMWs8cpqHUrZYmapSMfIn7
X-Received: by 2002:a7b:cc8d:0:b0:3fa:934c:8360 with SMTP id
 p13-20020a7bcc8d000000b003fa934c8360mr1171876wma.8.1693375986503; 
 Tue, 29 Aug 2023 23:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHvw3L5ADexsvF7N1c0MqO622OpsVqhuuyhkfctr5r7D+YcP0qanoW/QKryomKNyPwHppEpA==
X-Received: by 2002:a7b:cc8d:0:b0:3fa:934c:8360 with SMTP id
 p13-20020a7bcc8d000000b003fa934c8360mr1171860wma.8.1693375986147; 
 Tue, 29 Aug 2023 23:13:06 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b003fe1c332810sm1101298wme.33.2023.08.29.23.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 23:13:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <20230825132229.1109445-1-thierry.reding@gmail.com>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
Date: Wed, 30 Aug 2023 08:13:04 +0200
Message-ID: <87y1htawi7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thierry Reding <thierry.reding@gmail.com> writes:

Hello Thierry,

> From: Thierry Reding <treding@nvidia.com>
>
> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> not to remove any existing framebuffers in that case.
>

I see, this makes sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

A couple of comments below though:

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index b1e1a78e30c6..7a38dadbc264 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  
>  	drm_mode_config_reset(drm);
>  
> -	err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
> -	if (err < 0)
> -		goto hub;
> +	if (drm->mode_config.num_crtc > 0) {

Maybe you can add a comment here explaining why the check is needed?

I also wonder if is worth to move the drm_num_crtcs() function from
drivers/gpu/drm/drm_crtc.c to include/drm/drm_crtc.h and use that helper
instead?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

