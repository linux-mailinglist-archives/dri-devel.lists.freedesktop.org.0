Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BFE753B88
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 15:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E32910E15B;
	Fri, 14 Jul 2023 13:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FD510E15B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689340117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5jlF+0VvtD6KedYYZA+25RR268o+QB6ezDCMPRnzrAU=;
 b=NF2GNH8Ol+p4vhfOVvb2+9B2OlmY4XmjnDyrKkPFaasy0iTQj0ZHmJev5A9+OJLJJD3dNo
 EEUPNGEJHBtKZ/Mp4YnRgfLE4w+JG2sqwTvtpBrVY9n7+xGvWn4bA7EzLFUmpgBP8cNE6R
 UUhbFHP9RX+OkkoL8oUAUXlU3XYVtTs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-bxXTufrrPoaThlUaFU9B7w-1; Fri, 14 Jul 2023 09:08:35 -0400
X-MC-Unique: bxXTufrrPoaThlUaFU9B7w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fa979d0c32so10508075e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 06:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689340114; x=1691932114;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5jlF+0VvtD6KedYYZA+25RR268o+QB6ezDCMPRnzrAU=;
 b=GHcO3vOtQ0fZC9KyuphgRifJ/lTs1o6p8/BcDQUKal4+1AE2FryJYWQbV6BJH/rUMu
 Bmi2DRoEqfmzE3jWiwM/5Gi7hsc/0wNq/zf+ivNCdYyKG4EZtMzERmamEroOANF6YdJs
 dzA67ahnvXQpiGqXGKb632uvRYvpmh6WIpLNteQ1XiBMbG7yNjGn6tFDbiJfAHuLEzYK
 UCy+tkwyuxRy5CLyWpSkQIv6kHmZIpbIwib5X07FtzmuzpslNveLSa2nZ7lv/nXDji6P
 NZzVDxXkKiZkuSzRgfwTA/Ce4a774UmFGctIwp8IuQXh+sEs1P2fHP5A68tJ0H0KVE98
 +Weg==
X-Gm-Message-State: ABy/qLYb9KraBANYpH5D/Ck2wtGTwinccuNAVEdpohR7hG/8CEWdH8vn
 uB1WM0KThiK/8M14grMQNWBYnusUqCsJXf9oQm9zr9dLsHPcilkBMsKk4e9eevHqaD40yHKjvLR
 RQWZqbIHKLkRhAa1OiWs57RJZXI3C
X-Received: by 2002:a7b:cd97:0:b0:3f7:a552:2ec7 with SMTP id
 y23-20020a7bcd97000000b003f7a5522ec7mr3917338wmj.33.1689340114562; 
 Fri, 14 Jul 2023 06:08:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHhsMqIQp/IzuO0MIXq2cAlM4A//WRLZpuNqFOjCnyF5tfR2O7yTuBRFdgW1Y3m8IXRT5F1Gg==
X-Received: by 2002:a7b:cd97:0:b0:3f7:a552:2ec7 with SMTP id
 y23-20020a7bcd97000000b003f7a5522ec7mr3917326wmj.33.1689340114257; 
 Fri, 14 Jul 2023 06:08:34 -0700 (PDT)
Received: from localhost (208.red-88-2-40.staticip.rima-tde.net. [88.2.40.208])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c12cb00b003fc3b03e41esm1197974wmd.1.2023.07.14.06.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 06:08:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/8] drm/ssd130x: Add support for DRM_FORMAT_R1
In-Reply-To: <CAMuHMdUrqwQAaNFONO0KOktrRY_twpktAP6=AeKv_8jjdb5_fA@mail.gmail.com>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <72746f6d9c47f09fc057ad7a4bbb3b7f423af803.1689252746.git.geert@linux-m68k.org>
 <87ilamu7e3.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdV1MXexXuRuvW2ap5KA51q_3h9X8jXdYXtFb2RF-BBLnw@mail.gmail.com>
 <875y6macxu.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUrqwQAaNFONO0KOktrRY_twpktAP6=AeKv_8jjdb5_fA@mail.gmail.com>
Date: Fri, 14 Jul 2023 15:08:33 +0200
Message-ID: <87351qabe6.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,

[...]

>> >
>> > The display should not be updated after .remove(), so I think plain
>> > devm_kcalloc() should be fine.
>>
>> That was precisely my point, that there could be atomic commits even after
>> the driver has been removed (e.g: if using DRM fbdev emulation, user-space
>> can keep the /dev/fb0 opened and continue updating the framebuffer. That's
>> not released until the fd is closed and struct fb_ops .fb_destroy called.
>>
>> But that's a general rule in DRM, any user-visible resource must not be
>> allocated using device managed resources and instead use the drm_device
>> managed resources helpers. To make sure that are not released until the
>> last call to drm_dev_put():
>
> These buffers are not user-visible, so they should not be accessed
> after .remove().  When these are accessed, the next step would be
> to write the buffer data to the device, which would also fail miserably,
> as the regmap, GPIO, and regulator are hardware resources managed
> through devm_*().
>

Right, given that we do the shadow buffer -> native buffer copy, I thought
of it as if as a user-visible (well, user-accessible I guess) but you are
correct that's not and trying to write to the device will fail anyways.

So devm_* should be enough indeed and if there are problems with that, it
would be a different bug in the driver to fix.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

