Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0646D7B5C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0434810E8ED;
	Wed,  5 Apr 2023 11:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9DC10E8ED
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680694242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RNLFmKiaJhCbpMv6NNLJ01MSUH3fUGQXMqewzc3mLvQ=;
 b=K+emJmThw3A22bzpJupOQyQCFLGDoOOne+R9iZ9xOfVY0algVxjeVbFGflLtRW3RlOeytv
 A5sYrWx0aQeCjVQiCSifN3gxYoHu1V7KC9qKk/NtkDNxn0v01u9ziyHr1YKchJaJ9BoZ/U
 1DmjLotVo2C8qh/QNvrV2KixBNzQvCI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-gYzaiMemOne7nIZK3VRcNg-1; Wed, 05 Apr 2023 07:30:38 -0400
X-MC-Unique: gYzaiMemOne7nIZK3VRcNg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h22-20020a05600c351600b003ef739416c3so12245271wmq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680694237;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RNLFmKiaJhCbpMv6NNLJ01MSUH3fUGQXMqewzc3mLvQ=;
 b=mdzfNGI4BQ8g19ZMsp471yQGKzsysoot1UKdokFWhn47CYgQ5tCwRt36I5vMx3zf4a
 kaBWXqXBGeIJObVyL6LvLfs4x9S4AW2VHf+8vmixR0qVjzaLodji9nZ6zeuyZ0mPM1dp
 8CdLqPr2j/eOlYBnJaV13yk9JQDZrqFQ5pbE4/lsJXctdt8cwSHgTZ8ulthBNbb8Fg/T
 mP6teYZUzAhA8f5vdyPvVJezujRpYcR/u4NMrdJLq1RMZhJhu5my5Md8rtMPLmyS6Vq/
 VcfZAHYekmsBd+fusVdmnHMOV16J3HNIG8XJ/nQszytIO4SvRii5NqAafG7eznB2xgbG
 Isqw==
X-Gm-Message-State: AAQBX9e1XR2Nb31rhNwmKcu4A8P4cf5NehT9WAlj01K1HKMYYUtoONmB
 rJhPp66Li/gbD7UBI1ODA+aD6kpXjSJnuOrdvLU2LOY4d1AdnK9B2mg2HYOOSfzExzt48hl2V5x
 6vBuVkLzN9xbME6ya76WU6QcBcYkc
X-Received: by 2002:adf:e409:0:b0:2ce:a0c1:bcaa with SMTP id
 g9-20020adfe409000000b002cea0c1bcaamr1759119wrm.9.1680694237463; 
 Wed, 05 Apr 2023 04:30:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z+rEnxummXTXBERQ/WiQlDGMhXDsQ6asLHd92imjUbjJ+WG229BKVrkkBNa50e3N/32xHrgg==
X-Received: by 2002:adf:e409:0:b0:2ce:a0c1:bcaa with SMTP id
 g9-20020adfe409000000b002cea0c1bcaamr1759090wrm.9.1680694237126; 
 Wed, 05 Apr 2023 04:30:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w3-20020adfcd03000000b002d45575643esm14727267wrm.43.2023.04.05.04.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:30:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/8] drm/aperture: Remove primary argument
In-Reply-To: <20230404201842.567344-3-daniel.vetter@ffwll.ch>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <20230404201842.567344-3-daniel.vetter@ffwll.ch>
Date: Wed, 05 Apr 2023 13:30:36 +0200
Message-ID: <871qkyd0rn.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-hyperv@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Helge Deller <deller@gmx.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> Only really pci devices have a business setting this - it's for
> figuring out whether the legacy vga stuff should be nuked too. And
> with the preceeding two patches those are all using the pci version of
> this.
>
> Which means for all other callers primary == false and we can remove
> it now.
>
> v2:
> - Reorder to avoid compile fail (Thomas)
> - Include gma500, which retained it's called to the non-pci version.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

