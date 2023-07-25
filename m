Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 511517623E7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 22:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A1810E414;
	Tue, 25 Jul 2023 20:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C22010E180
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 20:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690318176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38IMj3xv1G3eXsCLZDvUth67OCLKES/PMNHoodovrOY=;
 b=AxSBpmz3/jrtwTC9F0Divi79kW90h5YeMSmt1QNiAdA1s19XvaronKqcldGY3lAMtacuJG
 WDEHaKDfCQkSMq8WRNycd1h+qzheravJwKj/zr79IV0r6V0RuJ0yu7pMrs8P38YPb/9h88
 9AWbKPZq8V+yoMBFcnsUq6tDHjs7sNM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-ZKXcavN6OEOLWTpoRvsSLA-1; Tue, 25 Jul 2023 16:49:34 -0400
X-MC-Unique: ZKXcavN6OEOLWTpoRvsSLA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fbb0c01e71so30465635e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 13:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690318173; x=1690922973;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KeONIz/Q4uQt+4XkSXhcxSe2PuQ/hyoDF1WmXfyyucM=;
 b=D4LfP/itFcO7JNHm/DJskjBL3WvVdpG2piEBoAtl74GXTeb5NtEWs9I9Zh2v9h/ZEo
 1UeOq9T0/0QgQBEeGefXdfJyue9wqJnuk3mynTll9xSK+pMqAy0FtSw8imhNVP1hYkvK
 OKZPWNv24TjAs4oDJwDVTyhBLYN/XdrWXAtjRu2/66LHHMM1gbcf2XqDFUo+IS8cfWPH
 +1IonbJx3z9VNvWLze1dyQ2m5t2fYIFugtD/VrZZ+dkqfOM644kGnZ0HfI2Xsl+iT1OW
 DDRjb8SdThtIt7TTzevFImG6eYz4G+pqGFUebGP/g1Z30tx/pGsB78TgvPZjG3jCeA52
 jZcQ==
X-Gm-Message-State: ABy/qLZ+KXJHvH6rbyGeWHiwEf6qCVIEvr+SsY5kZCLBhxBwQRQ26zaS
 7Fux6rrlWOL/QR9y0PlCcjkhWSgRX8xaxyR/xvODZlA2HVrN6OmjZeg7g2if0QYYUn0tib60dtw
 C2IveWU7KKd81R5kEptzwRdqMjH/W
X-Received: by 2002:adf:fec8:0:b0:313:f86f:2851 with SMTP id
 q8-20020adffec8000000b00313f86f2851mr11511700wrs.3.1690318173121; 
 Tue, 25 Jul 2023 13:49:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF7aHh/EHl2VpFeDBeaNz+w7LOEj3C2tIPTs6riDSwNDLpSDNQOzmSMzvJj9B29oNH8XF3gGA==
X-Received: by 2002:adf:fec8:0:b0:313:f86f:2851 with SMTP id
 q8-20020adffec8000000b00313f86f2851mr11511692wrs.3.1690318172663; 
 Tue, 25 Jul 2023 13:49:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b17-20020a5d40d1000000b00314417f5272sm17436732wrq.64.2023.07.25.13.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 13:49:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
In-Reply-To: <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
Date: Tue, 25 Jul 2023 22:49:31 +0200
Message-ID: <871qgvk97o.fsf@minerva.mail-host-address-is-not-set>
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

Hello Geert,

> Hi Javier,
>
> Thanks for your patch!
>

Thanks a lot for your feedabck.

> On Fri, Jul 21, 2023 at 9:10=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert reports that the following NULL pointer dereference happens for hi=
m

[...]

>
>> Since the primary plane buffer is allocated in the encoder .atomic_enabl=
e
>> callback, this happens after that initial modeset commit and leads to th=
e
>> mentioned NULL pointer dereference.
>
> Upon further investigation, the NULL pointer dereference does not
> happen with the current and accepted code (only with my patches to
> add support for R1), because of the "superfluous" NULL buffer check
> in ssd130x_fb_blit_rect():
> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/solomon/ssd130=
x.c#n592
>
> So you probably want to drop the crash report...
>
>> Fix this by having custom helpers to allocate, duplicate and destroy the
>> plane state, that will take care of allocating and freeing these buffers=
.
>>
>> Instead of doing it in the encoder atomic enabled and disabled callbacks=
,
>> since allocations must not be done in an .atomic_enable handler. Because
>> drivers are not allowed to fail after drm_atomic_helper_swap_state() has
>> been called and the new atomic state is stored into the current sw state=
.
>>
>> Fixes: 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each plane =
update")
>
> ... and the Fixes tag.
>

Ah, I see. Thanks a lot for that information.

>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

Will drop your Reported-by tag too then.

>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Regardless, avoiding calls to ssd130x_fb_blit_rect() when the buffer
> is not yet allocated is worthwhile.  And this patch achieves that.
>

Agreed, and as Maxime mentioned is the correct thing to do.

> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>

Thanks for testing!

