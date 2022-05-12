Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D301E524D1B
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 14:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49A510E414;
	Thu, 12 May 2022 12:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C0B10E414
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 12:38:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m20so9914000ejj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yoGfAeZQWxmcbzhHC6mTnSs1oZv+JtjPmO1ajlNx7xY=;
 b=b1wUoho9j1rQF9AgKvIZh6E7b3xVmeysOq+HQQYVvd1mbqPZRM87eyHi+uDOfsuWFA
 Mpyt973hsn3vGm6/EpFYegwcoNln/LUONWa03KjfvpKldjDxI+UU9mOPrwi0nR4plq3u
 wTANUhx4kd/3V9fr+XP8lgU3bkOwvHoYI+HHXaY9WlcFlZkdRSfWENzM73CHIrdXREYO
 8PMte1L5SN2hDAVN9snogABa67l+slqwBVTEXlAp2Jh00G5ytO/E6mgsbjfthkyPTc6k
 x38hbD7Sykg/XiiX4r4chB7OA8dMuwot6RnIGRQbgP7Fuhfb7s9GrJoWhjEUOa68rh5K
 Likw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yoGfAeZQWxmcbzhHC6mTnSs1oZv+JtjPmO1ajlNx7xY=;
 b=XKacl6ON2SVBPhGm1wtdvTUUVvF+xL5uGn+U4Cb15cNFAYnXcIOuPwOBtmkioAHcv+
 gZyaA6IdozveXh5qo4WpgN255Y89naE9PpPYHE0E/+3WOQxhO4nhkOkNAU9SkztQ3vxa
 6hv2I8l4rxqrMiwwOR9p00oc/LySYyAZ4EtJlxSJj7HF6ut00ZyQcWeFtyOFXogkQayl
 RuCs5CWPFncRG8ziM8YepNDgMkFEe/4aAF00sYqRsTgKiZw+Wej4L8avJPPT07ay6wjB
 aGzLnuUNrv8gMB2ftMumT2QAcUQgxQvcwrqaFTzwwH46hlqZigemqW2/BtgPEHlTFHH5
 EWJg==
X-Gm-Message-State: AOAM533vaqDrqk1UJ13TXSRHLXy8IXqgggyasLbS3H8m2jOR+MvKGP5Q
 0QAtBk2gLrcbCEMQQbGch9tRsQfzwPQMMu7hizQ=
X-Google-Smtp-Source: ABdhPJxyZQsOCxEgrJZ2NAiC1Xo6LDdCxh8GoYT6et8Ll4kjTZqtuvt2+XhFH0OByYZ9Rnqwnsq2/IAW528XPmAKjhM=
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id
 mp25-20020a1709071b1900b006f010221430mr30637029ejc.13.1652359110183; Thu, 12
 May 2022 05:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220511054052.51981-1-linmq006@gmail.com>
In-Reply-To: <20220511054052.51981-1-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 May 2022 14:38:19 +0200
Message-ID: <CAFBinCAQaCNcYmF0kT6o7zOCHy3eV+vHOHC10XULYXvDO6_-6w@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
To: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 7:41 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_find_device_by_node() takes reference, we should use put_device()
> to release it when not need anymore.
> Add missing put_device() in error path to avoid refcount
> leak.
>
> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for sending this patch!

Neil, while reviewing this I noticed that on module unload we're also
not calling put_device().
This note doesn't affect this patch - but I am wondering if we need to
put that put_device() during module unload on our TODO-list?


Best regards,
Martin
