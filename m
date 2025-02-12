Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A1A3286B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F82C10E8D1;
	Wed, 12 Feb 2025 14:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B/FGpSKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DB310E8CC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739370555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9WPEvkBQpOGn0vTtNVqi/6VObHeGOYD3hDmy0J7hXM=;
 b=B/FGpSKBjTvKvhXpsdIcpeUHumO0tmZO8M7KLfkzgfNeLujL5qsvFaRlEOYO5CxDaKAyi6
 l61flJaNqX4P50ts1TtEPdxWNYKCKOIm498gUaGaxdaH095HrUEhQHhU9OUMJluDHFE4RH
 7/nIlw+ViNK6lDC5y63NbpDDaHObqRY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-BfeAo6QkMaqMfztYB4Tj_Q-1; Wed, 12 Feb 2025 09:29:14 -0500
X-MC-Unique: BfeAo6QkMaqMfztYB4Tj_Q-1
X-Mimecast-MFC-AGG-ID: BfeAo6QkMaqMfztYB4Tj_Q
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab78d23202cso443729766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 06:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739370553; x=1739975353;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9WPEvkBQpOGn0vTtNVqi/6VObHeGOYD3hDmy0J7hXM=;
 b=n0cYwq0S0WpX+e03DIf2NQ9j7vl0nmDY1Am7phLrOtbIC2r+GyBfRzxRZisru7bNHW
 HVFgNODPWZJ9zMn8jyc5Dl9jzN2KkzMd9ZdKFKprqdw+EmC+1mtQKZgwPm3YD5lrL8KP
 qiV5fXNnbPhSiL4vzAoLy/4FeAsu/PG6TKcWIO1i/P8Q7Bezhm5SVwcaR1uv8lcxGtAM
 bGS2n/qQg5FDimRtOcKEznM/DW2dazxGoT6PaPXEqyQeBRSeXrNvh5vnWVJKoHFB+57t
 S7yj87IxHVqKx47KY62/p7eu/ABKggObt+8/yqHaapPXfg9FwOIGS+6lCnYFz/4IhWo9
 msBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhq7NlV/Qi4nh40C/9QL5KPXtBtvZsWde/smKjRnuiz2XG2pX+12N63/9LdKALc4KVHNCxXN3objs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8Jgd2M0GAJuAEcqomEz9PAPJVCzPxpkeD2W7UcrPsW7QJp2cf
 eaHxtqnScPtg24URn+or5c4XKav0vtGRkxCmIsrlCDMT2T10ZqIP6F0W0gARCpzCusk6riQT9hn
 Q0/f/JF9NH6R5DdhlyQFj0YPC1KTqRgCDy3RmNGmYvbFTIH4APWGMuxdi1YLCTrUaw7FgNagzB3
 dZAcHDaK+WEHU/ZW42AFiGsRAkfPyb5FTel5KN4PUm
X-Gm-Gg: ASbGncv6ByDJppOvCVg/gELPNb+03/PmBVdZxzq0G+YQQvPUn69KqjblWBhgReddZwP
 wcVKF6gKY9UrN6ZEvpyixrttDD/jnCpXuj8Bt8EegEtLB6FubwcZmhdiStC7LvoNl9XHC/6WSpn
 mUsQxg/YaHxhrZCAPylw==
X-Received: by 2002:a05:6402:3510:b0:5dc:7374:261d with SMTP id
 4fb4d7f45d1cf-5deadd71ae6mr7994590a12.7.1739370552923; 
 Wed, 12 Feb 2025 06:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFODMyc0mg69LtDY6AULrP8h8emzE8pmqlTP7h4KHBaL4p+FpoBPUfEFgNkycdGMlVSlAMSgfgepus94exDBMg=
X-Received: by 2002:a05:6402:3510:b0:5dc:7374:261d with SMTP id
 4fb4d7f45d1cf-5deadd71ae6mr7994548a12.7.1739370552594; Wed, 12 Feb 2025
 06:29:12 -0800 (PST)
MIME-Version: 1.0
References: <20250206104300.416014-1-ryasuoka@redhat.com>
 <d8a453e9-c8ce-4a7d-8fb9-08a13c44d7f3@collabora.com>
 <3c0e06d4-b5b7-45cf-bc42-8f12b293b7da@redhat.com>
In-Reply-To: <3c0e06d4-b5b7-45cf-bc42-8f12b293b7da@redhat.com>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Wed, 12 Feb 2025 23:29:00 +0900
X-Gm-Features: AWEUYZlZPWJuA_vK95ztJ7A8EkKN1A4KF5b4RIqvSAABBcmQQ3uMF8dJqmXE2rg
Message-ID: <CAHpthZqYGwXCqZYSXgrbZ8AT58kXS+qm8LRE=SWkrQvgx9CUHw@mail.gmail.com>
Subject: Re: [PATCH v7] drm/virtio: Add drm_panic support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, daniel@ffwll.ch, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qyib9zNRT5nYMkd1BzK6whK0P0V5M_fGWJhFY1gnc2M_1739370553
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2025 at 8:14=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> On 09/02/2025 18:45, Dmitry Osipenko wrote:
> > On 2/6/25 13:42, Ryosuke Yasuoka wrote:
> >> Virtio gpu supports the drm_panic module, which displays a message to
> >> the screen when a kernel panic occurs. It is supported where it has
> >> vmapped shmem BO.
> >>
> >> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> >> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> >> ---
> >
> > Applied to misc-next, thanks!
> >
> > I've tested v7 with a different capsets, works well. For a non-VT FB th=
e
> > vmap indeed will be needed. Looking forward to the atomic vmap support.
> > The rough idea of the atomic vmap helper is to make vmap code paths fai=
l
> > whenever hitting path that needs to sleep. Likely will be easy to imple=
ment.
> >
>
> Thanks for your support.
>
> I will see if we can do something for atomic vmap support for shmem.
>
> Best regards,
>
> --
>
> Jocelyn
>

Thank you for your kind support.
I'll try to write the atomic vmap support patch soon.

Best regards,
Ryosuke

