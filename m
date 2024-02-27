Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B78684F9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 01:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA32310E59C;
	Tue, 27 Feb 2024 00:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XYMuGN2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F0C10F199
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:24:44 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so629902066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 16:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708993481; x=1709598281;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3JmCULH6mtQ5aLGNesdJIBvLW9PajOrrLwSE+PIFPc=;
 b=XYMuGN2yugF8zvVJUF+Ex6l60Pkp5FDZJyef5MKiKFXi25nigP7o3+2BeD18KJ1J/7
 Yg72nvLM3AxqDUgIvD4gqaLaLtzY1RHdEWSJcqViov5bfks8ElSqlw6sCAXpiuWFRyWJ
 1dLO3bJu82xu+0vfW4c8cIzuzqfLg5d2yWS9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708993481; x=1709598281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z3JmCULH6mtQ5aLGNesdJIBvLW9PajOrrLwSE+PIFPc=;
 b=WLN9wbOfsfpU9AqdsFjDM0oSU+LuHbpTRiO1mPkI6pebF1iL2OYiD5VK/TOGrmv5nb
 /k2l20Hzwg+WFm2l8P4ItLGQEz7WldHYDEiAccZLWNpcFx2KRg2KGcFRYtj019vocZAF
 EdDj2R98VJNN1/lfXIJmGpNKl/zt94icwfWW7MzgJ7tnmUS9lyaVbT/tigM+IqoM3Shg
 Rxy2Qzb7+8S8nxSpkSXcYUnIu9GnV/zTOY7yo9kgdKOmTyN6SRUBgepQ8VecwQixs75i
 eXoaT37R8/lMms/wcC37UG+W1DIsL0VwD3D3nA6Q4CAdYGNHVg4g8Q2kO8jUynRvOilg
 E0Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx2O24FWtTJVB5RoPy1DvKtgWsIHesJkMC6emYNBXAOE4rNDGiMktY8Z/nKujQJOCsuhSqSzmNH5jcoV0TuZPrJ+UnDFn3RVQrra43VSWA
X-Gm-Message-State: AOJu0YzacBr53+ob/qGQ3v2PNhPX2Hl7SLcRGgnz1RE3jYtbq7tVb1jk
 cm4BxssYiNCNdvu/lHtEFObohHejWe5ziqUqby+6i4pluYroIf4JxVgTRUFUBzAlysY6FeM+6z7
 nl8YX
X-Google-Smtp-Source: AGHT+IFOU7mIKK/5QJ0FCce1b6AZB6qnkIk8euRc+/jSEm7F/YsjgWLNenQdTOb+FVJWjG4ItUfqTw==
X-Received: by 2002:a17:906:4f01:b0:a43:af0b:c1c0 with SMTP id
 t1-20020a1709064f0100b00a43af0bc1c0mr73251eju.16.1708993480855; 
 Mon, 26 Feb 2024 16:24:40 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 c19-20020a170906695300b00a3d8a76a92esm222718ejs.175.2024.02.26.16.24.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 16:24:39 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-412a9f272f4so21775e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 16:24:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUncWEAt5pP21fm3zerVPt9qPDzhyiQt2j2uw5fejSCNIx6unKV6eo77qUDu7FZND+mDx7kugeZiMhjztjr/FyfKWMKZYKVLhvDvp2WPY/A
X-Received: by 2002:a05:600c:a017:b0:412:ad68:f73e with SMTP id
 jg23-20020a05600ca01700b00412ad68f73emr8676wmb.1.1708993479487; Mon, 26 Feb
 2024 16:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-3-hsinyi@chromium.org>
 <CAD=FV=Xs4V7ei4NW0T0x0Bq6_dQF6sZKvFSy2WGQFQsHae=61Q@mail.gmail.com>
 <CAJMQK-jKuA_2Y+rQ5q4MkbmkQFJh4+DC98GhExuVt39DTfBwsg@mail.gmail.com>
In-Reply-To: <CAJMQK-jKuA_2Y+rQ5q4MkbmkQFJh4+DC98GhExuVt39DTfBwsg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Feb 2024 16:24:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WYLgFUhmvNdLe8JgQzNKrb=TDyE1qj-AgU6Z8DH9WcZw@mail.gmail.com>
Message-ID: <CAD=FV=WYLgFUhmvNdLe8JgQzNKrb=TDyE1qj-AgU6Z8DH9WcZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: panel-edp: Match with panel hash for
 overridden modes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Feb 26, 2024 at 2:39=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> On Mon, Feb 26, 2024 at 2:29=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Feb 23, 2024 at 2:40=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.o=
rg> wrote:
> > >
> > > It's found that some panels have variants that they share the same pa=
nel id
> > > although their EDID and names are different. One of the variants requ=
ires
> > > using overridden modes to resolve glitching issue as described in com=
mit
> > > 70e0d5550f5c ("drm/panel-edp: Add auo_b116xa3_mode"). Other variants =
should
> > > use the modes parsed from EDID.
> > >
> > > For example, AUO 0x405c B116XAK01.0, it has at least 2 different vari=
ants
> > > that EDID and panel name are different, but using the same panel id. =
One of
> > > the variants require using overridden mode. Same case for AUO 0x615c
> > > B116XAN06.1.
> > >
> > > Add such entries and use the hash of the EDID to match the panel need=
s the
> > > overridden modes.
> >
> > As pointed out in an offline discussion, it's possible that we might
> > want to "ignore" some of these bytes for the purpose of the CRC.
> > Specifically, we might want to ignore:
> > * byte 16 - Week of manufacture
> > * byte 17 - Year of manufacture
> > * byte 127 - Checksum
> >
> > That way if a manufacturer actually is updating those numbers in
> > production we can still have one hash that captures all the panels. I
> > have no idea if manufacturers actually are, but IMO the hash of the
> > rest of the base block should be sufficient to differentiate between
> > different panels anyway. It would be easy to just zero out those 3
> > bytes before computing the CRC.
> >
> > What do you think?
>
> Agreed that we can zero out these fields.

Ah, in (yet another) offline comment, someone also pointed out bytes
12-15 should also be ignored for the CRC. Those are the serial number.

-Doug
