Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFACF995668
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 20:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7C410E59C;
	Tue,  8 Oct 2024 18:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QWv3+c7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90F710E23F;
 Tue,  8 Oct 2024 18:25:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0C5D9A42981;
 Tue,  8 Oct 2024 18:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B889C4CED2;
 Tue,  8 Oct 2024 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728411907;
 bh=gbTLwyB5anW/NVNa27O4GYEgcT7Zt8zwGlDOBl4w9X4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QWv3+c7hgheNar52dT93kuaRJqQGwrTlm+2qt+dJoGyQzAHIgU0jubrC8ThWhyZIZ
 RS8ECJijkXPnKWXZt/DHYo4oNlel2cdA7QmeMfgDuBLkCfLLpl6vQcl4DNTcV5EyFH
 5h8XYKukhwE21LUBMtMTij4WxRmO6XhWfjQaEwayPWgg9ncS5s6vbgtpgFKR2d4Ze1
 U8RaeSIFzvB8vNoypQgBEdP43kZiPZVbc5vt/+kjhif0hCbio5j23Z7Fbcd2MdU+Eu
 u4mqS8NwdiP912BRPYfCL4ckK1zD9U7UpC3cflIOLH9kTp0r9qM6ScGNZWHbmYuBvP
 5BPH6goJRp7XQ==
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-5e7a6de544cso2887806eaf.0; 
 Tue, 08 Oct 2024 11:25:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXb+Win1Ydv9UnGxq7GZN0fN9KSPcjpiK9XsttONvcdtuqO72yw++PecyesR0NJ3RORJyBVbDSwwQ==@lists.freedesktop.org,
 AJvYcCXbOW4fzs9IHGF74UNFVQocLoMrTioQ+FNpZOXzLCy7IRqSdGAs6GSQQ9Yw7PCmgrstn6cGqgX/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcQIPwbQymInytmXm7bsUlz1di2wVCB7sRIg9WDgFRhoVjZmmu
 oNMdXdHPLexksmARYP9AKUZCjlSFueC8Ff+m8qO5pvMQTxUENd7UZaiLvNei1XdAvqxE6lKcYZa
 Chak8IXwgHsL5+h+Vm7a/gaySk/o=
X-Google-Smtp-Source: AGHT+IE8/UzrmOfg0dgL+a7sFpnmZmTmVZlVfZVXeH9h9sR6Zbx0f+k3/XHDUWx/NQFfJo1odWsZ7gtN5j50xL2u+GA=
X-Received: by 2002:a05:6820:228e:b0:5e1:d741:6f04 with SMTP id
 006d021491bc7-5e7cc079979mr12626737eaf.3.1728411906564; Tue, 08 Oct 2024
 11:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com>
 <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
In-Reply-To: <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Oct 2024 20:24:55 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Message-ID: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, 
 linux-input@vger.kernel.org, patches@opensource.cirrus.com, 
 iommu@lists.linux.dev, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, 
 asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Tue, 8 Oct 2024 at 00:25, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ulf,
> >
> > On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> > > On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > > > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > > > >
> > > > > > Hello everyone,
> > > > > >
> > > > > > This set will switch the users of pm_runtime_put_autosuspend() =
to
> > > > > > __pm_runtime_put_autosuspend() while the former will soon be re=
-purposed
> > > > > > to include a call to pm_runtime_mark_last_busy(). The two are a=
lmost
> > > > > > always used together, apart from bugs which are likely common. =
Going
> > > > > > forward, most new users should be using pm_runtime_put_autosusp=
end().
> > > > > >
> > > > > > Once this conversion is done and pm_runtime_put_autosuspend() r=
e-purposed,
> > > > > > I'll post another set to merge the calls to __pm_runtime_put_au=
tosuspend()
> > > > > > and pm_runtime_mark_last_busy().
> > > > >
> > > > > That sounds like it could cause a lot of churns.
> > > > >
> > > > > Why not add a new helper function that does the
> > > > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > > > > things? Then we can start moving users over to this new interface=
,
> > > > > rather than having this intermediate step?
> > > >
> > > > I think the API would be nicer if we used the shortest and simplest
> > > > function names for the most common use cases. Following
> > > > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is th=
at
> > > > most common use case. That's why I like Sakari's approach of repurp=
osing
> > > > pm_runtime_put_autosuspend(), and introducing
> > > > __pm_runtime_put_autosuspend() for the odd cases where
> > > > pm_runtime_mark_last_busy() shouldn't be called.
> > >
> > > Okay, so the reason for this approach is because we couldn't find a
> > > short and descriptive name that could be used in favor of
> > > pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
> > > you like it - or not. :-)
> >
> > I like the idea at least :-)
> >
> > > I don't know what options you guys discussed, but to me the entire
> > > "autosuspend"-suffix isn't really that necessary in my opinion. There
> > > are more ways than calling pm_runtime_put_autosuspend() that triggers
> > > us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> > > calling pm_runtime_put() has the similar effect.
> >
> > To be honest, I'm lost there. pm_runtime_put() calls
> > __pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
> > pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
> > RPM_ASYNC | RPM_AUTO).
>
> __pm_runtime_idle() ends up calling rpm_idle(), which may call
> rpm_suspend() - if it succeeds to idle the device. In that case, it
> tags on the RPM_AUTO flag in the call to rpm_suspend(). Quite similar
> to what is happening when calling pm_runtime_put_autosuspend().

Right.

For almost everybody, except for a small bunch of drivers that
actually have a .runtime_idle() callback, pm_runtime_put() is
literally equivalent to pm_runtime_put_autosuspend().

So really the question is why anyone who doesn't provide a
.runtime_idle() callback bothers with using this special
pm_runtime_put_autosuspend() thing, which really means "do a
runtime_put(), but skip my .runtime_idle() callback".

> >
> > >
> > > Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> > > during rpm_resume() too, for example. So why bother about having
> > > "mark_last_busy" in the new name too.
> > >
> > > That said, my suggestion is simply "pm_runtime_put_suspend".
> >
> > Can we do even better, and make pm_runtime_put() to handle autosuspend
> > automatically when autosuspend is enabled ?
>
> As stated above, this is already the case.

What really is needed appears to be a combination of
pm_runtime_mark_last_busy() with pm_runtime_put().

Granted, pm_runtime_put() could do the pm_runtime_mark_last_busy()
thing automatically if autosuspend is enabled and the only consequence
of it might be delaying a suspend of the device until its autosuspend
timer expires, which should not be a problem in the vast majority of
cases.
