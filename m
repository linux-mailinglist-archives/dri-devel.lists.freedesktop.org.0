Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E066B22E3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EEF10E7EC;
	Thu,  9 Mar 2023 11:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F1D10E7EC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=d0N6c/UwBgEz/bFY0nRuZ9Q8tZF9SdSHeNfw6HgDIBTVHGMidBjSuCms2/LH9vuR3KDO9p
 +Biqhn7k0D+f6ZjZedwhc6sRNhOCyoPh3UiaUhRQjJsl5QDryS5DAR6dHKO3EOJs2oPIyg
 ZGaRkmXIz6U5lVwolcKnyWgVT6X0zY0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-25GMR479MjyrBszB2CyT4g-1; Thu, 09 Mar 2023 06:26:56 -0500
X-MC-Unique: 25GMR479MjyrBszB2CyT4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so2251289wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361215;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=5rPjHmQqBiuRxBvDjUoB3UXyPWxO+1rkYUnwod0h3zZ99+LoLa/ZmXrqx26C0m4Aj/
 f/mkvqjlqR+JxygYdouJ95FUKwzcJUjirwTaE3BijFXPI64eUtRuzu+q2oFK7kBpTgEM
 FlQnDlrRvIyBC/2NiCy3LRutW/4VcFUN3lTypq5SS36bnnMRS8Vz8ECxoN8vuR6y5ueL
 kA/NM1lBsx3h7cEIQvIurvC7IxfSsLmZj1Jn3xLeSiaOyxVFRhDJQNMW9tCQMo0qnc6d
 LRBGb3jb4caXfoMPIPZy62id9YhauzzTtM5mH15w+0G7ssx70R+2rGxxwdW3gORMz/hU
 aomg==
X-Gm-Message-State: AO0yUKWZntPcvjLHFq3x/4E2l5tLC86DIB7Oq5wWAYfUVy4AVjyvaxr2
 +g7VmxE+SH2/kbEk/s11YbBotVi5RYG8Tl4abLxi8rIXt4d1lB5oaEPUPGEOaydc7nZREedLKXp
 vDw5iJ3cwWbKKhrRMOoUD4+YZU74w
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id
 u18-20020a05600c19d200b003e795bae1c7mr19013912wmq.32.1678361214954; 
 Thu, 09 Mar 2023 03:26:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+ootXMCqEk3gOIZKrqE6NGC6vCRZefQop/jJ1mx2KmfjNSeFee8+geTPWhVxDzmhIrEN6nCQ==
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id
 u18-20020a05600c19d200b003e795bae1c7mr19013869wmq.32.1678361214645; 
 Thu, 09 Mar 2023 03:26:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5-20020a05600c230500b003db01178b62sm2249369wmo.40.2023.03.09.03.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:26:54 -0800 (PST)
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
Subject: Re: [PATCH 16/22] drm/sun4i: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-17-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-17-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:53 +0100
Message-ID: <87mt4m6u82.fsf@minerva.mail-host-address-is-not-set>
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

