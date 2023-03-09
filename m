Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AEF6B229A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59E510E174;
	Thu,  9 Mar 2023 11:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E66210E7E0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=d1j71K7wfOiFcBlHogpxmlMQtkDBn+laXr/H/G+Ik19Du//9HJVuQLYxE4T0XyLQsdunRK
 p4XNZea43wFcmre2CnFmBK+PD9tJ4RAhAPv1vrYHRxd5Gtut38IuNETv6I3qmXUKwpgB+s
 zKB1OrHYCWHnW7my++RYp3Y6W6OTaw0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-RPB_LFg0PWexTLkom1cUnA-1; Thu, 09 Mar 2023 06:20:26 -0500
X-MC-Unique: RPB_LFg0PWexTLkom1cUnA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so2242057wma.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360825;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=twEp21AD5SFhH6Q35sMH1cTP5mS/4e2aeAaQpZMn4c/1x5RqHyEBBPdr7SSliSXsvi
 /yJ6EP0WlBJZspJB0Znr8OPa8g6SNASpne8cKhAIiClYHvDASlC0znq7VpuIsHzW9FaF
 hahXqOV+yu0Wl/fn4GKXxt4B32oV0CoHBXoSor6L2Lsd/HWrueSPqNsxGZCuTDcDzEqo
 o1UPv60hDTAHcGY/SI2w9M3UrCk16EWpZhuK9V1u/kl+JJaFLijGQiXSyurmbgFVa4BM
 5BLzCAVUREKCno7/fQe2bmKX/UkdjNHriHW1iJHTh9WJRtlR+RkbE8Gw3cfRr5xMIf2H
 GL8w==
X-Gm-Message-State: AO0yUKXyIZr5BzpYBF9WI8VAjNZYR/ZQwlPRw8xz29N0Ky/teT6A3IDL
 gFlpHurK0ZzlnmMY463v+PSryRI3+GzcOv0xJ/vnWWkBZSOI50PjD2X+sJnIdNvDkINR6Hzqqmb
 L7vGcAb83ojTR9eczRU5DBwTFspPD
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id
 c17-20020adfe711000000b002c740f6d7femr14224819wrm.64.1678360825569; 
 Thu, 09 Mar 2023 03:20:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9k96PNTBUz0TEByIG7gapEmsch0cL8AOD17b63GFBK4F6QUKC1zqFtEdtv5cA4DKM8r6l/1w==
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id
 c17-20020adfe711000000b002c740f6d7femr14224778wrm.64.1678360825289; 
 Thu, 09 Mar 2023 03:20:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w12-20020a5d608c000000b002c552c6c8c2sm17742706wrt.87.2023.03.09.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:20:25 -0800 (PST)
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
Subject: Re: [PATCH 05/22] drm/atmel-hlcdc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-6-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-6-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:24 +0100
Message-ID: <87pm9icgsn.fsf@minerva.mail-host-address-is-not-set>
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

