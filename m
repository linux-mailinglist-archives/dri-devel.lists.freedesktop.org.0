Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08818D25BA
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 22:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754BA10EE94;
	Tue, 28 May 2024 20:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SV7zowt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24CB10EE94
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 20:22:46 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1f44b441b08so9106415ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716927765; x=1717532565;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7qSEByr0cVqm4o+EKl2XQRiChKteOLXLt82vx/Q7ni4=;
 b=SV7zowt11C1L9Sv0rA7o47yNuIiUS86nSh9ZN07mA3VzWwlttzyZ2NqideljpGVfZl
 lq7BT0Du0zsCvLXljdEgtV6PBqynWGVsptb9ONq9VMPlk8Z78XB9qFuovJ9U+ky9V+zP
 MbH5TNQRIhQ0sQV247BM1eoGKXcI5yECtaVbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716927765; x=1717532565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7qSEByr0cVqm4o+EKl2XQRiChKteOLXLt82vx/Q7ni4=;
 b=AY1NHX9DL6lis06wh6RDij4O+NroKXfrC+7tWxpWR6BD5OjKd1hXH77ldbh10Fw2bK
 SzHag9cmMSK2otLCYfQM384JCpSNmpK6qGGSXYQisX31LczCyg4tZWuzd3JD1uqCNC42
 PgcyE5khsoM/zSVTJCIEIpLviBAnxKs3bgaNbHOx0b2fg49GXkZXJ/gj7Rrx7KTxiVXb
 72VDjIq6ZaKb2nncMKptWBI1/NUpMpTzxCefa+JziHeM0YVOl5XeLRyOLgAHtNx26LMh
 FolE7cOsglVUJMkVIRmjt+/ndCZE8svLEAQWmWmJbRvwYWROk3GOrFIBfqIX7z788Wqg
 ra6A==
X-Gm-Message-State: AOJu0YwKo4YGFac4bgLloIY2dGbtUiqpGnV3a/FUP5D8XY1ZQJt0baX4
 E6bjIpyrrBKUlPbpqTXRROlIQhOudhoC/E0IvJ4T2Awv/SdvglzqwU8t9JzXtVs8wDLuL/fACMQ
 =
X-Google-Smtp-Source: AGHT+IHQQNp9NZGqDANVP/svLNcVxy5jH/iyIHbW4mHusGcZy01Er5kUcU3WP4eMCeoQLxYS8LcfNQ==
X-Received: by 2002:a17:902:e541:b0:1f4:a52a:dca4 with SMTP id
 d9443c01a7336-1f4a52adf40mr65944195ad.69.1716927765380; 
 Tue, 28 May 2024 13:22:45 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com.
 [209.85.214.170]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f45ad4444csm77287675ad.274.2024.05.28.13.22.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 13:22:45 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f339d61e78so43025ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 13:22:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1e17:b0:43f:e034:724f with SMTP id
 d75a77b69052e-43fe1103588mr257971cf.15.1716927283572; Tue, 28 May 2024
 13:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
 <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
 <CAD=FV=WoYm43SzrdrSZ1Np58iQ4nMwF0u6uamOAnZc4pqmBpsg@mail.gmail.com>
In-Reply-To: <CAD=FV=WoYm43SzrdrSZ1Np58iQ4nMwF0u6uamOAnZc4pqmBpsg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 May 2024 13:14:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-4CnU7k0W3zwPAf_aeddykmHPN6=wMnjKAzQcbwHeNA@mail.gmail.com>
Message-ID: <CAD=FV=V-4CnU7k0W3zwPAf_aeddykmHPN6=wMnjKAzQcbwHeNA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
 Purism Kernel Team <kernel@puri.sm>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

On Wed, May 8, 2024 at 2:14=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> > This is the right thing to do, thanks for looking into this!
> >
> > As for the behaviour of .remove() I doubt whether in many cases
> > the original driver authors have even tested this themselves.
>
> Yeah, I'd tend to agree.
>
>
> > I would say we should just apply the series as soon as it's non-RFC
>
> It's not actually RFC now, but "RFT" (request for testing). I don't
> _think_ there's any need to send a version without the RFT tag before
> landing unless someone really feels strongly about it.
>
>
> > after the next merge window
>
> With drm-misc there's not really any specific reason to wait for the
> merge window to open/close as we can land in drm-misc-next at any time
> regardless of the merge window. drm-misc-next will simply stop feeding
> linuxnext for a while.
>
> That all being said, I'm happy to delay landing this until after the
> next -rc1 comes out if people would prefer that. If I don't hear
> anything, I guess I'll just wait until -rc1 before landing any of
> these.
>
>
> > and see what happens. I doubt it
> > will cause much trouble.
>
> I can land the whole series if that's what everyone agrees on. As I
> mentioned above, I'm at least slightly worried that I did something
> stupid _somewhere_ in this series since no automation was possible and
> with repetitive tasks like this it's super easy to flub something up.
> It's _probably_ fine, but I guess I still have the worry in the back
> of my mind.
>
> If folks think I should just apply the whole series then I'm happy to
> do that. If folks think I should just land parts of the series as they
> are reviewed/tested I can do that as well. Let me know. If I don't
> hear anything I'd tend to just land patches that are reviewed/tested.
> Then after a month or so (hopefully) I'd send out a v2 with anything
> left.

