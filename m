Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265D6B22EE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3138B10E7EB;
	Thu,  9 Mar 2023 11:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705610E7EB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Tg8tHneVRsd+W+BnvY/VHtX2lYyoBX4SgPnIf5W+ECT9GcrnsskFJ2yQCAdIIkdfKFeePc
 yReHFHMgEc4RIIHK89iYO4oR1/QeiVL4FPcQL34cpySYL8glQGD7a1aq3FlyFZeT+zOYcc
 y4n28h6SrRTOqcObSbTHR3aFl7991xM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-qXvro84vMYmF2GcLGgKceg-1; Thu, 09 Mar 2023 06:27:34 -0500
X-MC-Unique: qXvro84vMYmF2GcLGgKceg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo546284wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361253;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=EqtY56PyUUjw+J9NpcWabJEv8cdk6FN7p3jJ+VCM9FrRg48MNQaol0Z3wtYkzwZd2e
 eHgyzLAElxdHgqJsst+GjalaSsjh3Zo4Fr8JCqO6Bwzrr3THqOH/gQep0r8EroJOygj6
 tQy5HU75gTboJ1Cq7/WEVNmtFQX8XMdPehX+5Eg2/6iqxCeH7KzuKfWHAyaEZLSki8bR
 XZ0XaEt5rD9y6ioktCU4ID/XuB2jLel5q0yiXT8osby3l3Qsx6/EXwLcF/FJZaG8HOT/
 QOdcNu/c1bVhx16mUo8hJp9HAKYvUAEultxro6WfuvZ6a4kAupeANFbNhYeXzsBHlXNB
 OK2w==
X-Gm-Message-State: AO0yUKWGn6DzZvDRpVZTpdKSK7ssFwt48vahPp8JUwdTYspGEkhSSGxY
 wi9momZl535gOXzAUNmdRgieiPfD9zMqeGqzGH8umx5lz/h1zgvAmFGS3ds1JzsBnPbZcrQhR7O
 CHgfepzwzQNIAd5ad16EI7Q/Ob7v3
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id
 l22-20020a05600c1d1600b003df9858c030mr18328991wms.5.1678361253081; 
 Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9NkiNNv96tpY+ICOstwyMw+enkMfLxXSTreTdhPg1jdkeOeFAU5LDWK20u9ucio+cg3Xhjrg==
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id
 l22-20020a05600c1d1600b003df9858c030mr18328975wms.5.1678361252754; 
 Thu, 09 Mar 2023 03:27:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l6-20020a1c7906000000b003e2052bad94sm2217733wme.33.2023.03.09.03.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:27:32 -0800 (PST)
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
Subject: Re: [PATCH 18/22] drm/tilcdc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-19-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-19-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:31 +0100
Message-ID: <87h6uu6u70.fsf@minerva.mail-host-address-is-not-set>
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

