Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61C6B22B2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35F510E7E4;
	Thu,  9 Mar 2023 11:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405C810E7E4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=CcQrOEUB/gHc08FDyHUmbpoI5j6Sxt29lT4DqNfsktbvGB4CYoWTU6NGm5Y+cZuTV9ju5+
 cuoSB8NLuNzi6jh0++rfYbwfGO22kfiwryBDWxs5z7KGzUdVBRyiQ/yb1ydC79sIVR0LGA
 lHgfXd605kMnf4kMXIp0mvlLzqhE+xs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-krcUWVxhPGCXGscidpz6rA-1; Thu, 09 Mar 2023 06:22:08 -0500
X-MC-Unique: krcUWVxhPGCXGscidpz6rA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so644984wms.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360927;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=vy9I2iUYV6+HMfpDNddVPO7kpXnBYcuNiA8E5DWkdv7rxfJLKQZWIlFRJkFYuy5AH9
 XDxLRQF1tRmla6BHzoifsXdvvQV3AFd3QdGAWvfX1s8UpuxR8siFl4ddHGLiCnxlyh+1
 d+6fsochz8qBYuonx3E0a4tQft9N9AtJBGYXAlbENPX2M+dL46XGL6rAec9RDVm7Ntag
 oKGuIvAFJz8aL8jSlLPQXF/BryZRlminnCEB6Jho64QKeK0MsZO3js7gUAnnA+GNfKRa
 /Aey3auaM7SacewCau6WzyVQTaKMSFwwLrJFU9l6kotwTaI/rnRz171vO4aYQS8REqCI
 RacQ==
X-Gm-Message-State: AO0yUKXSqeZO3FVobr3OuxWtkC36XWh6zkny6v04lq1I9pxlCHZ2J88A
 tmA9+U8xn+SYZRCUfp6Q73FqUJTEtEOKoZX6ph5iEI7YwdSTU6+XWrOdgHL2ZXZ1qNg7v+XfakI
 zWblyKq8p2s355JdxbUwAuZTf39Ky
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id
 j9-20020a05600c190900b003eb248fa140mr20913761wmq.6.1678360927395; 
 Thu, 09 Mar 2023 03:22:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8sm+8KaUtaTToC6ewzxor62agxQaZWhIHs+6czjysLnXbg5f9mG7vIV2yLxia1B+mTwIz1AA==
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id
 j9-20020a05600c190900b003eb248fa140mr20913724wmq.6.1678360927112; 
 Thu, 09 Mar 2023 03:22:07 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i3-20020a05600c354300b003ebff290a52sm2051380wmq.28.2023.03.09.03.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:22:06 -0800 (PST)
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
Subject: Re: [PATCH 08/22] drm/imx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-9-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-9-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:22:06 +0100
Message-ID: <87bkl2cgpt.fsf@minerva.mail-host-address-is-not-set>
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

