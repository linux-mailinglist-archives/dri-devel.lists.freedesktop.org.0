Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7235CAE516
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 23:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A5B10E172;
	Mon,  8 Dec 2025 22:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="O+2dU3v8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F123710E172
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 22:21:25 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6492e7925d2so2017014a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 14:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1765232482; x=1765837282;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJAf24FuHQe95NZr/O9DtfATOUEp5YWLsl/0nDh2TTA=;
 b=O+2dU3v8A7v3p0wmOGOMtqPo9RQgxwShQ3i3U9CEvJuMaDN1aX9y5CUKaJO2pQlMmL
 j7RBCCO3TX+BRNx1pwExhrJlNRiHZxXIqat5bfxI6aDQEk8RlbnjhIgggytpvxoX4lcL
 ww2r5oIzlc1IxywO3GtcMrjcMh24em7CDUgBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765232482; x=1765837282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hJAf24FuHQe95NZr/O9DtfATOUEp5YWLsl/0nDh2TTA=;
 b=VfDiKFIKO7ioPmlQGAe1/vtjh9+3bOOnGbAGdhOdnXqm8nO8cjGjS6N06gUpe5w+yG
 qHzfV9TiQCzWZDMQuI/p/ioKzbdrlmSn+wMx548J1d8+EdBvcfizmKBRVOTqSUaB3F0P
 H2bGx4vdnwtg+n17Q8oBjIT/U1PH5g9ijfozJlKIRwHZZ1tzLHOws3hS36TKsjE8sU2H
 10DxhCmTXLtjsvCKuOGW9qSjQwVDv4pT4bKsWVm2J8sKH5yMDTV+x2HXX4q7IVh2yAto
 F2zOruNsy+b5kl4WqSN1qWzMe0lWhNaNQK4bhTXmoxDmZrrjnUrM6v0sFw7KP+Vb2E45
 UCIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxgXPYM/Q/IhCFkclWIWZZsBlJCve+xFn+r8hHnK8gIUH2IMgCl65Bjmp1TFnvKLeChG4mzyxCiDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUX0sERasGMJPJ7GvUHsP11l3OyjqtHlDnLdarCfQnu+e+05lh
 vpGTQbFbQ4W6QQZte6/EWRjLTbKvM2munFELfhHyewCyXXtc87BJlVy/TK53T2/nN3x2WaqQHQi
 QN47o6w==
X-Gm-Gg: ASbGncuwtKjbrI6c/9xg/9xNpJzoQFuxNRH9AjqlIhpaEFvRrQlL0rLo6rwYMGRGvn+
 3op+eQqyKOAX/PTb+dcEshTUFz5Wgm+o71IJfTcAZiFt1m7T8emCdGe+FNI0wCwTfDdBvqDh01u
 Bpz9hdV0wlPjAnoRDZebQQUg2MRNpgG7lpCUkXPE8YQOw5BQ770t8Cyq9QynEM/mq1BwdOMg0qE
 3+6h91MtGS/W26z3TgZoTureaTW1mvEKY+Luf4QVODv2e3HnjBP1LXx42ifaA2ev/fAz+Uui63+
 wZrHbt12mD4UP5xxnIxMU2qAREirb52AmoqdJU39aQgWtfIRjc1cNAJY73XQ7qRMZVyi9emio1U
 lLv33s4OkKXYn5zuUxlYa6Mldf0y5GmP7PAqsOdNNOeNdE+oiSvR0JRKWMkU+abkySJt5TRMtt5
 blthpfefl6SP1UXgSoA2pGrDtFW3byzqJQ2sMLWtmgER4g8jXcYw==
X-Google-Smtp-Source: AGHT+IFpjXQJjwcXuYliO4aQzChbUIu3OeAmvvTojztxkvpVmYK2eqUb0btem6tQIABfH0Qg0Ac6xw==
X-Received: by 2002:a05:6402:1ed0:b0:637:f07d:e80f with SMTP id
 4fb4d7f45d1cf-64919b853damr8414481a12.0.1765232481942; 
 Mon, 08 Dec 2025 14:21:21 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b4121d05sm11871330a12.29.2025.12.08.14.21.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 14:21:20 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42e2e5da5fcso2877313f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 14:21:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWeyUJCpwTuy7lmCuLNGwHrns7nCedt9uFtBvOPWuLXUTB4fv+wpD57M8IpgtkO4iBVb49wDvcJjE8=@lists.freedesktop.org
