Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461A97633FF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 12:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3AA10E455;
	Wed, 26 Jul 2023 10:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBBA10E453
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690367985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KIAYCAlGGZb3z19gVP5w6EtvKL+DEq/jdey/3NnQwh0=;
 b=A7ErHjFAO7KMumMgY275YeK8U6y/vuxemfz9qg0hkpkQTgy8zsulT3PS07E6O9b1TkVLIy
 QsDNlaLPVaHrc7hKkcyzhUOdjxA2VjtIwygleegsIHNcviOhdKplL8J6RCLGE+lw3kPf/o
 POm50w8iOqqkfaJJP7clv0vaOQ0teuM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-sInC_H-ZM_aoGC8EpKiV5Q-1; Wed, 26 Jul 2023 06:39:44 -0400
X-MC-Unique: sInC_H-ZM_aoGC8EpKiV5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fd2d331e1eso19137655e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 03:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690367983; x=1690972783;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KIAYCAlGGZb3z19gVP5w6EtvKL+DEq/jdey/3NnQwh0=;
 b=jNO8ZK3ecfed4e8JTrtjbj665ebaxuvzNBxmmMPYk1uiO00NthlSZpuIsh+rF2LSPy
 QpDkcmITZTtIrYV1hNZWWoxoQG4ceyTdujY0Qpwde43o+oRP07f2uV6bEqGW0KwkPZ3d
 ekzCW37gwjdJG9pQOC2Q/aP0czw2fLdFGQ3MXJTvL7CIyOicEmnOrUn/TAveBPBUhgTs
 JkLoo1GY02ZarzKQYq47xBeJBTNXaSew9QlWsyWnIQHp6/OtvbQJv6OHwYSp75ehKDOL
 oAwHhZP8yzp5ebi90R28i15Mgto9qsNHPWCilkg9AGi2TSF2CLb8b0+PQv5wCOtjaBBa
 yPSQ==
X-Gm-Message-State: ABy/qLZmx9crdrJs/0tOA/LeRuOcZDLrdhRrBwEQLEFT3jb/vWpc0OIC
 B5vSU4uE8tjmBqYIOtT+Eae9yQ2bdi5J4TxYzYyf05OqjdX1GflkjH+UmkesfOmsfRnlHnhztSd
 fH9OCYHyozaLH8vcZEt+DEC8EJEnY
X-Received: by 2002:a5d:558e:0:b0:313:e9f6:3378 with SMTP id
 i14-20020a5d558e000000b00313e9f63378mr980249wrv.4.1690367983084; 
 Wed, 26 Jul 2023 03:39:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGYw0N3Y9zgbHazPi+sNQahTHurRsVqsvtu8aXahMO0bwRHNhbqjTQPuqZyr2Jlj6STeU7U7g==
X-Received: by 2002:a5d:558e:0:b0:313:e9f6:3378 with SMTP id
 i14-20020a5d558e000000b00313e9f63378mr980230wrv.4.1690367982711; 
 Wed, 26 Jul 2023 03:39:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n8-20020adfe348000000b00315af025098sm19403938wrj.46.2023.07.26.03.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 03:39:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
In-Reply-To: <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
 <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
Date: Wed, 26 Jul 2023 12:39:41 +0200
Message-ID: <877cqnklci.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> On Tue, Jul 25, 2023 at 09:21:52PM +0200, Geert Uytterhoeven wrote:
>> > --- a/drivers/gpu/drm/solomon/ssd130x.c
>> > +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> > @@ -141,12 +141,26 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
>> >  };
>> >  EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
>> >
>> > +struct ssd130x_plane_state {
>> > +       struct drm_plane_state base;
>> > +       /* Intermediate buffer to convert pixels from XRGB8888 to R1 */
>> > +       u8 *buffer;
>> > +       /* Buffer that contains R1 pixels to be written to the panel */
>> > +       u8 *data_array;
>> 
>> The second buffer actually contains pixels in hardware format.
>> For now that is a transposed buffer of R1 pixels, but that will change
>> when you will add support for greyscale displays.
>> 
>> So I'd write "hardware format" instead of R1 for both.
>>
>> BTW, I still think data_array should be allocated during probing,
>> as it is related to the hardware, not to a plane.
>
> I somewhat disagree.
>
> If I understood right during our discussion with Javier, the buffer size
> derives from the mode size (height and width).
>
> In KMS, the mode is tied to the KMS state, and thus you can expect the
> mode to change every state commit. So the more logical thing to do is to
> tie the buffer size (and thus the buffer pointer) to the state since
> it's only valid for that particular state for all we know.
>
> Of course, our case is allows use to simplify things since it's a fixed
> mode, but one of Javier's goal with this driver was to provide a good
> example we can refer people to, so I think it's worth keeping.
>

Yes, that's certainly one of my goals. So I'll just keep it as-is then.

>> > @@ -159,23 +173,23 @@ static int ssd130x_buf_alloc(struct ssd130x_device *ssd130x)
>> >
>> >         pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
>> >
>> > -       ssd130x->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
>> > -       if (!ssd130x->buffer)
>> > +       ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
>> > +       if (!ssd130x_state->buffer)
>> >                 return -ENOMEM;
>> >
>> > -       ssd130x->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
>> > -       if (!ssd130x->data_array) {
>> > -               kfree(ssd130x->buffer);
>> > +       ssd130x_state->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
>> > +       if (!ssd130x_state->data_array) {
>> > +               kfree(ssd130x_state->buffer);
>> 
>> Should ssd130x_state->buffer be reset to NULL here?
>> I.e. if .atomic_check() fails, will .atomic_destroy_state() be called,
>> leading to a double free?
>
> That's a good question.
>
> I never really thought of that, but yeah, AFAIK atomic_destroy_state()
> will be called when atomic_check() fails.
>

Interesting. I didn't know that. I'll set to NULL and add a comment.

> Which means that it's probably broken in a lot of drivers.
>
> Also, Javier pointed me to a discussion you had on IRC about using devm
> allocation here. We can't really do that. KMS devices are only freed
> once the last userspace application closes its fd to the device file, so
> you have an unbounded window during which the driver is still callable
> by userspace (and thus can still trigger an atomic commit) but the
> buffer would have been freed for a while.
>
> The driver could use a bit more work on that area (by adding
> drm_dev_enter/drm_dev_exit) but it still creates unnecessary risks to
> use devm there.
>

Yes, but that discussion is not relevant anymore anyways if we keep the
.data_array allocatioin the plane's .atomic_check handler.

>> > +static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(struct drm_plane *plane)
>> > +{
>> > +       struct ssd130x_plane_state *old_ssd130x_state;
>> > +       struct ssd130x_plane_state *ssd130x_state;
>> > +
>> > +       if (WARN_ON(!plane->state))
>> > +               return NULL;
>> > +
>> > +       old_ssd130x_state = to_ssd130x_plane_state(plane->state);
>> > +       ssd130x_state = kmemdup(old_ssd130x_state, sizeof(*ssd130x_state), GFP_KERNEL);
>> 
>> I know this is the standard pattern, but the "dup" part is a bit
>> silly here:
>>   - The ssd130x-specific parts in ssd130x_plane_state are zeroed below,
>>   - The base part is copied again in
>>     __drm_atomic_helper_plane_duplicate_state).
>> So (for now) you might as well just call kzalloc() ;-)
>
> Still if we ever add a field in the state structure, it will be
> surprising that it's not copied over.
>
> The code is there and looks good to me, so I'd rather keep it.

Yes, it's unlikely that this state structure will get other fields but
still since is the standard patter, we can keep it just for others to use
it as a reference.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

