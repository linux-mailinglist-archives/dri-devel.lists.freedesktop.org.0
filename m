Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10834AEEF96
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 09:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB4C10E26E;
	Tue,  1 Jul 2025 07:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XEmD0tPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F0010E23F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 00:35:38 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-6116d9bb6ecso1577782eaf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 17:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751330137; x=1751934937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWI4N10Qll6H9gLi0COrUUb+8NPRB7fsuPXUb+Y1frk=;
 b=XEmD0tPKeeep+fAp2rM60+ixKat/vqtD61GgaDsn1NehIEe76Vre87HrWI6Ph4kPgv
 Hc7XqzyayjYlmdmcf25eekkGSA+hn3TVE182qkTEl+/+FX+de6RLMiP4jrDBQoP6IKdW
 b6cceboWUosrSX939il1208MkfxWGT+LqVblpypCGYphA51OLTzTcaFlGRVG4o6iDffA
 isYkYRqI6JgqadU+SPG72M+5rewnopA1G+OiERiPThmZgPRYc/atw6NjiWa2ObqzIHBJ
 FEwEIEN6Ve6/71n/FnhxN8RzD12EbE3OsQjGsUMGKDC8RP3i89YJ9qiy7RS5dFKJCAbV
 IyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751330137; x=1751934937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWI4N10Qll6H9gLi0COrUUb+8NPRB7fsuPXUb+Y1frk=;
 b=e0d6CuUXhlG46SydMw5Yg0RAhA09FJS8u2LaHdmiOaiCmFCiQPP4qGw/Dd3kGvTEM1
 70x0SaTKGy2mL9Jz72DFn0A0XOD7LLYch1CvpfPzLjhI99a/3MoWCakwQc9NJFGmCbZQ
 sFlL+nG3y5F8a7g0RaZkE3DaGQ0V8qsBMw/o1vU1PYTAHJVYNEvbV8c2DtFsJinnVO0s
 AG3gbYx9SSyrLMwtv7JK1xKnRMDD7F7UmeGeSSiIYm0gXbKrT3AXEnGSknYra94vXfOz
 2Scrpeviz4P/muwrQowmKH0Mjw2P8BOuq/uJZNDGwCHO6AcNVqKoQ1VFkdyFSTjI8xnl
 j/Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLrX7KVhSO/FFEGz0Nhz46QviM8o5d2O3XU7lpFWJ8iV9DCwARVCuheHXxQpTHUWE9HoQ/XF5/0QE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBZLvA+sHu6hAWUnrR9Vz90e5COWT9+w7Le3Ykgdjt+BAoffIZ
 xw4yYTi9sTc993jCZmPQ6MqbHqfUU0RGgruCrCeVs4pFTclJ9s3dwJR6wZGjzRuq4mRGlNFbeRF
 dijnmcKXDR7rUK/7iZDXYqsu3IACbP2A=
X-Gm-Gg: ASbGncvJBrrXJC8pR7gDpQIa2Z6VPZRmX/VaURJCnID19PIfBijptL2CH0jhb+t8CfN
 HSp5TyhIz2aG6aXfM+6FnwnVZZzsoPmve3Xfi9jBhbGRKuh/+mO6zpRtO7uF/2VOnbvWSPYbX2b
 rfHFouqBNBMiKvMCuS3xaXK38CSxr352zhhuKspeqmUuM=
X-Google-Smtp-Source: AGHT+IFVdRd51zzo2gagjFpXgTBNdm7rEQILgwm7pFT36wENCbxr5fUARgOqLp4Zs15XgdjE9e6aRvtdJxw6++vpPx8=
X-Received: by 2002:a05:6820:1b0e:b0:611:b1c7:24b with SMTP id
 006d021491bc7-611b8ed608dmr9097448eaf.0.1751330137297; Mon, 30 Jun 2025
 17:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250629233509.291786-1-marcelomoreira1905@gmail.com>
 <2025063006-recopy-playmaker-562d@gregkh>
In-Reply-To: <2025063006-recopy-playmaker-562d@gregkh>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 30 Jun 2025 21:35:25 -0300
X-Gm-Features: Ac12FXz_69Zfj20sM9ZCsC3y4DQamsyQCYCGa35fTV1D9-WfSu36yRgghA9KVwI
Message-ID: <CAPZ3m_gDqVeyY9x838tUHBuEjXZrANLgqiJ=+Cn8DQYeCfSnGg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: replace scnprintf with sysfs_emit_at
 in debugfs show
To: Greg KH <greg@kroah.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 01 Jul 2025 07:16:45 +0000
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

