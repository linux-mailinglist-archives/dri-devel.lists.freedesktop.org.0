Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B394FA10
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 00:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254AF10E163;
	Mon, 12 Aug 2024 22:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WEwJkWcK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3B710E163
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 22:58:48 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-492a01bce97so1715679137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723503525; x=1724108325;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ouT6IM1apr/KINsfRJHwaPDCoQ8lOSBwOo+X7EgUsGs=;
 b=WEwJkWcKp3es2M+rPKmmOTcNal7jdoSsnTm1dJnaGWfREDFv6rK9fI5REX8vB0M2Hv
 PVv1ZJxa5G0j4Rar0xU4bi7mDgoM/KwWV3nx9ENP321nHpeVllejrOs1M8hMiXXOojYY
 HKyen5gchcesKOqoqp9gDtnRoDEQeBNGKS1yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723503525; x=1724108325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ouT6IM1apr/KINsfRJHwaPDCoQ8lOSBwOo+X7EgUsGs=;
 b=HRyL3y8rRf/v0rQRvTWq+YbXSc7klcZ0T/fZ7/snQuC7NNsSgqj6RJjWP+nyoOUyYM
 c9Hw/C9iaiQPphzRhwoW6Pkz1MJo8VV3SSwhT8QJq6oq0dxYpcS3LLp5x+vEpZqRWhQM
 eAevrxBODrSAPfaCPt4klQYt6PAqUoVnxjaiO63qHmgUSssTaBCPnhzfMLq7scDecSc/
 rOXgOWZwAbQH24W8NtDFaGZNpJoXgGpvdHZOw0SBC3Pjr8fcxkjN/P492AoKl2U7mdn3
 XDsoH2Y60cTgttYt4efebJAJW4zP8f8g9ENNDprzSTBosqGp4MsmlHlQFy6folYji0Im
 WBWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoIXDRUFdFWLlmDjbLcQVvx6HtIlVFfbBN/lyUoOIGnqNLs1Ku2kgoMWQzdJKmfTPHKmaVqG5E93Nn1JtAFXjwF2vVw6ukdmAv25xNIZK6
X-Gm-Message-State: AOJu0YzZ83XAVWRdxG2GQbnnYpVRBw6gxtcgXAL9CqXqBO6IaTstyJYc
 RTAb7Qk0dK/TgQHEjHYYdPs88VPufc3BdgmgWS0f8Tu3fop/K1KxBWuu+Z+bJz4E1hDd6nT/uo0
 =
X-Google-Smtp-Source: AGHT+IGokTbTBDiJcWiwuWsPARjtVFrL6zdoN+wOneY4peRnJ8nL4oQBqikuTQwq8Ht2jloR8cZJQA==
X-Received: by 2002:a05:6102:290c:b0:492:ecd2:e0bd with SMTP id
 ada2fe7eead31-4974394c6e2mr2504482137.2.1723503525292; 
 Mon, 12 Aug 2024 15:58:45 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-84136658337sm830004241.7.2024.08.12.15.58.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 15:58:44 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-827113c1fb4so1477525241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:58:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUt1u3l8Te7k0GRIJBlr6mxoWKPDHzS8EeCZj1khE3nHlSdGAr7M3iNu2NzdXQYuKyEc8+APhMZEn+rEjIVTw8kzSSaNLpiWoOMLTFCYeX8
X-Received: by 2002:a05:6122:3c42:b0:4f5:2aa9:a447 with SMTP id
 71dfb90a1353d-4fabf07cd9cmr2352201e0c.11.1723503523748; Mon, 12 Aug 2024
 15:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240810045404.188146-1-tejasvipin76@gmail.com>
In-Reply-To: <20240810045404.188146-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Aug 2024 15:58:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzzQG3_dHSU2gCdena4aL-PgraMKYkBo1DzKLkV=7c4Q@mail.gmail.com>
Message-ID: <CAD=FV=VzzQG3_dHSU2gCdena4aL-PgraMKYkBo1DzKLkV=7c4Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] add more multi functions for streamlined error
 handling
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
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

On Fri, Aug 9, 2024 at 9:55=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> This patch adds mipi_dsi_dcs_set_tear_scanline_multi to the list of multi
> functions and uses it with other multi functions in the jdi-fhd-r63452
> panel.
>
> Tejas Vipin (2):
>   drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
>   drm/panel: jdi-fhd-r63452: transition to mipi_dsi wrapped functions
>
>  drivers/gpu/drm/drm_mipi_dsi.c               |  31 +++++
>  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 125 ++++++-------------
>  include/drm/drm_mipi_dsi.h                   |   2 +
>  3 files changed, 72 insertions(+), 86 deletions(-)

Not worth spinning just for this, but a few comments:

1. For the cover letter, it's better if you can make the subject more
different than the subject of your previous patch series. Comparing
this and the previous series you sent out side-by-side:

[PATCH 0/2] add more multi functions for streamlined error handling
[PATCH v3 0/2] add more multi functions to streamline error handling

Maybe this patch's cover letter should have a subject more like:

drm/mipi-dsi: convert jdi-fhd-r63452 to mipi_dsi "multi", adding more "mult=
i"

...or something like that.

2. In your cover letter you should note that this series only applies
cleanly if you apply it atop your previous series. You should point to
it w/ lore links based on the Message-Id, like:

https://lore.kernel.org/r/20240806135949.468636-1-tejasvipin76@gmail.com
