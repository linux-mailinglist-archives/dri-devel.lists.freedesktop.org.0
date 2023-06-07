Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99194725172
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 03:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C8110E408;
	Wed,  7 Jun 2023 01:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A45D10E408;
 Wed,  7 Jun 2023 01:18:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30adc63c87fso981963f8f.1; 
 Tue, 06 Jun 2023 18:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686100714; x=1688692714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1KgDHaOI1Us1uVdvmrUMFfMciSCryMc/a4pLaA9Lhg=;
 b=I2ghSAq3JDT4gj7Uf+IncMN0ipTmkzdn/4Yv5r4OjGYZKNar5OSApbCuLtKpwgaaog
 2ZoEIa9s8vQMupST9rS7w/tpwanQboypHhI87vF+mi84EHtmDaVK8vVxpg6PyUdfK5uI
 ab+7EDkMd8SddEeu0b4zwawV5ph6mNXZh3ymCoecgLkthdhkE4FX0dUgL9XhMbm04haN
 oG6rxssFsRg4TGy5yCrDqA0fJoI7bXbOXRAN6/E0Xtxyaw0oHLxz9qntXstDd2LGXRZB
 2clZB3Fj7s6uXhe3a+5qIkRzXMxjFiI8lOjRJz0Yd9PZymQpoVRRNyaNbmO57/FrpZCd
 GUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686100714; x=1688692714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1KgDHaOI1Us1uVdvmrUMFfMciSCryMc/a4pLaA9Lhg=;
 b=BZLxyS0zBrsYQwlI2TIKhQuTnO/2pgAIXXJemTSEHjBky6A9oM1Ikr29pGF4MCW3us
 N3v6SzsvAdmwbz3Q+pe7M+NYv/kpq/U3v0kPirXqpths38dFinyyZRJyAYIyiUb4n9kB
 RDFSCLWSKG6h8iaBmRHKDg6oect7LmU9M9eE6jVR2zWH1H2Bhwxn4N9Bt+X/auh4sNv/
 x/eRyiqFoVORoHhiCmfTTRgTGJDR9v/90T1vZTiSO4Eitrj0yI4bbbk/dWj0gPWzNXgT
 iBmvwbHcfqulu7hIbjKHlW6wU0jgRgEFwYpEnvvY3vmkupYazZ/D54dOQkmuaB8yhcWW
 7vsQ==
X-Gm-Message-State: AC+VfDys+AZn0HjrGzTe0I2koIN7ITH58kIdGoSpwQ468geZLLaeWgvK
 mARNdJbmju10URkkqxKdrdrUQInbO4vDGvmydNE=
X-Google-Smtp-Source: ACHHUZ7/cuO+TEChxTs+dXb7rNdJomNMj0QOWI0kWSVci+W1pvM3G3ccLLQvp1XZweD4REkWnWlEo8tN3KIEeW2PImU=
X-Received: by 2002:adf:eac5:0:b0:30c:2bd4:5141 with SMTP id
 o5-20020adfeac5000000b0030c2bd45141mr2614850wrn.4.1686100713726; Tue, 06 Jun
 2023 18:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230606143247.433018-1-nunes.erico@gmail.com>
In-Reply-To: <20230606143247.433018-1-nunes.erico@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 6 Jun 2023 18:18:06 -0700
Message-ID: <CA+E=qVcv4CrGki1cTYb53p5Ys0AgF=qfrK7XYB7X0gvu9knD-g@mail.gmail.com>
Subject: Re: [Lima] [PATCH] drm/lima: fix sched context destroy
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, yuq825@gmail.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 6, 2023 at 7:33=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com> =
wrote:
>
> The drm sched entity must be flushed before finishing, to account for
> jobs potentially still in flight at that time.
> Lima did not do this flush until now, so switch the destroy call to the
> drm_sched_entity_destroy() wrapper which will take care of that.
>
> This fixes a regression on lima which started since the rework in
> commit 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
> where some specific types of applications may hang indefinitely.
>
> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  drivers/gpu/drm/lima/lima_sched.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index ff003403fbbc..ffd91a5ee299 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -165,7 +165,7 @@ int lima_sched_context_init(struct lima_sched_pipe *p=
ipe,
>  void lima_sched_context_fini(struct lima_sched_pipe *pipe,
>                              struct lima_sched_context *context)
>  {
> -       drm_sched_entity_fini(&context->base);
> +       drm_sched_entity_destroy(&context->base);
>  }
>
>  struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *=
task)
> --
> 2.40.1
>