Em seg., 30 de jun. de 2025 =C3=A0s 02:09, Greg KH <greg@kroah.com> escreve=
u:
>
> On Sun, Jun 29, 2025 at 08:35:09PM -0300, Marcelo Moreira wrote:
> > Update the receive_timing_debugfs_show() function to utilize
> > sysfs_emit_at() for formatting output to the debugfs buffer.
> > This change adheres to the recommendation outlined
> > in Documentation/filesystems/sysfs.rst.
> >
> > This modification aligns with current sysfs guidelines.
>
> But this isn't a sysfs file, it's a debugfs file, so why are you calling
> sysfs_emit_at()?
>

You're right, thanks Greg.

> >
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 46 ++++++++++++++---------------
> >  1 file changed, 22 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/brid=
ge/ite-it6505.c
> > index 1383d1e21afe..98bea08a14e4 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -3427,37 +3427,35 @@ static ssize_t receive_timing_debugfs_show(stru=
ct file *file, char __user *buf,
> >       struct it6505 *it6505 =3D file->private_data;
> >       struct drm_display_mode *vid;
> >       u8 read_buf[READ_BUFFER_SIZE];
> > -     u8 *str =3D read_buf, *end =3D read_buf + READ_BUFFER_SIZE;
> > -     ssize_t ret, count;
> > +     ssize_t ret;
> > +     ssize_t count =3D 0;
> >
> >       if (!it6505)
> >               return -ENODEV;
> >
> >       it6505_calc_video_info(it6505);
> >       vid =3D &it6505->video_info;
> > -     str +=3D scnprintf(str, end - str, "---video timing---\n");
> > -     str +=3D scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
> > -                      vid->clock / 1000, vid->clock % 1000);
> > -     str +=3D scnprintf(str, end - str, "HTotal:%d\n", vid->htotal);
> > -     str +=3D scnprintf(str, end - str, "HActive:%d\n", vid->hdisplay)=
;
> > -     str +=3D scnprintf(str, end - str, "HFrontPorch:%d\n",
> > -                      vid->hsync_start - vid->hdisplay);
> > -     str +=3D scnprintf(str, end - str, "HSyncWidth:%d\n",
> > -                      vid->hsync_end - vid->hsync_start);
> > -     str +=3D scnprintf(str, end - str, "HBackPorch:%d\n",
> > -                      vid->htotal - vid->hsync_end);
> > -     str +=3D scnprintf(str, end - str, "VTotal:%d\n", vid->vtotal);
> > -     str +=3D scnprintf(str, end - str, "VActive:%d\n", vid->vdisplay)=
;
> > -     str +=3D scnprintf(str, end - str, "VFrontPorch:%d\n",
> > -                      vid->vsync_start - vid->vdisplay);
> > -     str +=3D scnprintf(str, end - str, "VSyncWidth:%d\n",
> > -                      vid->vsync_end - vid->vsync_start);
> > -     str +=3D scnprintf(str, end - str, "VBackPorch:%d\n",
> > -                      vid->vtotal - vid->vsync_end);
> > -
> > -     count =3D str - read_buf;
> > +     count +=3D sysfs_emit_at(read_buf, count, "---video timing---\n")=
;
> > +     count +=3D sysfs_emit_at(read_buf, count, "PCLK:%d.%03dMHz\n",
> > +                     vid->clock / 1000, vid->clock % 1000);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HTotal:%d\n", vid->hto=
tal);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HActive:%d\n", vid->hd=
isplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HFrontPorch:%d\n",
> > +                     vid->hsync_start - vid->hdisplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HSyncWidth:%d\n",
> > +                     vid->hsync_end - vid->hsync_start);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HBackPorch:%d\n",
> > +                     vid->htotal - vid->hsync_end);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VTotal:%d\n", vid->vto=
tal);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VActive:%d\n", vid->vd=
isplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VFrontPorch:%d\n",
> > +                     vid->vsync_start - vid->vdisplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VSyncWidth:%d\n",
> > +                     vid->vsync_end - vid->vsync_start);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VBackPorch:%d\n",
> > +                     vid->vtotal - vid->vsync_end);
> > +
> >       ret =3D simple_read_from_buffer(buf, len, ppos, read_buf, count);
> > -
>
> Shouldn't this all be using seq_print() instead?
>
> Again, don't use sysfs_emit*() functions for non-sysfs files, as you do
> NOT know the size of the buffer here (hint, it's not the same).
>
> And, your patch added trailing whitespace, did you forget to run it
> through checkpatch.pl before sending it?


Thanks again for the clarification, I'll be more attentive for future
submissions.

Specifically for this patch I forgot to run checkpatch, sorry. Sorry
for all the inconvenience.

Thanks Greg!

--=20
Cheers,
Marcelo Moreira
