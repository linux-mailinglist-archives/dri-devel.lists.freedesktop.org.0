Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734A4AC9CA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAFF10E3CF;
	Mon,  7 Feb 2022 19:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ADE10E3CF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:45:07 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z20so21250473ljo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 11:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZDpDADdfwq40jZPbE/sznh7Bnymle3eu2MsiKyAnHI=;
 b=BdiDafPxAfgT1LadX6/qdSNo8n3l0Xa/GtCJEktDJMXEmp52SrE42F60zh+yNtgnej
 uafnZUT8MJqOawyMYksVSqsD8w5zXATUGodDDaf2n0OSYIP77vOHkN1WwPFv0stLOa78
 +4ATpfopW4dS5hdH2p54SyosNF1m7zjr8r+2YE4GWs0neqc92bzF3dIJD7hE8cA0PJPs
 kQu1XjE348Lq3znmdTjfrSq9FD04iuxmobdD48LoM7k4xW51/uiPDMkZVxL359FVEki8
 6hN3NzqdifRAShPzrX73QDVc8Pe4IH8JQaohdbJyNHzgPOa0p/tQFkgSdDhkiO0KiTmj
 Kknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZDpDADdfwq40jZPbE/sznh7Bnymle3eu2MsiKyAnHI=;
 b=wUppmlyRz0fXc4caUaYp+G7CovNDiuNyGWyGutloRVINrKx8CuRNxUBoCF+gA1xVmO
 bO5az0BQLL04/3MMX6Eb9JkI/Hf4KPobkN+Tx8um930qoRJA7T/G6vn0gJv4EmogwvWR
 hIkpJPJSsAQHECxi8Oqk93JyDqBN7rPEUUbT8JNWj2A2UlY3H4h8PMy3K9B60h/7Kfu7
 7OKqCECNAI2eIeEMrSegpDkPRIvlFychqA9Xs2LNPC6/ZOqKRIgFKgychXGFvhgtHQzo
 I5I86thR6p8eMdw6VJr1MV42NxZirZKpNJgl5Uh2VMy3p3KYpZkw9mmYTgYVGqW9M1PV
 nm5g==
X-Gm-Message-State: AOAM531ovEoKmuXby6Dje3JQLZ4UVRKCpAg7pVQSFllrhiu8NrNUlmSs
 46C50cIMtyRQQlkQl57+nLOH+EnSbAR0dknLTzwKdA==
X-Google-Smtp-Source: ABdhPJwv1WF2F6ndc/bGUuNT+neSxWAOv6iXkCytc6pktYWRpfycPf6E/KpzZmQrd8aUu/NlJ8No19+iCvFMptVtXu4=
X-Received: by 2002:a2e:7c0c:: with SMTP id x12mr648215ljc.526.1644263105665; 
 Mon, 07 Feb 2022 11:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20220207165304.1046867-1-nathan@kernel.org>
In-Reply-To: <20220207165304.1046867-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Feb 2022 11:44:53 -0800
Message-ID: <CAKwvOdkXe8CB3QGe2e6Fhz8_SLOsOpcMumoKBiAzGE_VTXCkVg@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: Avoid using val uninitialized in
 ltdc_set_ycbcr_config()
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 7, 2022 at 8:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
>   drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>           default:
>           ^~~~~~~
>   drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
>           val |= LxPCR_YCEN;
>           ^~~
>   drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
>           u32 val;
>                  ^
>                   = 0
>   1 warning generated.
>
> Use a return instead of break in the default case to fix the warning.
> Add an error message so that this return is not silent, which could hide
> issues in the future.
>
> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1575
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5eeb32c9c9ce..447ddde1786c 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
>                 break;
>         default:
>                 /* RGB or not a YCbCr supported format */
> -               break;
> +               drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);

This is fine, but in the future you should add an explicit
#include <drm/drm_print.h>
to avoid implicit header dependencies (like the ones that Mingo is
trying to detangle) for the declaration of drm_err. `drm_vprintf`
needs it, too.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> +               return;
>         }
>
>         /* Enable limited range */
>
> base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
> --
> 2.35.1
>


-- 
Thanks,
~Nick Desaulniers
