Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386597ADCC9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E6510E28C;
	Mon, 25 Sep 2023 16:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406BE10E28C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 16:10:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9a9cd066db5so901720566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695658209; x=1696263009;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cwEuixmjVjieATmQA+XE8BdmzJIt5P+ghGd9MnmN4o=;
 b=IEuuQqm43gJvWdrzTm6LRsaC8Ugl8g9jsV20Sl1GG8jlJrH3QZ7qoFakChjDL4MAJP
 YQxnBLCL1jXdkLNmgNYMXMAGhHwiPnWUeLp/TLmbY88guB9j+bnG1SttfJT8zWpyUKGi
 oVvk4p2/ZMj/ZifcD5AA+si5mt7ruD94ctiVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695658209; x=1696263009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6cwEuixmjVjieATmQA+XE8BdmzJIt5P+ghGd9MnmN4o=;
 b=X+q76xk0Q4s0SPQPdh8lGs2Ez2PDqy7vdUAWTRe3YRbT6LDITil4E2oydaa3C00N5O
 mdK1GIRCjrkQVwCdWclw6BSuw81J1cfrqnbpWxZLRBmlX/cEAGpNCK+QJuZjTfD3rGKM
 aiJrKJBzhYJgllrcWV86aHxw5K/fC79DUy/zIU/dGM/hoIl2BGbybWJXnKJWosjm5P5U
 aU2JtYXQhlGRiPkMIKlWzFmOksfTWUkGIH2gGFc+1KXCPcC2QLr195OjFrSv1/gPoPMo
 w94vK+VoUd88p2i2r53O/sC2yC074uTL2BhSXM9dIvILHEzkeuZt9EJHUkg4gKlz3b0D
 P2Aw==
X-Gm-Message-State: AOJu0Yy4QNBOHH7QUm3aBozPEfqBO4/Rj8YXfiEw/vY5/VJddsUXmHvz
 kUcwF0GbzXZiM6A1dDR8mHJwTvXoZpbwtQB132XHvg==
X-Google-Smtp-Source: AGHT+IGP2CQiAf2AbZYzP+N36e3zHd2aX0nySaOtqLIfNvY3p+ykWpa4X9mgBNhKMQo5A+7W2uc8dw==
X-Received: by 2002:a17:907:75d7:b0:9a1:f4e8:87b9 with SMTP id
 jl23-20020a17090775d700b009a1f4e887b9mr5981163ejc.45.1695658208789; 
 Mon, 25 Sep 2023 09:10:08 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 kb23-20020a1709070f9700b009944e955e19sm6487294ejc.30.2023.09.25.09.10.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 09:10:08 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4053f24c900so144875e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 09:10:07 -0700 (PDT)
X-Received: by 2002:a05:600c:502b:b0:404:74f8:f47c with SMTP id
 n43-20020a05600c502b00b0040474f8f47cmr117221wmr.5.1695658207419; Mon, 25 Sep
 2023 09:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.11.I022cfc2dcd30e77d4f7005a2d912dd7ab76c0338@changeid>
 <BL1PR12MB51446279B27EC69BE91D865EF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB51446279B27EC69BE91D865EF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Sep 2023 09:09:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzhCmnLC8eqS=0Ug_n4rG2b+GjcFQcDQWXwCOPiHP1LA@mail.gmail.com>
Message-ID: <CAD=FV=XzhCmnLC8eqS=0Ug_n4rG2b+GjcFQcDQWXwCOPiHP1LA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 11/12] drm/radeon: Call
 drm_helper_force_disable_all() at shutdown/remove time
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 25, 2023 at 8:49=E2=80=AFAM Deucher, Alexander
<Alexander.Deucher@amd.com> wrote:
>
> [Public]
>
> > -----Original Message-----
> > From: Douglas Anderson <dianders@chromium.org>
> > Sent: Thursday, September 21, 2023 3:27 PM
> > To: dri-devel@lists.freedesktop.org; Maxime Ripard <mripard@kernel.org>
> > Cc: Douglas Anderson <dianders@chromium.org>; Pan, Xinhui
> > <Xinhui.Pan@amd.com>; airlied@gmail.com; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; amd-gfx@lists.freedesktop.org; Koenig,
> > Christian <Christian.Koenig@amd.com>; daniel@ffwll.ch; linux-
> > kernel@vger.kernel.org
> > Subject: [RFT PATCH v2 11/12] drm/radeon: Call
> > drm_helper_force_disable_all() at shutdown/remove time
> >
> > Based on grepping through the source code, this driver appears to be mi=
ssing
> > a call to drm_atomic_helper_shutdown(), or in this case the non-atomic
> > equivalent drm_helper_force_disable_all(), at system shutdown time and =
at
> > driver remove time. This is important because
> > drm_helper_force_disable_all() will cause panels to get disabled cleanl=
y which
> > may be important for their power sequencing. Future changes will remove=
 any
> > custom powering off in individual panel drivers so the DRM drivers need=
 to
> > start getting this right.
> >
> > The fact that we should call drm_atomic_helper_shutdown(), or in this c=
ase
> > the non-atomic equivalent drm_helper_force_disable_all(), in the case o=
f OS
> > shutdown/restart comes straight out of the kernel doc "driver instance
> > overview" in drm_drv.c.
> >
> > NOTE: in order to get things inserted in the right place, I had to repl=
ace the
> > old/deprecated drm_put_dev() function with the equivalent new calls.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I honestly have no idea if I got this patch right. The shutdown() funct=
ion
> > already had some special case logic for PPC, Loongson, and VMs and I do=
n't
> > 100% for sure know how this interacts with those. Everything here is ju=
st
> > compile tested.
>
> I think the reason for most of this funniness is to reduce shutdown time.=
  Lots of users complain if driver takes a while to shutdown and there is a=
 point to be made that if the system is going into power down, there is not=
 much reason to spend a lot of time messing with the hardware.

Sure, you don't want to do too much at shutdown time. That's the whole
reason that "shutdown" doesn't do a full remove / uninitialization of
all drivers. ...but drm_atomic_helper_shutdown() is documented to do
the things that are important for shutdown. Specifically, it cleanly
disables all of the displays. Depending on the display, this could
avoid temporary garbage on the display at reboot time or it could even
be important for the long term health of the panel.

-Doug
