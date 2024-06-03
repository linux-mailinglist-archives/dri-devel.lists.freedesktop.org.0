Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F98D7A73
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 05:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B1E10E26C;
	Mon,  3 Jun 2024 03:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nl6hAAMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFA310E26C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 03:29:15 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52b87e8ba1eso3583988e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 20:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717385354; x=1717990154;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqoXXfkLNaBeFUlnpo3xHv3wq1HsyXPs641ijeJqfYU=;
 b=nl6hAAMTEFUW9wkVICvtgR3+DPon/HIbpHh5qqoGfrPTLC/wgFoi5Wvdonvg8YJLBP
 1tQfSB1QpJI5tiF3tfgEQInDCWq6KkI7Rz2hjDyVTGcYvG1BB5MBUvy1nBWpnvWC1SOE
 nX7TWND+Pp7J6GDtM2mnV/R3sewgJUom4Yi14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717385354; x=1717990154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gqoXXfkLNaBeFUlnpo3xHv3wq1HsyXPs641ijeJqfYU=;
 b=GlMiasRjcow9oqSnZJ4SH3GMZX2IdKHEzq+ahCnX0NtNAWbE6BKVgzfZSryb5hW02p
 cFksizAgUzwxqjM3JmCOuKaI45yrUiK/9eW/sdgONVVpriG5Vn4fcnOHHrWzQ3HvsE5m
 tjJMwlHNBuoeGj4OczV2UAhtgkpJhkXhYGw0vo21VVG+5K7LoBaw9CJQBKYmEcLUuNxx
 lVxsDKhctJYFyB2IwdLIl2vNqyvdulHnTO8ME/g0UI+NxwECPbt0ZE4R9HfP8hosWsAI
 Q9o7GNy0oTwjM4B8oB1p7HI/QE8rx6dyT663trySiQQzsTe0R4rN9HGppMoGHuqqqjIi
 xXzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL2RfDz1LrAiC05JWai1Sphd3XqBlUWGV95xwppnI4vJBSqW7la1PKOAbEXLUfWIBgW+j8BYmAP67422UYn7QWuXecL/KGfhYZabbbHAP+
X-Gm-Message-State: AOJu0Yz0yI+JZ8a0+Tt+02tiSuwpnLY0g5tI+h5YI/AGEig+yunoY7Yf
 p5WrPmGL+0kMrl5PoPabMXQqk/4Uco/SfHzAfBANp4d0Urj6+f5rVJKlvKqaymZFW15dcU6zzUp
 lfOSjlR1G46kQzY0JZ2jj79Juh/JlWYvpdggj
X-Google-Smtp-Source: AGHT+IEDtRtBaOGSJnBChD4ejorRQ3d5tt8uQF6LU8aQIF4mUQzWnXLmkerka4FGapEkwbPEkl429n/sIzWje66CjaU=
X-Received: by 2002:a05:6512:3145:b0:52b:7a3d:1e12 with SMTP id
 2adb3069b0e04-52b896d9115mr5870986e87.65.1717385353646; Sun, 02 Jun 2024
 20:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-5-wenst@chromium.org>
 <efdacd820d13368816973f57c4a817e039ec4a2d.camel@imgtec.com>
In-Reply-To: <efdacd820d13368816973f57c4a817e039ec4a2d.camel@imgtec.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 3 Jun 2024 11:29:02 +0800
Message-ID: <CAGXv+5EMMNCbxaBqiBSQwGrQt-0KXWAtJU54K20sUU8PBh8faQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/imagination: Add compatible string entry for
 Series6XT
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
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

On Fri, May 31, 2024 at 7:18=E2=80=AFPM Frank Binns <Frank.Binns@imgtec.com=
> wrote:
>
> On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
> > of the Series6XT, another variation of the Rogue family of GPUs.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/gpu/drm/imagination/pvr_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/im=
agination/pvr_drv.c
> > index 5c3b2d58d766..3d1a933c8303 100644
> > --- a/drivers/gpu/drm/imagination/pvr_drv.c
> > +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> > @@ -1475,6 +1475,7 @@ pvr_remove(struct platform_device *plat_dev)
> >
> >  static const struct of_device_id dt_match[] =3D {
> >       { .compatible =3D "img,img-axe", .data =3D NULL },
> > +     { .compatible =3D "img,powervr-6xt", .data =3D NULL },
>
> I assume that by adding this to the list of supported devices we're essen=
tially
> freezing the existing uapi. This concerns me, as we've not yet started ru=
nning
> Vulkan conformance on any Series6XT GPUs and there's a chance we may need=
 to
> make some tweaks.
>
> I'm not really sure what the accepted approach is to hardware enablement =
/
> experimental support. I'm not sure if it's sufficient to hide support beh=
ind a
> Kconfig option and/or module parameter or whether we just have to hold th=
is
> patch back for the time being.

I guess this is more of a question for the DRM maintainers.
Added a couple Panfrost/Panthor folks for ideas.


ChenYu

> Thanks
> Frank
>
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, dt_match);
