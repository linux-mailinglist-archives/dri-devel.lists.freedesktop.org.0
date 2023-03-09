Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2206B22AD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3158210E7E2;
	Thu,  9 Mar 2023 11:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE8E10E7E2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Mb36jRGuC/o/ac716W/VeetYSkISJ0LRdvXaBeIiBaVoNmsX6X+1EXv9Vv8dRfo7eIIqmr
 KCVCseyRgCwqi3mrqn1fC/DOx+7n1PZNw3SuQdEC5JebE7zc2P3gmXQekVmbm3dboIqpkE
 OQZbsLPkY7e6Faa6Q/GSAx3c9kKygxo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-0eT78EMnOCqXqU0VpOF3FQ-1; Thu, 09 Mar 2023 06:21:46 -0500
X-MC-Unique: 0eT78EMnOCqXqU0VpOF3FQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so644294wms.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360905;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=FICj3Jyv5Ml9hPjcHDyGXj+Uy71l6+fML9yAigpO5hU7ItstS3ADjIEsUIUNW2RjD/
 FEkuJVvU9lqO6MLAsB/oQfZMHMLNe+dubfmHavyM3X0aSic5DEniv+tNWt8rXC0+3FLO
 0VDm/aV+5Ph7y2WL8scM0Ufw+ynsHyh1z9dWGD45A48NuCyARFe5+OB3Um5ap5VXEW11
 Qd5CgJvC2hhqPBRm+WqS3EnLz//+I7hwrDLGvqPw0ggxD79w4ZA4bmvQFTys84wEnerz
 0O4Wbtikfr13KoYPEeQ0HhTWFpJ2EDjoFzFoMPP2Qqs/+7CmVEI7gYRA/0FtY71XknRu
 cvCg==
X-Gm-Message-State: AO0yUKWRQx5cBy/wXyjJskCvRxaQee090XbX9QBPnq5DVLMI61RASJVE
 BtTAIzg/KVYWEPB/H4lGmtAWlgP/Xa3FEL+QEVpZGTRIGe60atzycisEwBRv5XOlHx0x3HZj6Hk
 28N72zEMASSVqcQ3T193nJ/V9rVZY
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id
 r7-20020adfda47000000b002c9f4885f54mr12321064wrl.57.1678360905537; 
 Thu, 09 Mar 2023 03:21:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/T4C0dgvSGGMpJs8/32CGlr56CYDRn+YAtD8UDvYRDVE6ywdBnZAiSainv+9e2TUJLz767pg==
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id
 r7-20020adfda47000000b002c9f4885f54mr12321033wrl.57.1678360905258; 
 Thu, 09 Mar 2023 03:21:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d1-20020a5d4f81000000b002c54e26bca5sm17503473wru.49.2023.03.09.03.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:21:45 -0800 (PST)
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
Subject: Re: [PATCH 09/22] drm/kmb: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-10-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-10-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:21:44 +0100
Message-ID: <87edpycgqf.fsf@minerva.mail-host-address-is-not-set>
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

