Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA0296BC8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 11:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B356E0A0;
	Fri, 23 Oct 2020 09:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7192D6E0A0;
 Fri, 23 Oct 2020 09:08:59 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id n18so478950vsl.2;
 Fri, 23 Oct 2020 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wem+NylVu/3ov/fkXS57osU2iNI0XmG3B8ARt9wz/5A=;
 b=R6KdPQnObho4Td4VWsSPL63GF2j7KplJv3T018SPGs21Azl4R++Cxwt3TAAmXY+MKJ
 KDE/ZM3PkRGKdnHjWQv1VUJJPTw0xihDNdnPPpH5bgF5xHcKNgrTBYap5plzdVH8x5JI
 gcBy3LlTw/jmFmWIVC9C7y9etu3W3JCsIbDwQ7Y71QPBROOmiZlgXXE2AgEbQW8nMHjA
 CnROv6l9tsnplQs5IYCphtXH5yXki+Fv15FetSAx8nOfvp+eVUQ3bZ4gKgRicEwbz60f
 L6CaH0phF3FmtqGWVBImj/SLLr55B1mEPAR5fecuRZONO1xAc9R2P3g8XWRUWj2wtq52
 yg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wem+NylVu/3ov/fkXS57osU2iNI0XmG3B8ARt9wz/5A=;
 b=WX45zmjdc4snPBiLo3fkhvYMu9W4x4EeQYI9be7hhb1OXsZaSqfdIj59Qn8BVS2nBr
 Lq3rK0llt1G1P04Y8rLbY1wLcc6gAVaQdJOFlGvy6cBif68oe+eWVr6no5451N2J54e4
 NImSRq9bGwgveZQR8pHmbW4oRzVIJDRKbuvv72UDHETrB/ytp7Y98p8w3THoq/z2fDGd
 fO/WYguMcLc32vu1BstqZ/TtrEfMSJtVJjLUh9YDtDUTwj1tA6hknp66cWwLoiN9Tn2R
 ANHtwDoWknfsCZPffyY+znkAgV+jJ6po3Zpyeyx4eepXELDoMoqeSLb4eWwkKRmGnP/q
 /vPA==
X-Gm-Message-State: AOAM532XlQYZdbOuIwFWy3D07pcJh5+pLsheBIJ1SdgcwNRkHOBRJJ2a
 S8xudy8euCzD4fEmdaXU22DyoKyaR6oEr6V98N0=
X-Google-Smtp-Source: ABdhPJy38Q095ZgB/JArW7mlS/RlJXZzyXODxGBRzGe7+80ka89drMo7RnqzfKBzNLpoLvGP5AoC1EUoK7cpD/gg5xc=
X-Received: by 2002:a05:6102:31b5:: with SMTP id
 d21mr593072vsh.19.1603444138226; 
 Fri, 23 Oct 2020 02:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201019204636.139997-1-robdclark@gmail.com>
 <20201019204636.139997-8-robdclark@gmail.com>
