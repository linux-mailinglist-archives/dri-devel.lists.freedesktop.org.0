Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A6B53C140
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 01:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862861137C1;
	Thu,  2 Jun 2022 23:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E3C1136C3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 23:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654211368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ymLvqfhO7F2VSq4EYMOanNHdhLgE7/SRZ2JMZktSN0A=;
 b=Q+AuP7UhsNfi5HE12PrTKBEBmZSQLI8F2gnPMTdEvW3r7sTArZXMzSiZXsm9oBbp0ttfoZ
 8bzA1y/sWGaNvOFIiSGrCM9u+yxw6rHXUFQ4ueuMr/WV+y5bDtiGskFy7IB+R/o5sj2Q1u
 TVHbOQnJ+s1ZTGF0y4LkbMywzDR2b1k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-ak3tRY_UPsyW1KO0ViOy9g-1; Thu, 02 Jun 2022 19:09:25 -0400
X-MC-Unique: ak3tRY_UPsyW1KO0ViOy9g-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c1c8500b003974c5d636dso3538331wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 16:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ymLvqfhO7F2VSq4EYMOanNHdhLgE7/SRZ2JMZktSN0A=;
 b=aJ5/0A/O5tRVHyQW7AOHlWlI5wVHJIPgLJTJSGnoG+Bi1+iq8k2u8wtRHy5xEoCtyL
 bEcAvrEF77RLfqSmQjWh+PPuJfTlxfsA7KRkBQZcnRLJEPtehTRXZ0VhDXUMgsf9PMUS
 ITOsjaD9QEpugGFDaQuqOpsIDyn8at+mtMm4jbSAiQwsN3c7/Y5c620AAJKl3dSWR7+g
 PHOpbT83MWBifHxNrpaQz/ZOsuljjhVSzEngf52//ayeoYZQixOB/469knY6RGmLB1QX
 AGSEOqwjJ7OE5YFP7BLowbCqkjzizX8PPbGsQdZuIo4xP31EAm0RwKWbhfx0yKIj7NGL
 Jg7w==
X-Gm-Message-State: AOAM532vAgOGFm1PHeTx6QiGVOzt2pm3DiNESVK/hDaWWapcWdZJ+nqq
 2pNDi3pGmDL81HTO+H2yJCjVyX+6eAUXaYs16k7uNh46rrOI+RnJdqf+4RXgaoPTTuHQlUhI7ja
 YBwodDOwwIa/2X0U89yIpnSL+WVZI
X-Received: by 2002:a05:6000:1acd:b0:20f:d7df:a2a8 with SMTP id
 i13-20020a0560001acd00b0020fd7dfa2a8mr5365891wry.477.1654211364144; 
 Thu, 02 Jun 2022 16:09:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwndCFntHsD0kEZaTLscajqkhVQmTmetKb34IAaRRbK56keS/iPdSKTNXOu+3abL87uHLM5A==
X-Received: by 2002:a05:6000:1acd:b0:20f:d7df:a2a8 with SMTP id
 i13-20020a0560001acd00b0020fd7dfa2a8mr5365885wry.477.1654211363951; 
 Thu, 02 Jun 2022 16:09:23 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c4e8600b0039466988f6csm12934625wmq.31.2022.06.02.16.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 16:09:23 -0700 (PDT)
Message-ID: <1ef6981d-5bbf-d4d4-9dbe-7a4af64105b0@redhat.com>
Date: Fri, 3 Jun 2022 01:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 5/6] ARM: configs: Enable DRM_V3D
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
 <20220601110249.569540-6-pbrobinson@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220601110249.569540-6-pbrobinson@gmail.com>
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
> BCM2711, the SoC used on the Raspberry Pi 4 has a different 3D
> render GPU IP than its predecessors. Enable it it on multi v7
> and bcm2835 configs.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

