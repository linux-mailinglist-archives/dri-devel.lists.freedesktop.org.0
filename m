Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63665C8C1A0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B77610E6F4;
	Wed, 26 Nov 2025 21:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i8QYdN1p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CA310E6F4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:48:21 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-78ac9f30833so2485167b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764193701; x=1764798501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZiKD3yP4gMMWJs0gOMbH81ZH3yNQ6RyuCV7qyF/1hZ4=;
 b=i8QYdN1p87uoiOyvke6k68d+OHanyx/+sSBCxL59+A8QXNAn56TA+pHjEIwI1T4Tby
 bZqs0pr1aDrtbUPc03TrljrqUtA4rshaTxwMrqdyANx8FUHWuazjqFAGlIuFRorV0MTU
 itCPlpPzvojalehB8RBlVcI9yKJ5QVHVMxQN1A/BX1lNPfCzEF4Bau94g4MJgR++DvgG
 re1g7oHgNF3BsMa0EujcvEt78mQDqvEeMovbQ/zN1cMIjW7ztMb/tzgvnMyBjGbtogNB
 t19vEssSIcjqP/Z8jolablo8NE+krOK7/vQIek14eXU8ts3gfkw0EkizarNc51E37Czu
 wV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764193701; x=1764798501;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZiKD3yP4gMMWJs0gOMbH81ZH3yNQ6RyuCV7qyF/1hZ4=;
 b=BqTfeg+Rn7HZiE5a/BDXR9anNx5gc8gunLkv2CbQvmmOfpo7ENs8jqTh7KgsXoHAAK
 SrZQosnUnuuMLJQRYZwGQ2HwnOa6Z/w/1paTZKuiLtRXrDWpET8zncmU+XPRWVQGtj32
 fiM9WJNY78v9KX/M2CeWy2im1pAsJ96Qmaa0ZFG0bEJFN+h9eD60aHeoWS3eoMF9KtUV
 OxM+6bZlRtR+1UIeZ0VeCspUH538Vju2KTsdDpT8bpOneBsCS37XRwN2rtptqCjgygR/
 GNXcm/Lz2krpEqxbqbRhUyol15ZhTenPlE0ZAe5Adc0Ko/M4FhvnS7BbUm5Z+ChPlNrj
 w45A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmHov2DgpLzbTX6tSGWzIhGPog6t6ksMRD7gFrwG47Y2PljLB/u7Kfq+gWw1GIFiB07Agz0WasIaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE/tXmlh9XhAwluaGDnS69dLniXll7HoUU8zagOP6z2sfuQF1f
 +ccCYo6HiCRMvy1GEHlp4+rL1npkX2XkiIlZosJ+trEOHEhs3ACH6NQkxvSjnUxWXVtrR5jEGec
 YcXW659nOY5U/zy2xAknWDxvw0hej1S0=
X-Gm-Gg: ASbGncssd+CBpenS2ovPnpuoY2yCy2knm0GQQfcz3S9YdrSa6g/6fMeWfSc3g8L8J3U
 8Qz3CNDCdy05lrfGqVoEOUj70SpSrTj6ylqj3oe09ZcTq6MgFUbo5bn/P3LjoFBg+/tXM7rsJmx
 Eu/r6U6EZAovSI1CQeA7L5DYKj2TnzaYBO8nmvNE/puF66c0hbnioEj9L1zamHX8UUjOiE6JkIE
 2NKkORd971Kj0zhDMtenOgn5P3qSphC6X4Vo2loBrk0RHvxHXmyDK5Xl25tStN0NVE/SesZgouV
 7WrzUJ+mZZsjFS6+ylZKdA7+W0Ww
X-Google-Smtp-Source: AGHT+IGL7dTNOlPin97O7akmgo+CjaJOs+UfUQArRq2FWay5vokPwi72On55xXQ0la/a9F0x38UdXB+ZRB5NejoSSIc=
X-Received: by 2002:a05:690c:368a:b0:785:caab:e660 with SMTP id
 00721157ae682-78a8b4979dcmr179183647b3.26.1764193700600; Wed, 26 Nov 2025
 13:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
 <20251112115142.1270931-4-boris.brezillon@collabora.com>
In-Reply-To: <20251112115142.1270931-4-boris.brezillon@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Nov 2025 13:48:09 -0800
X-Gm-Features: AWmQ_bky68uGBO5y1FPQP75y9b-e4ZC5f35M2lDIKiH2m24jS9H9smZaQGIC6oY
Message-ID: <CAPaKu7R1Zzu5Ojm+mShtu540bLnuz4qi5it6Yxwqq2tH+629NQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/panthor: Fix the group priority rotation logic
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>, 
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
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

