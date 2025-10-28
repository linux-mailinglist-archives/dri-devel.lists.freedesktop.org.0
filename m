Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FDC1529D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3108F10E0DD;
	Tue, 28 Oct 2025 14:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ktGQ6K35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B0110E0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:28:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5930f751531so1109859e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 07:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761661686; x=1762266486; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSF92TUdTEXQPnEN1rN74WhxSXDkEHjt64aihPbY3e0=;
 b=ktGQ6K35+UDzndefmnrApbuJ06kgkJ46urAcAFMDhdncKMhrS/HG8VVZSpaQ9W6u6L
 /v8JIAQHPy/WxeqXWP2iXRqPy5GOsqgxR6Rmkk+8nCTFrb/AIJEe7INvGezIxeXtWENz
 KDbl8F4SkDITCCTbTDGyuPROi7ZEoDouAeky8tgdGwqvr8nMTIxxgftoUpH5StMcm+db
 C1Fb+da11f4bnGhPPoaBb3glIVJjYEG1HZftvf2lqwkpc7k//EogxtYoMQeqBKx4vG/n
 oBSqQ4wOowzMJYkFNYSDbMnDORnD2KrhDmftgQJrdFl2QljTZNKQTGyyG71CUDrSRE15
 4RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761661686; x=1762266486;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSF92TUdTEXQPnEN1rN74WhxSXDkEHjt64aihPbY3e0=;
 b=lh00xfAzu7fcD7p8buZeSwdqFnoFfOG8Rh0Jho/1rOjc0tNEH3Y/7h80v3SRFZI2Nv
 w4no0Dk1WpiVp0EA5eyuCn1ZG7H2JQzMkOt0I3cPylBMmZxNIUKte/ZhKZ32qnr3qvDT
 CMOq6PqlzQoqSxpfFd/avSEC29WCMi7+7b+TTjdQEB9+prTL6asufIsPLT+KLBR2jvd4
 M3Lj+4TmqiGxasBjvnfYVqLstxHrb3UUi6mmyMyBi8NhdkdH3ibgrafYDWxoerpb6YXb
 wBAnLGPL8H/U6pWDi0op/2okWlWeHPmppotjNIv+a6AC54iXuI9piRxU3qh6hi5ixIwh
 gepg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtPGnJ194SAjlwATeWqPYYoKO+ktSntu/c2i+sTlggMaAFsmBJ8iv6wlSo1zcg4vDdX9Pxl+53Na0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywhpr6BOjKv2dSyBpSZ28T2/Sj6tQ+g8SU72ngqRn/j5bSwP2+H
 uGVoPBxHP43zx3GaF65twz/4MYvfqXTUd5+N/zm05wvqg+GvFqlFQ1ixQTY/eQHACgoNKDrYyQd
 g3RVrEKsXIx78Ku9aAsLFgCjdQJzeaLbSSW57N3f+Vw==
X-Gm-Gg: ASbGncuzIbN1IbinZdiR7v9f37KVW5p+xkIi153B6HRrtzb8s5wqF18+/Zsczp5G+7A
 9NgbGxWscMZg5pGcBO9tZRnxSF0a1KxyIi+9+gUE38tTbY4IYNCBgShhHlzlqTK3bKeHQMksexM
 XR6hQDUbJjJxyayYirE1JFC6IAeSFuKQQ75tmrN5CdtsKMjeZRyJJT76ZwqiP9qzyGHHxBqJg6N
 28mKtQ6P2EQGULaXw/bBWtm/X6f/hkNGYV+hO6eVbhB3cvuPMySl+lPY81JBztSJ+PJn7I=
X-Google-Smtp-Source: AGHT+IE4sqvI86RtTKCA6qNvTuaiR3Vkbwvle2u9hx3bAwEVaFr63lfr3Vn0DTetZ4mGl2ozc/Np9BqIFOJBXCSLmI4=
X-Received: by 2002:a05:6512:12ce:b0:57b:8675:e358 with SMTP id
 2adb3069b0e04-5930e9b2d99mr1222413e87.21.1761661686112; Tue, 28 Oct 2025
 07:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
 <067817a3-dee3-4ffb-a56f-8b46949cb494@ideasonboard.com>
In-Reply-To: <067817a3-dee3-4ffb-a56f-8b46949cb494@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Oct 2025 15:27:53 +0100
X-Gm-Features: AWmQ_blBM_uldSU5dj9wxKjsTC8oAMVuLr0QR2XATlrrLzeuPNq25xQKoJxdRPI
Message-ID: <CACRpkdYth1-QMDRW17bERXdzYvxvkfLq0o5QVTiis+o6NqubBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm: panel: Fix atomic helper-induced regressions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>,
 Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org
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

On Tue, Oct 28, 2025 at 11:32=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> > As the CRTC is no longer online at bridge_pre_enable()
> > and gone at brige_post_disable() which maps to the panel
> > bridge .prepare()/.unprepare() callbacks, any CRTC that
> > enable/disable the DSI transmitter in it's enable/disable
> > callbacks will be unable to send any DSI commands in the
> > .prepare() and .unprepare() callbacks.
>
> Well, that wasn't the intention...
>
> We also have this pre_enable_prev_first hack in the drm_bridge, but I
> guess that doesn't help in this case?

I don't know what that's for, the panel bridge isn't
using it so it doesn't help any panel driver?

> More generally speaking, I think the core issue is that we have the DSI
> video stream as a dependency for DSI commands.

That's right, I think.

> It would be better if the
> DSI hosts dealt with DSI commands independent of the video stream, in
> other words, one could send a DSI command at any time.
>
> Unfortunately in some cases that might be impossible, if the DSI host
> depends on the incoming pixel clock to function...

This is the case with the MCDE driver. It even cannot use the
existing .enable/.disable callbacks in it's bridge because it really
needs to bring the DSI transmission block up at the right time
in the initialization sequence.

I'm not making it up: I really, really tried hard to just initialized
it independently. It just won't, it's too tightly coupled with the
DSI video/command stream generator.

> In this particular case, if the same driver is dealing with the crtc and
> the dsi host, wouldn't it be possible to make the
> mipi_dsi_host_ops.transfer() work regardless of the enable/disable status=
?

Sadly no.

FWIW I think it is fine to require the DSI panels to only send
DSI commands in .enable/.disable and not in .prepare/.unprepare,
it's intuitive in a way, if we go for this semantic I can send a doc
update after the fixes and try to look over the panel drivers a bit
and see if there are more offenders.

Yours,
Linus Walleij
