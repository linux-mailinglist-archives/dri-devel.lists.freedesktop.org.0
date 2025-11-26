Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB33C89F3E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6535D10E04B;
	Wed, 26 Nov 2025 13:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l8a+ha1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2879310E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:13:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E6014437C3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5E6C2BC9E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764162796;
 bh=kQM5qsnL//ZJkZMh9tLs3eLdFe/nlMcmYnI0k3VYMm0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l8a+ha1eeH2yA0oILirGauWCC6U7Jx/JoOk7ADTxriXNhASuwUmLlWiCs5kYNm4Op
 6XNxrEostauqV/8PQcpVLuQCwEhH1uTFPcnmxqy5jBQ+psmfrEgpVU8TniZmioQ3st
 MEPwMoPS7TOoV3EUwGm5UAUebojwpX7G6ITzQx0FWjPc2s4uXXmu1FOrgnNbVA4ReK
 8srbPfocSbBdiOKPAJCRWnSbsIwIkDXhPBsRupFGoI/BZqXvYDjSMCB2rr62X1l0hE
 VeMzXT+KTl6+IMeAh5tiMOIBT3chQIqCrZzcBwzT49zz341nTDd3LN0ZEz7UwkwA/l
 mpqDX1V4Dpt+A==
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-595825c8eb3so6783448e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 05:13:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTGlYYtEbJ8wl45VkjuVvlN+QNAS119zOO9epRtVvx0gX5hTalNPwhz8UNTZakzUtTi60959iS1E0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2skntKxgsGhChkcXuk9UWOXLkUaAe0BpIcRPl1Db/cESzP05m
 BBYs27hNi1zyseDfp2sQ/UTFavr+PX1RajgdQBZgfp8VSMnimkg/YLxP2k2P51zns1v1pnpyTg/
 bsonmb/I+UDz3kPCy7cS6qv3Rrh7t3YFFXd9WxR83ug==
X-Google-Smtp-Source: AGHT+IGnxfuv/w8mMVX2aB+rHOQLgECwTUIQeAqwasXlnyq5xKWyJzJsqDqtuQCV9ee/0edID7j/VfV2gMgsRG40dFc=
X-Received: by 2002:a05:6512:3a82:b0:594:282d:f40c with SMTP id
 2adb3069b0e04-596b5277be8mr2625488e87.31.1764162795120; Wed, 26 Nov 2025
 05:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
 <2023112739-willing-sighing-6bdd@gregkh>
In-Reply-To: <2023112739-willing-sighing-6bdd@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 26 Nov 2025 14:13:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
X-Gm-Features: AWmQ_bnz6SpAZkE0enjhk9B-isNCGLXdzB_nbMX-AJzZrxJLh-qpR4CJt3SMChk
Message-ID: <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>, rafael@kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, 
 sfr@canb.auug.org.au, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org, 
 linus.walleij@linaro.org, Liu Ying <victor.liu@nxp.com>
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

On Mon, Nov 27, 2023 at 7:21=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Nov 27, 2023 at 05:38:13PM +0100, Maxime Ripard wrote:
> > Greg, Rafael,
> >
> > On Mon, Nov 27, 2023 at 01:14:13PM +0800, Liu Ying wrote:
> > > Export device_is_dependent() since the drm_kms_helper module is start=
ing
> > > to use it.
> > >
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v2:
> > > * Newly introduced as needed by patch 2.
> > >
> > >  drivers/base/core.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > index 67ba592afc77..bfd2bf0364b7 100644
> > > --- a/drivers/base/core.c
> > > +++ b/drivers/base/core.c
> > > @@ -328,6 +328,7 @@ int device_is_dependent(struct device *dev, void =
*target)
> > >     }
> > >     return ret;
> > >  }
> > > +EXPORT_SYMBOL_GPL(device_is_dependent);
> >
> > So, a committer just applied this to drm-misc-fixes without your
> > approval. Could you ack it? If you don't want to, we'll fix it.
>
> Wait, why exactly is this needed?  Nothing outside of the driver core
> should be needing this function, it shouldn't be public at all (I missed
> that before.)
>

Hi Greg!

Sorry for reviving this old thread but I stumbled upon it when looking
for information on whether anyone ever tried to export
device_is_dependent() before.

I have a use-case where I think I need to check if two devices are
linked with a device link. I assume you'll prove me wrong. :)

The reset-gpio driver is a reset control driver that mediates sharing
a reset GPIO (defined as a standardized reference fwnode property
"reset-gpios") among multiple users. reset-gpio auxiliary devices are
instantiated from reset core when it detects a consumer trying to get
a reset-control handle but there's no "resets" reference on the
consumer's fwnode, only "reset-gpios".

It makes sense for reset core to create a device link between the
auxiliary reset-gpio device (the supplier) and the reset consumer
because this link is not described in firmware - only the link between
the consumer AND the GPIO controller.

Now in order to make gpiolib-shared.c code (generic support for shared
GPIOs) happy, I need to handle the side effects of interacting with
reset-gpio which does a similar thing. To that end, I need to know if
given GPIO controller is a supplier of the consumer described in
firmware OR the auxiliary reset device which is only described with
software nodes.

The logical thing to do would be to use "device_is_dependent()" but
this thread makes me think that won't fly.

What should I do? What's the "correct" way of checking if two devices
are linked? I assume that fiddling with the supplier/consumer lists in
struct device is not it.

Thanks,
Bartosz
