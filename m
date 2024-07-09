Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD7292C506
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 22:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1A810E078;
	Tue,  9 Jul 2024 20:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CpZO8h6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE4810E078
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 20:56:01 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-79ef8fe0e90so297622085a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 13:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720558558; x=1721163358;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cVh6W36UPU19XxDEtUe4/W7t7i/b/SampjURjZZcQD8=;
 b=CpZO8h6q9evmKBQYsDT4uZHB5uJ4n1Fc41vGUFdt16rfFi/SAiZ9Ofenzk/MqJV3Bn
 CPWa6Vj65BgTgjXqMathviqkHFcl99+NgA07zka0OtXqAVXovUosccKn53nNrSxaUDHG
 XdStUaTAWbcIZDR+Dk/XuDbLw805do76BeixI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720558558; x=1721163358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVh6W36UPU19XxDEtUe4/W7t7i/b/SampjURjZZcQD8=;
 b=cN/oQJPUu7kTQILI/kVp4gRq/THti9PygAvQytaQ2tK8vBB2ctmFRb++r38L2vA8cb
 nUh77aIIM6xhN8p//RAktvpilOf12hEkscQ8yLSEUSxdSBcbcNigreo0CIkuhzAcnN+T
 Jb3mcijb4Fyr/y4qdrnDcCu7V4Mz7UdQy3DTrXSK4qNxpJDirA4TSouGPtEPCSAe6O21
 p/xP7x3MzOB/f3u2m91wl9PGIvtkkyKp2DacyBYcPEOU+nTSS6R+ELEtI5DRCg5iP9iS
 +oqONsGIYtKc96c/u1jOqurcCNYGZe8yu8NzRf5xaYUq543IqZ1D8wqMoGGIbC27pP43
 9HKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSofDaLz2a6Jc9H+aF3c67VJwWCytvBxzI3RPkxWNrRivujud0VGiHZROs9SuT4kGcxAbKmP0RadNneK8HXRRNUQ01L9ASTnFmKYuCShqw
X-Gm-Message-State: AOJu0Yw712a6JKNhkvZlnJ4XZitDT68+WJUIe6WEoaMimoJVYeEn55dT
 yUrlX0g3G7/9WUKwGOyMjKIHXcIHp3uJQ8rsNUNJrJgVTUla9m3H+v0LtdoZMhxRyJxqdDlp5s+
 qovOR
X-Google-Smtp-Source: AGHT+IEVczYw1fAMtJJmywgXnqpPJ64O6HSas4PuBMe/pIRu/mTOxWaBobhyyfqRAPU9gUsEa1ElRg==
X-Received: by 2002:a05:6214:48e:b0:6b5:4a87:4034 with SMTP id
 6a1803df08f44-6b61c1c436cmr51528466d6.49.1720558558025; 
 Tue, 09 Jul 2024 13:55:58 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b61b9c461bsm11991776d6.11.2024.07.09.13.55.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 13:55:56 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso103001cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 13:55:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWxhcV110ass9t8osv0xiGwmt0udpaxPhr1426hPmCWmisyWbJzs1uIaSeVDYQwXtlI5slWtIvLk5dSSD18acy6RPypOec/Q/Xe5SVsfm6g
X-Received: by 2002:a05:622a:7604:b0:447:f5de:bd18 with SMTP id
 d75a77b69052e-44b191f6ac5mr194891cf.9.1720558556064; Tue, 09 Jul 2024
 13:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240628182428.171031-1-tejasvipin76@gmail.com>
 <20240628182428.171031-2-tejasvipin76@gmail.com>
 <CAD=FV=VKiEjDfeK8pCqAk8+YWBD2U4ESLik8kiDbvgrZz7o1NA@mail.gmail.com>
 <36aa6067-fa6b-4957-ae33-58a28e32c8fd@gmail.com>
In-Reply-To: <36aa6067-fa6b-4957-ae33-58a28e32c8fd@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 9 Jul 2024 13:55:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U6WdxD4g-4rA2Kz0nbs3fZUA+NRzivg_tJMup0652MxQ@mail.gmail.com>
Message-ID: <CAD=FV=U6WdxD4g-4rA2Kz0nbs3fZUA+NRzivg_tJMup0652MxQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, LinusW <linus.walleij@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Tue, Jul 9, 2024 at 4:18=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> On 7/9/24 5:50 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Jun 28, 2024 at 11:25=E2=80=AFAM Tejas Vipin <tejasvipin76@gmai=
l.com> wrote:
> >>
> >> +/**
> >> + * mipi_dsi_dcs_set_page_address_multi() - define the column extent o=
f the
> >> + *     frame memory accessed by the host processor
> >> + * @ctx: Context for multiple DSI transactions
> >> + * @start: first column of frame memory
> >> + * @end: last column of frame memory
> >
> > nit: "start" and "end" comments should say "first page" and "last
> > page", not "first column" and "last column". The previous function was
> > the one about columns.
> >
> >> + *
> >> + * Like mipi_dsi_dcs_set_page_address() but deals with errors in a wa=
y that
> >> + * makes it convenient to make several calls in a row.
> >> + */
> >> +void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_contex=
t *ctx,
> >> +                                          u16 start, u16 end)
> >
> > nit: indentation of the above line isn't _quite_ right.
> >
> >
> > Other than the two nits, this looks fine to me, but I'd prefer if
> > someone else provides an "Ack" in addition to me that they're OK
> > adding these extra "multi" functions. Both Dmitry and Linus W were
> > involved in the original "multi" functions, so maybe they'd be willing
> > to offer their opinions?
>
> I think a better way to go forward with multi style functions is to
> use macros. All the multi style functions are basically exactly the
> same with the only difference being the function called internally
> and the dev_err. This can be represented in the form of a macro, and
> would save on a ton of otherwise redundant code, while also allowing
> us to "convert" any function to multi style as and when we please.
>
> We would ideally have 2 macros, one for the main functions where we
> desire to modify accum_err on an error arising, and another macro that
> just checks accum_err to see if the function should be a no op.
>
> If you guys think this is a good idea, I'll work on the macros and
> do the multi conversions in this new way.

I had a similar thought but I wasn't sure how easy it would be. If you
want to prototype it out and send out patches if they look good then
that'd be nice. We'd want to make sure that we actually generate
functions for the "multi" variants since we don't want all that inline
code on every caller, but generating those functions with a macro does
seem like it would work. I guess you'd also need to include some sort
of string for use in the error messages.

-Doug