X-Received: by 2002:a05:6000:184e:b0:42f:8816:6e53 with SMTP id
 ffacd0b85a97d-42f89f5b7a9mr9262105f8f.61.1765232480155; Mon, 08 Dec 2025
 14:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20251125090546.137193-1-kory.maincent@bootlin.com>
 <CAD=FV=WikKrpLKvaxD22H0s3XHeG=WUiRrLJ0eQMM2pqvXJhuw@mail.gmail.com>
In-Reply-To: <CAD=FV=WikKrpLKvaxD22H0s3XHeG=WUiRrLJ0eQMM2pqvXJhuw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Dec 2025 14:21:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WrQpa3G0ggSMiJG8RnT45zCLug2YKTTgPfNrzAoQU98Q@mail.gmail.com>
X-Gm-Features: AQt7F2qfhZ_9C3ny6GB_ztDzwr2hF0lEcdFjQq7wCKYlX1JiOVwhYtW82bJNjiA
Message-ID: <CAD=FV=WrQpa3G0ggSMiJG8RnT45zCLug2YKTTgPfNrzAoQU98Q@mail.gmail.com>
Subject: Re: [PATCH v4] drm/tilcdc: Fix removal actions in case of failed probe
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bajjuri Praneeth <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, stable@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Mon, Dec 1, 2025 at 10:10=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Nov 25, 2025 at 1:06=E2=80=AFAM Kory Maincent <kory.maincent@boot=
lin.com> wrote:
> >
> > From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> >
> > The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() helpers
> > should only be called when the device has been successfully registered.
> > Currently, these functions are called unconditionally in tilcdc_fini(),
> > which causes warnings during probe deferral scenarios.
> >
> > [    7.972317] WARNING: CPU: 0 PID: 23 at drivers/gpu/drm/drm_atomic_st=
ate_helper.c:175 drm_atomic_helper_crtc_duplicate_state+0x60/0x68
> > ...
> > [    8.005820]  drm_atomic_helper_crtc_duplicate_state from drm_atomic_=
get_crtc_state+0x68/0x108
> > [    8.005858]  drm_atomic_get_crtc_state from drm_atomic_helper_disabl=
e_all+0x90/0x1c8
> > [    8.005885]  drm_atomic_helper_disable_all from drm_atomic_helper_sh=
utdown+0x90/0x144
> > [    8.005911]  drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [=
tilcdc]
> > [    8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 =
[tilcdc]
> >
> > Fix this by rewriting the failed probe cleanup path using the standard
> > goto error handling pattern, which ensures that cleanup functions are
> > only called on successfully initialized resources. Additionally, remove
> > the now-unnecessary is_registered flag.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at shutdow=
n/remove time for misc drivers")
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >
> > I'm working on removing the usage of deprecated functions as well as
> > general improvements to this driver, but it will take some time so for
> > now this is a simple fix to a functional bug.
> >
> > Change in v4:
> > - Fix an unused label warning reported by the kernel test robot.
> >
> > Change in v3:
> > - Rewrite the failed probe clean up path using goto
> > - Remove the is_registered flag
> >
> > Change in v2:
> > - Add missing cc: stable tag
> > - Add Swamil reviewed-by
> > ---
> >  drivers/gpu/drm/tilcdc/tilcdc_crtc.c |  2 +-
> >  drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 53 ++++++++++++++++++----------
> >  drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  2 +-
> >  3 files changed, 37 insertions(+), 20 deletions(-)
>
> Seems reasonable to me. I did a once-over and based on code inspection
> it looks like things are being reversed properly. I agree this should
> probably land to fix the regression while waiting for a bigger
> cleanup.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> This fixup has been sitting out there for a while. Who is the right
> person to apply it? If nobody else does and there are no objections, I
> can apply it to "fixes" next week...

Pushed to drm-misc-fixes:

[1/1] drm/tilcdc: Fix removal actions in case of failed probe
      commit: a585c7ef9cabda58088916baedc6573e9a5cd2a7
