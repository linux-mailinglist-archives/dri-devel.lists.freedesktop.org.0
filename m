Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C802644C40
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 20:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0EB10E06A;
	Tue,  6 Dec 2022 19:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79BE10E06A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 19:10:35 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3b48b139b46so162291967b3.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 11:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+J0ZUqO7Jp7SLFVHzut3hUjsAKyxp0egVuJAPmiYXM=;
 b=aCyVNzpuclA+yxyZz4GApZ0oApVjSus5g6JqkbMUL+aAlcm9HeqjlxgK46/pAYvPxR
 gZQZE3Cxq/jZ5w117MFdbGuziblQlUiJM24VGq7W9iAQ6HvxSYy2L3EaYJJ4uXp6h+30
 gyVajUDilJql/oXWb48fwFREXAJdDZupF5z38kgLM3rWubfhwg+WhNQb0dl040XnSvsT
 NIArDIMBOytMdYs/ZAwcJOjW0ITixBpA2hM4cat03RbZSmeyTEvBzRBMeNeA1oNXrNps
 dYbqq6AmPolarnAQGJNFOq8wViwE9zbhaLliqir3yt3mnO2+a8JOsYEtfmjKdli/HFaP
 SaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+J0ZUqO7Jp7SLFVHzut3hUjsAKyxp0egVuJAPmiYXM=;
 b=EMN0lNYOQMeFrxnEdRlN14PRNGN+2cf/sFYAQn7i7RVvIuKxeGtyz3gaKtIOk0YI10
 RTs81qeI/fa7GnpVvrYYPxv+IOXU/BOOJT0/Uos7o2pfXznsfZ4Ig5VstbDsXxcKSS/O
 HrgMuSZK0OCnLUsmlw0JgzO3qtqpKhnhdeyxVjHpfKYnXh+KQF2zzMw19uJHjHd2suQj
 Avco53ZJLEYCZdCQitH7BSlSDmn+8IaCzZVbSm5pupgoFDNa3cF8OW0P2lHAK9s/pRZO
 CJOuhZ70DQ+FiunUYHID0789FbbttHiu9wLJ72IOwBdM33g6HsWy1xhHZd4LYGLN3FtD
 U4iw==
X-Gm-Message-State: ANoB5pkRad8qEq9RlEfIp62l2oUc0s+Y5GDbv30YgvM+Wd7J8rg/Eusz
 dvU+BPy89BYP+X4q5XKgtd+wAnWoRVWNJnk3oXUYKw==
X-Google-Smtp-Source: AA0mqf4IPS2ZJCd63/o1JQRXY89D3quN1KGwiHru6rsIekyV38fiRMKrQ7ThDWila5z+S6ttTwXgROIttoEk7G0/IHA=
X-Received: by 2002:a81:1793:0:b0:3c4:1f67:a2a2 with SMTP id
 141-20020a811793000000b003c41f67a2a2mr42320324ywx.234.1670353834651; Tue, 06
 Dec 2022 11:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20221206151207.8801-1-christian.koenig@amd.com>
In-Reply-To: <20221206151207.8801-1-christian.koenig@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 6 Dec 2022 11:10:23 -0800
Message-ID: <CABdmKX2DFsOOzrpriN7+KK1tw7tbvJctj-qhOM4hyvx0xB6W_w@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix dma_buf_export init order
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
Cc: dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, quic_charante@quicinc.com,
 cuigaosheng1@huawei.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 6, 2022 at 7:12 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> The init order and resulting error handling in dma_buf_export