On Wed, Nov 12, 2025 at 3:52=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> When rotating group priorities, we want the group with the
> highest priority to go back to the end of the queue, and all
> other active groups to get their priority bumped, otherwise
> some groups will never get a chance to run with the highest
> priority. This implies moving the rotation itself to
> tick_work(), and only dealing with old group ordering in
> tick_ctx_insert_old_group().
>
> v2:
> - Add R-b
> - Fix the commit message
>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 47 +++++++++++++++----------
>  1 file changed, 29 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 94514d464e64..f08a05d36fc0 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1960,31 +1960,22 @@ tick_ctx_pick_groups_from_list(const struct panth=
or_scheduler *sched,
>  static void
>  tick_ctx_insert_old_group(struct panthor_scheduler *sched,
>                           struct panthor_sched_tick_ctx *ctx,
> -                         struct panthor_group *group,
> -                         bool full_tick)
> +                         struct panthor_group *group)
>  {
>         struct panthor_csg_slot *csg_slot =3D &sched->csg_slots[group->cs=
g_id];
>         struct panthor_group *other_group;
>
> -       if (!full_tick) {
> -               list_add_tail(&group->run_node, &ctx->old_groups[group->p=
riority]);
> -               return;
> -       }
> -
> -       /* Rotate to make sure groups with lower CSG slot
> -        * priorities have a chance to get a higher CSG slot
> -        * priority next time they get picked. This priority
> -        * has an impact on resource request ordering, so it's
> -        * important to make sure we don't let one group starve
> -        * all other groups with the same group priority.
> -        */
> +       /* Class groups in descending priority order so we can easily rot=
ate. */
>         list_for_each_entry(other_group,
>                             &ctx->old_groups[csg_slot->group->priority],
>                             run_node) {
>                 struct panthor_csg_slot *other_csg_slot =3D &sched->csg_s=
lots[other_group->csg_id];
>
> -               if (other_csg_slot->priority > csg_slot->priority) {
> -                       list_add_tail(&csg_slot->group->run_node, &other_=
group->run_node);
> +               /* Our group has a higher prio than the one we're testing=
 against,
> +                * place it just before.
> +                */
> +               if (csg_slot->priority > other_csg_slot->priority) {
> +                       list_add_tail(&group->run_node, &other_group->run=
_node);
>                         return;
>                 }
>         }
> @@ -2033,7 +2024,7 @@ tick_ctx_init(struct panthor_scheduler *sched,
>                                 group->fatal_queues |=3D GENMASK(group->q=
ueue_count - 1, 0);
>                 }
>
> -               tick_ctx_insert_old_group(sched, ctx, group, full_tick);
> +               tick_ctx_insert_old_group(sched, ctx, group);
This drops the only user of full_tick. We can omit the parameter from
tick_ctx_init.
>                 csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, i,
>                                         csg_iface->output->ack ^ CSG_STAT=
US_UPDATE,
>                                         CSG_STATUS_UPDATE);
> @@ -2399,9 +2390,29 @@ static void tick_work(struct work_struct *work)
>         for (prio =3D PANTHOR_CSG_PRIORITY_COUNT - 1;
>              prio >=3D 0 && !tick_ctx_is_full(sched, &ctx);
>              prio--) {
> +               struct panthor_group *old_highest_prio_group =3D
> +                       list_first_entry_or_null(&ctx.old_groups[prio],
> +                                                struct panthor_group, ru=
n_node);
> +
> +               /* Pull out the group with the highest prio for rotation.=
 */
> +               if (old_highest_prio_group)
> +                       list_del(&old_highest_prio_group->run_node);
> +
> +               /* Re-insert old active groups so they get a chance to ru=
n with higher prio. */
> +               tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_grou=
ps[prio], true, true);
> +
> +               /* Fill the remaining slots with runnable groups. */
>                 tick_ctx_pick_groups_from_list(sched, &ctx, &sched->group=
s.runnable[prio],
>                                                true, false);
> -               tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_grou=
ps[prio], true, true);
> +
> +               /* Re-insert the old group with the highest prio, and giv=
e it a chance to be
> +                * scheduled again (but with a lower prio) if there's roo=
m left.
> +                */
> +               if (old_highest_prio_group) {
> +                       list_add_tail(&old_highest_prio_group->run_node, =
&ctx.old_groups[prio]);
> +                       tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.=
old_groups[prio],
> +                                                      true, true);
> +               }
>         }
>
>         /* If we have free CSG slots left, pick idle groups */
> --
> 2.51.1
>