> Still, some comments below.
>
>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -141,12 +141,26 @@ const struct ssd130x_deviceinfo ssd130x_variants[]=
 =3D {
>>  };
>>  EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
>>
>> +struct ssd130x_plane_state {
>> +       struct drm_plane_state base;
>> +       /* Intermediate buffer to convert pixels from XRGB8888 to R1 */
>> +       u8 *buffer;
>> +       /* Buffer that contains R1 pixels to be written to the panel */
>> +       u8 *data_array;
>
> The second buffer actually contains pixels in hardware format.
> For now that is a transposed buffer of R1 pixels, but that will change
> when you will add support for greyscale displays.
>
> So I'd write "hardware format" instead of R1 for both.
>

Agreed.

> BTW, I still think data_array should be allocated during probing,
> as it is related to the hardware, not to a plane.
>

Ack. I'll do that as a separate patch on v5.

>> +};
>
>> @@ -159,23 +173,23 @@ static int ssd130x_buf_alloc(struct ssd130x_device=
 *ssd130x)
>>
>>         pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width);
>>
>> -       ssd130x->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KERNEL);
>> -       if (!ssd130x->buffer)
>> +       ssd130x_state->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KE=
RNEL);
>> +       if (!ssd130x_state->buffer)
>>                 return -ENOMEM;
>>
>> -       ssd130x->data_array =3D kcalloc(ssd130x->width, pages, GFP_KERNE=
L);
>> -       if (!ssd130x->data_array) {
>> -               kfree(ssd130x->buffer);
>> +       ssd130x_state->data_array =3D kcalloc(ssd130x->width, pages, GFP=
_KERNEL);
>> +       if (!ssd130x_state->data_array) {
>> +               kfree(ssd130x_state->buffer);
>
> Should ssd130x_state->buffer be reset to NULL here?
> I.e. if .atomic_check() fails, will .atomic_destroy_state() be called,
> leading to a double free?
>

Yeah. I'll add it.

>>                 return -ENOMEM;
>>         }
>>
>>         return 0;
>>  }
>
>> @@ -576,18 +593,21 @@ static void ssd130x_clear_screen(struct ssd130x_de=
vice *ssd130x)
>>                 .y2 =3D ssd130x->height,
>>         };
>>
>> -       ssd130x_update_rect(ssd130x, &fullscreen);
>> +       ssd130x_update_rect(ssd130x, ssd130x_state, &fullscreen);
>>  }
>>
>> -static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struc=
t iosys_map *vmap,
>> +static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
>> +                               const struct iosys_map *vmap,
>>                                 struct drm_rect *rect)
>>  {
>> +       struct drm_framebuffer *fb =3D state->fb;
>>         struct ssd130x_device *ssd130x =3D drm_to_ssd130x(fb->dev);
>> +       struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_s=
tate(state);
>>         unsigned int page_height =3D ssd130x->device_info->page_height;
>>         struct iosys_map dst;
>>         unsigned int dst_pitch;
>>         int ret =3D 0;
>> -       u8 *buf =3D ssd130x->buffer;
>> +       u8 *buf =3D ssd130x_state->buffer;
>>
>>         if (!buf)
>
> This check should no longer be needed (and prevented you from seeing
> the issue before).
>

Ack.

>>                 return 0;

[...]

>> +static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *=
plane,
>> +                                                    struct drm_atomic_s=
tate *state)
>> +{
>> +       struct drm_device *drm =3D plane->dev;
>> +       struct ssd130x_device *ssd130x =3D drm_to_ssd130x(drm);
>> +       struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane=
_state(state, plane);
>> +       struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_s=
tate(plane_state);
>> +       int ret;
>> +
>> +       ret =3D drm_plane_helper_atomic_check(plane, state);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return ssd130x_buf_alloc(ssd130x, ssd130x_state);
>
> I think the code would become easier to read by inlining
> ssd130x_buf_alloc() here.
>

Agreed. I'll do that.

>> +}
>> +
>
>> +static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(st=
ruct drm_plane *plane)
>> +{
>> +       struct ssd130x_plane_state *old_ssd130x_state;
>> +       struct ssd130x_plane_state *ssd130x_state;
>> +
>> +       if (WARN_ON(!plane->state))
>> +               return NULL;
>> +
>> +       old_ssd130x_state =3D to_ssd130x_plane_state(plane->state);
>> +       ssd130x_state =3D kmemdup(old_ssd130x_state, sizeof(*ssd130x_sta=
te), GFP_KERNEL);
>
> I know this is the standard pattern, but the "dup" part is a bit
> silly here:
>   - The ssd130x-specific parts in ssd130x_plane_state are zeroed below,
>   - The base part is copied again in
>     __drm_atomic_helper_plane_duplicate_state).
> So (for now) you might as well just call kzalloc() ;-)
>

Indeed. You are correct.

>> +       if (!ssd130x_state)
>> +               return NULL;
>> +
>> +       /* The buffers are not duplicated and are allocated in .atomic_c=
heck */
>> +       ssd130x_state->buffer =3D NULL;
>> +       ssd130x_state->data_array =3D NULL;
>> +
>> +       __drm_atomic_helper_plane_duplicate_state(plane, &ssd130x_state-=
>base);
>> +
>> +       return &ssd130x_state->base;
>> +}
>> +
>> +static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane=
,
>> +                                               struct drm_plane_state *=
state)
>> +{
>> +       struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_s=
tate(state);
>> +
>> +       ssd130x_buf_free(ssd130x_state);
>
> I think the code would become easier to read by inlining
> ssd130x_buf_free() here.
>

Ack.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