In-Reply-To: <20201019204636.139997-8-robdclark@gmail.com>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Fri, 23 Oct 2020 11:08:46 +0200
Message-ID: <CAOeoa-dmWmsd86ZT6KVQbcpKHJ-1TNz-Tcx0nJFUXbbK+Ds3mA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 07/23] drm/msm/submit: Move copy_from_user
 ahead of locking bos
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 10:45 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We cannot switch to using obj->resv for locking without first moving all
> the copy_from_user() ahead of submit_lock_objects().  Otherwise in the
> mm fault path we aquire mm->mmap_sem before obj lock, but in the submit
> path the order is reversed.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h        |   3 +
>  drivers/gpu/drm/msm/msm_gem_submit.c | 121 ++++++++++++++++-----------
>  2 files changed, 76 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index c5232b8da794..0b7dda312992 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -240,7 +240,10 @@ struct msm_gem_submit {
>                 uint32_t type;
>                 uint32_t size;  /* in dwords */
>                 uint64_t iova;
> +               uint32_t offset;/* in dwords */
>                 uint32_t idx;   /* cmdstream buffer idx in bos[] */
> +               uint32_t nr_relocs;
> +               struct drm_msm_gem_submit_reloc *relocs;
>         } *cmd;  /* array of size nr_cmds */
>         struct {
>                 uint32_t flags;
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index aa5c60a7132d..002130d826aa 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -62,11 +62,16 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>
>  void msm_gem_submit_free(struct msm_gem_submit *submit)
>  {
> +       unsigned i;
> +
>         dma_fence_put(submit->fence);
>         list_del(&submit->node);
>         put_pid(submit->pid);
>         msm_submitqueue_put(submit->queue);
>
> +       for (i = 0; i < submit->nr_cmds; i++)
> +               kfree(submit->cmd[i].relocs);
> +
>         kfree(submit);
>  }
>
> @@ -150,6 +155,60 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
>         return ret;
>  }
>
> +static int submit_lookup_cmds(struct msm_gem_submit *submit,
> +               struct drm_msm_gem_submit *args, struct drm_file *file)
> +{
> +       unsigned i, sz;
> +       int ret = 0;
> +
> +       for (i = 0; i < args->nr_cmds; i++) {
> +               struct drm_msm_gem_submit_cmd submit_cmd;
> +               void __user *userptr =
> +                       u64_to_user_ptr(args->cmds + (i * sizeof(submit_cmd)));
> +
> +               ret = copy_from_user(&submit_cmd, userptr, sizeof(submit_cmd));
> +               if (ret) {
> +                       ret = -EFAULT;
> +                       goto out;
> +               }
> +
> +               /* validate input from userspace: */
> +               switch (submit_cmd.type) {
> +               case MSM_SUBMIT_CMD_BUF:
> +               case MSM_SUBMIT_CMD_IB_TARGET_BUF:
> +               case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> +                       break;
> +               default:
> +                       DRM_ERROR("invalid type: %08x\n", submit_cmd.type);
> +                       return -EINVAL;
> +               }
> +
> +               if (submit_cmd.size % 4) {
> +                       DRM_ERROR("non-aligned cmdstream buffer size: %u\n",
> +                                       submit_cmd.size);
> +                       ret = -EINVAL;
> +                       goto out;
> +               }
> +
> +               submit->cmd[i].type = submit_cmd.type;
> +               submit->cmd[i].size = submit_cmd.size / 4;
> +               submit->cmd[i].offset = submit_cmd.submit_offset / 4;
> +               submit->cmd[i].idx  = submit_cmd.submit_idx;
> +               submit->cmd[i].nr_relocs = submit_cmd.nr_relocs;
> +
> +               sz = sizeof(struct drm_msm_gem_submit_reloc) * submit_cmd.nr_relocs;
> +               submit->cmd[i].relocs = kmalloc(sz, GFP_KERNEL);

kmalloc_array() or check_mul_overflow() here for the integer overflow check.

> +               ret = copy_from_user(submit->cmd[i].relocs, userptr, sz);
> +               if (ret) {
> +                       ret = -EFAULT;
> +                       goto out;
> +               }
> +       }
> +
> +out:
> +       return ret;
> +}
> +
>  static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
>                 int i, bool backoff)
>  {
> @@ -301,7 +360,7 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
>
>  /* process the reloc's and patch up the cmdstream as needed: */
>  static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *obj,
> -               uint32_t offset, uint32_t nr_relocs, uint64_t relocs)
> +               uint32_t offset, uint32_t nr_relocs, struct drm_msm_gem_submit_reloc *relocs)
>  {
>         uint32_t i, last_offset = 0;
>         uint32_t *ptr;
> @@ -327,18 +386,11 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
>         }
>
>         for (i = 0; i < nr_relocs; i++) {
> -               struct drm_msm_gem_submit_reloc submit_reloc;
> -               void __user *userptr =
> -                       u64_to_user_ptr(relocs + (i * sizeof(submit_reloc)));
> +               struct drm_msm_gem_submit_reloc submit_reloc = relocs[i];
>                 uint32_t off;
>                 uint64_t iova;
>                 bool valid;
>
> -               if (copy_from_user(&submit_reloc, userptr, sizeof(submit_reloc))) {
> -                       ret = -EFAULT;
> -                       goto out;
> -               }
> -
>                 if (submit_reloc.submit_offset % 4) {
>                         DRM_ERROR("non-aligned reloc offset: %u\n",
>                                         submit_reloc.submit_offset);
> @@ -694,6 +746,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         if (ret)
>                 goto out;
>
> +       ret = submit_lookup_cmds(submit, args, file);
> +       if (ret)
> +               goto out;
> +
>         /* copy_*_user while holding a ww ticket upsets lockdep */
>         ww_acquire_init(&submit->ticket, &reservation_ww_class);
>         has_ww_ticket = true;
> @@ -710,60 +766,29 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>                 goto out;
>
>         for (i = 0; i < args->nr_cmds; i++) {
> -               struct drm_msm_gem_submit_cmd submit_cmd;
> -               void __user *userptr =
> -                       u64_to_user_ptr(args->cmds + (i * sizeof(submit_cmd)));
>                 struct msm_gem_object *msm_obj;
>                 uint64_t iova;
>
> -               ret = copy_from_user(&submit_cmd, userptr, sizeof(submit_cmd));
> -               if (ret) {
> -                       ret = -EFAULT;
> -                       goto out;
> -               }
> -
> -               /* validate input from userspace: */
> -               switch (submit_cmd.type) {
> -               case MSM_SUBMIT_CMD_BUF:
> -               case MSM_SUBMIT_CMD_IB_TARGET_BUF:
> -               case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -                       break;
> -               default:
> -                       DRM_ERROR("invalid type: %08x\n", submit_cmd.type);
> -                       ret = -EINVAL;
> -                       goto out;
> -               }
> -
> -               ret = submit_bo(submit, submit_cmd.submit_idx,
> +               ret = submit_bo(submit, submit->cmd[i].idx,
>                                 &msm_obj, &iova, NULL);
>                 if (ret)
>                         goto out;
>
> -               if (submit_cmd.size % 4) {
> -                       DRM_ERROR("non-aligned cmdstream buffer size: %u\n",
> -                                       submit_cmd.size);
> +               if (!submit->cmd[i].size ||
> +                       ((submit->cmd[i].size + submit->cmd[i].offset) >
> +                               msm_obj->base.size / 4)) {
> +                       DRM_ERROR("invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
>                         ret = -EINVAL;
>                         goto out;
>                 }
>
> -               if (!submit_cmd.size ||
> -                       ((submit_cmd.size + submit_cmd.submit_offset) >
> -                               msm_obj->base.size)) {
> -                       DRM_ERROR("invalid cmdstream size: %u\n", submit_cmd.size);
> -                       ret = -EINVAL;
> -                       goto out;
> -               }
> -
> -               submit->cmd[i].type = submit_cmd.type;
> -               submit->cmd[i].size = submit_cmd.size / 4;
> -               submit->cmd[i].iova = iova + submit_cmd.submit_offset;
> -               submit->cmd[i].idx  = submit_cmd.submit_idx;
> +               submit->cmd[i].iova = iova + (submit->cmd[i].offset * 4);
>
>                 if (submit->valid)
>                         continue;
>
> -               ret = submit_reloc(submit, msm_obj, submit_cmd.submit_offset,
> -                               submit_cmd.nr_relocs, submit_cmd.relocs);
> +               ret = submit_reloc(submit, msm_obj, submit->cmd[i].offset * 4,
> +                               submit->cmd[i].nr_relocs, submit->cmd[i].relocs);
>                 if (ret)
>                         goto out;
>         }
> --
> 2.26.2
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
