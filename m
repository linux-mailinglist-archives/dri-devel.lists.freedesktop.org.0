Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4087879F106
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9D510E4D2;
	Wed, 13 Sep 2023 18:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C18910E4D2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:20:36 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bf924f39f1so1488331fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694629233; x=1695234033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VOQaOs8o5B9GH/mmvpD1aOyQRsVO5OINT7Nf+9h0Zg=;
 b=mQc06oMhYgISNw4rzAC9nbDhTGdqFAfyv6NKU0e4B1gmMIEnS3c5y8a8NTDy/PV8Y1
 dFyXr/KTAmx5eYXDtBdZ2U2noLrSKmbBNapyoWNC1aFNxz/RuLGFIiZieiLqJwLTLIJ3
 dEobD/C5RI9KEJ1X1sE3ue3abU5TKb/V5o2ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694629233; x=1695234033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+VOQaOs8o5B9GH/mmvpD1aOyQRsVO5OINT7Nf+9h0Zg=;
 b=VK5T4fV1G8GhiU1RNCOsCk2YbRKJiUTVT6lI+RXNWeUeSUbbUp94w/tY5ckxym/W44
 MYMBNSHJv6qkvOglhk9vHT7Lbd7TfTB8sZboXGNbsFzSn6WoRYmUA9VqZS46iQbul3nT
 Oz+giQ015Tq+gB52KEPKsnTrCfPsklzlk8Xrsm/QcF8O2CcZpQXsAVXY/Wx10gbT4YkU
 dIKMliKEnuZZTPLPuJbEjbVuFiyYx4OnZ86xeG8gpvJvsJjVS6gZ7s9t9FR4BbW/PJzp
 gPh+mWE4k9Jk6G3ax3KMEjvqbhd1hT4u9YVUJDqtcR9pWFaFtOVb80XL+s787kxe+cA0
 aOcw==
X-Gm-Message-State: AOJu0YxsxZteoZDKdFMO7YSuavxBqM+7jTZ379Gvd9eZZo0T8Sh4+J+q
 Ik1gaNw713zHfq5l59vkKLpLoqyD2sC6qjbO+HkJJB8J
X-Google-Smtp-Source: AGHT+IGRu50Lb1HVNEPJZc2DzU316J4FBYvbTqyW2wbppBFj/9/jnBVQ47M7OhzcA1WIkrp0oa33nA==
X-Received: by 2002:a2e:9995:0:b0:2b8:4100:b565 with SMTP id
 w21-20020a2e9995000000b002b84100b565mr3018181lji.15.1694629233085; 
 Wed, 13 Sep 2023 11:20:33 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 va17-20020a17090711d100b009929ab17be0sm8751937ejb.162.2023.09.13.11.20.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 11:20:32 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso10335e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:20:32 -0700 (PDT)
X-Received: by 2002:a05:600c:3581:b0:3fe:eb42:7ec with SMTP id
 p1-20020a05600c358100b003feeb4207ecmr162996wmq.1.1694629231997; Wed, 13 Sep
 2023 11:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.1.Ia54954fd2f7645c1b86597494902973f57feeb71@changeid>
In-Reply-To: <20230804140605.RFC.1.Ia54954fd2f7645c1b86597494902973f57feeb71@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:20:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vy0EALn6rEdYeSUNYBj=h3UOB+NrPfhtfgNSSQqU988A@mail.gmail.com>
Message-ID: <CAD=FV=Vy0EALn6rEdYeSUNYBj=h3UOB+NrPfhtfgNSSQqU988A@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] drm/panel: Don't store+check prepared/enabled
 for simple cases
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Jianhua Lu <lujianhua000@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Aug 4, 2023 at 2:07=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
>
> This pile of panel drivers appears to be simple to handle. Based on
> code inspection they seemed to be using the prepared/enabled state
> simply for double-checking that nothing else in the kernel called them
> inconsistently. Now that the core drm_panel is doing the double
> checking (and warning) it should be very clear that these devices
> don't need their own double-check.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  |  9 -----
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    |  9 -----
>  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c  |  9 -----
>  drivers/gpu/drm/panel/panel-novatek-nt35950.c |  9 -----
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 12 ------
>  drivers/gpu/drm/panel/panel-raydium-rm68200.c | 38 -------------------
>  .../panel/panel-samsung-s6e88a0-ams452ef01.c  | 10 -----
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c |  9 -----
>  .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 10 -----
>  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c |  9 -----
>  .../panel/panel-sony-tulip-truly-nt35521.c    | 18 ---------
>  .../drm/panel/panel-startek-kd070fhfid015.c   | 11 ------
>  drivers/gpu/drm/panel/panel-truly-nt35597.c   | 20 ----------
>  drivers/gpu/drm/panel/panel-visionox-r66451.c | 16 --------
>  .../gpu/drm/panel/panel-visionox-rm69299.c    |  8 ----
>  .../gpu/drm/panel/panel-visionox-vtdr6130.c   |  9 -----
>  16 files changed, 206 deletions(-)

In response to the cover letter [1], I proposed landing patches #1-#3
directly from here while we resolve the issues talked about in
response to patch #4 [2]. I didn't hear any complaints, so I took
Linus W's review tag from the cover letter and pushed this to
drm-misc-next.

f8c37b88092e drm/panel: Don't store+check prepared/enabled for simple cases

[1] https://lore.kernel.org/r/CAD=3DFV=3DUFuUsrrZmkL8_RL5WLvkJryDwRSAy_PWTa=
-hX_p0dF+Q@mail.gmail.com
[2] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b2=
34f89613b5cec0f14@changeid/
