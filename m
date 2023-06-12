Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F379B72BBAF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359CA10E1D9;
	Mon, 12 Jun 2023 09:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A2D10E1D9;
 Mon, 12 Jun 2023 09:06:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30fc1c149bbso196634f8f.1; 
 Mon, 12 Jun 2023 02:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686560773; x=1689152773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NeP9jN0Nlnp5iwsfLoZbaAUysr23WuddsH1QoUDNjX4=;
 b=TMEEhLRTmHwFFs738bqyyrgzRrfwWEbN09Dd6/m7Tz+TBdXd4pGVH+pFJYlHbNtZJE
 NvGMKmg+3ZofhX4gq4yMSF4ItNAeLIEAj1cZvY/Gbl5S94fENv0STj9RNWgio6YnRpr2
 kDzpiAzYesFGveiA/nMi2y/IfSrfZ+szTd4+LrMBd56RsIc7NO+ji6iZ2z8awowLfHz8
 wtJo9drGTGl+bo8Q/i7gOpm48wbQ1MTcnHLn4T5cT5ASAq6GXJgX6LCV4kgkNpo8SCSy
 mos0V6nnuDa8Nx4dIayGPRg/+oKxOZcNqeL0uuF/nS5XSb2DxKmNgPBNva5KPuO4LlhM
 QNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686560773; x=1689152773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NeP9jN0Nlnp5iwsfLoZbaAUysr23WuddsH1QoUDNjX4=;
 b=HVfp5hKSZtsdYMJLjzcOqy/msUYH7t7j0i0gPjGadsflqQgnA9Qzc6KijJ+2GwNNLJ
 P1ZVMZEyQm8qyqogZdAwUiq9i/8E+KhXP7yGrNyh+hAg//VxQGXkDlsjw6zaDBrm2/IR
 Oz6e9Rp70lcmJMeKSrgPVIQ+JU9Wd/GvViq5USF3gve0U94vh48tq28twvYzs9sQbKS2
 rIzZYh7Uu/psuUR3Fik0stzPXPLQ2StTVwCS8NrDU0oUD/2lKzYI4qhAQ/IRCBRYfm0g
 OsB4DY9M0faeHgNoD2nQSTIfjV7FOJE/Yx4g4EGQNJavj/YUfwvbl0rVruukEhRv5sNH
 BgBw==
X-Gm-Message-State: AC+VfDzG1p/f5xmGRlDz2ONWeXo68imK1OHNEdH6QCGZN6njptEPVtyS
 v7WO+jr0cYPzE6AxNq3bU/b/IE7tE+QYDaYhQBo=
X-Google-Smtp-Source: ACHHUZ5UsC3c+8J1mnF5lhdzjD6NlKtuUfu/5lWwS7oH9yqReuoTydfhP4KZkRbn8rvoNh2iPWE/9CAX44OiNVWip7g=
X-Received: by 2002:a05:6000:1947:b0:30e:3db3:a1e8 with SMTP id
 e7-20020a056000194700b0030e3db3a1e8mr5615264wry.2.1686560772796; Mon, 12 Jun
 2023 02:06:12 -0700 (PDT)
MIME-Version: 1.0
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Date: Mon, 12 Jun 2023 18:06:01 +0900
Message-ID: <CANqewP1werjNPoyYUvqNctJvfxp5+AR-1urcm7SGCFFUk3Gqsg@mail.gmail.com>
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: arunpravin.paneerselvam@amd.com, felix.kuehling@amd.com,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, thomas_os@shipmail.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

> On May 4, 2023, at 20:51, Christian K=C3=B6nig <ckoenig.leichtzumerken@gm=
ail.com> wrote:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 08eced097bd8..9e751f5d4aa7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -882,25 +840,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_pa=
rser *p,
>
> mutex_lock(&p->bo_list->bo_list_mutex);
>
> - /* One for TTM and one for the CS job */
> - amdgpu_bo_list_for_each_entry(e, p->bo_list)
> - e->tv.num_shared =3D 2;
> -
> - amdgpu_bo_list_get_list(p->bo_list, &p->validated);
> -
> - INIT_LIST_HEAD(&duplicates);
> - amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd);
> -
> - if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
> - list_add(&p->uf_entry.tv.head, &p->validated);
> -
> /* Get userptr backing pages. If pages are updated after registered
> * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
> * amdgpu_ttm_backend_bind() to flush and invalidate new pages
> */
> amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
> - struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(e->tv.bo);
> bool userpage_invalidated =3D false;
> + struct amdgpu_bo *bo =3D e->bo;
> int i;
>
> e->user_pages =3D kvmalloc_array(bo->tbo.ttm->num_pages,
> @@ -1307,20 +1281,22 @@ static int amdgpu_cs_submit(struct amdgpu_cs_pars=
er *p,
> }
>
> p->fence =3D dma_fence_get(&leader->base.s_fence->finished);
> - list_for_each_entry(e, &p->validated, tv.head) {
> + drm_exec_for_each_locked_object(&p->exec, index, gobj) {
> +
> + ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
>
> /* Everybody except for the gang leader uses READ */
> for (i =3D 0; i < p->gang_size; ++i) {
> if (p->jobs[i] =3D=3D leader)
> continue;
>
> - dma_resv_add_fence(e->tv.bo->base.resv,
> + dma_resv_add_fence(gobj->resv,
>   &p->jobs[i]->base.s_fence->finished,
>   DMA_RESV_USAGE_READ);
> }
>
> - /* The gang leader is remembered as writer */
> - e->tv.num_shared =3D 0;
> + /* The gang leader as remembered as writer */
> + dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
> }
>
> seq =3D amdgpu_ctx_add_fence(p->ctx, p->entities[p->gang_leader_idx],

I believe this changes the usage of VM PDs from READ to WRITE.
Maybe we could check if a BO is PD and supply DMA_RESV_USAGE_READ in that c=
ase?

Tatsuyuki
