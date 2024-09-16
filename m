Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744A2979C32
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 09:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB4210E183;
	Mon, 16 Sep 2024 07:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nxplh2jJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B022010E183
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 07:44:00 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-846be74b299so924422241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 00:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726472638; x=1727077438;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E75Wlgna/GKE3PiZfSh3okspmyAQgbNKnoUlsHO6GkU=;
 b=nxplh2jJaunxgnhIV9TPXm3ar/vBpPBxfHQYOLcgDFmgtkRBGEXCbkhJ7sh5TI/heE
 6b8pWS2l0L++f5bDmG1s3PIhS/aHsYRPxcw1dK4X1qQOmBESKseJz2MsUpAI4HxbpFwt
 3TIeU0KZNWdCmAJZ95phdprxjidzsIphYa+m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726472638; x=1727077438;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E75Wlgna/GKE3PiZfSh3okspmyAQgbNKnoUlsHO6GkU=;
 b=ICb7HwAyiWlaR2CVFq4w6jmysCLZt6QVQ5mfIvtl13jXZuOPOrBQxoJp5vJXVydVPR
 lA7xmEXL/1BBrEL6d7GIavTUSdATcvp01zYRFkI9PyVXNNgiFvCE+YoyETeuP+wl0wMu
 rpQGYB/Ep2S10NIN7LOhA27maiBNz8/sedr7IAKMwNBPZfp7De7JDus+JN6IXKdgzSnk
 N/bJZMry699JOHHbV+9U/hm1K2aEZHcLg8zZ1tfPqTjBTKxB58TRcyZehuJ/nn+c730w
 6JHNXkAZh/uGaXHacVyGxb73anQcz/VIOzLx6CbZY8YChoCLi1sSPbHzSziC9DxNhfpT
 xeow==
X-Forwarded-Encrypted: i=1;
 AJvYcCULJDyolYXVtf3AXkGflvk5eBvFn9KjftqIMIX4g+td/diFXtvPFbGTtB/VFQqRNqAO/XCDY4/qNjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ2sZvglI4CjBrfkUVNm/ssH/5Y56zXDlINyoyQhHZllR2OlOS
 YnLdHNt4hwybTpxzYgU+IACf7tHA7hUkZO9FAQEPNNsLITJH7DJdHDPxmtNuinrPF/PqPparOua
 UeA==
X-Google-Smtp-Source: AGHT+IGl/6725ww9ap3uTxByuXXm3nAHJtwMQU2KZHJy86LG4QdjJxP8Oqc2tO+qBFfbXbn0l/4ewg==
X-Received: by 2002:a05:6102:6cf:b0:49b:e3cb:2717 with SMTP id
 ada2fe7eead31-49d41577900mr12599084137.20.1726472637596; 
 Mon, 16 Sep 2024 00:43:57 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-49e6b47a749sm699973137.29.2024.09.16.00.43.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 00:43:56 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-49bc7387371so1497036137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 00:43:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWeFO6fdo9bEw4yqf0FZzHg0KA8RZhwhRt3viZXVY/O9R7lyTMxXBWIoCIRpT7u3Kh7AXogpv/1xpw=@lists.freedesktop.org
X-Received: by 2002:a05:6102:950:b0:49b:cfe3:a303 with SMTP id
 ada2fe7eead31-49d41482bddmr12555482137.9.1726472636170; Mon, 16 Sep 2024
 00:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240914034341.897197-1-tejasvipin76@gmail.com>
In-Reply-To: <20240914034341.897197-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Sep 2024 00:43:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vap-_tYLQVNP8xz3O=k1b=ziBsV23DGMC0m1EkbzNhiA@mail.gmail.com>
Message-ID: <CAD=FV=Vap-_tYLQVNP8xz3O=k1b=ziBsV23DGMC0m1EkbzNhiA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: raydium-rm69380: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
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

On Fri, Sep 13, 2024 at 8:44=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the raydium-rm69380 panel to use multi style functions for
> improved error handling.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Fix whitespace issues
>
> Link to v1: https://lore.kernel.org/all/20240907140130.410349-1-tejasvipi=
n76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-raydium-rm69380.c | 93 ++++++-------------
>  1 file changed, 29 insertions(+), 64 deletions(-)

Pushed to drm-misc-next:

[1/1] drm/panel: raydium-rm69380: transition to mipi_dsi wrapped functions
      commit: f70181b3bdec6b8a166c6295937c4a8a5322515c

-Doug
