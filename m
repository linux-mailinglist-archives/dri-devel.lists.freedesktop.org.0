Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB084648CA9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 04:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5597310E063;
	Sat, 10 Dec 2022 03:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B35610E063
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Dec 2022 03:14:00 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id i186so7682861ybc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 19:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puhhx/GU0T3NXLqqWXTCjhDEWYCFqFbhOu3JuJgDFA8=;
 b=yfh1LyKtfhDu64mVcwcXgiIaQ5MbnEOQVGQ2P9Cj+UoKmDlPiL+U86cXvF+Kj+DERs
 52Nfb7zFjBJ8fGsZ5HjU/pTZrxcPkOEUj4KVTG7wXh7cvAHqvb/YTuSQNOsLnawQiq3R
 Dq4nTskBAaD+NVI9aeMRpOBNKmO5bfztYo2CqeFEA9OgonaqZW14KZA7hZ08bLkA8ERs
 3YEVrmxIEX8D+6dyJhRY3GP83ZQYXUnNy6ULOrMtyozoi62kP6DeH2lDwyl89qdSo/Mm
 ll2boaxXbqG2Pdi2RVYt3vz0CD1BIaxH0TJkRCTdBqKmSoh065AnmsQGtWiSq6gopVZw
 XR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puhhx/GU0T3NXLqqWXTCjhDEWYCFqFbhOu3JuJgDFA8=;
 b=L1v+fMvvulhv5pILe7Nk4Jw+4yW8Ks9NwKmlibL4VkVji/78ZhnoMSkOKarpSD6omA
 CMT/ooODg2KgdAAlQRPqvJL/FM09/af+/Gl64MbOZZOdbOFBw07IQNQe84M5gWBmseNo
 g1NC6A6v0mmShUL6idxvC6HwWk/gpwlrcjbOrA9bS6L0XJU6OTBKqKKagcCKuVLAhips
 uMy6NwAf5S1oGt9WJWvF3+yE9unwmUNXIXU0cbizEkmDoYwlLIYa55WveNL0pd+B6/PO
 Xmnmqld9igV9isNx/YjyruNI62SAJpVETwwm187B+Bcfkv9bjx79j/sf48FuepVX9mVH
 y6Uw==
X-Gm-Message-State: ANoB5pmmRMZt8yN3amxoN7uxCeoe+mmBUiXTQR3c276QVuFYvkQlRZno
 1TI7NjC10qBa5xBiVeoFvl/raiYfY3GKZjoDjjlP9A==
X-Google-Smtp-Source: AA0mqf5srgU9qKqc2DjPmJLutxXhtzqQBJLJ83A+5w7VvMQf5WZLojIw7E4CzRwyVZDbkaNev92+yPrLGU9eVzr2f+k=
X-Received: by 2002:a25:7709:0:b0:6fb:13c5:d33f with SMTP id
 s9-20020a257709000000b006fb13c5d33fmr34469086ybc.157.1670642039332; Fri, 09
 Dec 2022 19:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20221209071535.933698-1-christian.koenig@amd.com>
In-Reply-To: <20221209071535.933698-1-christian.koenig@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Sat, 10 Dec 2022 08:43:47 +0530
Message-ID: <CAO_48GEQmsiJ96iu16UKg-QWJDNK=y-QTcDOKTMc3CMt+S993g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix dma_buf_export init order v2
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
Cc: linaro-mm-sig@lists.linaro.org, quic_charante@quicinc.com,
 cuigaosheng1@huawei.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Fri, 9 Dec 2022 at 12:45, Christian K=C3=B6nig
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
> v2: add some missing changes to dma_bug_getfile() and a missing NULL
>     check in dma_buf_file_release()
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thank you for this nice cleanup.
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Best,
Sumit.
> ---
>  drivers/dma-buf/dma-buf-sysfs-stats.c |  7 +--
>  drivers/dma-buf/dma-buf-sysfs-stats.h |  4 +-
>  drivers/dma-buf/dma-buf.c             | 84 +++++++++++++--------------
>  3 files changed, 43 insertions(+), 52 deletions(-)
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
> index e6f36c014c4c..eb6b59363c4f 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -95,10 +95,11 @@ static int dma_buf_file_release(struct inode *inode, =
struct file *file)
>                 return -EINVAL;
>
>         dmabuf =3D file->private_data;
> -
> -       mutex_lock(&db_list.lock);
> -       list_del(&dmabuf->list_node);
> -       mutex_unlock(&db_list.lock);
> +       if (dmabuf) {
> +               mutex_lock(&db_list.lock);
> +               list_del(&dmabuf->list_node);
> +               mutex_unlock(&db_list.lock);
> +       }
>
>         return 0;
>  }
> @@ -523,17 +524,17 @@ static inline int is_dma_buf_file(struct file *file=
)
>         return file->f_op =3D=3D &dma_buf_fops;
>  }
>
> -static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
> +static struct file *dma_buf_getfile(size_t size, int flags)
>  {
>         static atomic64_t dmabuf_inode =3D ATOMIC64_INIT(0);
> -       struct file *file;
>         struct inode *inode =3D alloc_anon_inode(dma_buf_mnt->mnt_sb);
> +       struct file *file;
>
>         if (IS_ERR(inode))
>                 return ERR_CAST(inode);
>
> -       inode->i_size =3D dmabuf->size;
> -       inode_set_bytes(inode, dmabuf->size);
> +       inode->i_size =3D size;
> +       inode_set_bytes(inode, size);
>
>         /*
>          * The ->i_ino acquired from get_next_ino() is not unique thus
> @@ -547,8 +548,6 @@ static struct file *dma_buf_getfile(struct dma_buf *d=
mabuf, int flags)
>                                  flags, &dma_buf_fops);
>         if (IS_ERR(file))
>                 goto err_alloc_file;
> -       file->private_data =3D dmabuf;
> -       file->f_path.dentry->d_fsdata =3D dmabuf;
>
>         return file;
>
> @@ -614,19 +613,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
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
> @@ -638,10 +629,21 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
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
> @@ -653,44 +655,36 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
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


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
