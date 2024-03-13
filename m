Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4887A07D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 02:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD4310EFF3;
	Wed, 13 Mar 2024 01:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fDI1N8rj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C42289262
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 01:07:18 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id
 a1e0cc1a2514c-7dad8437347so2726610241.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 18:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710292037; x=1710896837;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cBmwXOg30OCoUF4GxOWpYW1K34Mj5YUqwZWwZ2HLAE=;
 b=fDI1N8rjNFPYEcsbuCkD0l/0++EiwK5uoOgEWWnZtY4F0IjJA8zNrJ7cg6FNKKdb7P
 i6zPnmxDQ58M/GLKcDwtQ0lFco30gy1QbH3JLC1Kn+/0dKvAdyD4oUOcEKUcpHkU7tR8
 hb8SU0LcztZO7avSQLfXbb0cT24Dm3ojDBLkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710292037; x=1710896837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cBmwXOg30OCoUF4GxOWpYW1K34Mj5YUqwZWwZ2HLAE=;
 b=JxHGK6gvPhtxjImchM97qEcT39MyMnZEZqSANFAQsdDfiPajPMOFR0MYJVBDHCcaXc
 HSyrc8CzEz5HaSxMLWNWCpD/DJI0PwbdO4OKiADnDiOg6mezjHdJ/pg4bTjfIeFejI/0
 GxiOeEmPuuQGWZGTLgk5xn7xZfT4p79aABKMdVvWCOnhsabZb9xs8A7RFoxqfyv6tdgN
 M7iI8lePYu9NI8lkvESjwIC/X12j31BTZUBtrx4rzFQEYGFCOXfnJvVj3lkcljhBRsip
 g0/sJegcsVvygjfggdhODslRHPAy8inw0OA+rXBMF0PCGvmUdEMgyDJL6R4ywJSpmr8I
 Dotw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ24oCweYBWAI8czAukOvqT2c3ip9JhnILE3kZdkgkBX8PjkPTKGbftzesTHet21sRK22q/HHE8awQW7TNj5ooxU4sqBhmc6Pc53dJ5gQw
X-Gm-Message-State: AOJu0YzgZ9hR604Bk9yeXuqDML5Oup+PeeJweUB+5REwNf8m1e6sBg4g
 c6b2s8/ofNpvdJbSdnZjOVfDtZ/bAOBfRuJoJKz48L2rR8w7WCRCnKvSvDxpSBTeJyzHdNYjO67
 jOw==
X-Google-Smtp-Source: AGHT+IFXqeYS5xpAGTo/YCPrZm+33I3XVKFsbNPlqSDhXVNjvyhk7w2MBmCfzl/PHcJVtWNhaCN/4A==
X-Received: by 2002:a05:6102:dc7:b0:474:d2c0:602c with SMTP id
 e7-20020a0561020dc700b00474d2c0602cmr91706vst.8.1710292037008; 
 Tue, 12 Mar 2024 18:07:17 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 xx1-20020a05620a5d8100b00788258a8888sm4190230qkn.48.2024.03.12.18.07.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 18:07:16 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-42ee0c326e8so128131cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 18:07:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUUeLQhXa/ejTNVge/U8dAcHjNftse52HosWri4S1ykXIUrIFdIP+k5c0mBFz7F13Q2oDuWAy/CActrHZ+OCdiC1c6mIo/VC/6syJU7Oscu
X-Received: by 2002:ac8:5ec8:0:b0:42f:a3c:2d5a with SMTP id
 s8-20020ac85ec8000000b0042f0a3c2d5amr76133qtx.27.1710292036231; Tue, 12 Mar
 2024 18:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240313001345.2623074-1-dianders@chromium.org>
 <20240312171305.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
 <CABXOdTfNaorDgyZT8owH6ypYpZMhVpUEcK8N4Mbw2UumA8Db2g@mail.gmail.com>
In-Reply-To: <CABXOdTfNaorDgyZT8owH6ypYpZMhVpUEcK8N4Mbw2UumA8Db2g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 Mar 2024 18:07:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UrxOmPRUa9Cw1u+JmTepMjKfKCwFLgLjj3f2O9wSdZyg@mail.gmail.com>
Message-ID: <CAD=FV=UrxOmPRUa9Cw1u+JmTepMjKfKCwFLgLjj3f2O9wSdZyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dp: Avoid a long timeout for AUX transfer if
 nothing connected
