Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E1DBAD2CD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBB110E5E4;
	Tue, 30 Sep 2025 14:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Z5WnXn4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFD110E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 14:29:25 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-27eceb38eb1so72672425ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1759242563; x=1759847363;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XL/Mc8iUtyo5W2s1qkd1yXvd0NCSK6cLxiT3Omi/7eQ=;
 b=Z5WnXn4VAjg5UB2UdBbmCgJIRot3pwDYURTx1VxhUIaadKBAjKpAJU6jPAQ8tkhuHw
 voHbi3AlJ6GWxXn0vd0mOq892SU4mjMft7bmuzVa2r1fOgicStCiTkdHzfM2xT5qZ1lF
 pHsH1AD19pFtIIfJiWbiBdjdSq6+lFHQYzXv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759242563; x=1759847363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XL/Mc8iUtyo5W2s1qkd1yXvd0NCSK6cLxiT3Omi/7eQ=;
 b=UY6SJEuDLPdvCz9GOqME/TbUeQmrq0tDEAqF/MpxM5ScWrXAbO+h3ntQ8Mm9y2kXRy
 HmUx0XdF90TBygllISVmbqk+efo1xAOUxv8Xkmq5EzYKh9TwmF53Q3Kf5PllyNLxDIhL
 BBuqqjjdYHmmtEWJz73DLXuTUoK2Yno0cyJ2iDdsGQHs/NbuvaI7Ahx0jFUu8Zzz9Vov
 Yu/r0Or6ZP7SNKd/+KSW7xxdUbmOCKe0o2lnqf9xbANUWSg3m/Z91KIWBqSBlhagktH4
 w+7BNQ78s7XL8zpxJNrWchJg/4vPQM6qfLXSMKc4CjINRKeWa4CBKfdnn/49N/OwO/TF
 2qtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+t+3sZvVKKT0nNcnIVW2mDo385SZxDGG8Qreoa5gJkULq8JX+0DOVbTIVeCo2hZ6n4+00y6bTN5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUNOSdn0Q2uEqcS7qlarbVSut0bN24PyUwZBHw+YWYhm2iHLwT
 5mJg9Ppgc1xIyga8ROjb25wRoKjFsG9Tuj4GFqLClu3qRF8hwb3n12SXhtrJ7IKncUSSkktpfIJ
 KZDw=
X-Gm-Gg: ASbGnct8ct0ml7gLvDd1Sy0ZIDw25p2U5vaQjndU9uJhWyC5KwH1iEQKj2HGKYd98VE
 LYJ+DgTYEmpEBLtq7MmoyloE4vfbe692sEFcz65tGvmivQrXlp2Qp0ezH0PFvoAxaHm/0tm99D5
 Uxrd5/0Vbvc4sp+R3ucXFcQLNbMX+BZ57YigCu2y1534xciHE3Mt+Pvg+vKW4ogbvYMKs8ouJAg
 qLFN/zOSz+ZLJkd3v4tZoL4aUyDqOzlEkW2E5Is54k8GOUZ0C7ilzi//bje1hQ7Qqjyv+FLM9rk
 vYUb+BlMHc9C1iGvGDeEnh3vEuaF8xhaSo0QK00zS4SGg9iwhI4cnbNsZRMgOcNM/7428FnT9Gr
 ptANqn42eLO/4Beim2/yEx3jFBnMRLAlC9ziRusReiLRre9Dq8FkRVsNkT1odvvRAMwPRB2HARY
 LNIG/7CNWaI4nSyefr//2YZs+l
