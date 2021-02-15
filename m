Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C931C1F0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 19:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6F56E91D;
	Mon, 15 Feb 2021 18:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845BA6E91D;
 Mon, 15 Feb 2021 18:51:29 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id 18so8748334oiz.7;
 Mon, 15 Feb 2021 10:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FXWa925AIO3LIH/jmOKxAvLuXR6xeq8EAPoo9G/LVPs=;
 b=mwJuO+uIPO1JIGp9GCaya7q/7P2IO6XqwIU5FmY3duvnqxZe2Ayg2KCoQq2PupLGY7
 ET5ehCApl/uoprsXlCr/EdyCQqMkQGiQu2sVM3H9at/K2AwzZXuBisDJvjx/GPgn9SD2
 kpoe689fJBRTXXED7iD7X6yNb5YlEA0NO37Z2tW4tLXZ6Fq2h/Sig+NPemq/fmdGO/Nb
 2SUXtkZFFQyVHHgzVClcOobK3CGveDpq9cD+AM1k06eEbhMS0DVzTEKQIAlaHjgQoikJ
 /Xiw5e5kNE01cmS8WbFFNFS/gGfzQ0haxRZQX9Uvc00ND8eHXnK41wbXD67rC8HGg2Bq
 /Rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FXWa925AIO3LIH/jmOKxAvLuXR6xeq8EAPoo9G/LVPs=;
 b=h1DCVPuKNrJ1w3B1MSC1BPcr05/csHShCdoFIAX03L5UFZCJQ38K1mbzVSUd1wYqH9
 BlCfdz39mx2lk8ztbc8RHdio3EwsS5Ygz9yyPGl2S7bhQkjdvKnNWJDoNSfteHeSf5SK
 FW4It6DqXebFTVTEbzD9yylgtxlw5LA6aofx+Xf/W4W7zdv7whHDXaFuJc3QdAxYdKYy
 NaHUZxjGNzLsEwMPMp1Bh4O+J32v+TU9YmYEd76tmuvqCC+8dJXoswKJzUaxqJQccUjy
 QQgkHIA7lbe4WmRyBYX7cwaBYckUsXMhi4QbV5lqNwnAKYIPsjBb02vRkW6vN/ChHoY5
 mtVg==
X-Gm-Message-State: AOAM533Kn+ZF7B/TLXPiOKPwMI6g/tnxrsOwTSJe/SBe12nEcHBuEoxm
 6YI1rzPq7xR+CR5Q8uCbcTcT1UfuKSe+NUDg4+k=
X-Google-Smtp-Source: ABdhPJyLYFB1RDFzHl/QlWTxY2E2uXWJGecQ9goXZar9CqZ/0/4BNdZH10F461PkX/NmhdAYNOv0kFtTPoixlBXZyqU=
X-Received: by 2002:aca:c786:: with SMTP id x128mr212794oif.120.1613415088943; 
 Mon, 15 Feb 2021 10:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20210210212330.GA880153@embeddedor>
In-Reply-To: <20210210212330.GA880153@embeddedor>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Feb 2021 13:51:17 -0500
Message-ID: <CADnq5_MTPKXA_1G+=zVVH+G3Eqs-DZGH_2pW0=uUT0SMHbs5HQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix potential integer overflow
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Lang Yu <Lang.Yu@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 4:23 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Fix potential integer overflow by casting actual_calculated_clock_100hz
> to u64, in order to give the compiler complete information about the
> proper arithmetic to use.
>
> Notice that such variable is used in a context that expects
> an expression of type u64 (64 bits, unsigned) and the following
> expression is currently being evaluated using 32-bit arithmetic:
>
> actual_calculated_clock_100hz * post_divider
>
> Fixes: 7a03fdf628af ("drm/amd/display: fix 64bit division issue on 32bit OS")
> Addresses-Coverity-ID: 1501691 ("Unintentional integer overflow")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> index bc942725b9d8..dec58b3c42e4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> @@ -240,7 +240,7 @@ static bool calc_fb_divider_checking_tolerance(
>                 pll_settings->calculated_pix_clk_100hz =
>                         actual_calculated_clock_100hz;
>                 pll_settings->vco_freq =
> -                       div_u64(actual_calculated_clock_100hz * post_divider, 10);
> +                       div_u64((u64)actual_calculated_clock_100hz * post_divider, 10);
>                 return true;
>         }
>         return false;
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
