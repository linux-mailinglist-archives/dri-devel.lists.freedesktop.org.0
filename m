Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51606B22F9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B235210E7EF;
	Thu,  9 Mar 2023 11:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D700210E7EF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=byuRJFsgwIbmwDoClgXjpGIRY7fzH9iO0cMStxilik1zPmdx7J0FLlIb5ch1zowP9Qs8Md
 1hQ+angNnLqqW5CPIQgTMWFQusJw3av0PZp3pMUI6QgOcylvGMWAprKL7ybDnp6aBLIdhS
 n7iYiQPDhJHLsFHs9yn2X4AobuDRLBQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-H8fNRs7jPQGm54qPznARNA-1; Thu, 09 Mar 2023 06:28:28 -0500
X-MC-Unique: H8fNRs7jPQGm54qPznARNA-1
Received: by mail-wr1-f72.google.com with SMTP id
 7-20020a5d47a7000000b002be0eb97f4fso349130wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361308;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=DR+igCk8p+StxBOqjwImFMLkn2Q5bR7CbYeyZBFm71xYDaKDD9pHEJ9z98MI7a/Lcy
 MiADJdOGpeIeYBufqTOBeOgGF1CHhy9/efIrrEDJ2SE0DBeB1aVjkRm62G1yeuDht9QF
 3NDq4c3nBhPFparK8i/VK5x8PXjfJ4nqzXoG1FKgnwe/NkSyJ5cxsQ25APWd5NBmrW5t
 ExZtY1uQfiGOW++qymbBPF5MfdC3SnNyNkvUrgGie7Ch5vndaTX9WU/rHzT2WwHsY7R+
 pimdIegtRAeabVMkqBOik8vyFLOszCMz5InxAbePYhOktKazKG9N7zrx/VATzudcX0U6
 0Kxg==
X-Gm-Message-State: AO0yUKVJnXoFMfWk7EmQr4JnOPS+fafdPwMhvjL0l9Cybyu9u394iDX6
 qEJt/ZbbN79YPiD5lY70nhpB7mE2vETKyUnFPWDjOtxAgTabwmsOas85Rz+8+cvZAFTXOprqt7Z
 G839L4arkUMTpqL7/4LTwYq7K37W0
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id
 z11-20020adfe54b000000b002ce7b1462famr5641249wrm.18.1678361307865; 
 Thu, 09 Mar 2023 03:28:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9maKowzBLXhrmVUURVySuRkGf+S+tkdt6mfteqqV00Jt+aM76M3w51SKUbdQy9Rrz6LZ2GlQ==
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id
 z11-20020adfe54b000000b002ce7b1462famr5641233wrm.18.1678361307645; 
 Thu, 09 Mar 2023 03:28:27 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003eb68bb61c8sm2498550wmo.3.2023.03.09.03.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:28:27 -0800 (PST)
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
Subject: Re: [PATCH 20/22] drm/tve200: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-21-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:26 +0100
Message-ID: <87bkl26u5h.fsf@minerva.mail-host-address-is-not-set>
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

