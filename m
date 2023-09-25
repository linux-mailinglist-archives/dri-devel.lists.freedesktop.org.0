Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F07AE1F1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 00:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E4C10E164;
	Mon, 25 Sep 2023 22:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CED10E164
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 22:54:05 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9b27bc8b65eso378562266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 15:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695682441; x=1696287241;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qDlt8685IO8EfILel9/XklmeSwJWvdU7kfcz0SQh0FU=;
 b=aX5zihNnR5QSLfAnvrRm1p/RzRVfbtI8xcAFZlE3PyPwyiwXqzaJmNjClav+drBmJp
 d5n3l9RXyvqHn4xfw5ESgHetNzI8CtYSt7YYKti46VCRngxvL/azJ75oq43fkdG4OXgR
 SHpd/GWa5UyOA6jGyI2W3HLsXmOBYelNc42d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695682441; x=1696287241;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qDlt8685IO8EfILel9/XklmeSwJWvdU7kfcz0SQh0FU=;
 b=pWF7YZvhhejWETpEcodKTqXJCC3SAH4bLdQ3Revy6F1qlfhRshBiIzZheXGsJVFjx+
 R+ZPMS/OM8kAgE74R2BUJ3k3Cw6jxg4T34xqZ1VnbGX3IgUdC67zGbDDWqnTny7lhhwy
 TmIhcodW7iGSKaf/Rm0KfycIdoWK2eqf/PC+yqVb46BdGd79r5KWrCjJ7HGLtsuozcM3
 pmVqljRgV0glVfpG+utQU6k7N0Nq6PD/Dc7jgmkilrdusbed968AGIjkjm5GWWpmcyLK
 V20VywWfrPu4QgmRYW46DoXxC8ey+pHdj75HaccoVymDp37eqjUCYq1eEadJ0PJekX+C
 z4cw==
X-Gm-Message-State: AOJu0Yy6dqFmiAczwPy2Ki0XFUQW7YkyoWyBkxtNZN1x4qI6EMbW3lGm
 XHwBa/ZFP8qdsT7XrlD01f9lBoIs+AthhkLaSNjPMEkV
X-Google-Smtp-Source: AGHT+IFTW7tAwCjl50GKsJTN4H3sDWWyiDaFmvvAIaQ0IA57YgnY2SFOZKmyEAjvHDVnUgWuLu8/gg==
X-Received: by 2002:a17:906:7954:b0:9ae:64b4:18b3 with SMTP id
 l20-20020a170906795400b009ae64b418b3mr8050200ejo.37.1695682441486; 
 Mon, 25 Sep 2023 15:54:01 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 v13-20020a17090606cd00b009ae5e46210asm6909331ejb.99.2023.09.25.15.54.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 15:54:01 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-53074ee0c2aso3444a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 15:54:00 -0700 (PDT)
X-Received: by 2002:a50:c04f:0:b0:525:573c:643b with SMTP id
 u15-20020a50c04f000000b00525573c643bmr16866edd.7.1695682440096; Mon, 25 Sep
 2023 15:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.1.I134336fce7eac5a63bdac46d57b0888858fc8081@changeid>
 <20230922075610.ekrzyz6hfcd3rjsm@fsr-ub1664-121.ea.freescale.net>
 <CAD=FV=ViV-n2T1Bup+XScsWD11yWpTmW3qEOLTTDj3kTtTY4Cg@mail.gmail.com>
 <20230925054710.r3guqn5jzdl4giwd@fsr-ub1664-121.ea.freescale.net>
In-Reply-To: <20230925054710.r3guqn5jzdl4giwd@fsr-ub1664-121.ea.freescale.net>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Sep 2023 15:53:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XSzVx2aoTshrh-ZmaQ-uFqhzw6iZPSBzmeMenjvTs2Zw@mail.gmail.com>
Message-ID: <CAD=FV=XSzVx2aoTshrh-ZmaQ-uFqhzw6iZPSBzmeMenjvTs2Zw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 01/12] drm/imx/dcss: Call
 drm_atomic_helper_shutdown() at shutdown time
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
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
Cc: kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-imx@nxp.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Sep 24, 2023 at 10:47=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> Hi Doug,
>
> On Fri, Sep 22, 2023 at 08:44:16AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Sep 22, 2023 at 12:56=E2=80=AFAM Laurentiu Palcu
> > <laurentiu.palcu@oss.nxp.com> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Sep 21, 2023 at 12:26:44PM -0700, Douglas Anderson wrote:
> > > > Based on grepping through the source code this driver appears to be
> > > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > > time. Among other things, this means that if a panel is in use that=
 it
> > > > won't be cleanly powered off at system shutdown time.
> > > >
> > > > The fact that we should call drm_atomic_helper_shutdown() in the ca=
se
> > > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > > instance overview" in drm_drv.c.
> > > >
> > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > No issues found on i.MX8MQ.
> > >
> > > Tested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> >
> > Thanks! Would you expect this patch to land through drm-misc? If so,
> > I'm happy to commit it there with your tags.
>
> Yes, please do. The i.MX8MQ DCSS patches go through drm-misc.

OK, landed in drm-misc-next:

89755ee1d593 drm/imx/dcss: Call drm_atomic_helper_shutdown() at shutdown ti=
me


> > If patches to this driver normally flow through drm-misc, I'm also
> > happy to post a patch to MAINTAINERS (or review a patch you post)
> > adding this to the entry for "NXP i.MX 8MQ DCSS DRIVER":
> >
> > T:     git git://anongit.freedesktop.org/drm/drm-misc
> >
> > ...which would make it obvious in the future that things should land
> > through drm-misc.
>
> Thanks, that sounds good.

https://lore.kernel.org/r/20230925154929.1.I3287e895ce8e68d41b458494a49a1b5=
ec5c71013@changeid
