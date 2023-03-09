Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1654A6B22CD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEDE10E173;
	Thu,  9 Mar 2023 11:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C96710E7E7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=G2zxcM5XFvPOogQgAGhDYLPFj6iK2DQb/QIqJxf2mAsgto0qflhs0OoQ0IXuT/oLwOIPUt
 1bAsgPyflJLaEkqonW6oY7WfG/sL6b87tQh5XOm6ZG1u5QjUopYqJCJDkbc6w6jH/rh2KN
 o9UYHuz23jYsj4eC4+yq//yWych3usE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-cSANKg04Maa6fWqFQB4bFg-1; Thu, 09 Mar 2023 06:25:52 -0500
X-MC-Unique: cSANKg04Maa6fWqFQB4bFg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d14-20020adfa34e000000b002bfc062eaa8so352558wrb.20
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361151;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=vjJDwwn731PXrxfaSjGNX8NMdAan/D6mH7/eVYojhJ+omVixl/4/p2J7C4+DXSShLn
 bPum79/g3qrcgX8SxSFAR8wSXGGArk086tGJe4GyvpLjqr87YQUJV72jCWtG3NrI2iDN
 SM/gGmUkffYVGSDstyvDePaKne5f4aA8IQdm36Vg86LNd8gztMxZ0vJZbGwe/XVjcV5A
 sRKe0tQKQRwSvXqSQqmrjOEfaM8hDQ+ALLz/wyjJgMENwe42XC6ncpwogkvFf81Za90W
 NC5dT1zg0txvWg2bL6rVeZDs3s2CA7BmVRsFkhjeeEcY2IspOn4zTb+AopK/HguQKrf6
 2TLg==
X-Gm-Message-State: AO0yUKWu5qqIYBGrlER9sLV7E/XrPOw57hsR+rSepu3S19ojXmOtN+gh
 w3scD24fJH2Yrs6F8N0Bn3cUkx3Uq3gtyYMBEUbIYzXiYJElsoIRKTJWGuGfQ/3HFE0wxsZ9GWz
 m6vvOdRT+7U3OLiTiB774tmP+AxB7
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id
 t20-20020a0560001a5400b002ca6cb1c9c5mr14672890wry.30.1678361151280; 
 Thu, 09 Mar 2023 03:25:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+fKWERQDzcgswyQf9IdMUANe41W2TE3VA84WcXGdem8/aR/1UT8t++iE4upU8MSOqw2VB+mg==
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id
 t20-20020a0560001a5400b002ca6cb1c9c5mr14672854wry.30.1678361151005; 
 Thu, 09 Mar 2023 03:25:51 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d40c3000000b002ce37d2464csm13808052wrq.83.2023.03.09.03.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:25:50 -0800 (PST)
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
Subject: Re: [PATCH 13/22] drm/mxsfb: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-14-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-14-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:25:50 +0100
Message-ID: <87v8ja6u9t.fsf@minerva.mail-host-address-is-not-set>
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

