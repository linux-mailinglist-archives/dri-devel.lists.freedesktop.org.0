Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A676363C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 14:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6B310E46C;
	Wed, 26 Jul 2023 12:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDF810E46C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690374319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U22bitSkjlOB7+s0Qqc7YUuzfGUohh2nuRolnfSIvEM=;
 b=gS025kjRSpKiYIafqkA0lW5M5I3Dj5Z6qkin3m9/zueeWIj7+DfwvqRvIDuztTCFv6qmvo
 xO6OGMhs/pHLrHomAuR+keH/svOlcisN2sqx5Ywwwuns9tfEzSi4ynUd9NS21IqROAMDGg
 NLcsTCWvGannBqZTQMWADpuXcJ3mobA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-GlIftAMyM66uwGc5Mc8GBQ-1; Wed, 26 Jul 2023 08:25:18 -0400
X-MC-Unique: GlIftAMyM66uwGc5Mc8GBQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3176c4de5bbso855228f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690374317; x=1690979117;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxjFPJ8KobiqywJVUesvkSeJiYPkEsnFPZn7dC9KfSE=;
 b=laoC9XjXH0MOaSYC1tSTuu/XEKTLWsnESj3IINTlyqaVmSoVBtLybpVWON9olFBzUW
 maSMzrhlblWmi60pRy68ENpGAC6j++ErhObYt2cxGMgOo97bZvDY1SkdErF4//Ovu5PO
 D0T0Pg/tpoF6mu+rIlVLwcr2lTn86MlE45LiIG1eDOgTFZ1u/nGpGZTdCKmcvHUWk9na
 HfB5gwxcaGS6Q5Q79+VXdgYDRGgCU/MVuU4kpqDK0TBpGhR7xOwkHIb0wzUdIh+0BW21
 gRHWWy8BUl1LU24Q9KuveTkVEFSLO8UDZFS4NRpnIExfHdL7ENi2qMI550a+HgiZgGuf
 m8NA==
X-Gm-Message-State: ABy/qLZEjPUYTDbBp8WUQ3BK4qSttYDCWx9ToWpFtQ/YGzVog2w4lwfq
 kghvg8npkBeg3PLiitkCqu53/UdrGvcPHchl/oEaIrAK7qr98o/uo+515FoTlKeJ3jsrHoMepdo
 gWw7sMau9mOv9wQwXl/fVPUcbVfaO
X-Received: by 2002:adf:d0c9:0:b0:317:6314:96e2 with SMTP id
 z9-20020adfd0c9000000b00317631496e2mr1427854wrh.14.1690374316975; 
 Wed, 26 Jul 2023 05:25:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHv7Azp7OdeZjTccYCPfcmAWx+6/xgx8t09mmpf7aV1keH33FUtz2Yvu6bEVJhWhn2+zeVUZA==
X-Received: by 2002:adf:d0c9:0:b0:317:6314:96e2 with SMTP id
 z9-20020adfd0c9000000b00317631496e2mr1427839wrh.14.1690374316665; 
 Wed, 26 Jul 2023 05:25:16 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x17-20020adfffd1000000b003141f3843e6sm19551465wrs.90.2023.07.26.05.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 05:25:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 2/2] drm/ssd130x: Allocate buffer in the plane's
 .atomic_check() callback
In-Reply-To: <CAMuHMdX1ECG44BMOb5zK_N1cZCpjoKmms2p_80+_F72HH0NBEA@mail.gmail.com>
References: <20230726105433.389740-1-javierm@redhat.com>
 <20230726105433.389740-2-javierm@redhat.com>
 <CAMuHMdX1ECG44BMOb5zK_N1cZCpjoKmms2p_80+_F72HH0NBEA@mail.gmail.com>
Date: Wed, 26 Jul 2023 14:25:15 +0200
Message-ID: <871qgulv10.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Wed, Jul 26, 2023 at 12:55=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Drivers are not allowed to fail after drm_atomic_helper_swap_state() has
>> been called and the new atomic state is stored into the current sw state=
.
>>
>> Since the struct ssd130x_device .data_array is allocated in the encoder'=
s
>> .atomic_enable callback, the operation can fail and this is after the ne=
w
>> state has been stored. So it can break an atomic mode settings assumptio=
n.
>>
>> Fix this by having custom helpers to allocate, duplicate and destroy the
>> plane state, that will take care of allocating and freeing these buffers=
.
>>
>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>
>> Changes in v5:
>> - Add collected tags from Maxime and Geert.
>> - Update commit message to not mention the kernel oops (Geert Uytterhoev=
en).
>> - Drop Reported-by and Fixes tags (Geert Uytterhoeven).
>> - Update comment about buffer and data_array fields (Geert Uytterhoeven)=
.
>> - Remove superfluous NULL check in ssd130x_fb_blit_rect() (Geert Uytterh=
oeven).
>> - Reset .buffer to NULL if .data_array allocation fails (Geert Uytterhoe=
ven).
>> - Inline buffer alloc/free helper functions (Geert Uytterhoeven).
>
> Thanks for the update!
>

You are welcome, and thanks for the review!

>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>
>> @@ -535,7 +550,8 @@ static int ssd130x_update_rect(struct ssd130x_device=
 *ssd130x, struct drm_rect *
>>         return ret;
>>  }
>>
>> -static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
>> +static void ssd130x_clear_screen(struct ssd130x_device *ssd130x,
>> +                                struct ssd130x_plane_state *ssd130x_sta=
te)
>>  {
>>         struct drm_rect fullscreen =3D {
>>                 .x1 =3D 0,
>> @@ -544,21 +560,21 @@ static void ssd130x_clear_screen(struct ssd130x_de=
vice *ssd130x)
>>                 .y2 =3D ssd130x->height,
>>         };
>>
>> -       ssd130x_update_rect(ssd130x, &fullscreen);
>> +       ssd130x_update_rect(ssd130x, ssd130x_state, &fullscreen);
>
> I've just realized another issue: since 49d7d581ceaf4cf8 ("drm/ssd130x:
> Don't allocate buffers on each plane update"). this no longer
> clears the screens, but just updates the hardware with the data in
> ssd130x_device.buffer, i.e. with the last image shown.
> So this should at least clear all of ssd130x_device.buffer before
> calling ssd130x_update_rect().
>

Oh, you are right. I missed that.

> As it's a bit pointless to transpose a black image, a better fix would
> be to just clear ssd130x.data_array, and call the low-level hardware
> functions like ssd130x_update_rect() does.
>

Yeah, this is a left over when we used to allocate a buffer here and I
agree with you that calling ssd130x_update_rect() is a pointless.

We can fix this as a separate follow-up patch though if you agree.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

