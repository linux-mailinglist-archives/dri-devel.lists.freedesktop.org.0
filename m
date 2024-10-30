Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B09B6B53
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 18:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487BF10E3E9;
	Wed, 30 Oct 2024 17:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZwA31ihu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5555D10E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 17:50:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539e6c754bdso95908e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730310632; x=1730915432;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eViS5GExJs7/C8t7zeY7Kx13rGb7WxwrhKFvKq8t8Io=;
 b=ZwA31ihuWiJg4ZHdR+meBJIBu0IqPVzfY8RO1gyyCsCRmd13Ocz8xBsVO3C8q1dL1w
 g1SCR5S2jx66DftAAfU5ZFJ3gDW73u5tAL1/95u9+DrqM+fGb6wJ6klsfBXPvxr/EtFE
 JdpqLO6MkmK5geI+sf+lURaCGDaGSeo4STFzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730310632; x=1730915432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eViS5GExJs7/C8t7zeY7Kx13rGb7WxwrhKFvKq8t8Io=;
 b=fr/AtOc9O2MxAcJk7jF42dRGMQK4Uk3X0luhTQ+YF4ZNwAc/4dcQvRcROji/LFXbzI
 y0B12/d7d65+7rLaDvyYqL4ght1KbkdGWRUt4N06B780i8L7OkiejLOwrfuQykimclBF
 mdsMUSdOvx2qf6KtB5LN/PZr4KpIAOvSL3anepsyUMAVHVTDrOvEROlUedtHrxxSdS26
 8VVNK0k0lKPwhgyrzpvURDH3SBOsJDdyeNlgqqpYOXfzw8lUmK+XYiy7qPkuPM0IoM8c
 ORBSqGafdYXDVGs1EB2h3rrOtLT6MVpdEwLNbeILgyRY1N//CYWp8uzb6Tp4cd2B/HX/
 u5lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWei3YUEqOZc4b8XabyBUod/9CDEW/prQk5oMfSNcjG907jBmh7jel1LmI33gWWF4kZf4EmNUrK0C4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZDzaeNyLA1V4TZQiiwMUiQjhMOPuy8uEnbPgNdJ6BXwluGJiw
 TkQbI1pCKOdmb7iHFs4hQqqBr1twupQF0Rw7IzQOs/UqTpg+2es+qQ5RE6xbr2bNFwP6Q5UddBK
 QEg==
X-Google-Smtp-Source: AGHT+IGmEn6gEhr3hgkEW0RdW6vv7dkDut7RzkFfTPBr24RdF+i2AV5QAgQZnruAlP6By7Z20761YA==
X-Received: by 2002:a05:6512:3b89:b0:535:d4e6:14e2 with SMTP id
 2adb3069b0e04-53c79e61133mr292054e87.36.1730310632284; 
 Wed, 30 Oct 2024 10:50:32 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53bc0d52e35sm304392e87.152.2024.10.30.10.50.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 10:50:30 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb3debdc09so189701fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 10:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHPyOqOyCY1Xl59i4rsNkqrcFR0Sx3pqmnCg2IMF5rrdBTXA6oMifwFzD5RE7yJYL78S8Nob2kw1o=@lists.freedesktop.org
X-Received: by 2002:a05:651c:50c:b0:2fb:58d1:d9a3 with SMTP id
 38308e7fff4ca-2fdec5f8336mr2759001fa.18.1730310629695; Wed, 30 Oct 2024
 10:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241026035928.183454-1-tejasvipin76@gmail.com>
 <CAD=FV=Vps5vWD72O_kYhuKudduYed41+tZrVRB6x+FiaZrm-EA@mail.gmail.com>
 <c389ea3e-70cb-46c5-8cf1-878a99f771ec@gmail.com>
In-Reply-To: <c389ea3e-70cb-46c5-8cf1-878a99f771ec@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Oct 2024 10:50:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmPmroitmYL3a4pdw8ai2LiQpJ6=zYh0kUdqcp6463Rw@mail.gmail.com>
Message-ID: <CAD=FV=WmPmroitmYL3a4pdw8ai2LiQpJ6=zYh0kUdqcp6463Rw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: leadtek-ltk050h3146w: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, Oct 30, 2024 at 12:24=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> On 10/29/24 12:24 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Oct 25, 2024 at 9:00=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail=
.com> wrote:
> >>
> >> @@ -418,79 +398,42 @@ static const struct ltk050h3146w_desc ltk050h314=
6w_data =3D {
> >>                 MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
> >>  };
> >>
> >> -static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int =
page)
> >> +static void ltk050h3146w_a2_select_page(struct mipi_dsi_multi_context=
 *dsi_ctx, int page)
> >>  {
> >> -       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> >> -       u8 d[3] =3D { 0x98, 0x81, page };
> >> +       u8 d[4] =3D { 0xff, 0x98, 0x81, page };
> >>
> >> -       return mipi_dsi_dcs_write(dsi, 0xff, d, ARRAY_SIZE(d));
> >> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, d, ARRAY_SIZE(d));
> >
> > FWIW: the above might be slightly better as:
> >
> > mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x98, 0x81, page);
> >
> > That would make it more documenting that the 0xff is the "cmd", has
> > fewer lines of code, and also gets the array marked as "static const"
> > which might make the compiler slightly more efficient. ;-)
> >
> > Not really a huge deal, though.
> >
>
> I did try this initially, but got an error because of page not being a
> compile time constant. Not sure how I should handle this.

Ha, that makes sense! It can't be "static const" because that means
that there's one storage location that's never changing and that's
just not true. I tried to see if there was some way to make the
mipi_dsi_dcs_write_seq_multi() smarter and have it detect if
everything is constant but I couldn't find any way to do that. The
__builtin_constant_p() trick doesn't seem to work with more than one
number.

So I think what you have is fine then. If this becomes common I guess
we can make an alternative version of mipi_dsi_dcs_write_seq_multi()
that just uses "const" instead of "static const".

I'll plan to apply your patch next week unless someone beats me to it.

-Doug
