Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231C753834
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CC110E865;
	Fri, 14 Jul 2023 10:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29710E865
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689330693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jXCCHC4y1vsxfQDMi0JiCwzaiAjNotpxpWdfoFM8jU=;
 b=BRpfyQHRh4P3Qk/sc6u1RAFctkt9CXBoCbupfjIQrJbdMNWYzuc2BxRprfucaybaVPmB4Y
 UDSpURVtt0he3TvGCXIUJqb8McHJiu7tj7dE6vQ08em4TGs+lGqkYsaGBeHZyXAfHwqT68
 B5EPe1zSl74yltLxC3f5teZm+zGAWNw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-SVkyYy2yOQ2cdOIX8mbr7w-1; Fri, 14 Jul 2023 06:31:32 -0400
X-MC-Unique: SVkyYy2yOQ2cdOIX8mbr7w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3144bf68a03so1037874f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 03:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689330691; x=1691922691;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8jXCCHC4y1vsxfQDMi0JiCwzaiAjNotpxpWdfoFM8jU=;
 b=TsfLGGYQf+XLoy+Ul1P1IOzlFKmnn4ChlfVp+CAFjmtqD/tc7FrEHz4ACW7Bh2i2lG
 JgQ4nyacdnnIL5h3qs4eN8fuR3RGiRDxMTQMnqRV4qr0oRQbBT/qgM5VubtX3YuNtG28
 UKHxI7bhM8ul5NVMZ/DnFYFWI+3m6X3t+xA2DehVaYfxOVZs/SjmmufMZtZgBnkfTLSu
 nOR3OABF8HLKE1acCGDcDU9A0grvbp5KAQtP9xiAcQ3f7RC+6N1Z4C1OVY60Rtc/8iJl
 jK78YUqI40p1OsC0UviIkpuWOpKKjYvkEwmfHXQd2HsdOZUzcx1dIjNblLuIp2jXm2YY
 bz2w==
X-Gm-Message-State: ABy/qLbz4CZPIJZtTZ9Lr3G+Dwry6b5al4rW/lNLZDbbng+nJg9XR1fC
 z+SkeT5mIWQz3yxN0jFnKbQYukhoVeldGPmhAxvw1hlePxPgiaJzk1R18doWVcz2K3MuITYE9wT
 YgUO/EUaILqtePBvhSmWUqrREEQxL
X-Received: by 2002:a5d:6284:0:b0:316:ee7f:f9bb with SMTP id
 k4-20020a5d6284000000b00316ee7ff9bbmr1403793wru.65.1689330691153; 
 Fri, 14 Jul 2023 03:31:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG0X90UuOfeNu2I3m1p8qQ1ruGOuu/vwVx5NDCfHvE8kg8Gme+6Wxg4oIzkL+SNe2n/ZO0qTg==
X-Received: by 2002:a5d:6284:0:b0:316:ee7f:f9bb with SMTP id
 k4-20020a5d6284000000b00316ee7ff9bbmr1403782wru.65.1689330690896; 
 Fri, 14 Jul 2023 03:31:30 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 f10-20020adff98a000000b003159d2dabbasm10414266wrr.94.2023.07.14.03.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 03:31:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 7/8] drm/fb-helper: Add support for DRM_FORMAT_R1
In-Reply-To: <ea0d68ef5630fe9748a11e50f6d79f79a768ebdb.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <ea0d68ef5630fe9748a11e50f6d79f79a768ebdb.1689252746.git.geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 12:31:27 +0200
Message-ID: <87a5vyu6m8.fsf@minerva.mail-host-address-is-not-set>
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

> Add support for the monochrome light-on-dark buffer format (R1) to the
> fb helper, so this format can be used for fbdev emulation and for the
> text console.  This avoids the overhead of using XR24 and the associated
> conversions on display hardware that supports only a simple monochrome
> format.
>
> R1 is very similar to C1 (monochrome indexed color), and shares the same
> depth and bpp.  As drm_mode_legacy_fb_format() returns a format based on
> only depth and bpp, it cannot distinguish between R1 and C1.  Hence
> drm_fb_helper_find_format() is modified to try to fall back to R1 if C1
> is not supported.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

