Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528536B22A1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744B410E7E1;
	Thu,  9 Mar 2023 11:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA6110E7E1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=J8AMSPbfaaWKAdueqBDchdfwCvvjPH6b5rfoKS9mYt5FZwMsDRY7NN8KQQ1LtTPgg8AZXC
 GQRxVvE9O7zrNk7DbpwaTEhE3pdK47y3HIuBADhdV0EUqatg4WJzh30ZTUeKgLBv2Mn3sP
 Ohmepe7GD96m683HdvXgEjcd097g5tI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-CcndLBuyNhCDvdwpuN5xGA-1; Thu, 09 Mar 2023 06:21:01 -0500
X-MC-Unique: CcndLBuyNhCDvdwpuN5xGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo541057wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360860;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=R+ZnY4X7sOampCtpNdsClQ1KLUgGVHJ9jGbpCkR5j9OX8eIKxRgr+jQ4I4dil2U4e6
 QhJ4RhsVO2QQXBW8vRb7Fwa6LwIInrZFzr2JdH1YH9i10160H/JmETjz7QEbNrzqzN70
 dKOXO2aai29wDmSbnFI/2a8N5tpCs8j8e5HCiI+rJyzDVif8nPE8p4vh8VKLWW6FUMtz
 ilXG8zSUUd66m9PIfkJoyxeNF9DCLrOEMagyX3q9B/u6no/i9BWaHbe5m40K46jastHc
 86MrnMCZ1bbpu2ufHnTMT4ig4RaqUDyEJfoGqViprmcXC51o4zj01GcT3ZCFI0X9uYBy
 XlMg==
X-Gm-Message-State: AO0yUKUUJrsJIUZNZvGi3MHP2ozjmNiXqt1ICuoD4G+umC2VrzVHsIgS
 NXvdCzqGzzLtlskuk95CHLhtY3eBkd5vyqKu4ZEOFaieURH6HquGPZODK7KtAW9DWsdn6DI+Wgm
 L/5u08NwRXDTuwwO+yUyux0Idf5PE
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id
 h6-20020a05600c350600b003eaf6c45f26mr18535001wmq.17.1678360860426; 
 Thu, 09 Mar 2023 03:21:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8sLO5bKSPBoOiZMye1ieYHzGLgjQdrxGWGVp5ppUvSkKaG+jgho1T4oKqlnOH+WRjzqLQwTQ==
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id
 h6-20020a05600c350600b003eaf6c45f26mr18534954wmq.17.1678360860177; 
 Thu, 09 Mar 2023 03:21:00 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c3b0800b003eae73ee4a1sm2681759wms.17.2023.03.09.03.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:21:00 -0800 (PST)
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
Subject: Re: [PATCH 07/22] drm/imx/dcss: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-8-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-8-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:59 +0100
Message-ID: <87jzzqcgro.fsf@minerva.mail-host-address-is-not-set>
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

