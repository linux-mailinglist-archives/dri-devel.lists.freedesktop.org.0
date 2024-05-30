Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08148D5635
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11BE10E188;
	Thu, 30 May 2024 23:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i5D41tku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A8310F884
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:25:28 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dfa46cedc5aso1338374276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717111527; x=1717716327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sv0LecyVOWd5yytKjjDHRWsA6Vnu0bk1m9ADGMShsuo=;
 b=i5D41tkuCT6x83Ahh17UAG5lAFLq3l0OSigeV7VNkY0qTCHHFSaDQ3GHFSqbyfg2HK
 D6rXkbz7cdO0cidvTEvLs3zxlEwizP7hCi/5EPe8492kbuAniISC4FQGYXekFyhrFBYO
 a9xNo1xgB7zrLk+UnCIe9JtFLFpbevzhxMaArXPq9v5HZVWPJQY0VxDQb9/8/n2kg7HJ
 PCRe1777The2ZC9BcHK6y5FzABVT65CFVgchJfNqNlliR3SYvsMxfxDW2O7kyW8LEOD9
 Mzv5SIbcsYUa81mX1JaMGoPbpoPN/b9diJ7pDwk5X/LkQ8mY4DhGfuQ57KdolDC7ejK5
 wwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717111527; x=1717716327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sv0LecyVOWd5yytKjjDHRWsA6Vnu0bk1m9ADGMShsuo=;
 b=C7c+2gY/2tsZRFgQlRqQkMauHS4//4xm8tGEnlp+TsA5sAHt6utXJmsFV1aOFBrhe5
 /EQLO6pwKFGOMPpTTO1wfichUa2nXVKceR8jmWEpJak4A9Qybn9+JAmIiHvh0lqycB1F
 BBJbIChAJ8/c5ub3gdetZC73zptjubn1PNl0rEfTiZKdHhzUmgwtzEYSPDYmNwu1xyqY
 PUJDoW5j5zDE2IUKodefuqBthqdGkrQC1nUwVUHFHnr45jOw/Bkz2aXIkWd4dUOVRWiW
 3KPDJoszENvqMQx+qfv0ABpbRZeMiudEqubTj8CGY3sjcmbYGMnhcXfXDYAzJ5qu0jKb
 nscQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdEMrsOag8sVqelhzi/CQAEkUlLHCr6dQfCLH7qtKzB1W4k5wBQIhn15zCruqJMYM87kI+zgQlGPeCroUifEituOmdztVoW6T51XB4MIni
X-Gm-Message-State: AOJu0YzU3pf3DEmWKKqCZsU5MHzbr+bboAeR1iuMHwayNlu+eKuWsGwG
 wQK6OWRfNC0r5XnxT5G9910R2BC/gvmjCP5bpE4mCJDqG4YOrwkI4yzKHkEzX38FGCCtbcNxFl6
 o8IH11M+rs54u1VuUOv/Lj3vpNvJIuE+oEYDLpw==
X-Google-Smtp-Source: AGHT+IGoT2aZ50ey6PYkXo4gk0t6FYv3SWVRLhfFVMNTxxcjrabn1SF849fjcmILla0ETMZvmc8wUcRAZ6PmWQmcsDw=
X-Received: by 2002:a25:a2c6:0:b0:de5:852f:6afe with SMTP id
 3f1490d57ef6-dfa73c23234mr310487276.30.1717111527524; Thu, 30 May 2024
 16:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
 <CAD=FV=XMgAnaEaHXZJL57+66OXs0afP9vurxf_ffqkum=xqEfA@mail.gmail.com>
In-Reply-To: <CAD=FV=XMgAnaEaHXZJL57+66OXs0afP9vurxf_ffqkum=xqEfA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 02:25:16 +0300
Message-ID: <CAA8EJpoy4vTGGFqoCXUKshWhLVUL8ME1i2Z_X5B+yRG45vx6+w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
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

On Fri, 31 May 2024 at 02:24, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, May 30, 2024 at 4:13=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > There are two ways to describe an eDP panel in device tree. The
> > recommended way is to add a device on the AUX bus, ideally using the
> > edp-panel compatible. The legacy way is to define a top-level platform
> > device for the panel.
> >
> > Document that adding support for eDP panels in a legacy way is strongly
> > discouraged (if not forbidden at all).
> >
> > While we are at it, also drop legacy compatible strings and bindings fo=
r
> > five panels. These compatible strings were never used by a DT file
> > present in Linux kernel and most likely were never used with the
> > upstream Linux kernel.
> >
> > The following compatibles were never used by the devices supported by
> > the upstream kernel and are a subject to possible removal:
> >
> > - lg,lp097qx1-spa1
> > - samsung,lsn122dl01-c01
> > - sharp,ld-d5116z01b
> >
> > I'm considering dropping them later, unless there is a good reason not
> > to do so.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v3:
> > - Rephrased the warning comment, following some of Doug's suggestions.
> > - Link to v2: https://lore.kernel.org/r/20240529-edp-panel-drop-v2-0-fc=
fc457fc8dd@linaro.org
> >
> > Changes in v2:
> > - Actually drop support for five panels acked by Doug Andersson
> > - Link to v1: https://lore.kernel.org/r/20240523-edp-panel-drop-v1-1-04=
5d62511d09@linaro.org
> >
> > ---
> > Dmitry Baryshkov (3):
> >       drm/panel-edp: add fat warning against adding new panel compatibl=
es
> >       dt-bindings: display: panel-simple: drop several eDP panels
> >       drm/panel-edp: drop several legacy panels
> >
> >  .../bindings/display/panel/panel-simple.yaml       |  10 --
> >  drivers/gpu/drm/panel/panel-edp.c                  | 192 +++----------=
--------
> >  2 files changed, 25 insertions(+), 177 deletions(-)
>
> Thanks! I'm happy to apply this series or also happy if some other
> drm-misc committer member wants to apply it. Probably we should wait
> for a DT person to make sure that they don't have any problems with
> the bindings change.

Yes, I'm waiting for an ack from DT maintainers.

--=20
With best wishes
Dmitry
