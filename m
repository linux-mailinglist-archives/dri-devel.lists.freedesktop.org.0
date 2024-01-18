Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE08311CE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 04:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E35D10E134;
	Thu, 18 Jan 2024 03:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E86710E134
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 03:26:21 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3606f3b8069so53811915ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 19:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705548321; x=1706153121;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ii56IFJu065FnMv6OshmGSGQK3NaWenX9LFIh28GHDw=;
 b=RglAHkXuexSxu155MfeCeHb3lt1ccNNgxkqNT4khpmezdcRpkSofs0UTXDW7oWWm3K
 pewiXHeM/aFdy5qtjqcOlzAXvGRzZFctK524KRB0xDaONdXBqDxO/mVqvHR54a6j3Z12
 0F8UAPkHUv927iknIA3G1KaVmB8ZBx4r4IxpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705548321; x=1706153121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ii56IFJu065FnMv6OshmGSGQK3NaWenX9LFIh28GHDw=;
 b=oxPyAOI1uXN4eroOx/YzG2Ebyja0TZ5W/3pmA09nOJrXkw2iAflOTmnEmI49PM88ql
 notAmP/nE6hTWKcgIogxPal4to+flIT11jSXxue89mGFIN8z6LHefvW13G4oqLI/40gv
 OGsXCZLBqNlNPzSJKV76iVAUmgu+TcjBboxQNJRKwX9qA7wcQsYhUXVAXBZWejyQCkj+
 yU+V+biq/7Co01VAVALTHTDLyknEYqmT+yhiY+CYOew48wvVVN5BqCwLldgkHKyjJQvT
 1dQLfX2ifBKDkyF46/lhmfhtlZGaV4JKJCBgvWJTvPAtVDZmyrYb4Vgkdjxa+LHoNtOR
 aGAg==
X-Gm-Message-State: AOJu0Ywdc1nl70dTYCqlmko9gAX+bhjidcVgEYGEjyLgWKHOjw/mnbn0
 h1jGTce9D5xvczTJIOiFTAQtsm+kMv/MkAnQD7+jMbrmp75HS84fUBa4nwyqmhAfNmbP13OgwOk
 L1C7ne28oCVt62WYgqyzI1kc0BeEghqQcfZGL
X-Google-Smtp-Source: AGHT+IE9D1TMeIh1UjhzZONIVYL35nzwGM7vKMti5Frnt+mKigLTifEXOn/4P8AZkmNo4W2eFWm7k1x7hjd+mCT2haA=
X-Received: by 2002:a05:6e02:1bc9:b0:361:8c6f:fbd0 with SMTP id
 x9-20020a056e021bc900b003618c6ffbd0mr388527ilv.49.1705548320834; Wed, 17 Jan
 2024 19:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20240109120528.1292601-1-treapking@chromium.org>
 <CAD=FV=WjjH3BCDf-OnX=zdk201uMu+YJvKVBhVmMa4GqNinacw@mail.gmail.com>
 <CAD=FV=Va-67xojWbm-8MBCxaDG19gQhmNr3V_sBwYUkDkny9GQ@mail.gmail.com>
 <CAD=FV=UJMVZATztLsx9YCkV37TYuS_mphbHzhqrS3qNKQCzVAA@mail.gmail.com>
In-Reply-To: <CAD=FV=UJMVZATztLsx9YCkV37TYuS_mphbHzhqrS3qNKQCzVAA@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 18 Jan 2024 11:25:09 +0800
Message-ID: <CAEXTbpfo7YsEi7uYcYen82vHg0F=Ataca=FocwF1Jr0-6MpgyA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: parade-ps8640: Ensure bridge is suspended
 in .post_disable()
To: Doug Anderson <dianders@chromium.org>
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
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Thu, Jan 18, 2024 at 2:37=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Jan 17, 2024 at 9:34=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Jan 9, 2024 at 8:52=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Jan 9, 2024 at 4:05=E2=80=AFAM Pin-yen Lin <treapking@chromiu=
m.org> wrote:
> > > >
> > > > The ps8640 bridge seems to expect everything to be power cycled at =
the
> > > > disable process, but sometimes ps8640_aux_transfer() holds the runt=
ime
> > > > PM reference and prevents the bridge from suspend.
> > > >
> > > > Prevent that by introducing a mutex lock between ps8640_aux_transfe=
r()
> > > > and .post_disable() to make sure the bridge is really powered off.
> > > >
> > > > Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime pow=
er management")
> > > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > > ---
> > > >
> > > > Changes in v2:
> > > > - Use mutex instead of the completion and autosuspend hack
> > > >
> > > >  drivers/gpu/drm/bridge/parade-ps8640.c | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > >
> > > This looks OK to me now.
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'll let it stew on the mailing list for ~1 week and then land it in
> > > drm-misc-fixes unless there are additional comments.
> >
> > Pushed to drm-misc-fixes:
> >
> > 26db46bc9c67 drm/bridge: parade-ps8640: Ensure bridge is suspended in
> > .post_disable()
>
> Crud. I landed this and then almost immediately hit a bug with it. :(
> I've posted up the fix:
>
> https://lore.kernel.org/r/20240117103502.1.Ib726a0184913925efc7e99c4d4fc8=
01982e1bc24@changeid
>
> -Doug

Sorry, I missed this because the patch was based on drm-misc-next, so
it did not include commit 024b32db43a3 ("drm/bridge: parade-ps8640:
Wait for HPD when doing an AUX transfer").

I also forgot to apply that commit when I did my testing.

Pin-yen
