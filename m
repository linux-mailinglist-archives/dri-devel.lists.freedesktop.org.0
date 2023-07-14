Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27E7537A9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18F110E85B;
	Fri, 14 Jul 2023 10:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F101910E85B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689329688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VDPdK5Oor5Kw2bqZn3fIKe7+JBJ69095qwlRLBTDYJc=;
 b=K2fi5cEyutxM4TWoj5uxVFpst6Cyce9kfcjxmj8t/5BTSJf5Sr9lLAoZpUEggtJYdA6h4A
 z8hw86t4kkDuCbdxaBSEcQKt7P+BtrlXYgXl1HtevtcGimugjfjKatYdaAPkR3luL9sroG
 r1xH5+MIxHYpSVcsZhYq+GFsu3DhYQw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-O9KmLO_dOr23vtnKNiJQxQ-1; Fri, 14 Jul 2023 06:14:47 -0400
X-MC-Unique: O9KmLO_dOr23vtnKNiJQxQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fa96b67ac1so10103985e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 03:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689329686; x=1691921686;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VDPdK5Oor5Kw2bqZn3fIKe7+JBJ69095qwlRLBTDYJc=;
 b=idCfG5o5Jv5X44bAwWylqR53JZJm0BDUS8ZiwsPaNLNyggeV6QhyGuqO3/rkgmnyjD
 XiypLgarEZA1jiFTCkduTmtI1m62brn84bhfsOnrKWzX3O+m91vjkagHk15eUMP5Iiy9
 gnjEJ52ZSsJIAU4gqr040AshhUH/7mmlX9JGgDwZvYCkfKCVgN8zGhBBKXkoFBJFeNAY
 R54a1hQiH6vo3a+UYSg/NM0vzYKpb2Ggft+s1lIgXPRv6pAvkFADDRoksewJdDHcOBdD
 Z0TyiS1qeTDpV+uhvLRfTC8i+g65vcHdnXf17WRYigWAw/q6VHIfJ06U3bYEcJ8uZbju
 zS4A==
X-Gm-Message-State: ABy/qLYi56G0kqo+u/D/3X0Es+2L76+KPufvCdQg50ykL/Db8NU3DfkN
 eTvJ8aDD4y1CMJNsQil6Q73aWrAA/aAwo4CjyeUKAJRo3Wh2cgC9k5qEuWCl06Zfex6oViDMbGZ
 cyETqf8xnYcSB3RW+riz6FrJ4knlV
X-Received: by 2002:a5d:4acc:0:b0:315:99be:6fe4 with SMTP id
 y12-20020a5d4acc000000b0031599be6fe4mr4197169wrs.69.1689329686469; 
 Fri, 14 Jul 2023 03:14:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFWG05PEub0RlJ3ldMFlpn9gHopzRMDXENCQEZqn/pCYz8EFuUfF/KoRBPBx6rx56Ah0A3k1g==
X-Received: by 2002:a5d:4acc:0:b0:315:99be:6fe4 with SMTP id
 y12-20020a5d4acc000000b0031599be6fe4mr4197153wrs.69.1689329686102; 
 Fri, 14 Jul 2023 03:14:46 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 z13-20020adfe54d000000b003143ac73fd0sm10526624wrm.1.2023.07.14.03.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 03:14:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/8] drm/ssd130x: Add support for DRM_FORMAT_R1
In-Reply-To: <72746f6d9c47f09fc057ad7a4bbb3b7f423af803.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <72746f6d9c47f09fc057ad7a4bbb3b7f423af803.1689252746.git.geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 12:14:44 +0200
Message-ID: <87ilamu7e3.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

Thanks a lot for your patch, this has been on my TODO for some time!

> The native display format is monochrome light-on-dark (R1).
> Hence add support for R1, so monochrome applications can avoid the
> overhead of back-and-forth conversions between R1 and XR24.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This work interfered with commit 49d7d581ceaf4cf8 ("drm/ssd130x: Don't
> allocate buffers on each plane update") in drm-misc/for-linux-next,
> which always allocates the buffer upfront, while it is no longer needed
> when never using XR24.
>

you mean R1 here, right ? It's still used in ssd130x_clear_screen() though.

> Probably ssd130x->buffer should be allocated on first use.

Yes, that makes sense.

> And why not allocate the buffers using devm_kcalloc()?

I think there are some lifetimes discrepancies between struct device and
struct drm_device objects. But we could use drm_device managed resources
helpers, i.e: drmm_kzalloc().

> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 57 ++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 17 deletions(-)
>

[...]

> +	case DRM_FORMAT_XRGB8888:
> +		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
> +		buf = ssd130x->buffer;
> +		if (!buf)
> +			return 0;
> +

I think this check is not needed anymore now that the driver won't attempt
to update planes for disabled CRTCs ?

It's OK for me to be paranoid though, specially after the other issue that
you found. So I'll let you decide if you think is worth to keep the check.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

