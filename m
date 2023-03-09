Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0E6B22BF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660DD10E7E6;
	Thu,  9 Mar 2023 11:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9F410E7E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=RchviBk9BaJnOhNnVKFVpd9CCx1Z6McWsVQIkpIYmuFjfpkK5H00q/ga26aFn9WpZQYxid
 zU8U+U6Im0rFb2LUOL1fzaeuORo21Hr8v5JpWrb6i7E8VcLIRUHgmSIZveT3+XATXxSNRi
 KN/2RTAIrzWjat81XrcVJAWOk0UK6sQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-5bUYt5osOruSUS7ALYWlmg-1; Thu, 09 Mar 2023 06:23:47 -0500
X-MC-Unique: 5bUYt5osOruSUS7ALYWlmg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so543317wmk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361026;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=e93syV0VKewmipQ93OxHwlrgtWOV1O512hLqs9FnfMSmiJeESMQe6ymtnm6ckiZeuk
 vDQ61DMv62OydvB1+JEY/dqgIOZWM1PAg+thKlFFS4HQ9SKZsPArkcgC9RJv58xRU1UL
 HcHcrT5y4vKlgzwNV1xEW4JukqEk9JD8k/qLHopZY0tUJ2WG4SLLa0wIQk5H5kBeyiAc
 9ohN2hQQCenAzXZWt1WzVpMmYcnHZOjee75MU9LrromlTaiNpAo51cTKShxTu3de/tc/
 bONg4y1atW4fX78zBMdKk+q0K9e96xVfXBtYKI5pTKQKlxeTu840Eq+e+YZWY4JCYouk
 PsnA==
X-Gm-Message-State: AO0yUKVPuQ/qSNne+zTbTMXz/tP46PCfx3z+dXF1JiqLlynZYk+29cKC
 p8CDFFpCS8b6BFe3jc6rIyZWBYGoqo5+Hy6wwi2jevgPplXehK9aHeZ6lyxDEi4nVsQ4TBXbZ61
 rpQhYVYp1dPFLEECeTTHfT8+2LwI+
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id
 v9-20020a5d6789000000b002c8dc70ab13mr14211731wru.18.1678361026293; 
 Thu, 09 Mar 2023 03:23:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/SH5LP3JdoN3TXJ/TYCOAs9QXCd0H2gq8nSZeQO9vW4n5twpVp9hXlg9qp/3ZX39KGtC3WSg==
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id
 v9-20020a5d6789000000b002c8dc70ab13mr14211721wru.18.1678361026031; 
 Thu, 09 Mar 2023 03:23:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c71dd1109fsm17321700wrw.47.2023.03.09.03.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:23:45 -0800 (PST)
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
Subject: Re: [PATCH 10/22] drm/logicvc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-11-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-11-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:23:45 +0100
Message-ID: <875ybacgn2.fsf@minerva.mail-host-address-is-not-set>
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

