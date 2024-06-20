Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FCA9111FC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 21:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2322410E280;
	Thu, 20 Jun 2024 19:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="R9ANwT4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3E210E2B5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:18:22 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3d22802674cso650688b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718911099; x=1719515899;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejsoHVwhFG9/ygIbEOYT86bzjsPu64MEjeZtGRSh1XM=;
 b=R9ANwT4LSnA/PgLaAiQ5iIVvgSfB3/g5LHfluk6SJTaMol9QuApqBbBUikslRtj7Zn
 irb2ThkYOLp9U1weg4WLAvxGdGOeGenOAHKAbqhLQI93FH3+lQACS92yIK09XHRjVC64
 AQqChH/+MNYWYQh1BqpVRZmpHBc+fcfM1vtfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718911099; x=1719515899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejsoHVwhFG9/ygIbEOYT86bzjsPu64MEjeZtGRSh1XM=;
 b=aVyBJ1eIPRW2agb31hyXf0va559R+OuNinVDftPZkVaynA9L8phUoVJptXkyhkuS5W
 QCEC8gB20BnkNqT/15PnwJMkNg9aKKJl0m7EebDxMqG6QWbmefnDjM+CicIzcfG5Wx7M
 vfen8G1YmOCBBYxMTnquGvL/D2FvAyMKkiYvttEiXj7twKlXvnp6oEG+F4YcO8/jKLET
 jjmLB+AmX9nbRFmo+Cyl2OKRUWEFBp/Lmx1d3EzZ5y7PiW/wMN2VYaZOhI39OerMxLRl
 FWWBL8YN+wthWcfiBobVoZFrkaLW02sFB4yK3cNVrNw+3cPFVJ7+nddkTdKM6P7WCaDH
 t9Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl2tHl6jafiNN3kdtbI6CpLvFWACDE6tAfip+rBrhkeM0JlXacG0eAqNhnYZj4616lksEmIbTjDHRi2VQ7U1qKTmadvCqMVAJETITvhwao
X-Gm-Message-State: AOJu0YzBms6m6REhtYWJiuCGdiUebTfzTYmYyyPdY9qBEy440DPdm4hv
 PGbqfO8pzQ5yHiUVJs9U1jgCSOVTkRi369TNzP6nXtq5vq19ONwvOoadQWyBOJHJpEr8A2+hqIM
 =
X-Google-Smtp-Source: AGHT+IEUfXYtwU8O1VFoZdbZFNk//q4BzgKzjwq0mMdUq9HQ7GMh79DjqHtZwkM8RbgQpWu5QCFwbA==
X-Received: by 2002:a05:6808:15a2:b0:3d2:49b2:c016 with SMTP id
 5614622812f47-3d51b9adfdemr7537605b6e.23.1718911099305; 
 Thu, 20 Jun 2024 12:18:19 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce8b1922sm2953085a.42.2024.06.20.12.18.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 12:18:16 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-443586c2091so86411cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 12:18:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPRcR1ziPlCq3Py5f1KVRgfXqigP5lk9Rn9xSmVGu6iZH9xI2rTjUQ8k3FEq9GGAIsGM4C0iS7TL+2Ahf1tQChwRSv5cumGrPvPo8lW5/Z
X-Received: by 2002:a05:622a:1306:b0:440:3996:84aa with SMTP id
 d75a77b69052e-444c1dc7fb2mr352411cf.15.1718911096385; Thu, 20 Jun 2024
 12:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240620181051.102173-1-tejasvipin76@gmail.com>
In-Reply-To: <20240620181051.102173-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Jun 2024 12:18:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vpb2xy68LUT9MRi2d=Lze=5AyPjV-ff5FLW30Q6MasJQ@mail.gmail.com>
Message-ID: <CAD=FV=Vpb2xy68LUT9MRi2d=Lze=5AyPjV-ff5FLW30Q6MasJQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Thu, Jun 20, 2024 at 11:12=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi:
> Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> raydium-rm692e5 panel.
>
> Additionally, the error handling in rm692e5_prepare() is changed to
> properly power the panel off in the case of a wider range of
> initialization commands failing than before.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Remove extra blank line
>     - Expanded on error handling functionality in patch notes
>
> Changes in v2:
>     - Change rm692e5_on to return void and take mipi_dsi_multi_context
>       as an argument.
>     - Remove unnecessary warnings.
>     - More efficient error handling in rm692e5_prepare
>
> v1: https://lore.kernel.org/all/20240615093758.65431-1-tejasvipin76@gmail=
.com/
>
> v2: https://lore.kernel.org/all/20240619033351.230929-1-tejasvipin76@gmai=
l.com/
> ---
>  drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 238 ++++++++----------
>  1 file changed, 99 insertions(+), 139 deletions(-)

Thanks! I normally let non-urgent things sit for a week or so before
applying them, but I'll be on vacation for some of next week and the
one after. If this is still pending when I get back then I'll try to
apply it as I'm getting through my inbox, though I'd also be happy if
someone else (maybe Neil?) wanted to apply it next week.

-Doug
