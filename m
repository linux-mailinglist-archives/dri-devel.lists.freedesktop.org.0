Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A793C790
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 19:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2676E10E899;
	Thu, 25 Jul 2024 17:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IKiIxI3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAA910E899
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 17:13:05 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so1925075a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 10:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721927582; x=1722532382;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjrU16gk7V5PUkFrLMr6PZnUJ6/u63NLBDO5kUa3PxY=;
 b=IKiIxI3gpzL3rE/+b6OW38AFLjoNhJ8F0TSolRqI108oE9z3DgWXBr2I2MLCkBAXuK
 vtFwtGTBdc2vI4b0ZSJnGdXnOxBdh1eeXAIApkAfxaLt7Rr6wnIEicMNJd6z7i4W8A/C
 N4t5tXMalMcZwZtFszfixunVWyuArtcgKNENU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721927582; x=1722532382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NjrU16gk7V5PUkFrLMr6PZnUJ6/u63NLBDO5kUa3PxY=;
 b=FBbqFHqVKbAccx6/nq/Y36K8c9SXhzagIZrY9i7oFlYLOUomp9cGZA0nSrX74bWCZ9
 /rZ+CUZPRVUxGP1Y0mjpXBu0pkIApoSa9xvO2zgAQQSiMeOldONdjhw4ybYmOmdZWclC
 ruQ/W8S1xyVXD/jMQdUmW/W57C4YXoVF7NpIuMeYYuMVv9S3hPvK+ir1C8xCb3jFBfLQ
 vY6aaKuGNioS0Iunn6A7nhO5e5uZ7PQYTz3GPNPWk7VPQsut+Sd5sxGcAAcKMlPM0hFV
 CrbcrbMo5fEN1IWM73O+xeiOi3sK+tXdOHa5ZUbZ3NULX2/Ku/hEIXLI2qpEdusaMXSR
 jj1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1rmMXKRB9hzmjX8/dx1Ns2NW8FQ/uQ9K0LZ3x8AZJD0EINXBSNYoZ66McaPMnwJk4fppfaf6hEzsz/ZdDp1zEUOvG6Lh5act6DtgaZRb9
X-Gm-Message-State: AOJu0YyrQEVFG7QgK8LwTUgk4rm8WuNPP4asg7J/5PohuzVeyl+LXcuY
 xkp04MPp/24bpwWByCCbqFiv7NORnI7xOn06HYd2r9YEdmtKMkOJnjA9VFMRl94v92KH0jqfaG3
 ncw==
X-Google-Smtp-Source: AGHT+IFUMMMqkX4ebet8ASP7dxOLLs073WRywlz5q6CWpC+pJrZHyCUXfbSaJGVfgUQjhLkSDDISqw==
X-Received: by 2002:a05:6402:2546:b0:57c:614c:56e7 with SMTP id
 4fb4d7f45d1cf-5ac148aa3b2mr3810338a12.18.1721927582234; 
 Thu, 25 Jul 2024 10:13:02 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b052bsm984912a12.15.2024.07.25.10.13.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 10:13:01 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-427fc9834deso2325e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 10:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3YvPfyqhtWVpqRTDE2dDJEYMj0G/rYcBL3PyUd5n4o9/o3OgGCLvH0r8YZYKyhJxtYDCVeviP4mju5OTCxx1fqQ1Q2HBPbH4IXJAr/tcD
X-Received: by 2002:a05:600c:4f09:b0:41a:444b:e1d9 with SMTP id
 5b1f17b1804b1-42804ba9b91mr1640015e9.4.1721927580731; Thu, 25 Jul 2024
 10:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240724122447.284165-1-tejasvipin76@gmail.com>
 <20240724122447.284165-3-tejasvipin76@gmail.com> <877cdakdq9.fsf@intel.com>
 <20240725-psychedelic-benevolent-muskrat-c7fd57@houat>
