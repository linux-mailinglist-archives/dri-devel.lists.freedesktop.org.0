Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B09836B2295
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE2F10E7DD;
	Thu,  9 Mar 2023 11:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097B310E7DD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=LnU2x/IqqKCDqK4XrlpxL32vicetj9esoRSV22lHIzA5oy4CwYOc5AWayknS5AOPPfN+DS
 zmYkhO8Yd4FyyzPtYmWWd6Zy5Zj6yi9cYn4W8/y6Kr9+AA6Dyv2palO2TZx192DSVhktcy
 r/ryRouww/NiC16O8AAeT9zGoirO7dk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-okGD7-riNmubfH44nBEUJg-1; Thu, 09 Mar 2023 06:20:04 -0500
X-MC-Unique: okGD7-riNmubfH44nBEUJg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so645225wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360803;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=vijsTE8TaxSn7SEdqUugIG4VnBMkPcsxni++ibtODdcn5DEE+xbjXSMETCGHSV9dI5
 8HxGEM9gJCC/E84GWphRASIYODadnSC4+oooIx7ohSLtN54ajoAinfFHuEhA0cGZWu9L
 +CoPOJ7sxSSnQ524L2w7khezc9qt1FSHGIlUnDNQEjUGQ9b8RW7/d4v+26yiSsZkF02J
 R0rv0SXbuO2/JrTsPPuO3TIMwlQSQTlRxUXyLbjO3T/h/XiXut16oQCMk6YlI2VEmQNn
 jA7WxllT5rjgjS4Mbm0fP55XgoeuUo8g6eCKgaaOHgOuQtpR5yVQvLmxc+SDhSSTldtx
 rQag==
X-Gm-Message-State: AO0yUKU++eTLvwHmGuO2O1uqZDNEWQBBUKOFle6Dk2TrLpzC2HLcTJ/p
 SKcm494nf9lvckIpW0ibghMwh+98zmPIX875AAuFbNyQuW134HVPUi8L6WuJanRJjPNCS3Ax2If
 yc1euqoUJeG2OBQMDfdxUwyzgzvc0
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id
 u8-20020a05600c19c800b003e10bfcd16emr19563109wmq.39.1678360803684; 
 Thu, 09 Mar 2023 03:20:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/qnVD0YYOZOg0gATaJ95G2PynE58HCE1Dk3DOhH1ATAU++l0OCrumBkXbrdoQMrJSTJfkHMQ==
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id
 u8-20020a05600c19c800b003e10bfcd16emr19563083wmq.39.1678360803370; 
 Thu, 09 Mar 2023 03:20:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t20-20020a0560001a5400b002c54f4d0f71sm18023382wry.38.2023.03.09.03.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:20:03 -0800 (PST)
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
Subject: Re: [PATCH 04/22] drm/aspeed: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-5-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-5-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:01 +0100
Message-ID: <87sfeecgta.fsf@minerva.mail-host-address-is-not-set>
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

