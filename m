Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB491F0EC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 10:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD3510E173;
	Tue,  2 Jul 2024 08:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="WRPClrRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A606110E173
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 08:20:51 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f64942fc54so53355739f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719908451; x=1720513251;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LjW1AaPPleDTehNvhUI4Uy1cfpQXZFORbmNIpyEf1Vs=;
 b=WRPClrRQoV37qNgcWzk7lsovfugBJE3/TX/eBoh5F0L/f+OqK96A7ltIpOtw3cjprP
 ev01i4VwDmaIgUKFlwivqX6KjcBBt32tNNR1U2/yQSK0aBu4isysA2hvxk2Yr2jOD0oh
 ZUhFxBZIdjcnkpqIb9XOmnaxRxsCkZ6aH5itI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719908451; x=1720513251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LjW1AaPPleDTehNvhUI4Uy1cfpQXZFORbmNIpyEf1Vs=;
 b=de0U7fjD+W34FXFRYq+P7HqxPlHjUMgdW+PBOY0LqKDjsdmKkOx0K0jc1XngOYqVGa
 bpVNtMvf1Hhb5PU87yl5F4mtZ4jlxI2ZCucarCjiYY6hy0mOmgsUNi3yP+FvUpJ+bJsu
 Y8EbNWL8c3jd25QHlLwaU5IdZgya/9igyiZxbgGjuR3Ce/TEJfoT7Nav+tuvcdATSzF4
 rIouhDECSrgv0NVFQTaP8L4zg1xSVOsPS8WsnEAnnADNzpK+TARRjpNQWZELpgAqBfgb
 aYFQOgR7/37lXl5WFsrxhgwPmGXZmJX4V3eCeThd44wOHBwKDMmUBGJTA5z7VwcefExy
 3PZg==
X-Gm-Message-State: AOJu0Yy3zGbO5KOa2+PW7RVo46ofErhKpQpi+ia00yucFVEHTcNWpzFD
 N1jYV8rYfZqIjHKVfcKgGgvu05SBozna4lclFRVDHnUXh33I2a3B176PEO0Hn48JYOsqXAQakjv
 KCYPqUCBwm1pjujNrU8nA7ZZ+2NklEMUSU1u9
X-Google-Smtp-Source: AGHT+IH9o61cvuN+VnixhLr4W4vbDhnrsa3JHsyiS0SWCmokqqVTuxhftscbNsFyCGR3neeNzJdUmOMXH3MqV0MEt9Y=
X-Received: by 2002:a05:6602:2bfa:b0:7f3:d731:c6df with SMTP id
 ca18e2360f4ac-7f62ee501eamr919293739f.10.1719908450692; Tue, 02 Jul 2024
 01:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240702021254.1610188-1-zack.rusin@broadcom.com>
 <20240702021254.1610188-2-zack.rusin@broadcom.com>
In-Reply-To: <20240702021254.1610188-2-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Tue, 2 Jul 2024 11:20:39 +0300
Message-ID: <CAKLwHdW=KMS2wWueFvWexSLiFo50hENmwju7pLPNLraCqZyvJw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/vmwgfx: Fix a deadlock in dma buf fence polling
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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

On Tue, Jul 2, 2024 at 5:12=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com>=
 wrote:
>
> Introduce a version of the fence ops that on release doesn't remove
> the fence from the pending list, and thus doesn't require a lock to
> fix poll->fence wait->fence unref deadlocks.
>
> vmwgfx overwrites the wait callback to iterate over the list of all
> fences and update their status, to do that it holds a lock to prevent
> the list modifcations from other threads. The fence destroy callback
> both deletes the fence and removes it from the list of pending
> fences, for which it holds a lock.
>
> dma buf polling cb unrefs a fence after it's been signaled: so the poll
> calls the wait, which signals the fences, which are being destroyed.
> The destruction tries to acquire the lock on the pending fences list
> which it can never get because it's held by the wait from which it
> was called.
>
> Old bug, but not a lot of userspace apps were using dma-buf polling
> interfaces. Fix those, in particular this fixes KDE stalls/deadlock.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 2298e804e96e ("drm/vmwgfx: rework to new fence interface, v2")
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_fence.c
> index 5efc6a766f64..588d50ababf6 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -32,7 +32,6 @@
>  #define VMW_FENCE_WRAP (1 << 31)
>
>  struct vmw_fence_manager {
> -       int num_fence_objects;
>         struct vmw_private *dev_priv;
>         spinlock_t lock;
>         struct list_head fence_list;
> @@ -124,13 +123,13 @@ static void vmw_fence_obj_destroy(struct dma_fence =
*f)
>  {
>         struct vmw_fence_obj *fence =3D
>                 container_of(f, struct vmw_fence_obj, base);
> -
>         struct vmw_fence_manager *fman =3D fman_from_fence(fence);
>
> -       spin_lock(&fman->lock);
> -       list_del_init(&fence->head);
> -       --fman->num_fence_objects;
> -       spin_unlock(&fman->lock);
> +       if (!list_empty(&fence->head)) {
> +               spin_lock(&fman->lock);
> +               list_del_init(&fence->head);
> +               spin_unlock(&fman->lock);
> +       }
>         fence->destroy(fence);
>  }
>
> @@ -257,7 +256,6 @@ static const struct dma_fence_ops vmw_fence_ops =3D {
>         .release =3D vmw_fence_obj_destroy,
>  };
>
> -
>  /*
>   * Execute signal actions on fences recently signaled.
>   * This is done from a workqueue so we don't have to execute
> @@ -355,7 +353,6 @@ static int vmw_fence_obj_init(struct vmw_fence_manage=
r *fman,
>                 goto out_unlock;
>         }
>         list_add_tail(&fence->head, &fman->fence_list);
> -       ++fman->num_fence_objects;
>
>  out_unlock:
>         spin_unlock(&fman->lock);
> @@ -403,7 +400,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fenc=
e_manager *fman,
>                                       u32 passed_seqno)
>  {
>         u32 goal_seqno;
> -       struct vmw_fence_obj *fence;
> +       struct vmw_fence_obj *fence, *next_fence;
>
>         if (likely(!fman->seqno_valid))
>                 return false;
> @@ -413,7 +410,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fenc=
e_manager *fman,
>                 return false;
>
>         fman->seqno_valid =3D false;
> -       list_for_each_entry(fence, &fman->fence_list, head) {
> +       list_for_each_entry_safe(fence, next_fence, &fman->fence_list, he=
ad) {
>                 if (!list_empty(&fence->seq_passed_actions)) {
>                         fman->seqno_valid =3D true;
>                         vmw_fence_goal_write(fman->dev_priv,
> --
> 2.43.0
>

LGTM

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
