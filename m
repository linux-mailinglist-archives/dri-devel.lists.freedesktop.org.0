Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EB830CCD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081A410E7AF;
	Wed, 17 Jan 2024 18:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C67710E7AF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 18:38:09 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50e7af5f618so12744919e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705516627; x=1706121427;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bvYD5YctFjlcXWn2S0lcBi88MDlkJ0fyWZbTuf+w4Q=;
 b=gBY2g2AQANSaOp1ueHgDDslJHQ9M0qNGD6nbyPXH/t94/ehjvyLcZJy6SdNlF6Gtju
 X5etOOjqS4hgJ88K7KmpHeT1tPPLUDzIsvRqN5rqxCox2Ff+RVpW+F5pouxBPn5cbEWc
 CjzcWJhV2d/EBTCnSGyqYeVkiGw2buxcZ7WGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705516627; x=1706121427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bvYD5YctFjlcXWn2S0lcBi88MDlkJ0fyWZbTuf+w4Q=;
 b=nG0gDKWvJ4kTR9+X3TwUJPA7/1j6a05U/V8zKzeVeXLuVUppOyyor0cenYGmjpfEfM
 +I8kKTa0hQDoCICYH/tbHFDMHpmunyNmxE1GYcXtzhuHdtPD5SWb2ahrWBV6h1XaVQVP
 4oWYNggeG9m33TQx0ymmkXH34y5RSzJWwB9k9x+6sKUfxthUxcrTWlSwk8r7Kt2je777
 UIYuXtLylTsUJlIqgLycqLhf7AfPUCeDxnJtKngNVIb868EygQ094nFqfXgBS9lp8xhh
 l69xlpkXYs8Dsi+0Lpv88QwJTEGpek5zDins0rMGt5yKX01BzhYp0FLIp70WADku7tTU
 uvfA==
X-Gm-Message-State: AOJu0Yx6z5RcQEt+8PYqjAye4D8tWSgsTFrYAlU2TYHEmQPc3EvJWHvN
 E2mqH5AT5B7KVxcj2oVaXWJRi58Y0KGuVJOmtzKx8uzrFuZ/oOc=
X-Google-Smtp-Source: AGHT+IEudNdRNDnMrw9PdsO1yLDsSYmN6TWs/NK45Y6uQk/u2cATz8WsO+a3kRcJt+SzcJehNSOxPg==
X-Received: by 2002:a05:6512:491:b0:50e:d71a:ebd0 with SMTP id
 v17-20020a056512049100b0050ed71aebd0mr3967854lfq.40.1705516627111; 
 Wed, 17 Jan 2024 10:37:07 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 tl23-20020a170907c31700b00a2e496510e9sm2717799ejc.35.2024.01.17.10.37.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 10:37:06 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40d5097150fso52655e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 10:37:06 -0800 (PST)
X-Received: by 2002:a05:600c:1990:b0:40e:863c:89d5 with SMTP id
 t16-20020a05600c199000b0040e863c89d5mr183514wmq.2.1705516625942; Wed, 17 Jan
 2024 10:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20240109120528.1292601-1-treapking@chromium.org>
 <CAD=FV=WjjH3BCDf-OnX=zdk201uMu+YJvKVBhVmMa4GqNinacw@mail.gmail.com>
 <CAD=FV=Va-67xojWbm-8MBCxaDG19gQhmNr3V_sBwYUkDkny9GQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Va-67xojWbm-8MBCxaDG19gQhmNr3V_sBwYUkDkny9GQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jan 2024 10:36:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UJMVZATztLsx9YCkV37TYuS_mphbHzhqrS3qNKQCzVAA@mail.gmail.com>
Message-ID: <CAD=FV=UJMVZATztLsx9YCkV37TYuS_mphbHzhqrS3qNKQCzVAA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: parade-ps8640: Ensure bridge is suspended
 in .post_disable()
To: Pin-yen Lin <treapking@chromium.org>
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

Hi,

On Wed, Jan 17, 2024 at 9:34=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Jan 9, 2024 at 8:52=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Tue, Jan 9, 2024 at 4:05=E2=80=AFAM Pin-yen Lin <treapking@chromium.=
org> wrote:
> > >
> > > The ps8640 bridge seems to expect everything to be power cycled at th=
e
> > > disable process, but sometimes ps8640_aux_transfer() holds the runtim=
e
> > > PM reference and prevents the bridge from suspend.
> > >
> > > Prevent that by introducing a mutex lock between ps8640_aux_transfer(=
)
> > > and .post_disable() to make sure the bridge is really powered off.
> > >
> > > Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power=
 management")
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - Use mutex instead of the completion and autosuspend hack
> > >
> > >  drivers/gpu/drm/bridge/parade-ps8640.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> >
> > This looks OK to me now.
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll let it stew on the mailing list for ~1 week and then land it in
> > drm-misc-fixes unless there are additional comments.
>
> Pushed to drm-misc-fixes:
>
> 26db46bc9c67 drm/bridge: parade-ps8640: Ensure bridge is suspended in
> .post_disable()

Crud. I landed this and then almost immediately hit a bug with it. :(
I've posted up the fix:

https://lore.kernel.org/r/20240117103502.1.Ib726a0184913925efc7e99c4d4fc801=
982e1bc24@changeid

-Doug
