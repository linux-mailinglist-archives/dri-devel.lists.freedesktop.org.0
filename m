Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B025B99F225
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 17:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F8E10E5A9;
	Tue, 15 Oct 2024 15:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PR9ViHqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C2810E5A9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 15:58:56 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539f72c913aso2640446e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729007934; x=1729612734;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f8q7MgnvGlQX6akYRxirKYZTLEprABkBbW76qdniZOI=;
 b=PR9ViHqyKkPolkHr7Q2W0m8b78Z7WajA5Me+auqA1TmM4Zy7AwxWFRc37VWxM8xXQF
 3R6RJvocHtg7g4KYH/XLOdwR54JZIoR3HUfs2Fcg+VgQc41Zr+hzkdZ0Nq5UQYe3C0TY
 PRhLY9MyT5rhrQKsCAUZ3VcLHVxCnXA4zU0hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729007934; x=1729612734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8q7MgnvGlQX6akYRxirKYZTLEprABkBbW76qdniZOI=;
 b=nTK+qDxWNBn1Ijr6GWcebtzu7ye4ObiQH4GVZE4haBebVhG8nac1A+MlnG2DvzIdwN
 qhWdy0OKBmVsETdKjAPd2wdDcI63IzQqSMtbeA+qB0MRBLS7BAXHx9wbDM1iOyaXWeiE
 IBX5eI7vu3KWemKdhmOh6cmuWIHS35A7CCbi1Uq3t1zlolmJ8Z+i/WmEZJ9Um7h44GMf
 AjQwtTQ//Jck9UFmvuEnsOiFsBCh2cYmgXvNDF4ruWqqtx6chJ4qi5YEcPy9zppxIaaj
 /LcGcUXBzJH72BaOOPhrUXd9ry5joHIsTP3tDvQf2taPiI+xAp8b+7D9+9mzWr/DtF/c
 chcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgGuszLiZbq6An7Z9+ibLm3M4emMKRdLdk5mkYfkXxe0nFPUonfmKwe3yg5c/ND3rHLFTfUPUpcHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzssYCh0DQD3Zpqv9urB9da4+Vk0OocLa8B4RGPkbbPReD9ksBx
 bhKVm4XoJelVxoiuplsaB9ECw7jkYZNE0gqwLOP0XcUSWccd0ZKAxqbiZZAfSCKOPW2hPaRhe9t
 l7g==
X-Google-Smtp-Source: AGHT+IHaIL8mJm+dyjsq6uU+l9fW7aZDcRNgM5lxZNN8KOXgWGXj5wwF3VzHl8gPtl+1EOCxBHpqNg==
X-Received: by 2002:a05:6512:e98:b0:52f:d69e:bb38 with SMTP id
 2adb3069b0e04-53a03f0bdd4mr588221e87.2.1729007933969; 
 Tue, 15 Oct 2024 08:58:53 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a00014342sm200299e87.292.2024.10.15.08.58.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 08:58:53 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so1948969e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 08:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWL/qt0r9DoI50F/HHSK+8LBkwXa+Hj7vujMUi4rs/CVOQzK8hdBh03pBmYBET/OKWdtG67TRXv6Og=@lists.freedesktop.org
X-Received: by 2002:a05:6512:692:b0:530:c212:4a5a with SMTP id
 2adb3069b0e04-53a03f1af4amr688286e87.22.1729007932572; Tue, 15 Oct 2024
 08:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241015-color-v1-1-35b01fa0a826@chromium.org>
In-Reply-To: <20241015-color-v1-1-35b01fa0a826@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 08:58:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrrhUoB9=JuPY2erLMA7S-EREqvP5t8NNuBuUiA4rZjQ@mail.gmail.com>
Message-ID: <CAD=FV=XrrhUoB9=JuPY2erLMA7S-EREqvP5t8NNuBuUiA4rZjQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix color format MACROs in OVL
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

On Tue, Oct 15, 2024 at 3:30=E2=80=AFAM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. However, there are typos in these
> formats MACROs, which cause the return value to be incorrect. Fix the
> typos to ensure the return value remains unchanged.

Right. I had a little bit of time figuring it out from the commit
message of the original CL, but I think the commit you're fixing was
_intended_ to be a noop and just a cleanup. ...but after resolving the
#defines before and after I can see that it wasn't.


> Fix: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")

The above syntax isn't quite right. It should be:

Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")

See `Documentation/process/submitting-patches.rst` which talks about
how to get `git` to format it for you.


> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
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

Other than the slightly broken "Fixes" tag, the above looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
