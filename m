Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C3CADFF7
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 19:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AA610E4DD;
	Mon,  8 Dec 2025 18:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JYATwXrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D12610E4DF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 18:28:14 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-64308342458so4303559d50.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 10:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765218493; x=1765823293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ls/ksszl6ioqrg9lO7CSYmgQB9BiV4HHuNq2fdpuR2w=;
 b=JYATwXrZNhI+SxX0Kz2dyXpOTuRe53lUZLTOMSFIm3eu+SWq6I9T9e4lvO/KpsK/EH
 obonprG9pRiPIQ+HO0Xeyv3a3NFm2b9ZvVFkRQacQgsROagehkPODnE/fbpqaiCOPKoJ
 MoCvnkvLxwbHDiKWxd8JuPQQapI38f2quETFNqeYKouvl6JIQsqriOv0r9MlKP1nr4QC
 FxouUnFTHCDSCi/yP9oKTfbZxTbgquHHFgId9cIw2VSLeSzYWsFSt88mgR9bmah5n1G3
 ne7x+0a2xqZ9IRiV/r0dhtVpxcoktLa7kSs1ltoZLWiTS7M5WvRO8v/8L1jaNevDRS6J
 QzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765218493; x=1765823293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ls/ksszl6ioqrg9lO7CSYmgQB9BiV4HHuNq2fdpuR2w=;
 b=AfC5AlckHfk++RA8qQNWrIfPdhggBNs3nNRO5nyEsJdu++txKRXa/D9Dri/ubrZsc0
 +8ihOx2HgrUqEmYxz4zcQIeMxrmZDD4Nru1p3VdrWo+42b9duy1oa4JruhXZ9KEv1ifz
 rdrg4BT2E4D7Iy1+rxHO7dU/75Aa4ZS8QQBLd1FA9nkTG3zgVY1dDBDUY1GAqG06CzL+
 sIkplj1+9dEP6OXvby8BJ56SOvVOQ3vJr9xDP37MKljHL1Ojj6z82m8QvxIdXSa4RVYL
 hZyVnDOCihuXMnoV2O9tmJ1cd+UujnfgIvHbbmEbvmO5OHwWWPeWt6dNFIuKSPlCvKvv
 4RPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmGIE0URwvkylQV5cXEqhLTsmYEvQKgBpQlvQYYux/0vzg/AF4B3wT72loGVkoXFl7N+2X6cmiuow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTalP/JvIkBUHKX47PDSCD4p2aw3UeAPcWDmqEriLDmxyNFVLt
 lLHaN2J+k+9uZVPOJ3n1vpXr+PlvWQ7w88XkDAb4daiD19oJoPlVa177u9vOsf45UI9g1WjRLqN
 0aZk8nDn93ViKKkjq+dS15TPkHlplWsA=
X-Gm-Gg: ASbGnct6tLdD+m+gP0XisDRkVJjfnKTT81lqUUjLwGtrMYWKmrxxEJrVUal6RZAvGsW
 lwvtw1NL2TL84dz79S34DjeLfcRbvfpyzmixdR8anzcJxGgjOmDPSUC+sm1iU0tx45FbCUyiW7R
 XzMqdWw4kKfZBNnX8e/JJ2YNiNPJLrhBwDhnH67j8JTkDz2FQNcSvb5k4cIdEpvFinOX3fy0eap
 DPJrrW5mcryWWvui61CSQoTSW3WHLZwJ9nZ9iyZaqqgdvn1Tdy7Wa/k+5lFmPo8iZwFZ90GjvAc
 vJBZJZ8uxrCzrf9ZH/wtok5YfvmJiQ==
X-Google-Smtp-Source: AGHT+IEDBoYtuG1nRK/Q5TQqZmHJAxQRQoA+6D3GwVy0mEaSmGOrnfYYdm/spoa6Oqh3PLWMvPchMocG2/MVb24AtHI=
X-Received: by 2002:a05:690e:1552:20b0:63f:c0ce:f158 with SMTP id
 956f58d0204a3-6444e761b91mr6094700d50.30.1765218493328; Mon, 08 Dec 2025
 10:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <15112867.uLZWGnKmhe@workhorse>
 <CAPaKu7SQP9jYmq5UCA98_YmO50st6ChBjYNjYNON7-YAWozzaQ@mail.gmail.com>
 <10765657.nUPlyArG6x@workhorse>
