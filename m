Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D0294B1B7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 23:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9501D10E20A;
	Wed,  7 Aug 2024 21:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CAANFnGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE25410E20A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 21:02:39 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a7a9a7af0d0so32519566b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723064557; x=1723669357;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTYXAHlyuGK4qJh3GSpiuZskKn2nz6H+kdyrHKoET5c=;
 b=CAANFnGM+S3IOhXaFEdSLe6rVdC8aCVWXtVCBqM+8HkjXjI7FPH537mBLD0UaG4Acc
 Idoy10LUD6NE5A5Bmyn7b76PJwLDcv/7cGpShxKa2exz78+xI/i4aLQD5xhWQNtvBjJ4
 wvxhHo84SU1dHwtObO3dVdwOgQS6USWFHO9KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723064557; x=1723669357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTYXAHlyuGK4qJh3GSpiuZskKn2nz6H+kdyrHKoET5c=;
 b=h2RJhVC4LpU7q0Le26mSqRz+UFd4rFxC43H5QXc0sVF+eoWOL5IWespgUFztiQnqJH
 keAjwHsXAG2c8nyJ+Q/2WFzTigsOZKzmArYiTHEsup6H94ldORwQHtx3OpViZ9qqGiBZ
 ADchLns7a2t/DLStzG4ha6tWAwyZH8mK5a9pwulEo17VMSwkFy68meGtyZm5SgHmQ7tH
 A4VZtlIfBCsU0nKmrQbHGx2FIGP7Ofo74AZsi4fLDaI2JHKFuRIBq4/IzRnXChYWbiKe
 6YeM/ftC1QE8/x3j8rGFylFX9E6zN5/6ViIKPtmfuumaczye+wu2oDkSk6PmoLqIYNuo
 7v4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/jyih2Bas+4lL/n1wRrAFjYy4aPVClP0iv8ZSZg8yzUCRyMTHJq9/xoe1ALC8/+c425Rq+Y2VwJ+98loxk+8eB6MIcnLpUweW5LEEN6e9
X-Gm-Message-State: AOJu0YwwIgIMkXEzJf/BdWHJEqDopwxMS72OWeOmqZAMDS6BlzGoWkLx
 8jKNU6X6Y7qhGUUXmPZDRQgWQ4i2ml7q1cZ/F2pVZsvekhebVn97u7hGHd97gSrnVOeRjKOoggR
 mCw==
X-Google-Smtp-Source: AGHT+IHZjIMrcnoX81FZ7yn/qwoE4EwNKXkYZpxRZ4fu6x2ltSELVX5IznUGOZVcoWLJguI7BIV+bA==
X-Received: by 2002:a17:907:804:b0:a7a:b9dd:7762 with SMTP id
 a640c23a62f3a-a7dc509885bmr1335257666b.42.1723064557087; 
 Wed, 07 Aug 2024 14:02:37 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec8cd5sm667157066b.213.2024.08.07.14.02.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 14:02:36 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-427fc9834deso19955e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 14:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAouu7R8bJsoirw2RdHD4YlzA2IV+3H77lOUdUUWs9d6jh9c8rOjudWCx9E7ymy0m2dZd3p9XQTVUcWcbnaVjxL7NMBWXkmWL5mIbH1IIH
X-Received: by 2002:a05:600c:a4f:b0:426:6e95:6ea7 with SMTP id
 5b1f17b1804b1-42909cdf292mr410945e9.0.1723064555426; Wed, 07 Aug 2024
 14:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240624185345.11113-1-michael@amarulasolutions.com>
 <CAOf5uwkhThmTEuhYAxAgLqg86PEHJ49wWp67RahVhio=O2OfQw@mail.gmail.com>
In-Reply-To: <CAOf5uwkhThmTEuhYAxAgLqg86PEHJ49wWp67RahVhio=O2OfQw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Aug 2024 14:02:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9=Ynhgi3nrfuM47rz053iWTvsEhhQFkZ5xp_bmwzmLA@mail.gmail.com>
Message-ID: <CAD=FV=W9=Ynhgi3nrfuM47rz053iWTvsEhhQFkZ5xp_bmwzmLA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panel: synaptics-r63353: Fix regulator unbalance
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Aug 7, 2024 at 5:39=E2=80=AFAM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi Doug
>
> +cc Doug
>
> I have seen that you have done some re-working and investigation on
> drm stack, do you have some
> suggestion on this case?
>
> On Mon, Jun 24, 2024 at 8:53=E2=80=AFPM Michael Trimarchi
> <michael@amarulasolutions.com> wrote:
> >
> > The shutdown function can be called when the display is already
> > unprepared. For example during reboot this trigger a kernel
> > backlog. Calling the drm_panel_unprepare, allow us to avoid
> > to trigger the kernel warning
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> >
> > It's not obviovus if shutdown can be dropped or this problem depends
> > on the display stack as it is implmented. More feedback is required
> > here

In general the shutdown should be dropped and it should be up to the
display driver to do the shutdown. If your panel needs to be used with
a DRM Modeset driver that doesn't properly call shutdown then the
ideal solution would be to fix the DRM Modeset driver. If this is
somehow impossible, I suspect folks would (begrudgingly) accept some
other solution.

From a super quick look, I see:

* This panel seems to be used upstream by "imx8mn-bsh-smm-s2-display.dtsi"

* In "imx8mn.dtsi" I see "lcdif" is "fsl,imx6sx-lcdif".

* "fsl,imx6sx-lcdif" seems to be handled by "drivers/gpu/drm/mxsfb/mxsfb_dr=
v.c"

* Previously I determined that "mxsfb-drm" was indeed calling
drm_atomic_helper_shutdown() properly [1]

...so it seems like just dropping the shutdown handler in this panel is cor=
rect.


[1] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f=
746b93621749c@changeid

-Doug
