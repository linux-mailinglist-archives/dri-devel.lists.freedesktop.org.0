Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9073C1A46
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 22:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0C26E996;
	Thu,  8 Jul 2021 20:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C303E6E996
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 20:04:18 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id e14so6944589qkl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i2ShnqkwGdY+p9FXl6ZlIp+vJU67PDq4UAj6sQK/5ts=;
 b=JvScqzChNTblNbgYpS84sBhIuExRyWQApm2ngU4vqQxH/grkGtf+hjmRLQtR6ZQ/V8
 ufa1fMdEjY0jE2yiaN8iYau0y7JA7V7qGDINwm7gTf7ccNojE7ykB8ymUhi1LYZH+5AK
 x5CuwgelO8Z76eKfPtRT4HiptRITFEm3NHz6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i2ShnqkwGdY+p9FXl6ZlIp+vJU67PDq4UAj6sQK/5ts=;
 b=uKLgLxR6QT/n0aRKJc7vUqB0/IqhQfLrPr4CgGpttUexy56jDLUqxH6o/cuF7Ai0ji
 PZgRunS85kMIdhPOIQbYBqi4L+l/RY6sFBhRBkf4nnutxSD36Ny66QI6U4/j0bfIvZqt
 5cRzjPf279b5e2N4+4d1kcHAIfICCEInAOUUHVluzsw3kTJarVV67IqToWuwaZ0hZ+85
 WqDnYtkk/8Jccn/t87brIGQewXMnDzftvFfU1h/oUSN7lpFqMCKwohmsNB2skOuuL58M
 BbCtUTeqDbBHdCsVBopdO70iSnlUWbyAwBN5Toflj5Y8cTZNso6yj3HH0qN+s0Bno/6R
 7vdQ==
X-Gm-Message-State: AOAM531nxKbmb5iW/aywwb2R6f99yesnhaA+bKEYbqB30oJW9EUnWyO1
 IWMhGrOU6W1keey4g8lqtScdJSu0voX8IA==
X-Google-Smtp-Source: ABdhPJwhqrdrUkAfTy06ua74/e+6SF9ZiFdxvcEWiuG3/EjqiwLNYHlD6HXdZVHklJVPXUOevcrhMw==
X-Received: by 2002:a37:a545:: with SMTP id o66mr7898662qke.310.1625774657738; 
 Thu, 08 Jul 2021 13:04:17 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id o13sm1365774qti.84.2021.07.08.13.04.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:04:17 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id r135so11006001ybc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:04:16 -0700 (PDT)
X-Received: by 2002:a25:d97:: with SMTP id 145mr43551072ybn.276.1625774656588; 
 Thu, 08 Jul 2021 13:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210702135601.3952726-1-linus.walleij@linaro.org>
In-Reply-To: <20210702135601.3952726-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jul 2021 13:04:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4QiXRXNiB6QZtb2KZ=vzXcNzAfN4YUxkVnfxQA_3hXA@mail.gmail.com>
Message-ID: <CAD=FV=U4QiXRXNiB6QZtb2KZ=vzXcNzAfN4YUxkVnfxQA_3hXA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dbi: Print errors for mipi_dbi_command()
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 2, 2021 at 6:58 AM Linus Walleij <linus.walleij@linaro.org> wro=
te:
>
> The macro mipi_dbi_command() does not report errors unless you wrap it
> in another macro to do the error reporting.
>
> Report a rate-limited error so we know what is going on.
>
> Drop the only user in DRM using mipi_dbi_command() and actually checking
> the error explicitly, let it use mipi_dbi_command_buf() directly
> instead.
>
> After this any code wishing to send command arrays can rely on
> mipi_dbi_command() providing an appropriate error message if something
> goes wrong.
>
> Suggested-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Make the macro actually return the error value if need be, by
>   putting a single ret; at the end of the macro. (Neat trick from
>   StackOverflow!)
> - Switch the site where I switched mipi_dbi_command() to
>   mipi_dbi_command_buf() back to what it was.
> - Print the failed command in the error message.
> - Put the dbi in (parens) since drivers/gpu/drm/tiny/st7586.c was
>   passing &dbidev->dbi as parameter to mipi_dbi_command()
>   and this would expand to
>   struct device *dev =3D &&dbidev->dbi->spi->dev
>   which can't be parsed but
>   struct device *dev =3D &(&dbidev->dbi)->spi-dev;
>   should work. I hope.
> ChangeLog v1->v2:
> - Fish out the struct device * from the DBI SPI client and use
>   that to print the errors associated with the SPI device.
> ---
>  include/drm/drm_mipi_dbi.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

This seems reasonable to me. There's really no reasonable case I can
think of where someone would want to handle the error without it
spitting something in the logs. If someone ever comes up with a need
for that then we can always add a variant that avoids the logging. ;-)

With the commit message fixed as per Noralf:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
