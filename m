Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44230287AE6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 19:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B673A6EAB3;
	Thu,  8 Oct 2020 17:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5CC6EAB3;
 Thu,  8 Oct 2020 17:22:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g12so7469292wrp.10;
 Thu, 08 Oct 2020 10:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0XCAglP6YywwJUqM/bv9Go8J3wVKQf8G1ogKm9q5Gzw=;
 b=gL5DIxHuRCK9zS157yydNrjM50jVisfQRkHntJVR+dmxm1SRh0sYQpiqcF8gSvxlXj
 Ou61xly9XbENNpEY3e2ZQqLnyPlWma1yYni8Bmq3Rd0XakK+O2FPlFluti5v+w7NVjlW
 9uyO5xHLfyIn/BJNXqaKC7f0Vipqv/sbSMFUzbvEdcz90kEhgal+iWEnR0Ni8TwZtJWo
 LN5ENPrDBDIGHIT2mXnpnjvLFr58txgo0wkiViyPPOT6RQl0fsm4bq/Hd0p2m9BTSmlp
 mG8P15pqui1170eY3yxdIzxvQEZrNgBvcMcjNIbxpQ3jtlNwJsuCb3kMRzGLSD3DtaJo
 Bq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0XCAglP6YywwJUqM/bv9Go8J3wVKQf8G1ogKm9q5Gzw=;
 b=Z1Lr62+pIXaJ8B7L0QDuFSGp1UAgaqfYwzhfqgxoHY86saYPXRwqTGitWuiTtOh8D4
 /UUmXbAF0cOdJFfcKuCMW/mq2y7MlzZoohLQJtN2EP+kq0esVmRISBP2sCxOsk0w2c6h
 Uc6Cl4ZQwjusHZhZ5cFECUSa4PNU7W5yM3JyB1Ch8aI+c0WzaR2FJSpcChdTSxnywhT1
 p07DD4YxIGO4Jqscw6kQ892ib0h72zvoBEccq8bfvn3herJ56N9+Lsm8wEx71Y+Ja0mM
 hXXD5Qgg4y4QI8vrzFetc2BKZ1jpjTBQ3tqrbzP551Hcggluefn4OZ2TSEXfY7j8aUqx
 iqNQ==
X-Gm-Message-State: AOAM531XPInN9kQYX2oJj51mverz4x5qqiG0JunVkR3R6Wi5UTsMzgpZ
 i1tPQ8xDNVciDPnQynx1LuyJiOd9za557isP99c=
X-Google-Smtp-Source: ABdhPJxKNLFsnTv9OdQfqfvkt+lO2RGpK6EuS+70Pe6YGeonhYinlnofq3OOyLbeNaKzcKYUOE8q03LgA0UxPsjMokE=
X-Received: by 2002:adf:aa0a:: with SMTP id p10mr10309056wrd.362.1602177770395; 
 Thu, 08 Oct 2020 10:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201008143450.GA23077@embeddedor>
In-Reply-To: <20201008143450.GA23077@embeddedor>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Oct 2020 13:22:39 -0400
Message-ID: <CADnq5_MHvnkWtEUOG2WTBMaMKJMied3aPDg4ZLy0w+9Vyce_AQ@mail.gmail.com>
Subject: Re: [PATCH][next] amd/amdgpu_ctx: Use struct_size() helper and
 kmalloc()
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
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Oct 8, 2020 at 10:29 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Make use of the new struct_size() helper instead of the offsetof() idiom.
> Also, use kmalloc() instead of kcalloc().
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index c80d8339f58c..5be125f3b92a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -100,7 +100,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>         enum drm_sched_priority priority;
>         int r;
>
> -       entity = kcalloc(1, offsetof(typeof(*entity), fences[amdgpu_sched_jobs]),
> +       entity = kmalloc(struct_size(entity, fences, amdgpu_sched_jobs),
>                          GFP_KERNEL);
>         if (!entity)
>                 return  -ENOMEM;
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
