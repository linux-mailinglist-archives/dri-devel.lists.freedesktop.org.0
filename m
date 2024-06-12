Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37199055C4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA0710E88A;
	Wed, 12 Jun 2024 14:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hD/zO10i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E6F10E88A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:52:37 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dfe41f7852cso982191276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718203956; x=1718808756;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VlfyFCkUVCs8ONQQdxaEn5ekXCqtc2aYs760svQn/CM=;
 b=hD/zO10i79oI0LX4TNGLpqjXS1H4IMu1oAzSDQpEs7kSmEE4GXkHJcbmK67a+jXyr+
 Ojjk4GG/MtORcckDtBPAKX8QSdiFgiMaJ29XsfRH5pIzeN1kOmY1mVRKvSONKVD8oZ8D
 lksCdt6ryvR5AawwaVUyqElrOIyp/3DR+IDRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718203956; x=1718808756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VlfyFCkUVCs8ONQQdxaEn5ekXCqtc2aYs760svQn/CM=;
 b=Zjs+vgBBDBj57p9w1SVaKl6v47aWJ7PawwFPAsUe/RR+ekqVcBKlaJ0VRGij0p0eUv
 zXHWh1jTtPp9BCHiCrKUg6/An/+llvu85pP+zRR/+jdr8aCEnw/AnsfYbtqI3N8+gI7a
 hnL9jF0XgaE/8m81+tM1D98Wl3dz4Q5aRjJnYiIMVOzKZU5HkGODumVDqSmw2FjBZupU
 ulF5uhXX4okq+sQc4BkDLp21AaxSigXqhrVZcm6/FI929Zf4LN7TbpAV+ZhpQtBi6K8N
 YpWAdTplkdyoygE4GkPUe0qmlHNeHqFDtduBigjGrLYoEz/80UAXGrYtCoH5ZuBmOVYP
 XY0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG17aYvf3n9rYiYRo53/v29Zv+Ho02BmUvgk7tVgzQhkD7sZ+ostbniFiIiwG0gAQ7/KS+UM2RVv8RN7zui+c+5Dq1FEf9GomKT9RvhUxQ
X-Gm-Message-State: AOJu0Yx0wIlheh/Tj6lT3q6pujTKyz3qgm6g0HzEilBtcBfIGloJmcNU
 HUCnuRV5LTGSBzQP8WjPmgUSgQi10pHc0yByAYCcqQbwDFHjetTqp8IaMrxISiiHtbGzvBsqoKs
 =
X-Google-Smtp-Source: AGHT+IF0ChRjolWRK4ELJw7VuPxXH3PVQEKCw2vNvKxaGA+W6vG04i6asA6wPbLOReF4nQUxm1tK3Q==
X-Received: by 2002:a05:6902:10f:b0:df7:8dca:1ef4 with SMTP id
 3f1490d57ef6-dfe66b60fbcmr1962204276.21.1718203955759; 
 Wed, 12 Jun 2024 07:52:35 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441208c5072sm21175721cf.78.2024.06.12.07.52.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 07:52:35 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4405cf01a7fso345121cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:52:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVvil24b60C2IPV+v9JFH77ZNAHx0lYMRedDWzz8A1A3ROOom/FCgpC8Z+11lzvsNrXbKahKag/pGAQ8VLdZwFsfJje9+/IeXxYda8DOfcO
X-Received: by 2002:a05:622a:514d:b0:43e:cb4:1d10 with SMTP id
 d75a77b69052e-44159205ccfmr3828581cf.14.1718203954512; Wed, 12 Jun 2024
 07:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240612133550.473279-1-tejasvipin76@gmail.com>
 <20240612133550.473279-3-tejasvipin76@gmail.com>
 <CAD=FV=VTEzSyTHm-YBwneBgpohK8uu460DER-GcsQWu-z9hJsg@mail.gmail.com>
 <9beb8011-cb0f-4694-87e7-d4c02de80cd8@linaro.org>
In-Reply-To: <9beb8011-cb0f-4694-87e7-d4c02de80cd8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 07:52:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Udsw=XCR204A8QGwVSAxyprLCrrOgmZf+pU+8m-7sQ0Q@mail.gmail.com>
Message-ID: <CAD=FV=Udsw=XCR204A8QGwVSAxyprLCrrOgmZf+pU+8m-7sQ0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep
To: neil.armstrong@linaro.org
Cc: Tejas Vipin <tejasvipin76@gmail.com>, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, linus.walleij@linaro.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
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

On Wed, Jun 12, 2024 at 7:34=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> On 12/06/2024 16:21, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Jun 12, 2024 at 6:37=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail=
.com> wrote:
> >>
> >> ctx would be better off treated as a pointer to account for most of it=
s
> >> usage so far, and brackets should be added to account for operator
> >> precedence for correct evaluation.
> >>
> >> Fixes: f79d6d28d8fe7 ("drm/mipi-dsi: wrap more functions for streamlin=
e handling")
> >> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> >> ---
> >>   include/drm/drm_mipi_dsi.h | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Yeah. Looking closer at the history, it looks like it was always
> > intended to be a pointer since the first users all used it as a
> > pointer.
> >
> > Suggested-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I've also compile-tested all the panels currently using mipi_dsi_msleep=
().
> >
> > Neil: Given that this is a correctness thing, I'd rather see this land
> > sooner rather than later. If you agree, maybe you can land these two
> > patches whenever you're comfortable with them?
>
> Applying them, but inverting them, fix should go first.

Well, they're both fixes, and inverting them means that you get a
compile failure across several panels if you happen to be bisecting
and land on the first commit, but it doesn't really matter. I guess
the compile failure is maybe a benefit given that they were not doing
their delays properly... ;-)

-Doug
