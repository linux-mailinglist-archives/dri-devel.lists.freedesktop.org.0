Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C58792FF8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 22:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA8010E50A;
	Tue,  5 Sep 2023 20:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1841410E50A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 20:29:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9a63b2793ecso436316766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693945754; x=1694550554;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bpdw72cpSgmaX22+3FdeOvfo0LutgJ3/l7xm/56ifbU=;
 b=bPccczUJqSKWlcVrvFB08yCoexnjavLYg4/AfQkfpd4CKxE4bZtAQ11CBdcq78gu2J
 NooiMkLqyZBulX+/lP7sQMVoqBNbAvAVoFL2YE4l7tsRUr6P7GepggIKbVPhUGusNM6x
 Ki7AaQ+cDRicevQ+7ZHM7wMnJUrJZoDhE9VJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693945754; x=1694550554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bpdw72cpSgmaX22+3FdeOvfo0LutgJ3/l7xm/56ifbU=;
 b=Vk7Ha6OS5CbeWwH5slzS5+jUKcArx8HE1eJ10+f/lDWRcSskSWQcplh6sPStVHxD77
 JpblYGpW6yVBBR74QFGKJmExnMH7CHwRBuBCSXCV6C4TmmCY3qsVZjOwJCQ7QN+cwiJ6
 WmMOhLVdLvkq0OOhGudZtLuC3WpW4aXhoBuMyazwsNFT4nLcxKuSfXrSLtj613eGbvoc
 YnJPX0d7adX0PwPHj5jOFjZkhCk2E+9G7GHL2a8BLXIE9ymLsjm5Sghx0yrj9+Yhx7zJ
 3tlJGD03QUb0WjsTCvv4Th0p245NvG2UkNRstHOEu3eTaMYpesWw3P98kh+06Kr+PcN1
 mrBw==
X-Gm-Message-State: AOJu0Yy2cWDz2kobBthcfFEiJy1sv0rOG5K72yfV1ydd/e8AVp81upUX
 mNFHKjxO4vw8Ne2YMft0/gY7B217yb8SzeFFXKjDqyCt
X-Google-Smtp-Source: AGHT+IFXbLtwCcKUkI1zDdFwHJJpSToxg/nussnK0GvgWNdMymbsWxjaPBYuhBib09lZvAu7sbreaA==
X-Received: by 2002:a17:906:318c:b0:992:3897:1985 with SMTP id
 12-20020a170906318c00b0099238971985mr720131ejy.43.1693945753946; 
 Tue, 05 Sep 2023 13:29:13 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 o21-20020a1709062e9500b009a13fdc139fsm8053209eji.183.2023.09.05.13.29.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 13:29:13 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-402c80b71ecso25885e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 13:29:13 -0700 (PDT)
X-Received: by 2002:a05:600c:1d28:b0:401:a494:2bbb with SMTP id
 l40-20020a05600c1d2800b00401a4942bbbmr6526wms.5.1693945753084; Tue, 05 Sep
 2023 13:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.13.I0a9940ff6f387d6acf4e71d8c7dbaff8c42e3aaa@changeid>
 <32186b941d6228a102b5e799aadf34206b58ac15.camel@pengutronix.de>
In-Reply-To: <32186b941d6228a102b5e799aadf34206b58ac15.camel@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Sep 2023 13:29:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLw3cAU0nuNuKXiu=Zbv4tVa3aa35GFaxsjO880T0pmw@mail.gmail.com>
Message-ID: <CAD=FV=WLw3cAU0nuNuKXiu=Zbv4tVa3aa35GFaxsjO880T0pmw@mail.gmail.com>
Subject: Re: [RFT PATCH 13/15] drm/imx/ipuv3: Call drm_atomic_helper_shutdown()
 at shutdown/unbind time
To: Philipp Zabel <p.zabel@pengutronix.de>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 4, 2023 at 1:30=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> On Fr, 2023-09-01 at 16:41 -0700, Douglas Anderson wrote:
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown time
> > and at driver unbind time. Among other things, this means that if a
> > panel is in use that it won't be cleanly powered off at system
> > shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart and at driver remove (or unbind) time comes
> > straight out of the kernel doc "driver instance overview" in
> > drm_drv.c.
> >
> > A few notes about this fix:
> > - When adding drm_atomic_helper_shutdown() to the unbind path, I added
> >   it after drm_kms_helper_poll_fini() since that's when other drivers
> >   seemed to have it.
> > - Technically with a previous patch, ("drm/atomic-helper:
> >   drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
> >   actually need to check to see if our "drm" pointer is NULL before
> >   calling drm_atomic_helper_shutdown(). We'll leave the "if" test in,
> >   though, so that this patch can land without any dependencies. It
> >   could potentially be removed later.
> > - This patch also makes sure to set the drvdata to NULL in the case of
> >   bind errors to make sure that shutdown can't access freed data.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Thank you,
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks! I notice that:

./scripts/get_maintainer.pl --scm -f drivers/gpu/drm/imx/ipuv3/imx-drm-core=
.c

Doesn't say drm-misc but also when I look at the MAINTAINERS file and
find the section for "DRM DRIVERS FOR FREESCALE IMX" it doesn't
explicitly list a different git tree. I guess the "shawnguo" git tree
listed by get_maintainer.pl is just from regex matching?

Would you expect this to go through drm-misc? If so, I'll probably
land it sooner rather than later. I can also post up a patch making it
obvious that "DRM DRIVERS FOR FREESCALE IMX" goes through drm-misc if
you don't object.

Thanks!

-Doug
