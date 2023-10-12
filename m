Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DA97C7354
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 18:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4989710E06C;
	Thu, 12 Oct 2023 16:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1158E10E06C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 16:44:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so2157443a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697129055; x=1697733855;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z24YZGqTCXcSjZw7pVvFeMUQZsyzVXoHF/bkKgAPfjE=;
 b=Yt7UzKf93VLuoPFUXw/7P5jzutFLjhGN2loZ26aFDvUgNYSjPPFRvfc+lZKJ2bZQjT
 y92aGXFVXuMjAIpi79Mw3NfWuksFOR36HCroiCy1CTJWHnVGyICo9dVUupiW523UthrZ
 Gw7KsGpr2wl2mpTMNyo1lzwh4DF12yUgJDqbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697129055; x=1697733855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z24YZGqTCXcSjZw7pVvFeMUQZsyzVXoHF/bkKgAPfjE=;
 b=Zxj9r3oMPcrczmlF+cuLr/IzObaHBJW12DhBWIH+sRnQzgUOMOxgjZLi2BlkIAQIe4
 Vw6xk6OwytNCvOeom4kc8NMsB6oDop5oPlOUEvaCbyIyrIDR8oRJ5X9BgUAcx1cmsxFp
 M+y14bW+AT94jsp/1xsOS0rHVqZoy6XAAe86uGH2qZqzgOoscsaGl/8I75TKdjKeZIcF
 Zo2b8xy4UoMIYGKMw3nMBmwEPGW3ir0IS9f4BV5Ae0GA+6r0dqIzjmsG/iMVUoNMjlpj
 bUYfHJdvd3zVGDfKxe6O0Pk1oyA6mIb7Myz/f2GFvgdv/kMQo2xg437RtVzdQE+4CAUX
 vjAA==
X-Gm-Message-State: AOJu0YzVCWpZq0RKTgGutaPecgF0SRqWelBQd0kQ7HsHkCh0g5MG1msQ
 +soKTgj0QV0M360PE4eOM+ojw7rAL8SgSMRF2a9LHA==
X-Google-Smtp-Source: AGHT+IE8bcvwCVwSSi6oS1JbBZdP1yzlmG3+/MQ++UM/ptQ6USXnqrcF7afjYZmAGHjdEMPUIT/YjQ==
X-Received: by 2002:a05:6402:541a:b0:53d:b2c8:6783 with SMTP id
 ev26-20020a056402541a00b0053db2c86783mr5975747edb.14.1697129054956; 
 Thu, 12 Oct 2023 09:44:14 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 er24-20020a056402449800b0052febc781bfsm3178421edb.36.2023.10.12.09.44.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 09:44:14 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-405459d9a96so1875e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:44:14 -0700 (PDT)
X-Received: by 2002:a05:600c:1d10:b0:404:7462:1f87 with SMTP id
 l16-20020a05600c1d1000b0040474621f87mr293864wms.6.1697129053819; Thu, 12 Oct
 2023 09:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231002235407.769399-1-swboyd@chromium.org>
 <CAD=FV=U2dza-rxV=YtcfJwUY-gZw5FrCyn0NahOxvXJW2J2-vg@mail.gmail.com>
 <CAE-0n51LJDgop-Nh+Aq1CTiu7xJZOqOsdSvHMmXzshkRKM3dgg@mail.gmail.com>
In-Reply-To: <CAE-0n51LJDgop-Nh+Aq1CTiu7xJZOqOsdSvHMmXzshkRKM3dgg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Oct 2023 09:43:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGP9L341iDd44rUPKf_jZ5Y6qodPKZ_BLgMq-HnkBmbQ@mail.gmail.com>
Message-ID: <CAD=FV=UGP9L341iDd44rUPKf_jZ5Y6qodPKZ_BLgMq-HnkBmbQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Associate DSI device lifetime
 with auxiliary device
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 5, 2023 at 10:18=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Doug Anderson (2023-10-02 17:31:41)
> > Hi,
> >
> > On Mon, Oct 2, 2023 at 4:54=E2=80=AFPM Stephen Boyd <swboyd@chromium.or=
g> wrote:
> > >
> > > The kernel produces a warning splat and the DSI device fails to regis=
ter
> > > in this driver if the i2c driver probes, populates child auxiliary
> > > devices, and then somewhere in ti_sn_bridge_probe() a function call
> > > returns -EPROBE_DEFER. When the auxiliary driver probe defers, the ds=
i
> > > device created by devm_mipi_dsi_device_register_full() is left
> > > registered because the devm managed device used to manage the lifetim=
e
> > > of the DSI device is the parent i2c device, not the auxiliary device
> > > that is being probed.
> > >
> > > Associate the DSI device created and managed by this driver to the
> > > lifetime of the auxiliary device, not the i2c device, so that the DSI
> > > device is removed when the auxiliary driver unbinds. Similarly change
> > > the device pointer used for dev_err_probe() so the deferred probe err=
ors
> > > are associated with the auxiliary device instead of the parent i2c
> > > device so we can narrow down future problems faster.
> > >
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Cc: Maxime Ripard <maxime@cerno.tech>
> > > Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our =
DSI device at probe")
> >
> > Even before that commit I think it was using the main "dev" instead of
> > the auxiliary device's "dev" for some "devm" stuff. I guess the
> > difference is that it wouldn't mess with probe deferral? Searching
> > back, I think the first instance of a case that was using "devm_" with
> > the wrong device was commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86:
> > Wrap panel with panel-bridge")? Would it make sense to use that as a
> > Fixes, you think?
>
> The problem for me is that the dsi device is registered twice. That
> happens because probe for the auxiliary device happens twice. I was
> cautious about the fixes tag here because it didn't look like probe
> deferral was happening before commit c3b75d4734cb.
>
> >
> > In any case, this looks reasonable to me:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll give it a week and then apply to "-fixes" if everything is quiet.
>
> Thanks!

Pushed to drm-misc-fixes leaving your existing "Fixes" line:

7b821db95140 drm/bridge: ti-sn65dsi86: Associate DSI device lifetime
with auxiliary device

-Doug
