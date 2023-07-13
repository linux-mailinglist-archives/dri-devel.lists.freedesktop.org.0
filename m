Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2BD7524BC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 16:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFC610E6E9;
	Thu, 13 Jul 2023 14:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195EA10E6E9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689257587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATYcu61NcKBFBZNjA8FHDlmR2BmhqC05nng2Fk5LQdk=;
 b=IJEOI+Ym71dgPW+eGo4J9V52a62g/Xvzop+ibeFbZ6/7sb/UoRwJ10khKAgkU9Rnm9Or+I
 Q5g9AW0Bn/qIGLcUZUFYSDVQSWU5kXI00dcTyF8n8Mo27AgC2yMZ6Vp6JflWmykzhO+MRI
 siXAWWfZHE9iWt6wMMjhD5UclhGBqMo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-msiSVqAeO_izTOBcori3Ow-1; Thu, 13 Jul 2023 10:13:01 -0400
X-MC-Unique: msiSVqAeO_izTOBcori3Ow-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fc00d7d62cso4238915e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689257564; x=1691849564;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ATYcu61NcKBFBZNjA8FHDlmR2BmhqC05nng2Fk5LQdk=;
 b=ljxS5N0ufNjjpNTFock8rXTMsDlLsplvT2l88QPnZJAKI1q+5NfXqO7sbXF3gyQaqW
 Zmd2lMPC5eoFnHWlZ/lP7F9GLUE/ekl+X8d4tB0iKzpz8o3LxCCQlh8aQ3PJYSKRRbIW
 b3WZGLXebVVu/wGT7KBN+mmUqS97y6kc2YMXlT2KYtaVOhbpMs5y//FPLA/8IQRH0T9I
 gAKuhZENCZQD5U+6arllGRia/xWnXZSXa7Q93PZk6Pa00NWoSx0yo8v0SFF2hXDzu5kr
 R+7MNSbA5m0hh2gy1dfJwm0OiNMrO0ZLUxkASP2ZMxhkW1amPaauzzEmeZ65hipAnV5l
 hxAw==
X-Gm-Message-State: ABy/qLZMoVXIMYtQsIuThHSN7ErQJZmbGp+H+YDUBfBWIQ0SPivA3yLP
 dcKVVizhALOYeQ0Mq9nCbxlCh730p6wGde4nW9sGuPd6ZcVujW5p6A88Qc+TaxAMACwn2ke0m/k
 EOOmpJOjNFAsSU/873qlsUwCKA4AE
X-Received: by 2002:a05:600c:20c4:b0:3fb:e054:903f with SMTP id
 y4-20020a05600c20c400b003fbe054903fmr1518660wmm.36.1689257563793; 
 Thu, 13 Jul 2023 07:12:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGTO8tKXWD2Nu2+1I1N2SiNyFhI/CQYeIdOuzfASSUpHgauIrg4LbcsK8lqHcU5wl1qnbOXhg==
X-Received: by 2002:a05:600c:20c4:b0:3fb:e054:903f with SMTP id
 y4-20020a05600c20c400b003fbe054903fmr1518639wmm.36.1689257563446; 
 Thu, 13 Jul 2023 07:12:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q4-20020adfcd84000000b0031134bcdacdsm8140605wrj.42.2023.07.13.07.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 07:12:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 4/5] drm/ssd130x: Don't allocate buffers on each
 plane update
In-Reply-To: <CAMuHMdWmJjGX+s=z0bBMDz0=zqZJHrGhkzWyRkmstS0eW9aiTg@mail.gmail.com>
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-5-javierm@redhat.com>
 <CAMuHMdVXhi52KfpCmnum+9t74UWP+AOLE95xQU6VV6Nz=VHk1Q@mail.gmail.com>
 <87fs5sgdfh.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWmJjGX+s=z0bBMDz0=zqZJHrGhkzWyRkmstS0eW9aiTg@mail.gmail.com>
