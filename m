Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8E6B22F4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2E410E7ED;
	Thu,  9 Mar 2023 11:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6A10E7ED
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=U3QmQiwOG2L5ks0Rhj0fWFvBjisjYigNj9RK4QwE10iRclRIRWP1dxaMgh7QXaKqBx6tEl
 YqES2lwLKK+h7t1RYAnnHs3qUJ2IMBj5TMpxlRaHaHXQG2BmjYJNRohplCQ73yrwEtlNOO
 iWI8jeSflcJ8hgywBGCrdayfPplN4Po=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-62ipDXchP8a0eFrgQUHhhQ-1; Thu, 09 Mar 2023 06:28:07 -0500
X-MC-Unique: 62ipDXchP8a0eFrgQUHhhQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so543884wmb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361287;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=FvY8jEZrrXVY83kX0ZXab9wgLGKMbHKpN/I8wA/c7Ck3tHG531Z7jkrN6mDxw5XUm/
 Ztf5gJNkgVCqNHRoEfP+L6pTmE82ItW13oZEWDnylS2SpZJs1hlUIOLFUnFjv/wcP43z
 Tcu0qFa73qfyHKhUnw0AZqM5PQSYwWLEGJjjqj6RpxrhNWn2RNeqzlx8v6tVFR45Hv7K
 jBF7tEQywK7yVOXJigb0jjT6Pl1SExfSupJlhMvuYg8TcHEKMBDk6TS3oW02j1v2dCxS
 CkH3WjrsvvMhJ75zXWV9qHIZHBmYT9Wwf8Ezhdo3sD+Q7UuJyl7ND1EzF70PNHY0DyL/
 tuRg==
X-Gm-Message-State: AO0yUKUgJX3z2Nnf80YktPUQk92cVL/y8TOprDIWrKyuafaqUDPPx8Ym
 UMr4nsqfOcDDw3AjuLnqvM2C4ENUYDj1yJ6hEOLs1Vjiksy6DsnXEBzeSNJzvu7zWry+ZZXf5XR
 aUmZku7bcrt7SaZwcEZP9gPBfHDRq
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id
 s6-20020a05600c45c600b003eb2e1ebeaemr18094362wmo.25.1678361286860; 
 Thu, 09 Mar 2023 03:28:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/WVkqnZjpkmSmEiWhaQK18CsrOsasLB6GMCz1AC0uyDvVk4dRPtB1UV7OYFbDbrMsIDiabKA==
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id
 s6-20020a05600c45c600b003eb2e1ebeaemr18094343wmo.25.1678361286535; 
 Thu, 09 Mar 2023 03:28:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f10-20020a5d4dca000000b002c70bfe505esm17395825wru.82.2023.03.09.03.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:28:06 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 19/22] drm/arcpgu: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-20-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-20-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:05 +0100
Message-ID: <87edpy6u62.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

