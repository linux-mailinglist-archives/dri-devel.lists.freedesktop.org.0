Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057466B2301
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0177E10E7F2;
	Thu,  9 Mar 2023 11:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A622A10E7F2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=QGtKIkAUDfax/IoBNEytpljnWwNlAd5TGdI7mxG9OyrPt13m1KB3h8HlHEySbVuStsGkzI
 DokXitxMdSnZXYDxdJMthC8yhk1SbzwGyA9V+lZSHqxiiTbGAxsjXJedhhNmzEFygy8mPl
 99lWZ8WoYWmx3Abv1pnaKZJQPLFwXhU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-5Bzv1SMGMfypoRnLMDLoow-1; Thu, 09 Mar 2023 06:29:05 -0500
X-MC-Unique: 5Bzv1SMGMfypoRnLMDLoow-1
Received: by mail-wm1-f70.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so2256677wmb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361345;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=28efDPcQLrtA50+XBd2ex1HvQlCOGFpGYAbR96VY9AjEgMfWGB3gd05c3cYMwNNcjD
 PrICf2suDaBAmAry/q9rAK6Cy6UJreTeq3YrT/D1+p+gCdnP7pWDOtVAHzL1DEhhh/7Z
 DgfhSwfOT7bnUWwKEVrErnOIZ8B2aFL5qPfX4fiWPRMRerWNt7SKQpqrIjeXLHmlsOuf
 9CwLIu0MGjPFXVCRuWZK76gsew1JLmatLx0zN6dCwjdON/guWNDlyCDy+LufLh4ftCGg
 W9BVUvceZnsiemYyKo6ycJarohkutJAIqw9S8P3Xl8xkXI3DoRZOsaXn8KAOAqShojzv
 H89Q==
X-Gm-Message-State: AO0yUKXG46KxVoLOyMVM3b9ykXAYxNnH/1ZkW0OMpna9My5+Lh9Hckvo
 I+jerkWxT+pgMH7RBuYyZKxOcsyxHuCf3L4WAD9Z9oqbISo6hQxJshv/tpLrWN+rb7N5pRMJPhR
 h4k2AKGejJQVjRrJq3uhjXwmtkIuQ
X-Received: by 2002:a5d:6505:0:b0:2c6:e682:e55b with SMTP id
 x5-20020a5d6505000000b002c6e682e55bmr11934478wru.48.1678361344740; 
 Thu, 09 Mar 2023 03:29:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/SuOlGzNjzuB+/71QhRoDFVzQZ5KDl1yemHeUwxjB4OayINr1XWjAGx9mSH74oqRW7vJe0XA==
X-Received: by 2002:a5d:6505:0:b0:2c6:e682:e55b with SMTP id
 x5-20020a5d6505000000b002c6e682e55bmr11934447wru.48.1678361344548; 
 Thu, 09 Mar 2023 03:29:04 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003e214803343sm2615371wmb.46.2023.03.09.03.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:29:04 -0800 (PST)
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
Subject: Re: [PATCH 22/22] drm/xlnx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-23-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-23-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:29:03 +0100
Message-ID: <875yba6u4g.fsf@minerva.mail-host-address-is-not-set>
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

