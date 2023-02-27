Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B80036A3E02
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B628110E390;
	Mon, 27 Feb 2023 09:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A800F10E390
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677489210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UIyjUN1UbHRo/+M6TptOIJTprO+3djrqyy4P+Xz3UPg=;
 b=Q0LEQy3G0Ya8LHZa+dzd4aT2vJuYaaI9EQspMepcdXT6Jh6iH4YfllZvmANXHh50bVzwhw
 ddS9g0f5CyiNcLcYOiz59YQDJElNCjbZqzpO3yZbDPokXFEhsjdVGndTRfvdEPi1KOg22f
 i5P4u+DnRGa5u3jIDI7d7SRype5HXo4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-mD2OE3FaNVe6mb8BKbPYYw-1; Mon, 27 Feb 2023 04:13:27 -0500
X-MC-Unique: mD2OE3FaNVe6mb8BKbPYYw-1
Received: by mail-wr1-f72.google.com with SMTP id
 bv22-20020a0560001f1600b002c559840c76so639416wrb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 01:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UIyjUN1UbHRo/+M6TptOIJTprO+3djrqyy4P+Xz3UPg=;
 b=w+0iw35v8MzCWRmKCGfelWe1+Cj5UP5gBfBKwZnvKFVJIhcWj7ShVBKpWxbIx7Ad7H
 Y4YA+5iHqabkZRtHHFAFe2v86+p6aFvgNJCnTmE2jGgfU7DbPYmSBQwLTo/00+Jx+8N8
 CXsA6Zgz9JgaJAMnNE8U8Oyj1eI0x+53qX6tl1gXLJ7rp93rFTorfd6n+kuLwp/Jajkh
 9WEuBNhFfQg2CqE2HBpWpqxB0sLepXA+3nLx88fSDj7D6PL5dBFTh2DJwCRNLIeeaG7M
 mdCN3YcUwAZaJzu0PK7Bi0JWeraxOKgdclmiNdlYflQUVVL8uc+EQVbJij5v15iVlHYE
 da+Q==
X-Gm-Message-State: AO0yUKXR3AdkM6oVybD9xqLfxWqii/ICKoLWRt6QhufW4MFzzgax0POU
 putOiMj+5epPm63qAkiUgsOU2mGpo9SyKgntbL5Rs6KTNiZFIRNNjXip4Aoz1RaPCX57K2qOv2P
 PyqbkzPFFLoiRWvT9rDvIEN7qDUik
X-Received: by 2002:a05:6000:1d95:b0:2c5:4f45:90b0 with SMTP id
 bk21-20020a0560001d9500b002c54f4590b0mr5025686wrb.3.1677489206188; 
 Mon, 27 Feb 2023 01:13:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+ltcLyJInrrDgWgB4dDuQf+eIs4MmOwJbJlUO44QBOpiD5QEgz+EhE3kPKPRMGvVtbttqb1w==
X-Received: by 2002:a05:6000:1d95:b0:2c5:4f45:90b0 with SMTP id
 bk21-20020a0560001d9500b002c54f4590b0mr5025673wrb.3.1677489205848; 
 Mon, 27 Feb 2023 01:13:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a5-20020a5d4565000000b002c3f81c51b6sm6474293wrc.90.2023.02.27.01.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 01:13:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Asahi Lina
 <lina@asahilina.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/shmem-helper: Revert accidental non-GPL export
In-Reply-To: <c94a0b2c-f061-3030-ecb7-abf0a16faa1d@suse.de>
References: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>
 <c94a0b2c-f061-3030-ecb7-abf0a16faa1d@suse.de>
Date: Mon, 27 Feb 2023 10:13:24 +0100
Message-ID: <878rgjh3nv.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 27.02.23 um 10:04 schrieb Asahi Lina:
>> The referenced commit added a wrapper for drm_gem_shmem_get_pages_sgt(),
>> but in the process it accidentally changed the export type from GPL to
>> non-GPL. Switch it back to GPL.
>> 
>> Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Fixes: ddddedaa0db9 ("drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()")
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Thanks a lot. I'll add your patch to drm-misc-fixes ASAP.
>

Thanks for fixing this and sorry that I missed it during review.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

