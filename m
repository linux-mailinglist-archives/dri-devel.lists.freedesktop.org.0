Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24106B22D8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD0C10E7E9;
	Thu,  9 Mar 2023 11:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1B110E7E9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=dyNhlerx4KGeQzPVLdJY9VxEpDzCTyrV4VJYcaj79/bXeb17BW28rHrFQeZrrULp0wu0Nk
 Yqg+k0I23aVXEDWC6CXPOgHW4gtwm+aen/P3xovNsKwOt/Xrt2bl3CEELAYS29f9k66XjV
 UsP8oh8wPGAH/qrupd7RhTP5rXhqPbU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-BmGbTBmhPEWPI8pWlD5u9A-1; Thu, 09 Mar 2023 06:26:38 -0500
X-MC-Unique: BmGbTBmhPEWPI8pWlD5u9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 x3-20020a5d6503000000b002c8c421fdfaso350980wru.15
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361197;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=EeUlMjN/I2V0G/9KQAGXg5/qcKoSh1GmTtS+4b1DrpZm8SbPZBRjYssGVmWR4Z2g8s
 temIymr57F2sE6h2FPsArk8KcWfUPioF69YxcKETnljwXLdh7DXdEdy/qqsp11H5VFie
 bNcsPsCqTXzr4BcgWlKnqlBw9rGcIJY9220eofa7oi7/me96CgKrQmPF1vs9zNvc1wh+
 7fqEpTrJeiYG9ZcTCjn8C4WZ3gD7fO3fsDs2pZzdMyi/iPjgjJv5453DSBaOh3LpZRQC
 wY3C34iqO2oxWddOvcp34aCUpkhFOgre7xlVJnzd9dC/f+bmEl/0JqAJhLxmH5afv/SL
 S3FQ==
X-Gm-Message-State: AO0yUKWnsKVZL+ltfeWzwskbuZyMP8GTH48Hy1MNxzZnz2nDnR9P11nv
 UQxGdGa4yNDjm6HqqQx+DNGENiY7XxiTMZiOStAzHJ/yxNAgyu3oCCjRw0mIdYtcB8mIuWI73sS
 1IVTvxZ3AP2bgzJ/X2Zv4nRy8tGG4
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id
 u15-20020a05600c19cf00b003db05f153a5mr19369389wmq.20.1678361197623; 
 Thu, 09 Mar 2023 03:26:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+RyBjxyYc/phvqksZd0yr2bTO+U8qhrE/l56ozt/Hpw5EwIkObMj058GJMfnxZhhD8JebzIw==
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id
 u15-20020a05600c19cf00b003db05f153a5mr19369354wmq.20.1678361197403; 
 Thu, 09 Mar 2023 03:26:37 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c1c9700b003e21f01c426sm2647711wms.9.2023.03.09.03.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:26:37 -0800 (PST)
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
Subject: Re: [PATCH 15/22] drm/stm: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-16-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-16-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:36 +0100
Message-ID: <87pm9i6u8j.fsf@minerva.mail-host-address-is-not-set>
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

