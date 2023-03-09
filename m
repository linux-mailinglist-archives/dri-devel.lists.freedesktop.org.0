Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3166B22C4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FB910E7E8;
	Thu,  9 Mar 2023 11:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CBC10E7E8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Je2CZyGuW41jE5Wzc6LKq8bk/71VIENRL2Iv+q1jbxdatNNYwfggHmo+B4b5wwF9oIRJON
 1vbwsOCxv8d0YNt9dT+4/Emp8ehOGqOG+iFdxUKjFd4EnxjvsniKCPqCqkvtKkL6EYttBi
 fdiyrAl8AbFy1meOHFsrAa35yUjhH8c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-SoBwgUdHOWWoUvmFf8GcMQ-1; Thu, 09 Mar 2023 06:24:26 -0500
X-MC-Unique: SoBwgUdHOWWoUvmFf8GcMQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l5-20020a5d6745000000b002c91cb49949so347744wrw.14
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361065;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=dXzMKGK/EvWrDE91Nl+2mYBjfcf9hAks9Qn/yU738q7WGLzpKBJ+t3XGeA0NvcagAK
 oagK5reUpjDrwtnvUZvcuYPsQ7J9XXCygab7TliQFrDGb3uyeMw8/WKIGypC9G/byEXR
 jyIYC/VKpP//iXekneIn/0m7YmeT6pXO4ggmqGMwfLYDqlV7cYoZZglSX+p/UVt7ZYXz
 9mEmsuXOFOUNa2rDtulKqTh9abG8pBWACbCCHBK7JmT7llr8uT4RiK8QYrpGS5sP1on8
 DbPil6/26kqfDLQqiSpYda7ZPUvcuSlY1Od4qzT4n6jB1Z4mhJIWaFhmW2HJ9BAs07Me
 dCgA==
X-Gm-Message-State: AO0yUKV6JQavfXpuLBw9n7YENp0LepSsFqxKaBWg8owt0t78zhvHtQLu
 FazBezBKlP6VjEUVQ18HGbKDoGGZ5Kyqh4PdtjsvZjgvYF3nEsXAN3r8O80t6nlu6FBWT5d6dAG
 t6K8k6Rv7C5xdHmOSYigZv/zVVggm
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id
 s19-20020a05600c45d300b003e7cee40f8amr19365846wmo.29.1678361065651; 
 Thu, 09 Mar 2023 03:24:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9lVCuiT3oH2S4c0dL4PFGWn3m73Ldrm4xd1nwgxerYQstdGiySSUAK65ix4kHFEogJnnnnZQ==
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id
 s19-20020a05600c45d300b003e7cee40f8amr19365828wmo.29.1678361065371; 
 Thu, 09 Mar 2023 03:24:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c35c100b003dfe5190376sm2436712wmq.35.2023.03.09.03.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:24:25 -0800 (PST)
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
Subject: Re: [PATCH 12/22] drm/mxsfb/lcdif: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-13-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-13-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:24:24 +0100
Message-ID: <87356ecglz.fsf@minerva.mail-host-address-is-not-set>
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

