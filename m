Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E37615664
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 01:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A9210E444;
	Wed,  2 Nov 2022 00:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7525110E443
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 00:05:41 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id z192so19318376yba.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 17:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LXVjpmcuceSLtVtq1KwkEZZvIzkOBdTR9+384qptIxA=;
 b=gY0XqIBcT72x+5mIHCPS8JMRAncFIGnhE9GY7Cn5NPnWk4IRHMt0JMqWu6DH90gzVc
 CHoUTiZPAQrnS/2fpZPWdo0998e+aHizZckzTlZvfGoKECQUr7hQYrT91Jrdwj8L9ytm
 DF7dq6zseQf0BPwvHgd/G9MfnW4J1KBOPwTjy0i+yOwLk3+QZGJdonLAVXhBGSZm6idB
 gtdVjKVZWDHQbbXp2bK3t9hmaiB4OGj8P4J6R1Vo1agDCf+oxQop9P6seYMRN/FP3Bc/
 /0jV5xUupHu/9i4wodfQv3Jf9DyvQ9qXM+Nhvawy+j0Q/7Vr17KQJ5qQrI1XnXInJe/B
 Pmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LXVjpmcuceSLtVtq1KwkEZZvIzkOBdTR9+384qptIxA=;
 b=l1nC94Nfuz3NoNJG8i/iBwOo6UpOvsOeXHO18XG/CCb2KlX6vdVu1Ch6Bn4dVciThC
 oU79we11TzOPyC+taegTzB040tW7TH8pbK4/0KiDXbtgJRZnuNCigTlOmhMab9a/GVj7
 ei6okxjnoRr/BAIILPtW8MSFnpKhoQiPVOZwu1CxyNY0eokDpWuyA0XJ0WXFvDgm2Wbq
 KSW3E9aRhsBBbHEgKB447nTF9l4kQxCoImJgTQNku7J0vxeT4KWzn8Zs3b1beIvwaINP
 85YPzUbN4737CD4EmcMqwc9RLGn9e1NJVP1DAmADCwkTDNJY9rYhRuMk545Qwubn7zy/
 Q/sg==
X-Gm-Message-State: ACrzQf3/ynUjjZybXBFKRtFnr0kdwXniN4nHzL+RLR/vh0iPk6Y6II08
 L5ACiVkfvAJW4G39eG2i9eDVkHgLBDugfx5ymhN/lw==
X-Google-Smtp-Source: AMsMyM7XHfcExfov1AZxC0aYOPIhc1Njm8sLYHakec7c8IDdtD3Rx445uxhfyVQggY9P/Cp7QQeM1XBRcgOs2Ij28ZA=
X-Received: by 2002:a05:6902:1cb:b0:6cf:e925:5baa with SMTP id
 u11-20020a05690201cb00b006cfe9255baamr256079ybh.636.1667347540410; Tue, 01
 Nov 2022 17:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <TYCP286MB23235BB803E3A778C85B50F7CA379@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB23235BB803E3A778C85B50F7CA379@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 1 Nov 2022 17:05:28 -0700
Message-ID: <CABdmKX0iR-YAfR+rLczPDa5W9Y+JMYs5RKMK8bkjs3z80TgL6A@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: fix racing conflict of dma_heap_add()
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

On Mon, Oct 31, 2022 at 7:53 AM Dawei Li <set_pte_at@outlook.com> wrote:
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
> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
>
> base-commit: 447fb14bf07905b880c9ed1ea92c53d6dd0649d7
>
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>  drivers/dma-buf/dma-heap.c | 37 ++++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 8f5848aa144f..1c787a147e3a 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -216,9 +216,21 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>         return heap->name;
>  }
>
> +static inline bool dma_heap_exist(const char *name)
> +{
> +       struct dma_heap *h;
> +
> +       list_for_each_entry(h, &heap_list, list) {
> +               if (!strcmp(h->name, name))
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  {
> -       struct dma_heap *heap, *h, *err_ret;
> +       struct dma_heap *heap, *err_ret;
>         struct device *dev_ret;
>         unsigned int minor;
>         int ret;
> @@ -235,13 +247,11 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>
>         /* check the name is unique */
>         mutex_lock(&heap_list_lock);
> -       list_for_each_entry(h, &heap_list, list) {
> -               if (!strcmp(h->name, exp_info->name)) {
> -                       mutex_unlock(&heap_list_lock);
> -                       pr_err("dma_heap: Already registered heap named %s\n",
> -                              exp_info->name);
> -                       return ERR_PTR(-EINVAL);
> -               }
> +       if (dma_heap_exist(exp_info->name)) {
> +               mutex_unlock(&heap_list_lock);
> +               pr_err("dma_heap: Already registered heap named %s\n",
> +                      exp_info->name);
> +               return ERR_PTR(-EINVAL);

Hi Dawei,
What Andrew was suggesting was that you entirely move the check from
here to the critical section down below, not duplicate the check. I
don't think we want to check this twice. We should be able to do this
by taking the heap_list_lock only once.

>         }
>         mutex_unlock(&heap_list_lock);
>
> @@ -283,13 +293,22 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>                 err_ret = ERR_CAST(dev_ret);
>                 goto err2;
>         }
> +
>         /* Add heap to the list */
>         mutex_lock(&heap_list_lock);
> +       if (unlikely(dma_heap_exist(exp_info->name))) {
> +               mutex_unlock(&heap_list_lock);
> +               pr_err("dma_heap: Already registered heap named %s\n",
> +                      exp_info->name);
> +               err_ret = ERR_PTR(-EINVAL);
> +               goto err3;
> +       }
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
