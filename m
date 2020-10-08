Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34D287AEA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 19:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D47F6EAB8;
	Thu,  8 Oct 2020 17:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C152A6EAB6;
 Thu,  8 Oct 2020 17:23:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h7so7501742wre.4;
 Thu, 08 Oct 2020 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Th8nI66DvtaZ0IVeBilAefR7QwQob2LTpsjIn1x8LsM=;
 b=tLRYcHUQ5hYXSooAZwqc+dONvA4JaaWG7/eT+978T0sPZB+Semwk7rkaDsaybmiHVe
 xYH7F73tbVs9KTVMeGfgchxoCjLCT42yvYMyLVHVi7dEsaBm3tYOQ2juGi/0VenRk6eT
 RFvm9ESuBjJIcyRySLyZabYiSxcC9tm2fxuev1LvoL1GNa0fqhHXrwDyRBupRUhs0IM7
 4bw/4Do2cBO826iWJQxk63yEvtf2SrRaSTMPrp/mTOuemxgN60z4Wtu1Y5fNFfVe/NXC
 BN9xrQ0+chdPtqonQyZqq/rWyA2VQVooVyg4Llau+V7P3jpzJRWx/KplcJ68ItZ/FKRM
 CsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Th8nI66DvtaZ0IVeBilAefR7QwQob2LTpsjIn1x8LsM=;
 b=oOvsQ6QJsraScCZCE7cAjTnufhEWMQljw3xWC9zdtUCnfyv9QyDDNTBz7oPc2KwV1B
 S2vg942qcxc294SfTDZHljsedMXMRYj4mUD8O65rHFx93j9/qtGKehmhRKDKLd2jEjry
 bXEcp+Tha9x/63itdKmZFO7rQlZgjaBay5XSZtIMxPh4ePSagFyFORRLWYq/xUD4PAFI
 1AnnmqhTeEUWBuuh6gcjmxnoOpz1d7CzZSH1w2PNPNFvpTDvI08TBw79ZTdhp04p+EIF
 y6DpNR7ZuoV7zXQVJNWo2rRnWeXMv++vF5b1eJdbTTkDw+it87wIsRIegautf00f1qWT
 HQXA==
X-Gm-Message-State: AOAM53090iKZXLtT1oNz7MDuO69CUu7gzfkWgOCqDJMR3RskonjEcxgS
 nkDG+LYB/bcV8Dno50ULpGS6MSdT2a9dPyeKjdc=
X-Google-Smtp-Source: ABdhPJzZ6GoeX2WpQfU+giynQG8KdCAt3+RG6EPJsd5+47Ui2pcrX/PGqpk0QmrwBrrDh6wRze0rpVHSdftoL+uv9Kk=
X-Received: by 2002:adf:f246:: with SMTP id b6mr4508843wrp.111.1602177782434; 
 Thu, 08 Oct 2020 10:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201008142305.GA21249@embeddedor>
In-Reply-To: <20201008142305.GA21249@embeddedor>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Oct 2020 13:22:51 -0400
Message-ID: <CADnq5_NA+vck4=zq8LxkrJDx0AXcu8iLAs=TNdvxoWhFqeTfEA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: Use struct_size() helper in kmalloc()
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Oct 8, 2020 at 10:17 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Make use of the new struct_size() helper instead of the offsetof() idiom.
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 5da487b64a66..30192dce7775 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -239,8 +239,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>         if (!old)
>                 return 0;
>
> -       new = kmalloc(offsetof(typeof(*new), shared[old->shared_max]),
> -                     GFP_KERNEL);
> +       new = kmalloc(struct_size(new, shared, old->shared_max), GFP_KERNEL);
>         if (!new)
>                 return -ENOMEM;
>
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