X-Google-Smtp-Source: AGHT+IGplIF8Cd3BqR7t/mEDSxjZMSf9qe5bBWixT/05ClYbUqu8dNHuRDpc2rcHPJqnXNr4X9E0Og==
X-Received: by 2002:a17:902:ecc8:b0:279:fa:30fe with SMTP id
 d9443c01a7336-27ed4a57523mr244020745ad.26.1759242562961; 
 Tue, 30 Sep 2025 07:29:22 -0700 (PDT)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com.
 [209.85.210.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed66cf9d3sm161991455ad.15.2025.09.30.07.29.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 07:29:21 -0700 (PDT)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-77f605f22easo5450179b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHj3z2lKHsGYDpyHA5/vxvYKsIC+lrm7NCy1AB2zbG5fgousM3ylgxvWByqz1XpstSHZ45UHXJXUw=@lists.freedesktop.org
X-Received: by 2002:a17:902:7088:b0:24c:965a:f97e with SMTP id
 d9443c01a7336-27ed4a29dacmr180245305ad.2.1759242560525; Tue, 30 Sep 2025
 07:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-3-clamor95@gmail.com>
 <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
 <CAPVz0n2Prw0ZoQhrodobmSpAu7XV6aX=NV=2ee0RwL3H5hWARg@mail.gmail.com>
In-Reply-To: <CAPVz0n2Prw0ZoQhrodobmSpAu7XV6aX=NV=2ee0RwL3H5hWARg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Sep 2025 07:29:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XD=L=otnj+YsQ1qEtrO_+wBD-ZYpDNmickcD1tb+6OoA@mail.gmail.com>
X-Gm-Features: AS18NWBKEeqzCuUPltq0hFLhhfC7TR2NA7onkkxdD9X53tjrGMLTsb8gFsFvIps
Message-ID: <CAD=FV=XD=L=otnj+YsQ1qEtrO_+wBD-ZYpDNmickcD1tb+6OoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] gpu/drm: panel: add support for LG LD070WX3-SL01
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
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

On Mon, Sep 29, 2025 at 10:13=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> > > +static int lg_ld070wx3_unprepare(struct drm_panel *panel)
> > > +{
> > > +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> > > +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->dsi };
> > > +
> > > +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> > > +
> >
> > Maybe add some comment about ignoring the accumulated error in the
> > context and still doing the sleeps?
> >
>
> Isn't that obvious? Regardless of what command returns power supply
> should be turned off, preferably with a set amount of delays (delays
> are taken from datasheet) to avoid leaving panel in uncertain state
> with power on.

I won't insist, though IMO any time an error return is purposely
ignored a comment about why can be justified.


> > > +       msleep(50);
> > > +
> > > +       regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->supp=
lies);
> > > +
> > > +       /* power supply must be off for at least 1s after panel disab=
le */
> > > +       msleep(1000);
> >
> > Presumably it would be better to keep track of the time you turned it
> > off and then make sure you don't turn it on again before that time?
> > Otherwise you've got a pretty wasteful delay here.
> >
>
> And how do you propose to implement that? Should I use mutex?
> Datasheet is clear regarding this, after supply is turned off there
> MUST be AT LEAST 1 second of delay before supplies can be turned back
> on.

You don't really need a mutex since the DRM core will make sure that
prepare and unprepare can't be called at the same time. panel-edp
implements this. See `unprepared_time` I believe.

NOTE: if you want to get really deep into this, it's actually a bit of
a complicated topic and I would also encourage you to add an
"off-on-delay-us" to the regulator in your device tree (which only
works on some regulators but really should be universal). This is
important because:

1. The regulator could be shared by other consumers and they could
cause violations of this.

2. The regulator could potentially be in either state when Linux starts.

3. The regulator framework could adjust the state of the regulator at
regulator probe time.

The "off-on-delay-us" handles at least some more of those cases,
though I seem to remember that at least a few of them still have rough
edges...


> > > +static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
> > > +{
> > > +       struct device *dev =3D &dsi->dev;
> > > +       struct lg_ld070wx3 *priv;
> > > +       int ret;
> > > +
> > > +       priv =3D devm_drm_panel_alloc(dev, struct lg_ld070wx3, panel,
> > > +                                   &lg_ld070wx3_panel_funcs,
> > > +                                   DRM_MODE_CONNECTOR_DSI);
> > > +       if (IS_ERR(priv))
> > > +               return PTR_ERR(priv);
> > > +
> > > +       priv->supplies[0].supply =3D "vcc";
> > > +       priv->supplies[1].supply =3D "vdd";
> > > +
> > > +       ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(priv->supplie=
s), priv->supplies);
> > > +       if (ret < 0)
> > > +               return dev_err_probe(dev, ret, "failed to get regulat=
ors\n");
> >
> > Better to use devm_regulator_bulk_get_const() so you don't need to
> > manually init the supplies?
>
> So you propose to init supplies in the probe? Are you aware that
> between probe and panel prepare may be 8-10 seconds, sometimes even
> more. Having power supplies enabled without panel configuration may
> result in permanent panel damage during that time especially since
> panel has no hardware reset mechanism.

Maybe look more closely at devm_regulator_bulk_get_const(). Really it
should just save you the lines of code:

  priv->supplies[0].supply =3D "vcc";
  priv->supplies[1].supply =3D "vdd";

...and it lets you put those names in a "static const" table in your
driver. All the timings of when regulators are initted should be the
same.

-Doug
