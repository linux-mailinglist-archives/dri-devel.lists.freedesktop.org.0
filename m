Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC56B2288
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4AE10E162;
	Thu,  9 Mar 2023 11:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABCB10E162
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Q1AOpfNjOxvAZETLXJ3cfQNQDRtqZl5XqWjuhR9Ks4YTtlnDz9eoHhtfM3H4QOpF67nuoc
 ualrTISMJpGPYc4U/J782WtzMxZbPPwiYNgM+hZocunVuj155Gf9QqD/4NuvicVITIJSby
 rnoH6F1bFB6Z7XOZgYRy2YATEK8wee0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-i6Ai8zrGNV2olcmk35LF7A-1; Thu, 09 Mar 2023 06:18:11 -0500
X-MC-Unique: i6Ai8zrGNV2olcmk35LF7A-1
Received: by mail-wm1-f72.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso536125wmi.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360690;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=SNHASQxD3ue251zHBlEX2kFSBxxuTstLM08+xIcNQZ3rMoNd3fa7UNoVwoLMd2mF6a
 jULWz4WOTc9v+tPCZFGK9IDGn9TkcurJEq81hXhmYC3WVJs9SzxXUxW2Oe0Sa0enTWpB
 H4HCx4rYTQz6CIuLBgNPuGeVgSjL2fiWjvmZH8loz/1KQVvsgzgD7rCMDLbMynH50GIH
 doCxReQy0YpDlBdQpd876voSHyugWoC6VVh88baE6T339I8e/2045ArwNIz3qOHn6iKL
 ZxLLm7Ob5ubiiVWPSdWbZpDW3rqgrZh++jfa1GljLvsv+QSLjRjYcTuqS4nFq6lvO/yp
 OskA==
X-Gm-Message-State: AO0yUKWo2t7KLhX/oMj/5MgqbFxQoFAxihtkkYbILyXuOeFWo1oEZGvS
 3VQsmfXopegjPN6DN5l0cTRQJZNdOiUAFMbFB6h+fLLZUKLlrZQYoTtQTYdk9OFkvGTIBs7Wtzo
 ndpI70BHU9+kAxaOBH8eVDwOkpzdA
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id
 r11-20020a05600c458b00b003ead620570amr19256919wmo.38.1678360690490; 
 Thu, 09 Mar 2023 03:18:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8nz/b/mv461MJo6uCh18V+HWYnANd/m5ucTuXO+pUDMtWMOWVVOePuNeDpPXiYp2Mt7j7R+w==
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id
 r11-20020a05600c458b00b003ead620570amr19256887wmo.38.1678360690262; 
 Thu, 09 Mar 2023 03:18:10 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c229000b003eb2e33f327sm4775721wmf.2.2023.03.09.03.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:18:10 -0800 (PST)
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
Subject: Re: [PATCH 03/22] arm/malidp: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-4-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-4-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:18:09 +0100
Message-ID: <87v8jacgwe.fsf@minerva.mail-host-address-is-not-set>
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

