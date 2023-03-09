Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1204D6B22BA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463FF10E7E5;
	Thu,  9 Mar 2023 11:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C7710E7E5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Dghzts1KQfEJn117b+D+nIsLd5JNUVZxacPTW+thvMS+bZCpeL/Kk2LnfiNO0OdOJkbCcH
 KCkYj3L2d/LUOtcMjAksgiA0glofBTMHqnuDJJl0yMuBSOMTLihGq600Hg5GH6mUHvqxk1
 T5lDDvYaievRtWIJpsuOV51mH2r7Gps=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-gw5jo6wAN4mQABAR-Gy9iA-1; Thu, 09 Mar 2023 06:22:44 -0500
X-MC-Unique: gw5jo6wAN4mQABAR-Gy9iA-1
Received: by mail-wm1-f69.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so2244380wma.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360963;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=enk1YAwMIdGfpHJDAaC+PR+VvIZ/XkLLDw4dCtJowbrJ0yJSi5gUxGRxL7gSB+y/Rb
 qSCTruwyoJFjGhIaa5rzqCfCsBL05xjW2Pwtg2043Y8mLJ3WthI7n+v/J20Y+//5gntD
 6pNT2uka0wxxvncCkf7q9xnLw6eHU4wjiNynjhb4SLVXzZAJHrqQpr9LUAIGCBm3mC0s
 3bIm/llt/CyHY1ITdLAj0LBY8+fE1JUFq37rrwN00SwlPHjNYM65P8h9+z0alqiA5Ggp
 V5qMT1OuoQkh+VaoUNOXF8gEXzheLYoyBafsdhglvrjwNw55+mKG0EPQspZmar6Qf+ez
 QynQ==
X-Gm-Message-State: AO0yUKUYCdcfaAaClh35tnI6KBLjDadnwxciH5Cdi0XU62weOKjdZBgw
 zD7lbhEly2KYK8J++RWYE+Pd0dx+7PuuKLNAu8rsfb/40qQDADgULHQqwQ2GfOQkjA0n3T/He5v
 Sh3Hsbsq4f1/pBWpmDdXhOYIFlaeP
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id
 j5-20020a05600c1c0500b003eb45016c60mr15506187wms.5.1678360963367; 
 Thu, 09 Mar 2023 03:22:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+bXzeTIl7Irwfxa7/DXky+Tf4Fs2Oix8AFpHgk72LnoLDINFW1m3YZeFk72iyLEtfOHY0o9w==
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id
 j5-20020a05600c1c0500b003eb45016c60mr15506159wms.5.1678360963195; 
 Thu, 09 Mar 2023 03:22:43 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003eb966d39desm2539921wmo.2.2023.03.09.03.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:22:42 -0800 (PST)
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
Subject: Re: [PATCH 11/22] drm/meson: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-12-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:22:42 +0100
Message-ID: <878rg6cgot.fsf@minerva.mail-host-address-is-not-set>
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

