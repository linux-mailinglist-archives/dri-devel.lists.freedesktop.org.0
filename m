Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E199D539
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 19:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187A710E491;
	Mon, 14 Oct 2024 17:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cpBAWhK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDA810E492
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 17:03:53 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-539e1543ab8so4442051e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 10:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728925431; x=1729530231;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpqfZpy0KhNOi4dX7TpD4nUG6HhaVwhIk+AiVaYBRNs=;
 b=cpBAWhK893UTYddxwCY0Zi2Lvj8RA86WdP6nCS4hB5y0zsrfCGwDzvRo0QucC7LPlE
 LZfiAM08Lpl99EC66nipXIvoAOPciaZcN+qz/jnytqqQGnIcjaM3FOKwan0qk+i8BZ0q
 ucjM+d36LrgDJmMzT1aISl7eInPcU+XyqPZp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728925431; x=1729530231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WpqfZpy0KhNOi4dX7TpD4nUG6HhaVwhIk+AiVaYBRNs=;
 b=JHatXzPwrKkK7E2TqBY4weJOvCc1seUkptnkap2gmbUIeYwGfjj7ra45SPrOFxQ5R5
 4eqEJFfNEotpRMkW9yKmDMm4S2LHEWbe8N5m/uPPvZg1hYnTIqa6sUcx6pr9t89hOutj
 O6fgEHwQCVq+aFKQZwqy8y3XUCPWWCs+jVM/2dGUsJfhSITLtFmIKIb08c/TZwQ0EVOt
 u5lWTXSS6zqRa8TDxEob4gRmqizChwimP7VQ/V6TOALxJ/DWa+arZs5U2Y+suCdgvgQ2
 tanCcgEh2iXuosMhvDaooPfibUoCU3H++NaLBBtlzrciD3rmXVpvf52xhGB+S9UAD+fX
 z2Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw9/4K73NW4p5FCYxcvRNEsNKYPwg+91rxP7kBHe9un11Ngt8Aktlv/PnR2Om6O+Wqr8SfKBN2B4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxnwHFpjLfOEzgYrdYCbj8uDNzVx2PBn6wZiYm4nSG7RphAo41
 WCg0JJlf9Pf5PfaWXfxBtcr5i3rnF/Sr8ji1rbRRVpP9F6gOsvF+mgNUIoNzqAsrn54RoGJjn0f
 +lw==
X-Google-Smtp-Source: AGHT+IHdb2AjZAopM+CSL9Xamg+51hivZnNhs/BmtGbTGBqaDwwjUeHiN2i7ctepwYYzNWIBADUA2Q==
X-Received: by 2002:a05:6512:1598:b0:530:b773:b4ce with SMTP id
 2adb3069b0e04-539e551a25emr4813880e87.33.1728925430246; 
 Mon, 14 Oct 2024 10:03:50 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb8f0ea9sm1698468e87.186.2024.10.14.10.03.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 10:03:49 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539f58c68c5so2013894e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 10:03:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7mOk0iWb7DLsmPgpvp+x447w8o9522l9C99RHNTAOlmK7mUpO9pT1vgmY98aU9zQ+bBVZ8U22dFU=@lists.freedesktop.org
X-Received: by 2002:a05:6512:39c7:b0:531:8f2f:8ae7 with SMTP id
 2adb3069b0e04-539e550179cmr5026613e87.25.1728925429365; Mon, 14 Oct 2024
 10:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241011020819.1254157-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=XfHtdc9RpEwAtVHNYwBGJGhHUAoHaJhP+ZPWuUHAASFQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XfHtdc9RpEwAtVHNYwBGJGhHUAoHaJhP+ZPWuUHAASFQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Oct 2024 10:03:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMaAo9x0URaaVNxzx+ztLreAcbiAfLFvDFNcHut5srvg@mail.gmail.com>
Message-ID: <CAD=FV=UMaAo9x0URaaVNxzx+ztLreAcbiAfLFvDFNcHut5srvg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83102: Adjust power and gamma to
 optimize brightness
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, linus.walleij@linaro.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 11, 2024 at 7:20=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Oct 10, 2024 at 7:08=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The current panel brightness is only 360 nit. Adjust the power and gamm=
a to
> > optimize the panel brightness. The brightness after adjustment is 390 n=
it.
> >
> > Fixes: 3179338750d8 ("drm/panel: Support for IVO t109nw41 MIPI-DSI pane=
l")

When applying your patch, I got a yell about your "Fixes" line. It
turns out you didn't copy the subject of the patch you're fixing
exactly. The above should be:

Fixes: 3179338750d8 ("drm/panel: himax-hx83102: Support for IVO
t109nw41 MIPI-DSI panel")

I'll fix that when applying. Please make sure you get the commit
subject exactly in the future.


> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx83102.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
>
> No objection on my part. This is just modification of some constants,
> is well described, and is to a panel that you added so I don't think
> it needs a long bake time on the list. I'll plan to apply this on
> Monday unless there are comments or someone beats me to applying.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I've applied and pushed to drm-misc-fixes:

[1/1] drm/panel: himax-hx83102: Adjust power and gamma to optimize brightne=
ss
      commit: fcf38bc321fbc87dfcd829f42e64e541f17599f7

-Doug
