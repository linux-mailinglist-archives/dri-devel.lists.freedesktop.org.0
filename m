Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B155295CBBE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 13:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E78010E041;
	Fri, 23 Aug 2024 11:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GkzppfAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBAF10E041
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 11:54:03 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-70949118d26so1668027a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724414042; x=1725018842;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qn6mU1Z7uEyGrrtLdzWFgv92xoJ3V8ymO1UfoJbvTv0=;
 b=GkzppfABKQTuhqJC3C+cEAhD2zgBozXPHO5TFLQZR6A7RhxQb697KvSRaRJhhD1zqd
 rh8Re4Jl8fdWN6HL/hiFEJlc0YxiuSdMahQhQojdy/fKjZhTu2lh06MOfW3HLMHBYIIV
 YZxBgU9hZIQSlZCWKHhvVgpNwzrzzh1B3A/90ohJuLLzWKHS8C+5sTgB+gMMN9lKBeDg
 jkV7kzq+EHaWBTX039ukV/p+s8VDJKxxn2yKwaP8UiqlueVWOsl7GJ8gKTgSV7Hb/vfs
 hKcdVBuF+IbrRGm4Z42bXHFrBMLqzFZeAMZCml1FyZpQNmRu29TeJkt91v8sVTY/8eNf
 /zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724414042; x=1725018842;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qn6mU1Z7uEyGrrtLdzWFgv92xoJ3V8ymO1UfoJbvTv0=;
 b=BaxWGJ5fhfVKcT3wIOVRWJucfbsgVjtt+cw6g+L0LJG55/UbWq/ej1tlv7O12i5sB6
 zKR4HAUjtYtFvultWmM0UqzgtvBpUbs49Oyjq971CXKgbD7teQWaebyUN2c1m+OK1Ak4
 JRmlI3laQsw6ZJKLX3wyncPAYH6hdSdrQoPLC4ASNKl/kB6gbfpWmmZp7ZBUIGnvj+iN
 5mbCBXqkfXLDueA1vJ2g0iP+fNpluWS8RH+xN5kA/Bf9lSYoKlpZaUFAyPUub9U+fsB3
 Es+U+KF8pFcBMkVu21Qw4sWu72c4aaEnSess/uMT4gTbdWnVbLmkN/5et0kuU05nUSpx
 KMiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAKDGj3O09cey/pfLww2OZgBRwmn7GmAxBg+urbjALcu3preIsjEKkGkjC3gFoJ3OzaK/MPbcMscA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEGqEjMcOIcKEmeuZ4M3zLy5cdcF93KT32nPi/dIIvQoDuTgRl
 I3zJsIncxgOG8t8ursx3wJUbCs3bcMno4FnQwO/xSNG77Cu8uJjyo2YNHvdRMNvt9goEVGe5/cj
 JWJuLZzS/zVmRFTd8DGkrZeQCs8IuakNAs1veDQ==
X-Google-Smtp-Source: AGHT+IGTtVIAQIlxuwXUOrvMubq/AS7vZkR3Y4FPpwazrWTnw/W47IWkEwa2I9+QW8yQ2Ag91mmC06S30C9mmpPw+zA=
X-Received: by 2002:a05:6830:6384:b0:709:3792:5e0a with SMTP id
 46e09a7af769-70e0eb6cb5fmr2088812a34.17.1724414042288; Fri, 23 Aug 2024
 04:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240823083657.7100-1-hanchunchao@inspur.com>
In-Reply-To: <20240823083657.7100-1-hanchunchao@inspur.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Fri, 23 Aug 2024 19:53:50 +0800
Message-ID: <CAHwB_NK3Jg=7VC6dMgB3LuVCu2ZxWu_MO8PGWcoXpG=JnqzORg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/panel: fix null pointer dereference in
 hx83102_get_modes
To: Charles Han <hanchunchao@inspur.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 liuyanming@ieisystem.com, Douglas Anderson <dianders@chromium.org>
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

Charles Han <hanchunchao@inspur.com> =E4=BA=8E2024=E5=B9=B48=E6=9C=8823=E6=
=97=A5=E5=91=A8=E4=BA=94 16:37=E5=86=99=E9=81=93=EF=BC=9A
>
> In hx83102_get_modes(), the return value of drm_mode_duplicate() is
> assigned to mode, which will lead to a possible NULL pointer
> dereference on failure of drm_mode_duplicate(). Add a check to avoid
> npd.
>
> Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as  separate dr=
iver")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/dr=
m/panel/panel-himax-hx83102.c
> index 7c2a5e9b7fb3..e61ed7d02729 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -566,7 +566,6 @@ static int hx83102_get_modes(struct drm_panel *panel,
>
>         mode =3D drm_mode_duplicate(connector->dev, m);
>         if (!mode) {
> -               dev_err(&ctx->dsi->dev, "bad mode or failed to add mode\n=
");

Your V2 patch should not depend V1, should make patches on the base code.
And when you send the next release, explain the differences from the previo=
us
submission in a cover letter or a single patch.
see https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
respond-to-review-comments

In addition, Doug made some comments in V1, you should CC him when
sending patches.

>                 return -EINVAL;
>         }

nit: remove brackets


>
> --
> 2.31.1
>