In-Reply-To: <20240725-psychedelic-benevolent-muskrat-c7fd57@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Jul 2024 10:12:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WbXdnM4or3Ae+nYoQW1Sce0jP6FWtCHShsALuEFNhiww@mail.gmail.com>
Message-ID: <CAD=FV=WbXdnM4or3Ae+nYoQW1Sce0jP6FWtCHShsALuEFNhiww@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mipi-dsi: Change multi functions to use quiet
 member of mipi_dsi_multi_context
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Tejas Vipin <tejasvipin76@gmail.com>, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Thu, Jul 25, 2024 at 1:28=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Wed, Jul 24, 2024 at 06:32:14PM GMT, Jani Nikula wrote:
> > On Wed, 24 Jul 2024, Tejas Vipin <tejasvipin76@gmail.com> wrote:
> > > Changes all the multi functions to check if the current context requi=
res
> > > errors to be printed or not using the quiet member.
> > >
> > > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mip=
i_dsi.c
> > > index a471c46f5ca6..cbb77342d201 100644
> > > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > > @@ -814,6 +814,8 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi=
_multi_context *ctx,
> > >     ret =3D mipi_dsi_generic_write(dsi, payload, size);
> > >     if (ret < 0) {
> > >             ctx->accum_err =3D ret;
> > > +           if (ctx->quiet)
> > > +                   return;
> > >             dev_err(dev, "sending generic data %*ph failed: %d\n",
> > >                     (int)size, payload, ctx->accum_err);
> >
> > A maintainability nitpick. Imagine someone wishing to add some more
> > error handling here. Or something else after the block.
> >
> > IMO the dev_err() should be wrapped in if (!ctx->quiet) instead of
> > adding an early return.
> >
> > Ditto everywhere.
>
> I'm not even sure why we need that parameter in the first place.
>
> Like, what's the expected use of that parameter? Is it supposed to be
> set in users of that function?
>
> If so, wouldn't it prevent any sort of meaningful debugging if some
> drivers set it and some don't?
>
> It looks to me like you're reimplementing drm.debug.

I can explain how we got here and maybe you can explain how it should
be designed differently.

1. The majority of MIPI panels drivers just have a pile of commands
that need to be sent during panel init time. Each time you send a
command it technically can fail but it's very unlikely. In order to
make things debuggable in the unlikely case of failure, you want a
printout about which command failed. In order to avoid massive numbers
of printouts in each driver you want the printout in the core. This is
the impetus behind the "_multi" functions that were introduced
recently and I think most people who have looked at converted drivers
are pretty pleased. The functions are readable/non-bloated but still
check for errors and print messages in the right place.

2. As Tejas was adding more "_multi" variants things were starting to
feel a bit awkward. Dmitry proposed [1] that maybe the answer was that
we should work to get rid of the non-multi variants and then we don't
need these awkward wrappers.

3. The issue with telling everyone to use the "_multi" variants is
that they print the error message for you. While this is the correct
default behavior and the correct behavior for the vast majority of
users, I can imagine there being a legitimate case where a driver
might not want error messages printed. I don't personally know of a
case, but in my experience there's always some case where you're
dealing with weird hardware and the driver knows that a command has a
high chance of failure. Maybe the driver will retry or maybe it'll
detect /handle the error, but the idea is that the driver wouldn't
want a printout.

Said another way: I think of the errors of these MIPI initialization
functions a lot like errors allocating memory. By default kmalloc()
reports an error so all drivers calling kmalloc() don't need to print,
but if your driver specifically knows that an allocation failure is
likely and it knows how to handle it then it can pass a flag to tell
the core kernel not to print.


So I guess options are:

a) Accept what Tejas is doing here as reasonable.

b) Don't accept what Tejas is doing here and always keep the "_multi"
functions as wrappers.

c) Declare that, since there are no known cases where we want to
suppress the error printouts, that suppressing the error printouts is
a "tomorrow" problem. We transition everyone to _multi but don't
provide a way to suppress the printouts.

d) Declare that the _multi functions are terrible and undo all the
recent changes. Hopefully we don't do this. :-P


[1] https://lore.kernel.org/r/p7fahem6egnooi5org4lv3gtz2elafylvlnyily7buvzc=
pv2qh@vssvpfci3lwn
