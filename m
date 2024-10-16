Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E929A0B77
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 15:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70E610E2DD;
	Wed, 16 Oct 2024 13:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ge5nM35s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478CB10E2DD
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 13:30:51 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-84fe06fbdc6so1684708241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729085449; x=1729690249;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TREUo1lQfvBhTYNzvxLnSAftCI9jNyXaG87hpbR/7a8=;
 b=Ge5nM35sWU0gCZ8/DvbThpj4UC9MiyYf259pBd3uVQSp0Y1U4u8uU8iZq1yYSxUJec
 5hvVA3O2O084AKSruYO48hI4No/Yj+HXPPfsY12v9mEnmTC2ebxgILZaT2mG7U7EB+oB
 fcmuMcgfrB/EnCx3od+xW6egvV/1nlr2L0a9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729085449; x=1729690249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TREUo1lQfvBhTYNzvxLnSAftCI9jNyXaG87hpbR/7a8=;
 b=jbgCcEr0wovi7MlbRTXTPQhmEb1VjaVBjntoM5ZDML76fxf0svKOqL3563d8GIQt6S
 Hh9I1n2kPh2LizP/4BOUV5cqjsIPJbTymDY7Eu+/pVt/WFhde3CUjlU8041NuPb6HmO7
 n6zLqPes9g7UidSgT8LSaLd9jffIaPRA1wJua9ekw21KbhqqzYq2L7Vf1fUUtHfGjLyX
 b+F6C6HgyECPVarOz2WBynqzsCs3ozDVl9+5lof5tf+jnSnUQJpQByse9YEAbEbzox5q
 f2LvBmNz8cFTnBYp+K2YZwrYY4PKtAUTc/Y0PkEQbam3TiCH9HQMwaBV7KlQzNTVxk8E
 KTsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrn4Qaboz0/68LHuMMBwrJ1E5zeIkueXQGg4+Is7jBzSLZ8NQxxHtGvnHHdUycXxfx8JxR4Iuy19o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+j2t7tJFB6FnGEv2Fe0qvmC30jQwcDjYm2S5nPnqc8RnFLFhL
 HfbNtx7PzNdW+Hhha5MNCs4ceIq4ZZ1Sc+GQbSi2NsPVmMmqpslimtV0KGpt+sYZBbg7nOBjuow
 =
X-Google-Smtp-Source: AGHT+IEMNV62vkVQBXPuvJ3poVJG7k9WIE1dU1wc2AjOW+7gVBarxM5oTPCHa5pdwTsf5/mvNrLO9g==
X-Received: by 2002:a05:6102:41ab:b0:4a5:6f41:211a with SMTP id
 ada2fe7eead31-4a56f412d7dmr8150311137.25.1729085448923; 
 Wed, 16 Oct 2024 06:30:48 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4a5acedd632sm537946137.22.2024.10.16.06.30.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 06:30:48 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-84fd057a993so1963551241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 06:30:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCULMmeiPtBcut4kgeLsnI/q/nOtB1QQ0dzqx/2jXn1s6cYZf/lJ9SUL+CdeOeX4i2QtWRVII42YhQI=@lists.freedesktop.org
X-Received: by 2002:a05:6122:469b:b0:50d:5be4:c39d with SMTP id
 71dfb90a1353d-50d5be4c7a8mr9674315e0c.0.1729085447232; Wed, 16 Oct 2024
 06:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-color-v2-1-46db5c78a54f@chromium.org>
In-Reply-To: <20241016-color-v2-1-46db5c78a54f@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 16 Oct 2024 21:30:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1niFFuKiw1hC-pV-dSVP_cd6YiAU+7a7xLYgokLc-DtOcQ@mail.gmail.com>
Message-ID: <CAC=S1niFFuKiw1hC-pV-dSVP_cd6YiAU+7a7xLYgokLc-DtOcQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Fix color format MACROs in OVL
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org
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

On Wed, Oct 16, 2024 at 7:10=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. That commit was intended to be a no-op
> cleanup. However, there are typos in these formats MACROs, which cause
> the return value to be incorrect. Fix the typos to ensure the return
> value remains unchanged.
>
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Changes in v2:
> - Clarify that the commit get fixed was intended to be a no-op cleanup
> - Fix the typo in tag
> - Link to v1: https://lore.kernel.org/r/20241015-color-v1-1-35b01fa0a826@=
chromium.org
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 89b439dcf3a6af9f5799487fdc0f128a9b5cbe4a..1632ac5c23d87e1cdc41013a9=
cf7864728dcb63b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -65,8 +65,8 @@
>  #define OVL_CON_CLRFMT_RGB     (1 << 12)
>  #define OVL_CON_CLRFMT_ARGB8888        (2 << 12)
>  #define OVL_CON_CLRFMT_RGBA8888        (3 << 12)
> -#define OVL_CON_CLRFMT_ABGR8888        (OVL_CON_CLRFMT_RGBA8888 | OVL_CO=
N_BYTE_SWAP)
> -#define OVL_CON_CLRFMT_BGRA8888        (OVL_CON_CLRFMT_ARGB8888 | OVL_CO=
N_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_ABGR8888        (OVL_CON_CLRFMT_ARGB8888 | OVL_CO=
N_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_BGRA8888        (OVL_CON_CLRFMT_RGBA8888 | OVL_CO=
N_BYTE_SWAP)
>  #define OVL_CON_CLRFMT_UYVY    (4 << 12)
>  #define OVL_CON_CLRFMT_YUYV    (5 << 12)
>  #define OVL_CON_MTX_YUV_TO_RGB (6 << 16)
>
> ---
> base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
> change-id: 20241015-color-e205e75b64aa
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>

You missed Doug's R-b tag in v1:
https://lore.kernel.org/all/CAD=3DFV=3DXrrhUoB9=3DJuPY2erLMA7S-EREqvP5t8NNu=
BuUiA4rZjQ@mail.gmail.com/

Can you resend v3 with both R-b tags this time?

Thanks,
Fei
