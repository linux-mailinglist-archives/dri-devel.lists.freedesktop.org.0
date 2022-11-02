Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4C6169CA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 17:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C5E10E510;
	Wed,  2 Nov 2022 16:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CF710E50C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 16:54:15 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id n130so21836495yba.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f+jsYWzMq4ayln83LACSuCFQylp+aW9xpS8cdpbBSi0=;
 b=Z8JN/8nhG9eptQBEBpxwlVClP98EOTk8ztgCuPfjxHeDBQnhqELjWrIdPZ5K2mtIqd
 j4RMTLr15plCqweSdq3fqcfitKfeaKFfNhkYgoDwGRKj97tnv4ibaMA2+k1Ycj5QBJiW
 5h1nEu3c8rfB2xEf85WSK0RF12SBH21ItlZRiVDTcx0x+zn2Ry2xCi92Iay5Iv8LIEPN
 W1gffIV4OGrovFyqOUMrm/plPRlGVZwT4SsKup6d6QYOH2oUTcISDTep3wNjUzWgen/N
 8h9/xvXqCq3RsGTjfVtibEdwMi13cvCy2itdvFm61wFuyhFeCEe+8/CoaXkeg/ljZ7s4
 FUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f+jsYWzMq4ayln83LACSuCFQylp+aW9xpS8cdpbBSi0=;
 b=MvAppNVgdEN1QHGsL5eoSCiYL2NbDFRGSU8b1so9qNdxFxMMSmUKp211M5nx3xMSb8
 BWvhin6xTJpYmSl1K6Dp4RMp8K2kYJ2HNXOmlCngT6pCPKgkR6EN8XFFL4lRMu5rcoYR
 TaVVGFFS/E+pDpx81xA/23EXBKIwPykdVgL24FvwsrzIRejXke0yL51mAjeWaMFi/ipo
 W4ozk0bKHkgCsUJPxm0yhibDgRl3mXbxKtpt20hU1Zmsw23Ez3Phowz8Zp3bGHPphabP
 h8/HzEZFWststsKlaxvbbJhBGc8FPqLQ1s+PHsR4HhCY2td+OhS42UVXqTrB/k9Vidyr
 GRzA==
X-Gm-Message-State: ACrzQf0d+TDO1iDXZ0w2N8metNEH+9tV+o+UP2JHvEeYnp8OQYXxiU+T
 GUiUwM0UPLJ5PoYju5eZLdaO4hWJmbcLYaODyn5bFw==
X-Google-Smtp-Source: AMsMyM65O4NBPUuaOBAgi95AvY9AqyXj3pXE7q8JILaTPjQvUhUaYGNVBiND+5QefC7PS0k2HKzI7xpKHUBwrDMr1pw=
X-Received: by 2002:a25:cd01:0:b0:6c2:6f0d:f4ce with SMTP id
 d1-20020a25cd01000000b006c26f0df4cemr22429548ybf.365.1667408054985; Wed, 02
 Nov 2022 09:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <TYCP286MB2323D71DEC1D008BEA6F7ABBCA399@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB2323D71DEC1D008BEA6F7ABBCA399@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 2 Nov 2022 09:54:03 -0700
Message-ID: <CABdmKX3bE5eKOeonTnkLZUgg=1yx3h5QPkGgue-bATHVDChHLQ@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: fix racing conflict of dma_heap_add()
To: Dawei Li <set_pte_at@outlook.com>
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
Cc: benjamin.gaignard@collabora.com, christian.koenig@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org, sspatil@android.com,
 jstultz@google.com, afd@ti.com, labbott@redhat.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 2, 2022 at 8:59 AM Dawei Li <set_pte_at@outlook.com> wrote:
>
> Racing conflict could be:
> task A                 task B
> list_for_each_entry
> strcmp(h->name))
>                        list_for_each_entry
>                        strcmp(h->name)
> kzalloc                kzalloc
> ......                 .....
> device_create          device_create
> list_add
>                        list_add
>
> The root cause is that task B has no idea about the fact someone
> else(A) has inserted heap with same name when it calls list_add,
> so a potential collision occurs.
>
> v1: https://lore.kernel.org/all/TYCP286MB2323950197F60FC3473123B7CA349@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
>
> v1->v2: Narrow down locking scope, check the existence of heap before
> insertion, as suggested by Andrew Davis.
>
> v2->v3: Remove double checking.
>
> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
>
> base-commit: 447fb14bf07905b880c9ed1ea92c53d6dd0649d7
>
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>  drivers/dma-buf/dma-heap.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 8f5848aa144f..7a25e98259ea 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -233,18 +233,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       /* check the name is unique */
> -       mutex_lock(&heap_list_lock);
> -       list_for_each_entry(h, &heap_list, list) {
> -               if (!strcmp(h->name, exp_info->name)) {
> -                       mutex_unlock(&heap_list_lock);
> -                       pr_err("dma_heap: Already registered heap named %s\n",
> -                              exp_info->name);
> -                       return ERR_PTR(-EINVAL);
> -               }
> -       }
> -       mutex_unlock(&heap_list_lock);
> -
>         heap = kzalloc(sizeof(*heap), GFP_KERNEL);
>         if (!heap)
>                 return ERR_PTR(-ENOMEM);
> @@ -283,13 +271,26 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>                 err_ret = ERR_CAST(dev_ret);
>                 goto err2;
>         }
> -       /* Add heap to the list */
> +
>         mutex_lock(&heap_list_lock);
> +       /* check the name is unique */
> +       list_for_each_entry(h, &heap_list, list) {
> +               if (!strcmp(h->name, exp_info->name)) {
> +                       mutex_unlock(&heap_list_lock);
> +                       pr_err("dma_heap: Already registered heap named %s\n",
> +                              exp_info->name);
> +                       err_ret = ERR_PTR(-EINVAL);
> +                       goto err3;
> +               }
> +       }
> +
> +       /* Add heap to the list */
>         list_add(&heap->list, &heap_list);
>         mutex_unlock(&heap_list_lock);
>
>         return heap;
> -
> +err3:
> +       device_destroy(dma_heap_class, heap->heap_devt);
>  err2:
>         cdev_del(&heap->heap_cdev);
>  err1:
> --
> 2.25.1
>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

Thanks!