In-Reply-To: <10765657.nUPlyArG6x@workhorse>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 8 Dec 2025 10:28:00 -0800
X-Gm-Features: AQt7F2r2S28GdmeXBLlJb-WAM41iXk4hlT-Q4qukY7InsFS5GG5-XhAKyb9JdYo
Message-ID: <CAPaKu7SjBemV8AGrtr-n22_Pq-2CSmeD-eH+B=3mA0B_qLQJ=A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Sun, Dec 7, 2025 at 11:49=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Friday, 5 December 2025 22:16:44 Central European Standard Time Chia-I=
 Wu wrote:
> > On Fri, Dec 5, 2025 at 2:48=E2=80=AFAM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > On Thursday, 4 December 2025 21:21:08 Central European Standard Time =
Chia-I Wu wrote:
> > > > On Wed, Dec 3, 2025 at 6:04=E2=80=AFAM Nicolas Frattaroli
> > > > <nicolas.frattaroli@collabora.com> wrote:
> > > > >
> > > > > Mali GPUs have three registers that indicate which parts of the h=
ardware
> > > > > are powered and active at any moment. These take the form of bitm=
aps. In
> > > > > the case of SHADER_PWRACTIVE for example, a high bit indicates th=
at the
> > > > > shader core corresponding to that bit index is active. These bitm=
aps
> > > > > aren't solely contiguous bits, as it's common to have holes in th=
e
> > > > > sequence of shader core indices, and the actual set of which core=
s are
> > > > > present is defined by the "shader present" register.
> > > > >
> > > > > When the GPU finishes a power state transition, it fires a
> > > > > GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> > > > > received, the PWRACTIVE registers will likely contain interesting=
 new