> was pretty messy.
>
> Subordinate objects like the file and the sysfs kernel objects
> were initializing and wiring itself up with the object in the
> wrong order resulting not only in complicating and partially
> incorrect error handling, but also in publishing only halve
> initialized DMA-buf objects.
>
> Clean this up thoughtfully by allocating the file independent
> of the DMA-buf object. Then allocate and initialize the DMA-buf
> object itself, before publishing it through sysfs. If everything
> works as expected the file is then connected with the DMA-buf
> object and publish it through debugfs.
>
> Also adds the missing dma_resv_fini() into the error handling.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf-sysfs-stats.c |  7 +--
>  drivers/dma-buf/dma-buf-sysfs-stats.h |  4 +-
>  drivers/dma-buf/dma-buf.c             | 65 +++++++++++++--------------
>  3 files changed, 34 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-=
buf-sysfs-stats.c
> index 2bba0babcb62..4b680e10c15a 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -168,14 +168,11 @@ void dma_buf_uninit_sysfs_statistics(void)
>         kset_unregister(dma_buf_stats_kset);
>  }
>
> -int dma_buf_stats_setup(struct dma_buf *dmabuf)
> +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
>  {
>         struct dma_buf_sysfs_entry *sysfs_entry;
>         int ret;
>
> -       if (!dmabuf || !dmabuf->file)
> -               return -EINVAL;
> -
>         if (!dmabuf->exp_name) {
>                 pr_err("exporter name must not be empty if stats needed\n=
");
>                 return -EINVAL;
> @@ -192,7 +189,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>
>         /* create the directory for buffer stats */
>         ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, =
NULL,
> -                                  "%lu", file_inode(dmabuf->file)->i_ino=
);
> +                                  "%lu", file_inode(file)->i_ino);
>         if (ret)
>                 goto err_sysfs_dmabuf;
>
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-=
buf-sysfs-stats.h
> index a49c6e2650cc..7a8a995b75ba 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> @@ -13,7 +13,7 @@
>  int dma_buf_init_sysfs_statistics(void);
>  void dma_buf_uninit_sysfs_statistics(void);
>
> -int dma_buf_stats_setup(struct dma_buf *dmabuf);
> +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
>
>  void dma_buf_stats_teardown(struct dma_buf *dmabuf);
>  #else
> @@ -25,7 +25,7 @@ static inline int dma_buf_init_sysfs_statistics(void)
>
>  static inline void dma_buf_uninit_sysfs_statistics(void) {}
>
> -static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
> +static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct fil=
e *file)
>  {
>         return 0;
>  }
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e6f36c014c4c..ea08049b70ae 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -614,19 +614,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
_export_info *exp_info)
>         size_t alloc_size =3D sizeof(struct dma_buf);
>         int ret;
>
> -       if (!exp_info->resv)
> -               alloc_size +=3D sizeof(struct dma_resv);
> -       else
> -               /* prevent &dma_buf[1] =3D=3D dma_buf->resv */
> -               alloc_size +=3D 1;
> -
> -       if (WARN_ON(!exp_info->priv
> -                         || !exp_info->ops
> -                         || !exp_info->ops->map_dma_buf
> -                         || !exp_info->ops->unmap_dma_buf
> -                         || !exp_info->ops->release)) {
> +       if (WARN_ON(!exp_info->priv || !exp_info->ops
> +                   || !exp_info->ops->map_dma_buf
> +                   || !exp_info->ops->unmap_dma_buf
> +                   || !exp_info->ops->release))
>                 return ERR_PTR(-EINVAL);
> -       }
>
>         if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
>                     (exp_info->ops->pin || exp_info->ops->unpin)))
> @@ -638,10 +630,21 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
_export_info *exp_info)
>         if (!try_module_get(exp_info->owner))
>                 return ERR_PTR(-ENOENT);
>
> +       file =3D dma_buf_getfile(exp_info->size, exp_info->flags);
> +       if (IS_ERR(file)) {
> +               ret =3D PTR_ERR(file);
> +               goto err_module;
> +       }
> +
> +       if (!exp_info->resv)
> +               alloc_size +=3D sizeof(struct dma_resv);
> +       else
> +               /* prevent &dma_buf[1] =3D=3D dma_buf->resv */
> +               alloc_size +=3D 1;
>         dmabuf =3D kzalloc(alloc_size, GFP_KERNEL);
>         if (!dmabuf) {
>                 ret =3D -ENOMEM;
> -               goto err_module;
> +               goto err_file;
>         }
>
>         dmabuf->priv =3D exp_info->priv;
> @@ -653,44 +656,36 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
_export_info *exp_info)
>         init_waitqueue_head(&dmabuf->poll);
>         dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
>         dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
> +       mutex_init(&dmabuf->lock);
> +       INIT_LIST_HEAD(&dmabuf->attachments);
>
>         if (!resv) {
> -               resv =3D (struct dma_resv *)&dmabuf[1];
> -               dma_resv_init(resv);
> +               dmabuf->resv =3D (struct dma_resv *)&dmabuf[1];
> +               dma_resv_init(dmabuf->resv);
> +       } else {
> +               dmabuf->resv =3D resv;
>         }

I like this, but I think it'd be even better to remove the local
struct dma_resv *resv variable since it's just a copy of
exp_info->resv and doesn't get modified any longer. More typing but
less to keep track of.

> -       dmabuf->resv =3D resv;
>
> -       file =3D dma_buf_getfile(dmabuf, exp_info->flags);
> -       if (IS_ERR(file)) {
> -               ret =3D PTR_ERR(file);
> +       ret =3D dma_buf_stats_setup(dmabuf, file);
> +       if (ret)
>                 goto err_dmabuf;
> -       }
>
> +       file->private_data =3D dmabuf;
> +       file->f_path.dentry->d_fsdata =3D dmabuf;
>         dmabuf->file =3D file;
>
> -       mutex_init(&dmabuf->lock);
> -       INIT_LIST_HEAD(&dmabuf->attachments);
> -
>         mutex_lock(&db_list.lock);
>         list_add(&dmabuf->list_node, &db_list.head);
>         mutex_unlock(&db_list.lock);

Unrelated: I'm kind of surprised we bother with this db_list when
CONFIG_DEBUG_FS isn't defined.




>
> -       ret =3D dma_buf_stats_setup(dmabuf);
> -       if (ret)
> -               goto err_sysfs;
> -
>         return dmabuf;
>
> -err_sysfs:
> -       /*
> -        * Set file->f_path.dentry->d_fsdata to NULL so that when
> -        * dma_buf_release() gets invoked by dentry_ops, it exits
> -        * early before calling the release() dma_buf op.
> -        */
> -       file->f_path.dentry->d_fsdata =3D NULL;
> -       fput(file);
>  err_dmabuf:
> +       if (!resv)
> +               dma_resv_fini(dmabuf->resv);
>         kfree(dmabuf);
> +err_file:
> +       fput(file);
>  err_module:
>         module_put(exp_info->owner);
>         return ERR_PTR(ret);
> --
> 2.34.1
>
