Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FFF27459E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 17:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0486E8AA;
	Tue, 22 Sep 2020 15:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FF96E84B;
 Tue, 22 Sep 2020 15:42:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o5so17581174wrn.13;
 Tue, 22 Sep 2020 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zqe84Nk1UowCxWHEiI4DgdqPuTuGGYYmgeHmTBq0fk=;
 b=uHadmq3Kz2/+CUFAUGs/3cB8L1OaAkv/I+ZV8ZYzgFHRz2FsDq65zy5S8iqf3cN4jq
 8h9cAwvHa8idmrrH4ZpHw1qPEGpcxVIHNCr9NuY1vRhvhNLIJ9lNCMc5DviJQy8oqsEb
 NnR1rL3ma/9uNi9Hopsfs7oqbz7Grs20FVqgFW9MP9ofBiFG7xBQVGzLAVNu8oAXq9PM
 7jk9wJrr4275SyylH/FxyBzL9A6nhdiQ8VXpM8/xky2R8GqWrHPVZ1KjbxF5JEVsKROb
 VUJTVVwj1zfHyeWUk3mGkDKhWSQXET8j28VgkEsnu9DXm0ba1gLO0Y2z3t9fmfygxOHJ
 49TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zqe84Nk1UowCxWHEiI4DgdqPuTuGGYYmgeHmTBq0fk=;
 b=lLBneGJsGjaCScM1B+bmly2YoVM4gMXWQgwoGY9vLsX/3GZ9YhLtvRNG7x78GuQllT
 jsbHodeDNvdu6EeeX7qdHYs5bpsEaZYt1sE5E8be2c+q00h1ZNh1IbMxwUwmunFvQEYV
 ugJib+J5FSxlq7uYPzOXRZLROyT3WdZowhE8z94AGxxq0asQ4KM22Td+7Ze8mXHbRj+W
 C1qCL3a2XVDieMiu+lr3cjOWds8lTEE8CnA9ZDidLpdHNS+B6q/0YQHTSjhj+TnFbvvw
 8hNlrPDa7BR5y55IWjFKyelxCszJn/mApgcUfmYlieHL1cHbbIRd5ZodrCAe7cUp4lzm
 NJZA==
X-Gm-Message-State: AOAM530pz+/LI4ZuoQ78+o5/4NE9/nWg7jux8aJX8WwiQ36sb3KHdST4
 1w39F+pK44Vu1egUKdbiNEeJl3sNzEOKtu1ybcg=
X-Google-Smtp-Source: ABdhPJxF6Yvtfum2cD2X7jpiXkb4a9Vmy8ViEa3nivHp1A5xnwW3JO/PQV7tnrzLGN7mG0h8o9ULIacpXRoA7QLPSAg=
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr6081863wrr.111.1600789365196; 
 Tue, 22 Sep 2020 08:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200922021106.24733-1-bernard@vivo.com>
In-Reply-To: <20200922021106.24733-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Sep 2020 11:42:34 -0400
Message-ID: <CADnq5_OrnViA+RQkkrmTuBFkuK++yPY4Mhmp4grEuKzJiOmAEg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: optimize code runtime a bit
To: Bernard Zhao <bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Martin Leung <martin.leung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Brandon Syu <Brandon.Syu@amd.com>, Michael Strauss <michael.strauss@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 abdoulaye berthe <abdoulaye.berthe@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Sep 22, 2020 at 3:52 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> In the function dal_ddc_service_query_ddc_data,
> get rid of dal_ddc_i2c_payloads_destroy, call
> dal_vector_destruct() directly.
> This change is to make the code run a bit fast.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> Changes since V1:
> *get rid of dal_ddc_i2c_payloads_destroy, call
> dal_vector_destruct() directly.
>
> Link for V1:
> *https://lore.kernel.org/patchwork/patch/1309014/
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> index b984eecca58b..dec12de37642 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> @@ -148,14 +148,6 @@ static uint32_t dal_ddc_i2c_payloads_get_count(struct i2c_payloads *p)
>         return p->payloads.count;
>  }
>
> -static void dal_ddc_i2c_payloads_destroy(struct i2c_payloads *p)
> -{
> -       if (!p)
> -               return;
> -
> -       dal_vector_destruct(&p->payloads);
> -}
> -
>  #define DDC_MIN(a, b) (((a) < (b)) ? (a) : (b))
>
>  void dal_ddc_i2c_payloads_add(
> @@ -582,7 +574,7 @@ bool dal_ddc_service_query_ddc_data(
>                                 ddc->link,
>                                 &command);
>
> -               dal_ddc_i2c_payloads_destroy(&payloads);
> +               dal_vector_destruct(&payloads.payloads);
>         }
>
>         return success;
> --
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
