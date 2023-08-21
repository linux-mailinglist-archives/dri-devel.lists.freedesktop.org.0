Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A07821B2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 04:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CE010E067;
	Mon, 21 Aug 2023 02:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59E910E067;
 Mon, 21 Aug 2023 02:53:22 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-986d8332f50so376126066b.0; 
 Sun, 20 Aug 2023 19:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692586401; x=1693191201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yk6N/H89rG2XGekr3UL0YyNLbJwptjYVEPotSs/smck=;
 b=c02Zp6aXh2uGpgMqgk2Ppw1Vt7hCRaxZCVWABIl3WHT24TcytfIuKm4oZSNQgEP2yK
 OcQm6IvMgQv+CHW2txcg7SDef4G7r+izU1rclrNE74wGdRyagBEVQNj13+GYlC9ZtA00
 9qtjn6V/QBTvzL5ncpbyeMC+vZE9fFdWnazykiXvXEUQcv5Twm0nXJyuRY0FnKBBF5x+
 7jIC6BCMrbErVNqwHHkQn5O8NmzTbhYfJv3bgnXRbWxw6YvRuSyaZVAkZFSlT8nPZglA
 8jKalMKZlGSDkknmAQ0d684eoEp58dLZagKvgLU7e3yIdXfbz8EZQZZ2ldMzjMCmPgl5
 bnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692586401; x=1693191201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yk6N/H89rG2XGekr3UL0YyNLbJwptjYVEPotSs/smck=;
 b=lD0keOieN15tfrp5nKf59wWRMAgAlpTGj1Z1qO0WPnaMQVJZBCLuNPHybqFl4rQeoS
 HAvSk/+E+zFdgkoZ8TFyoG5V/78yPwMuBM4JF/xmkCx0XFTk6X5T01MUgCn44LrHyIvh
 MKspT0QPQu7ksuZt2646pMyGdgA5ThHoOskwmwA1/T9Gjmif3VGOfYYk57d8c69par5i
 petsRm9FbjOPooxVDFo4Y9cU+0VAhIlxqgDetHWQBUckWiB6l477LIROIKxW4MAQG3Zn
 5fgCgZFATWJaSXzpCwT5hcIlbFf+jrqdKJjh08Z1jhsLwBzbbK2A0gyB/ScLpZowrF0N
 vbJA==
X-Gm-Message-State: AOJu0YysNhrQ+T7jLS5RhlUfKdGJpbgNCx0pNYjpELkdOq4jCsFFGTLJ
 dhoC/vecLunJkxsLHlKM0Caav1cG1n8SMDPSTE8=
X-Google-Smtp-Source: AGHT+IGpcuIkBMuljYqNy8fyhXeLygXxQIfEVdNqZXzRPTI7GcpoBSmzuovQead8nkhaQOuXQke305jrcS0G63+23J4=
X-Received: by 2002:a17:906:5a68:b0:99b:d178:f059 with SMTP id
 my40-20020a1709065a6800b0099bd178f059mr3755330ejc.35.1692586401025; Sun, 20
 Aug 2023 19:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230820222920.2344-1-dakr@redhat.com>
In-Reply-To: <20230820222920.2344-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 21 Aug 2023 12:53:09 +1000
Message-ID: <CAPM=9txjnd_MrhANjoGqJ4iU1sNvz92MdsRUm_XbzGR-=daBTg@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next] drm/nouveau: uvmm: fix unset region pointer
 on remap
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Dave Airlie <airlied@redhat.com>

On Mon, 21 Aug 2023 at 08:29, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Transfer the region pointer of a uvma to the new uvma(s) on re-map to
> prevent potential shader faults when the re-mapped uvma(s) are unmapped.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 3a1e8538f205..aae780e4a4aa 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -639,6 +639,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
>                         struct drm_gpuva *va = r->unmap->va;
>                         struct uvmm_map_args remap_args = {
>                                 .kind = uvma_from_va(va)->kind,
> +                               .region = uvma_from_va(va)->region,
>                         };
>                         u64 ustart = va->va.addr;
>                         u64 urange = va->va.range;
>
> base-commit: 25205087df1ffe06ccea9302944ed1f77dc68c6f
> --
> 2.41.0
>