> > > > > information.
> > > > I am seeing
> > > >
> > > >    irq/342-panthor-412     [000] .....   934.526754: gpu_power_acti=
ve:
> > > > shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0
> > > >    irq/342-panthor-412     [000] .....   936.640356: gpu_power_acti=
ve:
> > > > shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0
> > > >
> > > > on a gpu-bound test. It does not look like collecting samples on
> > > > GPU_IRQ_POWER_CHANGED_ALL gives too much info.
> > >
> > > On what GPU and SoC is that? If it's MT8196 then I wouldn't be
> > > surprised if it just broke that hardware register, considering
> > > what it did to the SHADER_PRESENT register.
> > Indeed I was on mt8196.
>
> I don't have much faith in the Mali integration of that SoC being
> representative of how the Mali hardware is supposed to work. The
> SHADER_PRESENT thing is just the tip of the iceberg, I've also
> noticed while developing mtk-mfg-pmdomain that it seemingly messes
> with the Mali GPU's internal MCU from the GPUEB depending on the
> commands you send it, and can get it into a broken state with
> enough luck.
>
> Check if the registers ever read anything but 0, e.g. by dumping
> them from sysfs like this:
>
> ---
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index d1d4c50da5bf..b0e67dc17c92 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1678,8 +1678,69 @@ static ssize_t profiling_store(struct device *dev,
>
>  static DEVICE_ATTR_RW(profiling);
>
> +static ssize_t print_active_bitmask(char *buf, ssize_t len, u64 present,=
 u64 active)
> +{
> +       unsigned int i =3D 0;
> +       u64 bit;
> +
> +       while (present) {
> +               bit =3D BIT(i);
> +               if (present & bit) {
> +                       present &=3D ~bit;
> +                       len +=3D sysfs_emit_at(buf, len, "%s", (active & =
bit) ? "1" : "0");
> +               } else {
> +                       len +=3D sysfs_emit_at(buf, len, "_");
> +               }
> +               i++;
> +       }
> +
> +       return len;
> +}
> +
> +static ssize_t power_active_show(struct device *dev, struct device_attri=
bute *attr,
> +                                char *buf)
> +{
> +       struct panthor_device *ptdev =3D dev_get_drvdata(dev);
> +       ssize_t len =3D 0;
> +       u64 present;
> +       int ret;
> +
> +       if (pm_runtime_suspended(ptdev->base.dev))
> +               return sysfs_emit(buf, "Shader:\t0\nTiler:\t0\nL2:\t0\n")=
;
> +
> +       ret =3D pm_runtime_resume_and_get(ptdev->base.dev);
> +       if (ret)
> +               return ret;
> +
> +       len +=3D sysfs_emit_at(buf, len, "Shader:\t");
> +       len +=3D print_active_bitmask(buf, len, gpu_read64(ptdev, GPU_SHA=
DER_PRESENT),
> +                                   gpu_read64(ptdev, SHADER_PWRACTIVE));
> +       len +=3D sysfs_emit_at(buf, len, "\n");
> +
> +       present =3D gpu_read64(ptdev, GPU_TILER_PRESENT);
> +       if (present =3D=3D 0x1) /* "Implementation defined", just try to =
dump all */
> +               present =3D U64_MAX;
> +       len +=3D sysfs_emit_at(buf, len, "Tiler:\t");
> +       len +=3D print_active_bitmask(buf, len, present, gpu_read64(ptdev=
, TILER_PWRACTIVE));
> +       len +=3D sysfs_emit_at(buf, len, "\n");
> +
> +       present =3D gpu_read64(ptdev, GPU_L2_PRESENT);
> +       if (present =3D=3D 0x1) /* "Implementation defined", just try to =
dump all */
> +               present =3D U64_MAX;
> +       len +=3D sysfs_emit_at(buf, len, "L2:\t");
> +       len +=3D print_active_bitmask(buf, len, present, gpu_read64(ptdev=
, L2_PWRACTIVE));
> +       len +=3D sysfs_emit_at(buf, len, "\n");
> +
> +       pm_runtime_put(ptdev->base.dev);
> +
> +       return len;
> +}
> +
> +static DEVICE_ATTR_RO(power_active);
> +
>  static struct attribute *panthor_attrs[] =3D {
>         &dev_attr_profiling.attr,
> +       &dev_attr_power_active.attr,
>         NULL,
>  };
> ---
>
> If they always read 0 regardless of whether you're running a GPU
> workload or not, then it's just not properly wired up.
They can be non-zero.
>
> > >
> > > On RK3588 (v10), GPU_IRQ_POWER_CHANGED_ALL reliably fires when
> > > there is new information available in those registers. I haven't
> > > tried on MT8196 (v13) yet because that still doesn't boot with
> > > mainline so testing anything is a pain.
> > >
> > > I don't have any v12 or v11 hardware to test with. From what I
> > > understand, there's no open enough platform to do v11 testing on,
> > > just the Pixel 8 and Pixel 9. I could look into the Cix SoC for v12
> > > though some day, but I don't own one at the moment.
> > >
> > > >
> > > > I think they are more useful to be collected periodically, such tha=
t
> > > > we know that in the past X seconds, Y out of a total of Z samples
> > > > indicates activities. That's best done in userspace, and panthor's
> > > > role should be to provide an uapi such as
> > > > https://lore.kernel.org/all/cover.1743517880.git.lukas.zapolskas@ar=
m.com/.
> > >
> > > This wouldn't give you information on the time a power transition has
> > > completed, which is one of the motivations. A periodically collected
> > > PWRACTIVE would just be roughly correlated to how busy the GPU is,
> > > which isn't very useful additional information as the performance
> > > counters themselves are likely a better source of that kind of info.
> > {SHADER,TILER,L2}_READY might be more appropriate if you want to trace
> > power transitions?
>
> Depends, the documentation I have access to isn't explicit about
> what "READY" means. Is a busy core non-ready? Is there ever a case
> where a significant number of cores are READY but not PWRACTIVE?
>
> I can answer the first question with some more poking on RK3588,
> but for the latter a simple experiment on one piece of hardware
> isn't going to answer it. Plus, the core being active will probably
> be more interesting than it either sitting idle but powered or
> actually doing work.
From what I can see, *_READY are non-zero when powered and *_PWRACTIVE
are non-zero when powered and busy on mt8196.

If you want to generate a trace event upon GPU_IRQ_POWER_CHANGED_ALL,
*_READY seems more appropriate at least on mt8196. If you want to
track busyness with *_PWRACTIVE, you probably need to sample
periodically.

>
> >
> > >
> > > What I need to do is restrict this to <=3D v13 in the next revision
> > > however, because v14 reworks this stuff.
> > >
> > > Kind regards,
> > > Nicolas Frattaroli
> > >
> > >
> >
>
>
>
>
