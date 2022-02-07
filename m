Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 332D44AC975
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3712610F8CF;
	Mon,  7 Feb 2022 19:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B5210F8CF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:26:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id o17so21192371ljp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 11:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJag/A5JmvykTiv6EpL4n31ZcZevEf+cXwTOlC0tOkg=;
 b=q1Hb1u5r9+AsViUlf6UZzxNWWr4GQprtIzge2G5bWfH70p3weWpX0FICkMAfCmkQSW
 DxgfdzQE6MACnIaDHskjXVgPZotUPDpBaHrW7ATyVti21B//sFUL8rxetrFLrYvP+b9F
 4o+LGmKu257u9/1LtqMQ+GhZ4MclAaFkmv2BmZ8JEy/LHyw1sb1hB1gUgMg4y5Ld4IM5
 tJ31LDi71OAbJlJwPOZ8x3SIhG9TLn96RRZPV9+jyJD4SVx4VtmZA5hyKpNTsTwCyT+X
 MBzdf/hKqWdwyskNBWuTAbzc/LRz7r8p7GK9DgeuRqvoHUUPsMLbtYzYn516lryInL24
 Sgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJag/A5JmvykTiv6EpL4n31ZcZevEf+cXwTOlC0tOkg=;
 b=MN3t+xlnT4vD3t8bsBmM7wDXQqHkwKoGTrpuFfHbbqi28r3ainD+A2vTtqwXB8Q47z
 oyOnRapWY9l343CRQBD7v/Vp9RBtv6Qx/a7uqbhfut36liKqFfCpjlxbHPvqGJGA+CcH
 3P9hzBPkGN67CPfIY8k4n6ZPiPQQpY1gLqs76VsP2pvFywUuJI8oaSc+GWmZHm5GkBUB
 jdc3SZlOT4wkoXL57k+xzggO/H8LXfRClE3sNmpIEnV7aJJ+/i0QNr5cLzvUNx+rxF0w
 c+vu6J5coGwNP25UEw7EGrUmFmHFLKKu/i4yenCfDTNUGfcgSawruYZFUEQGNvUQxQwV
 N/7g==
X-Gm-Message-State: AOAM530lPu2fFrE2+FF91ZUpqRiLZyJmQV1JR6RgiO85Wdr9dIdNXkED
 D7IzgnfGNxfaREZYhPZvm/J3923r8m+vlIw0zvn6uw==
X-Google-Smtp-Source: ABdhPJxiRwBDrZ7qHrwkeYZzKApFxOfBT0kt7xuCw9xbG3ufLrmJ9Sb/VD/Nm0ot8LNlflSABDiDmjBvKBn3HS7qJ1s=
X-Received: by 2002:a2e:980e:: with SMTP id a14mr617655ljj.220.1644261977984; 
 Mon, 07 Feb 2022 11:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20220203152305.1846862-1-trix@redhat.com>
In-Reply-To: <20220203152305.1846862-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Feb 2022 11:26:06 -0800
Message-ID: <CAKwvOd=MviBd5iwSnhyt9aSZU+QTsBrBSGPcjsjt2eepfYC3KQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: fix using freed memory
To: trix@redhat.com
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
Cc: tzimmermann@suse.de, airlied@linux.ie, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, maxime@cerno.tech, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 3, 2022 at 7:23 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis reports this problem
> ast_mode.c:1235:3: warning: Use of memory after it is freed
>   drm_connector_update_edid_property(&ast_connector->base, edid);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The second condition on
>
>   if (!flags && ast_connector->i2c)
>
> Means that the edid is not always set.  If the previous block
> fails the freed edid value will be used.  So set edid to NULL
> after freeing.
>
> Fixes: 55dc449a7c60 ("drm/ast: Handle failed I2C initialization gracefully")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index ab52efb15670e..9131dc8a1a2fc 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1224,10 +1224,12 @@ static int ast_get_modes(struct drm_connector *connector)
>                         return -ENOMEM;
>
>                 flags = ast_dp501_read_edid(connector->dev, (u8 *)edid);
> -               if (flags)
> +               if (flags) {
>                         ast->dp501_maxclk = ast_get_dp501_max_clk(connector->dev);
> -               else
> +               } else {
>                         kfree(edid);
> +                       edid = NULL;
> +               }

You probably didn't need to add the {} for the if, but it doesn't really matter.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>         }
>         if (!flags && ast_connector->i2c)
>                 edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
> --
> 2.26.3
>


-- 
Thanks,
~Nick Desaulniers
