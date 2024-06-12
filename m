Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637AF905475
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF93610E860;
	Wed, 12 Jun 2024 13:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cfZNzLBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A5B10E858
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:57:29 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4405c2263eeso20574551cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718200645; x=1718805445;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRNaWp2aBUToWnoyQCXSeqRZnOtorjt+zh3ziOtXXN0=;
 b=cfZNzLBAqF6y14uQZGkW+h+ZSWIUAoBYf3oAzfs6S95zQIFi7ec7IVJJOxtDBm7yrQ
 OPQlu4yWfjpeJPjzoz0UT5/dpCi48f+Mvv1URMlNOvQA7vlScoZzHd47E64awyOmh3I+
 VhfOc+0N1k753RAmC8aFneccPutGJvoGWhJKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718200645; x=1718805445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRNaWp2aBUToWnoyQCXSeqRZnOtorjt+zh3ziOtXXN0=;
 b=S36Pns5dk/qeR0KqIp88Mn4U4nCKz3uq/C4h0Y4oXLqxTnHO3C4TfRhAhxdY3+S4W+
 qYmi24XaQWjTy2zBO3xsHzOsEzdPp/tYEF+/CIADA4/bMvO8QmndtP3oCUYW4nHGhGIg
 NMmXj4SV7yB7m4Ut5/IyflWDzkhbDeBIzp+6YZXI+3WToeScYC4T+zdEoiqACWA7UUkU
 M/fAiDXNWEGNToJb7cjrEDGfx1Ks0wQ5c60xgJ01JcpfdaR8YD43QZ6R5b85gIfa5xvk
 LcXCta9JIxDvAyRrD8HwCCrtm2PVYyOiBUOx9B06zosStwL9LR7/NEBtRUhCaMtlpRDB
 V9WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4IB+7zCMg5bQeco52g3hfLDSOnleMqgidNGB/7bQZAtsxbJOAFqTtvS7opg25ULNGwzAD0pMio28PzxlvjxMJBVG1tEW6GqZkq80prlR+
X-Gm-Message-State: AOJu0Yxq7p5Y3xgbOwqpKicXDex86y0nR70uy8/5FhPbN4KNp/DctDkv
 gnwinX5x8fr4IiUEBRXwEXG2XWAFdSE5z5Ny5oATQ/vk0U+6e9Jb8o+MJhjEpYid/pZuFuLhKJM
 =
X-Google-Smtp-Source: AGHT+IEKo2k/4FdPkW8scwXSTlm4YPqSKdPRUzc7zmoe9EI/0VBf5tIbWP+7rRkn6iPMddxw7j02nQ==
X-Received: by 2002:a05:622a:d0:b0:440:5476:55b7 with SMTP id
 d75a77b69052e-4415abae722mr22753081cf.13.1718200645513; 
 Wed, 12 Jun 2024 06:57:25 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44162841562sm1025471cf.43.2024.06.12.06.57.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 06:57:24 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4400cc0dad1so446951cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:57:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5XNcy5x/nlrkP5omF+OHGPMtnp1ulEJFqW+edKy9MHFxskTpTe9Z8qgPjAC5/z1XaHlug7OiHj3PJx8CIie6xMDs4uRXfMTr9vS7cRij6
X-Received: by 2002:a05:622a:6208:b0:441:53bc:4f8f with SMTP id
 d75a77b69052e-4415a2320c8mr1678241cf.27.1718200643619; Wed, 12 Jun 2024
 06:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240612133550.473279-1-tejasvipin76@gmail.com>
 <20240612133550.473279-2-tejasvipin76@gmail.com>
In-Reply-To: <20240612133550.473279-2-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 06:57:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtRfejhDEv675AEj6=SfLh_b=X2TLTt2hatTOLrikSRA@mail.gmail.com>
Message-ID: <CAD=FV=WtRfejhDEv675AEj6=SfLh_b=X2TLTt2hatTOLrikSRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel : himax-hx83102: fix incorrect argument to
 mipi_dsi_msleep
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
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

On Wed, Jun 12, 2024 at 6:37=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> mipi_dsi_msleep should be modified to accept ctx as a pointer and the
> function call should be adjusted accordingly.
>
> Fixes: a2ab7cb169da3 ("drm/panel: himax-hx83102: use wrapped MIPI DCS fun=
ctions")
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
