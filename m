Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2835891A63D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 14:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F81A10E03B;
	Thu, 27 Jun 2024 12:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="PLiGNinU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E882110E1FA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 12:08:26 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7f3d3919a4aso60785139f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719490106; x=1720094906;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E2r1ESSwZbjCYuyVquXZ4JcpRU+zaQsqDZJxmGkF+CA=;
 b=PLiGNinUfDrsCFNtDnNPvTuLau7bey3lEU6mMHm6seFVjCBCEBgxloPQ2moWIM0XwM
 GqfKzwOaBeG0ZpsGkTn2GbmtMnkIsQvfnXxLv7RArMKS5Li8DjOuPe0cQQ/PWptP4mrh
 /I25+khjaW3SJSDpqT8GOzm+/fMRc5bSxTnts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719490106; x=1720094906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E2r1ESSwZbjCYuyVquXZ4JcpRU+zaQsqDZJxmGkF+CA=;
 b=mouYmOQ5+e5cUdf0f5pJ21UfY3gZzQV6KA7K1Kmp8Fw6B6yGG0lV+f0LzxhJ5fjHMp
 Q8zguxMyoaqiF5CT/EKtzz7yP/RQd5pfGlmkLOkzcz4XGfhi5P7WveU1IkEcRZVm0G9z
 3O8kHF18pf856wya+knby1BmOKpOUwS5WKBoOiOHURnza2GM0OAPzqZ+J66AD1oo4bGz
 ENKN8/a288LXx90rxaHOgf8VTwtkDKJIPedNOqpYaJPQkDqe8IjznGbuLrSWxVfmJ13/
 XcrY4q/qL4DfZv81DMXYDKY4UPAQXsE97zJgmRxaVIKFQb7md6RRhHCHL634/9cOStRp
 3fsA==
X-Gm-Message-State: AOJu0YwipvCKqV+Hrxrvvi/js7lwANB7RUPdx9gfnILtsq4oWa8p46XH
 PYMIAOrJuJ+ElK/D2zMLhUlINffgQF8F/wYOukcbskhNni/q8c8zGWX9SELMWM5WSKLAHlO0TYU
 Jq+wmXTJAtiIAx36xhoz9or5GRL6IQedugScu
X-Google-Smtp-Source: AGHT+IGugJIkLcqzl3qOGvg/HikFdmSdOsLhMoybnqZZC2VraMmaowc074qNNMvCK7PWMffiPVYf5ZAKDYCtWmoBtlw=
X-Received: by 2002:a05:6602:2b93:b0:7eb:b93d:4101 with SMTP id
 ca18e2360f4ac-7f3a4dcbc1fmr1753925839f.9.1719490105954; Thu, 27 Jun 2024
 05:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240627053452.2908605-1-zack.rusin@broadcom.com>
 <20240627053452.2908605-2-zack.rusin@broadcom.com>
In-Reply-To: <20240627053452.2908605-2-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Thu, 27 Jun 2024 15:08:14 +0300
Message-ID: <CAKLwHdX9f1dgNnQY64WEJAERrUiQgzEvVb=8rQXf3y9uUMoyqw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/vmwgfx: Fix a deadlock in dma buf fence polling
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

On Thu, Jun 27, 2024 at 8:34=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
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
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_fence.c
> index 5efc6a766f64..76971ef7801a 100644
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
> @@ -120,16 +119,23 @@ static void vmw_fence_goal_write(struct vmw_private=
 *vmw, u32 value)
>   * objects with actions attached to them.
>   */
>
> -static void vmw_fence_obj_destroy(struct dma_fence *f)
> +static void vmw_fence_obj_destroy_removed(struct dma_fence *f)
>  {
>         struct vmw_fence_obj *fence =3D
>                 container_of(f, struct vmw_fence_obj, base);
>
> +       WARN_ON(!list_empty(&fence->head));
> +       fence->destroy(fence);
> +}
> +
> +static void vmw_fence_obj_destroy(struct dma_fence *f)
> +{
> +       struct vmw_fence_obj *fence =3D
> +               container_of(f, struct vmw_fence_obj, base);
>         struct vmw_fence_manager *fman =3D fman_from_fence(fence);
>
>         spin_lock(&fman->lock);
>         list_del_init(&fence->head);
> -       --fman->num_fence_objects;
>         spin_unlock(&fman->lock);
>         fence->destroy(fence);
>  }
> @@ -257,6 +263,13 @@ static const struct dma_fence_ops vmw_fence_ops =3D =
{
>         .release =3D vmw_fence_obj_destroy,
>  };
>
> +static const struct dma_fence_ops vmw_fence_ops_removed =3D {
> +       .get_driver_name =3D vmw_fence_get_driver_name,
> +       .get_timeline_name =3D vmw_fence_get_timeline_name,
> +       .enable_signaling =3D vmw_fence_enable_signaling,
> +       .wait =3D vmw_fence_wait,
> +       .release =3D vmw_fence_obj_destroy_removed,
> +};
>
>  /*
>   * Execute signal actions on fences recently signaled.
> @@ -355,7 +368,6 @@ static int vmw_fence_obj_init(struct vmw_fence_manage=
r *fman,
>                 goto out_unlock;
>         }
>         list_add_tail(&fence->head, &fman->fence_list);
> -       ++fman->num_fence_objects;
>
>  out_unlock:
>         spin_unlock(&fman->lock);
> @@ -403,7 +415,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fenc=
e_manager *fman,
>                                       u32 passed_seqno)
>  {
>         u32 goal_seqno;
> -       struct vmw_fence_obj *fence;
> +       struct vmw_fence_obj *fence, *next_fence;
>
>         if (likely(!fman->seqno_valid))
>                 return false;
> @@ -413,7 +425,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fenc=
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
> @@ -471,6 +483,7 @@ static void __vmw_fences_update(struct vmw_fence_mana=
ger *fman)
>  rerun:
>         list_for_each_entry_safe(fence, next_fence, &fman->fence_list, he=
ad) {
>                 if (seqno - fence->base.seqno < VMW_FENCE_WRAP) {
> +                       fence->base.ops =3D &vmw_fence_ops_removed;
>                         list_del_init(&fence->head);
>                         dma_fence_signal_locked(&fence->base);
>                         INIT_LIST_HEAD(&action_list);
> @@ -662,6 +675,7 @@ void vmw_fence_fifo_down(struct vmw_fence_manager *fm=
an)
>                                          VMW_FENCE_WAIT_TIMEOUT);
>
>                 if (unlikely(ret !=3D 0)) {
> +                       fence->base.ops =3D &vmw_fence_ops_removed;
>                         list_del_init(&fence->head);
>                         dma_fence_signal(&fence->base);
>                         INIT_LIST_HEAD(&action_list);
> --
> 2.40.1
>

Neat fix!
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
