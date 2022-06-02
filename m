Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52C53C139
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 01:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6232F113409;
	Thu,  2 Jun 2022 23:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05467113409
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 23:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654211106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnD0SQwuXnJnzuGTCuRRNeW9Z54yBgQvTPH+uvNxZn8=;
 b=MMkHb/NU/ilwbbtd+A1PjDqMqi5HVMXpS40CDWMBeBiv9+hFx8AXMdEcIIMCRF7uUscuia
 phDzs8WsC8fns0JgqO4S7OFk94zSxuGWKKDUGTsShUEI0vSWb+pqK1h27c/XnR94m47xfz
 efcWcOVF1mHIt/qs+yzjmtktwV2dh+0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-peGHyzmGM62xl4RMw0OBAQ-1; Thu, 02 Jun 2022 19:05:04 -0400
X-MC-Unique: peGHyzmGM62xl4RMw0OBAQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so3055313wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 16:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dnD0SQwuXnJnzuGTCuRRNeW9Z54yBgQvTPH+uvNxZn8=;
 b=p2SxBQDxq0d/XDCO222k+fcNKdDng75wVJAs0COLC0t4uNjP7DmBhGtVXcNZg1Dj4R
 TkYynE7Y/AnSV+uJ4xz43DwVVqLWNf+XoSr8nhflcS6bv676PyVgzvbC5T9DhVwjUSN5
 wRuquFeybDEB2YxpeLjtSdLWxU8PyZVqNNGxpzjzo/oPCi0ItzyrS/SuQOPNgSl8JXTO
 vP5311dsqWHGIs7jAJIS1tU4K2TXrh9mhx4Dr01Ez7yYs2m07euOpjjvwQjhIR7ceVuy
 j/OOJrsn4HJJIVvqCyY7Ok82YlOt1ZUD/eCivTdJPMi5W67DBZ6s2Y0O1trxP0q+/ZTZ
 q6ig==
X-Gm-Message-State: AOAM531gJHVQOvjyiDieOKmqlHCILrR0x9dffbDuQPBmNMVUhXYedR4R
 54oUimNEVztAetktjqS1wcbTBF7PmrRdLdl1M5HgelupA4gpKRZiFQAWvg/gM2Iup02BCLkZ/NT
 zEWLVL89UpJWQkceT+nZdRgcCKWpe
X-Received: by 2002:a05:600c:3849:b0:397:89ce:289 with SMTP id
 s9-20020a05600c384900b0039789ce0289mr5936150wmr.104.1654211103799; 
 Thu, 02 Jun 2022 16:05:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZsT0S/V0wXOQCnSXr1pqcxR/QdZi+Mc0vGIeliLE5HEZerwm60VZMV9wY46X/+D7HMI36SA==
X-Received: by 2002:a05:600c:3849:b0:397:89ce:289 with SMTP id
 s9-20020a05600c384900b0039789ce0289mr5936134wmr.104.1654211103550; 
 Thu, 02 Jun 2022 16:05:03 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u18-20020a5d5152000000b0020cdcb0efa2sm5511529wrt.34.2022.06.02.16.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 16:05:03 -0700 (PDT)
Message-ID: <581f076f-ce60-03be-dcd3-23fbd96128e1@redhat.com>
Date: Fri, 3 Jun 2022 01:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 3/6] drm/v3d: Add support for bcm2711
To: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-4-pbrobinson@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220601110249.569540-4-pbrobinson@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/1/22 13:02, Peter Robinson wrote:
> Add compatible string and Kconfig options for bcm2711.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I've one small nit though.

[snip]

>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_V3D
>  	tristate "Broadcom V3D 3.x and newer"
> -	depends on ARCH_BCM || ARCH_BRCMSTB || COMPILE_TEST
> +	depends on ARCH_BCM || ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST

The help text for this Kconfig symbol currently says:

        help
          Choose this option if you have a system that has a Broadcom
          V3D 3.x or newer GPU, such as BCM7268.

Maybe you can add "... as BCM7268 or BCM2711." ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

