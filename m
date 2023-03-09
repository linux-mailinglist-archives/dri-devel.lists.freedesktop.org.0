Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0856B22A8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ACD10E7E3;
	Thu,  9 Mar 2023 11:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A34F10E7E3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=CU40T/dhvBztNwrsVnlRl1wprx1SK03OK+kO20wyYBCfHjLSrOzvCMrcJr8eMnaabGSwIh
 rqf/haMMXQc/ahc1CEeEffYvx33ny7wNJXLmUDu8XDDt1OlIiAdOI799V1fy5g+wAOqDNL
 XtBiep6tjUK7UqV/VT5k/GhgUf8UOGU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-ZmdrhDFoM8eV1C0Vta-UQQ-1; Thu, 09 Mar 2023 06:21:24 -0500
X-MC-Unique: ZmdrhDFoM8eV1C0Vta-UQQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 7-20020a5d47a7000000b002be0eb97f4fso345249wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360883;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=enLnCczv/7tz1Hy8yzaeTphdrOVzqFwHLRwdyF+7GSFmcl4wBdxFrUCllmrpL+7ML+
 H7EN3kDmnSh8oZ9FDfY628ZzNQlQMAJ0E7pmnLDPOUnGjaMT/lKRyy6Hr4MbsSY6Hjx9
 8a1naCCR9vUb3Yeoe7CLX6mffA2PpCTisaVf2vMxTTeDxEl2n06fcdTkh0DvoAH67QOu
 Jd0k0vg22PCO2bYZ5vfBshI8TqSXO4O4A7MXWRZ8ndUwOh8OtU/ujQRRpR2kcCot3A6l
 5IxTM7YJSQof5qX4wyOH5+MgoOdipJMN3IDqUQIZn7oBGs7wvK1YEaiO/2CR+bBBsNHT
 jl2Q==
X-Gm-Message-State: AO0yUKVGhvyYJNlQVglX2O7bMqCV75p/458UXV/XRSyTFl9dxLXD63zd
 sWT/e4iT61ve42IMzcykxpqPDCozuJZv/rDFWd36MSuON14RjXVLIywEW53mA+oGGdIV5Ab9edE
 +Yz2295f0PkO8LoucMcqvLpNzHwH3
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id
 u15-20020a05600c19cf00b003e7772d22demr18809451wmq.30.1678360883235; 
 Thu, 09 Mar 2023 03:21:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9QvIelUa3ZPRMnnDZU4wSkpr+jKhTz8vzz9MlATkeg82OLoMst/ctfKDlY/kc1tAF7ljMTyg==
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id
 u15-20020a05600c19cf00b003e7772d22demr18809404wmq.30.1678360882944; 
 Thu, 09 Mar 2023 03:21:22 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bca50000000b003eb5a0873e0sm2237300wml.39.2023.03.09.03.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:21:22 -0800 (PST)
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
Date: Thu, 09 Mar 2023 12:21:22 +0100
Message-ID: <87h6uucgr1.fsf@minerva.mail-host-address-is-not-set>
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

