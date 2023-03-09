Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463046B2280
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45C310E0DA;
	Thu,  9 Mar 2023 11:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D0310E0DA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=KFI5NolLW00M30XYJxkQ4MIHgLq0upzBFWGrVN73sW1eARaypBeC/FuDewBCvaVTJctFoq
 iIEqDyM+fu03ea/H2UFE5LU+JNir/dQlYcXI9pEKpD+V8yEto9nPEZstTrMkLCPOFg16Bf
 eJHZuZApcuEiBi9juOPLHameLIR0iU8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-CBQLMJq-O-WcoT7KawrQ4w-1; Thu, 09 Mar 2023 06:17:49 -0500
X-MC-Unique: CBQLMJq-O-WcoT7KawrQ4w-1
Received: by mail-wr1-f69.google.com with SMTP id
 y11-20020a056000168b00b002ce179d1b90so346376wrd.23
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360669;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=OgonWNWycYUKVKagH/ciNebsHxfEUukC8nRNClNAqFfn+GVX+gsrtORxFlDe336FzB
 JfH/zUiXodwLbkJMi1Bd0p0CjPWyZHFLvUw1gsphwrd/S+FT9R68n+d9INkLHFJbGV2+
 mQ8jaN6ktyG6GDwqra53cQozn0ArVYcjqdvcapm7Yblgzn/r6ofjb07RqLGBHqrg1Nzf
 Dxo4d5LYlf04kl3UufKD4aDhIzQuJSESFuXudLsTKbNue6K7bCA//QtzVXyUegA2UOD+
 BMMGtIwI907FHcTFi9DTjoe92z8BmlmO5gTIPraOgKEzCVXoZ0rfRTTNCekEKTZBQ0nu
 16cA==
X-Gm-Message-State: AO0yUKWvXWFxz8nDLBQGABc54aKpoPus6xUE/7gljb9A0olotCsLcZT8
 cKn60vkiwjtX0FmcBZfL4KhY/6q/SqLrLJ7cuxGzZpFdLI4mDLgHwR1FkrzW0MZ4m4DcaOwQggW
 EvS5xobyCtPqrPv1mCdxTBdA4Y4yc
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id
 o13-20020a5d670d000000b002c713197b1dmr13606688wru.39.1678360668799; 
 Thu, 09 Mar 2023 03:17:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8t7W3VVjilkedn2prHPhya2P0ttMZiu2dHkADuEES7J7gfekac/bMcyXv4f/qMKVji9jryrA==
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id
 o13-20020a5d670d000000b002c713197b1dmr13606665wru.39.1678360668526; 
 Thu, 09 Mar 2023 03:17:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c12-20020a5d63cc000000b002c5801aa9b0sm17711159wrw.40.2023.03.09.03.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:17:48 -0800 (PST)
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
Subject: Re: [PATCH 02/22] arm/hdlcd: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-3-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-3-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:17:47 +0100
Message-ID: <87y1o6cgx0.fsf@minerva.mail-host-address-is-not-set>
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

