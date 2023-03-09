Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA76B22E8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8B010E7EE;
	Thu,  9 Mar 2023 11:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DBF10E7ED
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=HhBx59K5GRUTCv/uIxtSHIcPIHuPCFoJ/9xwZQxosXBM2eBadYSGK7ubJ2JFpFsxZnHpq3
 JXjd4HemQspSgFZvSbgQQR71XXXwt3U4VEKX40S/nABPhbnE7zc0zTJIn6liK4/UrtY5U6
 KgX/Hg+CZlIln7pPJQfZTUH2AGuwwQg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-VVE20r0YM5iLPuOb7UqA9w-1; Thu, 09 Mar 2023 06:27:15 -0500
X-MC-Unique: VVE20r0YM5iLPuOb7UqA9w-1
Received: by mail-wm1-f69.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so544063wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361234;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=CrNqXqHTWUBT+Ru2obHYNzd5AebpPVztXJs/UjJrNZ8uNqlqd3AwIbII+h/z4ZZxuy
 y6kfU0MNLyKAr8uiRclPa7VlKSQPjgrWysPr3fS70yqQJSDNxLB0tD2cv13WdMV6VXuU
 GOmKt0uyjp9a6tLg2zw+Rk+vp1rSRxTKdxVsNTICfFauHcTPs/PXf9GNA9+4c1803vlI
 o5HtpjoYLS8vDnII9vSwUjpHShoetrP4fHzJSjJs85WEhCoh1qtK2zqeriok+ARIfCpR
 nF8n+cdgrPVE9Bla9oKdrv4v3S1Gi9hqsyH4+08XlAhyIKBqsqTHWFXJgq4e30YAFswQ
 5vBA==
X-Gm-Message-State: AO0yUKWbsZvSiSU3L8nGw+cTMPcvI7RbqqNi1ZFb4onVbGl2DRAomfTO
 ogFRPClEVjV+196yeJcu8y1YxATNlcNFrOpeMDXA51mcrI07FuYr3Ql7FtFVmvUxMu3Zkr5Oxxk
 8SGW9KPfw+i3w+/Koz/6BAtUXrjMa
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id
 a2-20020adfeec2000000b002c58d0675c2mr16142985wrp.35.1678361233891; 
 Thu, 09 Mar 2023 03:27:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8ARdxfkcrK23hiLLxHMM+1xly+a483wuNbL82OhsV1hVbBQRT5MxfXfizo4EESj/6UVgIYTA==
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id
 a2-20020adfeec2000000b002c58d0675c2mr16142965wrp.35.1678361233574; 
 Thu, 09 Mar 2023 03:27:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z16-20020adfdf90000000b002c707785da4sm17592422wrl.107.2023.03.09.03.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:27:13 -0800 (PST)
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
Subject: Re: [PATCH 17/22] drm/tidss: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-18-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-18-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:12 +0100
Message-ID: <87jzzq6u7j.fsf@minerva.mail-host-address-is-not-set>
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