Date: Thu, 13 Jul 2023 16:12:42 +0200
Message-ID: <87cz0vhpd1.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,
>
> On Thu, Jul 13, 2023 at 3:21=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> > On Fri, Jun 9, 2023 at 7:09=E2=80=AFPM Javier Martinez Canillas
>> > <javierm@redhat.com> wrote:
>> >> The resolutions for these panels are fixed and defined in the Device =
Tree,
>> >> so there's no point to allocate the buffers on each plane update and =
that
>> >> can just be done once.
>> >>
>> >> Let's do the allocation and free on the encoder enable and disable he=
lpers
>> >> since that's where others initialization and teardown operations are =
done.
>> >>
>> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> >> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> >> ---
>> >>
>> >> (no changes since v1)
>> >
>> > Thanks for your patch, which is now commit 49d7d581ceaf4cf8
>> > ("drm/ssd130x: Don't allocate buffers on each plane update") in
>> > drm-misc/for-linux-next.
>> >
>> >> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> >> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> >> @@ -701,14 +709,22 @@ static void ssd130x_encoder_helper_atomic_enabl=
e(struct drm_encoder *encoder,
>> >>                 return;
>> >>
>> >>         ret =3D ssd130x_init(ssd130x);
>> >> -       if (ret) {
>> >> -               ssd130x_power_off(ssd130x);
>> >> -               return;
>> >> -       }
>> >> +       if (ret)
>> >> +               goto power_off;
>> >> +
>> >> +       ret =3D ssd130x_buf_alloc(ssd130x);
>> >
>> > This appears to be too late, causing a NULL pointer dereference:
>> >
>>
>> Thanks for reporting this issue.
>>
>> > [   59.302761] [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
>> > [   59.304231] [<c0304200>]
>> > ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
>> > [   59.305716] [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
>> >
>>
>> I wonder how this could be too late. I thought that the encoder
>> .atomic_enable callback would be called before any plane .atomic_update.
>>
>> > Bailing out from ssd130x_update_rect() when data_array is still NULL
>> > fixes that.
>> >
>>
>> Maybe we can add that with a drm_WARN() ? I still want to understand how
>> a plane update can happen before an encoder enable.
>
> Full log is:
>
>     ssd130x-i2c 0-003c: supply vcc not found, using dummy regulator
>     [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
>     ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
> and format(R1   little-endian (0x20203152))
>     Unable to handle kernel NULL pointer dereference at virtual address 0=
0000000
>     Oops [#1]
>     CPU: 0 PID: 1 Comm: swapper Not tainted
> 6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
>     epc : ssd130x_update_rect.isra.0+0x13c/0x340
>      ra : ssd130x_update_rect.isra.0+0x2bc/0x340
>     epc : c0303d90 ra : c0303f10 sp : c182b5b0
>      gp : c06d37f0 tp : c1828000 t0 : 00000064
>      t1 : 00000000 t2 : 00000000 s0 : c182b600
>      s1 : c2044000 a0 : 00000000 a1 : 00000000
>      a2 : 00000008 a3 : a040f080 a4 : 00000000
>      a5 : 00000000 a6 : 00001000 a7 : 00000008
>      s2 : 00000004 s3 : 00000080 s4 : c2045000
>      s5 : 00000010 s6 : 00000080 s7 : 00000000
>      s8 : 00000000 s9 : a040f000 s10: 00000008
>      s11: 00000000 t3 : 00000153 t4 : c2050ef4
>      t5 : c20447a0 t6 : 00000080
>     status: 00000120 badaddr: 00000000 cause: 0000000f
>     [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
>     [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
>     [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
>     [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
>     [<c02f94fc>] commit_tail+0x190/0x1b8
>     [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0

Thanks for the log, so I think the problem is that the default struct
drm_mode_config_helper_funcs .atomic_commit_tail is
drm_atomic_helper_commit_tail():

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic_h=
elper.c#L1710

That helper calls drm_atomic_helper_commit_planes() and attempts to commit
the state for all planes even for CRTC that are not enabled. I see that
there is a drm_atomic_helper_commit_tail_rpm() helper that instead calls:

drm_atomic_helper_commit_planes(dev, old_state, DRM_PLANE_COMMIT_ACTIVE_ONL=
Y),
which I thought that was the default behaviour.

Can you please try the following change [0] ? If that works then I can
propose as a proper patch.

[0]:
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ss=
d130x.c
index afb08a8aa9fc..c543caa3ceee 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -795,6 +795,10 @@ static const struct drm_mode_config_funcs ssd130x_mode=
_config_funcs =3D {
        .atomic_commit =3D drm_atomic_helper_commit,
 };
=20
+static const struct drm_mode_config_helper_funcs ssd130x_mode_config_helpe=
rs =3D {
+        .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
+};
+
 static const uint32_t ssd130x_formats[] =3D {
        DRM_FORMAT_XRGB8888,
 };
@@ -923,6 +927,7 @@ static int ssd130x_init_modeset(struct ssd130x_device *=
ssd130x)
        drm->mode_config.max_height =3D max_height;
        drm->mode_config.preferred_depth =3D 24;
        drm->mode_config.funcs =3D &ssd130x_mode_config_funcs;
+       drm->mode_config.helper_private =3D &ssd130x_mode_config_helpers;
=20
        /* Primary plane */
=20
--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

