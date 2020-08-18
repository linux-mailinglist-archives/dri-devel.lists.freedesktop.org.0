Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E224880A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 16:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0831D89CF6;
	Tue, 18 Aug 2020 14:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD94189CDB;
 Tue, 18 Aug 2020 14:43:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a14so18538323wra.5;
 Tue, 18 Aug 2020 07:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nn+dQltSNrTpEOmO/72SIoczPIww+KaSGSIwYHiMyqs=;
 b=r70f2n6UEVQH/7cm8pp0ownDfW4G5pAIS3odxMw8ievkejBcDlkfTg/gGG8BMNIwdn
 EXAoAGCT1+2D2HBWjcOgSXDwQKKikB8wZOPpcwckTaiwCVAeojiVlQM74th3Rg03QaK7
 32/RwSaB2G/cCMyzuIWSgVPA7AhJnfvf6mPkM7LBUR6B8sPtha+R/lHLlx3291PH8ZhV
 h3tdM6xoaRG8zeyeZlPEW5tXuHZvpo28CuH3oHDyXnHn0hy0etpKS1ksNKWn3CBGZZWT
 StLicyOr8olMszHL36nXBRFW41wuvRxfqLa9dHrmjfMHTgtiOmRSiVfkA0GNsjSBZsyJ
 8PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nn+dQltSNrTpEOmO/72SIoczPIww+KaSGSIwYHiMyqs=;
 b=XL6FAtJckviAbBycMylzM62AcrgBU/f39zTwoWXP1QKg6flC/m6718FRJX0nMXNeI1
 jn55iWJccfAqUU7aSlOPPr7yTeziRnicu/fuL9HB6Yg98CeLP1+Jgk5/CzUcGN6yQ8S8
 bUMpV6/jTYYPrRrwd7uMDpLeUayC6eTYydc4E2iZDzsZX8+dZAWq1Z6xuhqyFAAq4yRQ
 gKmkaUKB3zuIcekVaQUSqL29pa+fvItLtUtKasK3OmxcUNko0D7FHI0TS7cI+PFaOnSX
 AYLyVdRa/kIs5oyRrRc3m1dcsGulicj4m2JM9zQGHmZdEHe4PcmjNMaPYNCNNztMcYFe
 jMVw==
X-Gm-Message-State: AOAM530cj4y5HNGS5iqrnBKGg/fZUH8S3ouVKoUceBnQAt6gWSLNodak
 5MXuUlx1xH3wAxAM5Pa8Zrb57j8JGWm/M661NU0=
X-Google-Smtp-Source: ABdhPJy/Kl5SzhrZm43eFQ5CqHvKNB6Ze6VOIYOn4HWeUuJcUR+R2Fdj9tdc6stlUAnpOpwapgVwAkd3wyZfc9ROc+Y=
X-Received: by 2002:adf:a351:: with SMTP id d17mr20309653wrb.111.1597761826407; 
 Tue, 18 Aug 2020 07:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200818120914.20280-1-colin.king@canonical.com>
In-Reply-To: <20200818120914.20280-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Aug 2020 10:43:35 -0400
Message-ID: <CADnq5_P5ozoOT4H0hrjxM1JwpvJGQ0UCnp00Kf5+Msh2CdBHgg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: fix potential integer overflow
 when shifting 32 bit variable bl_pwm
To: Colin King <colin.king@canonical.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 8:09 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The 32 bit unsigned integer bl_pwm is being shifted using 32 bit arithmetic
> and then being assigned to a 64 bit unsigned integer.  There is a potential
> for a 32 bit overflow so cast bl_pwm to enforce a 64 bit shift operation
> to avoid this.
>
> Addresses-Coverity: ("unintentional integer overflow")
> Fixes: 3ba01817365c ("drm/amd/display: Move panel_cntl specific register from abm to panel_cntl.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
> index a6d73d30837c..df7f826eebd8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_panel_cntl.c
> @@ -76,7 +76,7 @@ static unsigned int dce_get_16_bit_backlight_from_pwm(struct panel_cntl *panel_c
>         else
>                 bl_pwm &= 0xFFFF;
>
> -       current_backlight = bl_pwm << (1 + bl_int_count);
> +       current_backlight = (uint64_t)bl_pwm << (1 + bl_int_count);
>
>         if (bl_period == 0)
>                 bl_period = 0xFFFF;
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