To: Guenter Roeck <groeck@google.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, Tanmay Shah <tanmay@codeaurora.org>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Tue, Mar 12, 2024 at 5:47=E2=80=AFPM Guenter Roeck <groeck@google.com> w=
rote:
>
> On Tue, Mar 12, 2024 at 5:14=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > As documented in the description of the transfer() function of
> > "struct drm_dp_aux", the transfer() function can be called at any time
> > regardless of the state of the DP port. Specifically if the kernel has
> > the DP AUX character device enabled and userspace accesses
> > "/dev/drm_dp_auxN" directly then the AUX transfer function will be
> > called regardless of whether a DP device is connected.
> >
> > For eDP panels we have a special rule where we wait (with a 5 second
> > timeout) for HPD to go high. This rule was important before all panels
> > drivers were converted to call wait_hpd_asserted() and actually can be
> > removed in a future commit.
> >
> > For external DP devices we never checked for HPD. That means that
> > trying to access the DP AUX character device (AKA `hexdump -C
> > /dev/drm_dp_auxN`) would very, very slowly timeout. Specifically on my
> > system:
> >   $ time hexdump -C /dev/drm_dp_aux0
> >   hexdump: /dev/drm_dp_aux0: Connection timed out
> >
> >   real    0m8.200s
> >
> > Let's add a check for HPD to avoid the slow timeout. This matches
> > what, for instance, the intel_dp_aux_xfer() function does when it
> > calls intel_tc_port_connected_locked(). That call has a document by it
> > explaining that it's important to avoid the long timeouts.
> >
> > Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/msm/dp/dp_aux.c     |  8 +++++++-
> >  drivers/gpu/drm/msm/dp/dp_catalog.c | 10 ++++++++++
> >  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
> >  3 files changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/d=
p_aux.c
> > index 03f4951c49f4..de0b0eabced9 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > @@ -307,7 +307,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *d=
p_aux,
> >          * turned on the panel and then tried to do an AUX transfer. Th=
e panel
> >          * driver has no way of knowing when the panel is ready, so it'=
s up
> >          * to us to wait. For DP we never get into this situation so le=
t's
> > -        * avoid ever doing the extra long wait for DP.
> > +        * avoid ever doing the extra long wait for DP and just query H=
PD
> > +        * directly.
> >          */
> >         if (aux->is_edp) {
> >                 ret =3D dp_catalog_aux_wait_for_hpd_connect_state(aux->=
catalog);
> > @@ -315,6 +316,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *=
dp_aux,
> >                         DRM_DEBUG_DP("Panel not ready for aux transacti=
ons\n");
> >                         goto exit;
> >                 }
> > +       } else {
> > +               if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
> > +                       ret =3D -ENXIO;
> > +                       goto exit;
> > +               }
> >         }
> >
> >         dp_aux_update_offset_and_segment(aux, msg);
> > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/=
dp/dp_catalog.c
> > index 5142aeb705a4..93e2d413a1e7 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > @@ -266,6 +266,16 @@ int dp_catalog_aux_wait_for_hpd_connect_state(stru=
ct dp_catalog *dp_catalog)
> >                                 2000, 500000);
> >  }
> >
> > +bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog)
> > +{
> > +       struct dp_catalog_private *catalog =3D container_of(dp_catalog,
> > +                               struct dp_catalog_private, dp_catalog);
> > +
> > +       /* poll for hpd connected status every 2ms and timeout after 50=
0ms */
>
> Maybe I am missing something, but the comment doesn't seem to match
> the code below.
>
> Guenter
>
> > +       return readl(catalog->io->dp_controller.aux.base + REG_DP_DP_HP=
D_INT_STATUS) &
> > +              DP_DP_HPD_STATE_STATUS_CONNECTED;

LOL. I guess I overlooked that. Thanks for catching! The comment got
copied from the dp_catalog_aux_wait_for_hpd_connect_state(). I'll
remove the comment and send a v2, but I'll wait a little bit to see if
there is additional feedback.

-Doug
