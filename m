Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFCB439AFF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03882892CD;
	Mon, 25 Oct 2021 15:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92729892CD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:59:18 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 e59-20020a9d01c1000000b00552c91a99f7so15611655ote.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KOddvT3/SVcm/um2/rq9wR57y2D9AglEjqRL6U6ddYY=;
 b=WSBsi5uPR5US36IEkDlz89S/mbtLNqxQAxAqUO026sRsksWylXVHr+6Lf5yPIrsDit
 H5RQdD/rVcUO9vFBzQE+08Eq6lg9r+55r69OJOdFJju750B/r58fYW6lDxPNdlqGVySn
 UA4jYv2TVAbv7nFnQLDOsJebMuLJJjsgGvZdYLwGN/qrGu+ciId/M5C7nDMdK38/zONM
 nK2BjXmgJUbmBbwo63BSMZCdyEVyInPPVYXKgLt46CZIhwmkEt4872Lbra9Zu1lFZUm2
 7uqX7wXNnx57/v3KFNfkoQ9M38fdpQpuSfwTcJCyROxpZ5QXkz5i2mQD4dHD+t2Mfksp
 SuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KOddvT3/SVcm/um2/rq9wR57y2D9AglEjqRL6U6ddYY=;
 b=WFQh+YVRcCS99WKEHMkQchdpcjf7NxtdA28bz6Wc3DHeR3bgkYyPrEOtUM2JAm3bAG
 SFu3ArQ6w0i6Vvbeyf+voMUCZENiizvwy6tNm9bQtJGK8xF21QjAaydKq1QMxjwKbj78
 NcF6qGGeWeihz+wwSDl9xp3p/1gW9LnzD9hKEd8I5gdJ3eFlaPN/NlGzA5szbein4lzL
 Bb0W6D/qe6NiX4pJ+Df85ooio06CSrWeEOLQpVf8ReiqplF1+UIN3teocU/n2nBMC/It
 RvyrmW+m/PDeXRYRGrKBDGvnuCQqNhF8FhMnGcoSuAqXSnQzUskJ9wfhhXRpg6x/xpz7
 53Zg==
X-Gm-Message-State: AOAM530DP1xepqPhEWk5lyK2+2eMZVtMHS/OQhCfTLp2oJBGt0L8diie
 7K07+GKgz84ipcg6Yg8QBhOgjpWOCQpOOLAI8s80bW/oYpY=
X-Google-Smtp-Source: ABdhPJyi+KtA5UrArj8yJmll6FCzPW8JK1jmgqulic8kX4WMD2iY8Nxvdcadoj9qrGOl6hSlRKITO8z0Pazhka4vjHY=
X-Received: by 2002:a05:6830:23ac:: with SMTP id
 m12mr15206769ots.357.1635177557832; 
 Mon, 25 Oct 2021 08:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211025072835.176805-1-christian.koenig@amd.com>
In-Reply-To: <20211025072835.176805-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Oct 2021 11:59:06 -0400
Message-ID: <CADnq5_NRCi1JFi53DMFJaAhqhPX-KTjf9ufQ3J+m6PgwyBgiig@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix uninitialized variable usage in selftests
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

On Mon, Oct 25, 2021 at 3:28 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> "i" can be used uninitialized in one of the error branches. Fix this.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/dma-buf/st-dma-resv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.=
c
> index 6f3ba756da3e..bc2265807f6c 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -295,7 +295,7 @@ static int test_get_fences(void *arg, bool shared)
>                 if (r) {
>                         pr_err("Resv shared slot allocation failed\n");
>                         dma_resv_unlock(&resv);
> -                       goto err_free;
> +                       goto err_fini;
>                 }
>
>                 dma_resv_add_shared_fence(&resv, f);
> @@ -336,6 +336,7 @@ static int test_get_fences(void *arg, bool shared)
>         while (i--)
>                 dma_fence_put(fences[i]);
>         kfree(fences);
> +err_fini:
>         dma_resv_fini(&resv);
>         dma_fence_put(f);
>         return r;
> --
> 2.25.1
>
