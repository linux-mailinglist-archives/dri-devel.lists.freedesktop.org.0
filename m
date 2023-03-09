Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9866B229E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80E710E7E0;
	Thu,  9 Mar 2023 11:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED3610E7E0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=VcaBdZhCNdA2qk6UngItWJM2Zsy2DJgYqGVMFCWRvl2uWu5Gf6grEEm8MtDqgnEQOVVCSZ
 6lPELiORVZeOuFVO5ki1VzOQEEKPUqb0hmKe8AcxVHfoKFJFKu1elPmlfWzx8ZlnctBgds
 bD7pwk4/dRg+d/FRy30yDu9hm+zGeZc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-AZ3cgIalOgepclJI_VXWQQ-1; Thu, 09 Mar 2023 06:20:41 -0500
X-MC-Unique: AZ3cgIalOgepclJI_VXWQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso2252542wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360840;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=IEXuyATP9rrw7kvOvtlviHiHGE/It8VF7c2MxUZIJY6ClOdnE9QfgrE2Pym2PksbRp
 FLud0sfzuagDN9jTVmgaXw927gCUB3PRs8bVA/mR/OfAHV3bbZxJX6YoMkEh+SIvPoxc
 3WCION8rHmU89R4DXQORfRqq0rJ3YPLl0hWmheKFVtPGvdI7vv6JOWnmVWALqa8tUdNE
 254yUZIivrFEq5/02rM/iT2JQNGcWF3E516kEk9d9uJRWN4Q9lctM+Y51cXc+WpIa6S+
 CpAppyo1gAWks3wGq5RgihAWuJ2dNqHJ3cIAvAojmM4v+fYMOTS0LnV4qpDtA/d/c5WC
 hqVQ==
X-Gm-Message-State: AO0yUKVy5rFfuM0SS/LOHShrQurZDmTa8p5b4xOaa90MvY5tJp94d8MH
 K4fOmwMEslL+lZVP0NhlHvO32M7kxA9pvWpYvgYueKNzuaWbtdP+xP7h/NkXNjHqJmCFgxyqSb0
 +qkv8v5Yn2A13uovhsUZ1aBr7UgNf
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id
 v9-20020a05600c444900b003dfe659f9d9mr17924810wmn.34.1678360840100; 
 Thu, 09 Mar 2023 03:20:40 -0800 (PST)
X-Google-Smtp-Source: AK7set90uCM0Kw514Efx0RC1JOWrOFPoY3H9ZtCG8DZJ7CZ4XdZwaIBFGLtcMSgQBx3eBGbTb1Y4bA==
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id
 v9-20020a05600c444900b003dfe659f9d9mr17924778wmn.34.1678360839923; 
 Thu, 09 Mar 2023 03:20:39 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az5-20020a05600c600500b003eaf666cbe0sm2386747wmb.27.2023.03.09.03.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:20:39 -0800 (PST)
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
Subject: Re: [PATCH 06/22] drm/fsl-dcu: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-7-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-7-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:39 +0100
Message-ID: <87mt4mcgs8.fsf@minerva.mail-host-address-is-not-set>
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