Nobody said anything, so I did what I indicated above:

1. I've applied all patches that someone responded to with Linus +
Maxime's Acks + any given tags. This includes the st7703 panels which
Ond=C5=99ej replied to the cover letter about but didn't officially get any
tags.

2. I also applied patches for panels that I was personally involved
with. This includes panel-edp, panel-simple, samsung-atna33xc20,
boe-tv101wum-nl6.

Anything totally unresponded to I've left unapplied. I'll wait a
little while (at least a week) and then plan to send a v2 with
anything still outstanding. If someone sends Tested-by/Reviewed-by for
some panels in the meantime I'll apply them.

Here are the 25 patches applied to drm-misc-next:

[01/48] drm/panel: raydium-rm692e5: Stop tracking prepared
        commit: 598dc42f25cc3060fd350db0f52af1075af3f500

[04/48] drm/panel: boe-tv101wum-nl6: Stop tracking prepared
        commit: 3c24e31c908eb12e99420ff33b74c01f045253fe
[05/48] drm/panel: boe-tv101wum-nl6: Don't call unprepare+disable at
shutdown/remove
        commit: 1985e3512b5a3777f6a18c36e40f3926037120bb
[06/48] drm/panel: edp: Stop tracking prepared/enabled
        commit: 3904f317fd977533f6d7d3c4bfd75e0ac6169bb7
[07/48] drm/panel: edp: Add a comment about unprepare+disable at shutdown/r=
emove
        commit: ec7629859331fb67dbfb6bcd47f887a402e390ff
[08/48] drm/panel: innolux-p079zca: Stop tracking prepared/enabled
        commit: f9055051292442d52092f17e191cf0a58d23d4ed
[09/48] drm/panel: innolux-p079zca: Don't call unprepare+disable at
shutdown/remove
        commit: eeb133ff78476eb1e6e88154dfb75a741e8a034a

[12/48] drm/panel: kingdisplay-kd097d04: Stop tracking prepared/enabled
        commit: 157c1381780a453e06430f8b35bb8c5d439eb8c6
[13/48] drm/panel: kingdisplay-kd097d04: Don't call unprepare+disable
at shutdown/remove
        commit: 68c205ef3c39edce4a3346b8a53fd2b700394a0c
[14/48] drm/panel: ltk050h3146w: Stop tracking prepared
        commit: f124478dd18c519544489caddce78e7c5796a758
[15/48] drm/panel: ltk050h3146w: Don't call unprepare+disable at shutdown/r=
emove
        commit: b7ca446ecb53205944968617b158f073bcacaedc
[16/48] drm/panel: ltk500hd1829: Stop tracking prepared
        commit: 2b8c19b9d7bc9d03e8c44bd391d21e95c07a2c83
[17/48] drm/panel: ltk500hd1829: Don't call unprepare+disable at shutdown/r=
emove
        commit: 3357f6f465e62c0bc5e906365063734740c9f6d4
[18/48] drm/panel: novatek-nt36672a: Stop tracking prepared
        commit: b605f257f386b7f4b6fc9c0f82b86b75d0579287
[19/48] drm/panel: novatek-nt36672a: Don't call unprepare+disable at
shutdown/remove
        commit: 2a9487b5aa55753993fde80e4841128c8da4df71

[24/48] drm/panel: samsung-atna33xc20: Stop tracking prepared/enabled
        commit: 5a847750aac8454a1604070ab99d689c0a6e4290
[25/48] drm/panel: samsung-atna33xc20: Don't call unprepare+disable at
shutdown/remove
        commit: 49869668ff0e3f380858b4c20b8d0cb02b933f48
[26/48] drm/panel: simple: Stop tracking prepared/enabled
        commit: 2a1c99d7159b798288bfb20a76c1e665e2344126
[27/48] drm/panel: simple: Add a comment about unprepare+disable at
shutdown/remove
        commit: bc62654df3c888dec735343f5db9907ac93aea60

[30/48] drm/panel: xinpeng-xpp055c272: Stop tracking prepared
        commit: 4e5e6fa77a9d40cdf85ade7f86d07dc8929941c9
[31/48] drm/panel: xinpeng-xpp055c272: Don't call unprepare+disable at
shutdown/remove
        commit: ac9e1786271f771ff1f774742602330be2d57a12

[42/48] drm/panel: sitronix-st7703: Stop tracking prepared
        commit: 3004d2e9cca5d59d25dff670a03a005d40601ded
[43/48] drm/panel: sitronix-st7703: Don't call disable at shutdown/remove
        commit: 718bd8a1a5ee873778a72523c06da054a89108b4

[46/48] drm/panel: sony-acx565akm: Don't double-check enabled state in disa=
ble
        commit: e28df86aeeff0b84c13e676f641ea879abbdb809
[47/48] drm/panel: sony-acx565akm: Don't call disable at remove
        commit: 6afebd850d1ab5518c273b32532f0b2086cc633a


-Doug
