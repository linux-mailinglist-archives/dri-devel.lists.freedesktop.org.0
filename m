Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A339F7890EA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 23:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DFF10E167;
	Fri, 25 Aug 2023 21:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0068010E167
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 21:58:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so1909274a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 14:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693000697; x=1693605497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5vqh0pjH8L8vsEX9VZkjGRGPe8QVst65z8KgGhXSIw=;
 b=CRNutOBDre83ONajAQ009LldpJ8dAFhd2csHUOezk3rezrdQqNMUVmMrB5cTc3vJLK
 Csm6FI/qYlTNOicsgJRTd/UWYt15uLdKySskcq+KI2M3+BJg4645ghygx5g3sBGbHy7p
 R0Hfo9sPw4vqe4ObJyEduLo/bSA4DL06LT6c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693000697; x=1693605497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5vqh0pjH8L8vsEX9VZkjGRGPe8QVst65z8KgGhXSIw=;
 b=c7xFz0WUhTNIMLNZxKolLBr68jJZTd+sgcz1BOsmm61gRRxMUGCC6S+1YXybH0Nzal
 G7zaJoV85+Cg2bGLUhJIVDA2wRrxHj9rlesmb3WTkfGeSGKr3jFWMtjr8Tl9mH2e9b2v
 /QF03+feNaOfmFbzXo5LzqdNy0Ie+jFikX9sXm5dByxXFmfcsF6H+jUrkTztFenEVg15
 wyNXFCPGBo9SkRRylPfgctRG23tngxEzf05DTJX8eKC6eqjxKGh1bqUjVMao+ZCtjWbc
 3LWaVSvNVrzZD8n2Rh5wiX54U6OcDrPTPa/YNC2FO/wT0keEIoeIglewXVpa0Dp3fwOx
 /maw==
X-Gm-Message-State: AOJu0YzF8kjcm32MS9U3bpeNvKahqLc+SsL1LHCjDFaOKzPx8tFNmHI7
 RZD9xCHE9uVHaIs37a7rYyb2spzLuxqHu9YPb0TUuA==
X-Google-Smtp-Source: AGHT+IFLC78Dvbt1QPCSN6fLllesZa4ucIgI2BvAsVe686C95FHGH/HUkqI3jY8raJWLHDeVIVnpwA==
X-Received: by 2002:aa7:d9c7:0:b0:529:4642:7933 with SMTP id
 v7-20020aa7d9c7000000b0052946427933mr16347189eds.36.1693000696756; 
 Fri, 25 Aug 2023 14:58:16 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 j19-20020aa7c0d3000000b005272523b162sm1403267edp.69.2023.08.25.14.58.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Aug 2023 14:58:16 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3fe2d620d17so28815e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 14:58:15 -0700 (PDT)
X-Received: by 2002:a05:600c:501e:b0:3f7:e4d8:2569 with SMTP id
 n30-20020a05600c501e00b003f7e4d82569mr31887wmr.5.1693000695582; Fri, 25 Aug
 2023 14:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
 <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
In-Reply-To: <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Aug 2023 14:58:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
Message-ID: <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime,

On Sun, Aug 6, 2023 at 11:41=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi Doug,
>
> Thanks for working on this :)
>
> On Fri, Aug 04, 2023 at 02:06:07PM -0700, Douglas Anderson wrote:
> > The goal of this file is to contain helper functions for panel drivers
> > to use. To start off with, let's add drm_panel_helper_shutdown() for
> > use by panels that want to make sure they're powered off at
> > shutdown/remove time if they happen to be powered on.
> >
> > The main goal of introducting this function is so that panel drivers
> > don't need to track the enabled/prepared state themselves.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> It shouldn't be necessary at all: drivers should call
> drm_atomic_helper_shutdown at removal time which will disable the
> connector (which in turn should unprepare/disable its panel).
>
> If either the driver is missing drm_atomic_helper_shutdown, or if the
> connector doesn't properly disable the panel, then I would consider that
> a bug.

Hmmm. I'm a bit hesitant here. I guess I'm less worried about the
removal time and more worried about the shutdown time.

For removal I'd be fine with just dropping the call and saying it's
the responsibility of the driver to call drm_atomic_helper_shutdown(),
as you suggest. I'd tend to believe that removal of DRM drivers is not
used anywhere in "production" code (or at least not common) and I
think it's super hard to get it right, to unregister and unbind all
the DRM components in the right order. Presumably anyone trying to
remove a DRM panel in a generic case supporting lots of different
hardware is used to it being a bit broken...  Not that it's a super
great situation to be in for remove() not to work reliably, but that's
how I think it is right now.

For shutdown, however, I'm not really OK with just blindly removing
the code that tries to power off the panel. Shutdown is called any
time you reboot a device. That means that if a DRM driver is _not_
calling drm_atomic_helper_shutdown() on the panel's behalf at shutdown
time then the panel won't be powered off properly. This feels to me
like something that might actually matter. Panels tend to be one of
those things that really care about their power sequencing and can
even get damaged (or not turn on properly next time) if sequencing is
not done properly, so just removing this code and putting the blame on
the DRM driver seems scary to me. Sure enough, a quick survey of DRM
drivers shows that many don't call drm_atomic_helper_shutdown() at
.shutdown time. A _very_ quick skim of callers to
drm_atomic_helper_shutdown():

* omapdrm/omap_drv.c - calls at remove, not shutdown
* arm/hdlcd_drv.c - calls at unbind, not shutdown
* arm/malidp_drv.c - calls at unbind, not shutdown
* armada/armada_drv.c - calls at unbind, not shutdown

...huh, actually, there are probably too many to list that don't call
it at shutdown. There are some that do, but also quite a few that
don't. I'm not sure I really want to blindly add
drm_atomic_helper_shutdown() to all those DRM driver's shutdown
callbacks... That feels like asking for someone to flame me...

...but then, what's the way forward? I think normally the panel's
shutdown() callback would happen _before_ the DRM driver's shutdown()
callback, so we can't easily write logic in the panel's shutdown like
"if the DRM panel didn't shut the panel down then print a warning and
shut down the panel". We'd have to somehow invent and register for a
"late shutdown" callback and have the panel use that to shut itself
down if the DRM driver didn't. That seems like a bad idea...

Do you have any brilliant ideas here? I could keep the function as-is
but only have panels only call it at shutdown time if you want. I
could add to the comments and/or the commit message some summary of
the above and that the call is important for panels that absolutely
need to be powered off at shutdown time even if the DRM driver doesn't
do anything special at shutdown... Any other ideas?


-Doug
