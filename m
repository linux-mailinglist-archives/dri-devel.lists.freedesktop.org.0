Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5A65EB7D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C611B10E724;
	Thu,  5 Jan 2023 13:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18D910E726
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:00:14 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so1230509wmk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hzorT7PWxGOJ2m5OeY0o02FLMEQzdF4Uv+hPiv+hTlY=;
 b=iN7/mxumzGeGu6S7A5svBbKMb1w8V5UkCspfxz88VQSuNN/Dx+Mcx3P1y8LXvB/x/F
 Mc8QYzFC+c83IQWFnBHw8fv6wWn4piVWzomlw204mbx4NnYTqsZIusn/jE2cJwr7e9kO
 htKHb5vtXSTJLROzlXYwRsT8kLLAOPKM6y4u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hzorT7PWxGOJ2m5OeY0o02FLMEQzdF4Uv+hPiv+hTlY=;
 b=AC76PAh/DwnHFiQTgrrqX3TLNhJrFnqLl0d+exdX0lG9ZSAIPiSDiiZNzZZ5MQgg2N
 BcwanfuCVZ/N6HBeeH9b9INUTq69iZDU6SJA3UmWrTtnCvRNSZ5cZPpjmMRgXKng89K/
 anvtIaE7uuTiRRc1LuX5dEtLdgKid/nGqxXKEOTa9Vpk9UA4xbxJjtCs1uTl9mHr7i4u
 4zSkDRqFvmZgAFLqdTd6TkyE+SsvVWb+UVNytFDOaQdEP6CwqjsN5d1dcIvFNCbkI1jA
 BwJk5KdqyqHsb2ZstTg9Txm4Bkksf9eK15lwVw4m64cbJZWYlrPWi9gnAM+bc7PgCQOL
 pXiQ==
X-Gm-Message-State: AFqh2kqg8vO3Q8fY+9qF5ekdoA6ruz09mcDTVkxXInADr6y/wIKwvhQf
 gelUjzdHBA5Wdn2g31PIV05X6w==
X-Google-Smtp-Source: AMrXdXs3ssTahaCBzBQg8Q7qRFXeear3J9IbNNtQefbUtAXYN435uMV3d6KUmY/EKDUnOgQ38LJzTw==
X-Received: by 2002:a05:600c:21c1:b0:3d3:45c6:b641 with SMTP id
 x1-20020a05600c21c100b003d345c6b641mr37205922wmj.22.1672923613186; 
 Thu, 05 Jan 2023 05:00:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003d96efd09b7sm2807655wmp.19.2023.01.05.05.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:00:12 -0800 (PST)
Date: Thu, 5 Jan 2023 14:00:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: fix dma_buf_export init
 order v2
Message-ID: <Y7bJ2kTYbl30M67f@phenom.ffwll.local>
References: <20221209071535.933698-1-christian.koenig@amd.com>
 <CAO_48GEQmsiJ96iu16UKg-QWJDNK=y-QTcDOKTMc3CMt+S993g@mail.gmail.com>
 <Y5ixrgOsWBTzonq9@phenom.ffwll.local>
 <ead9f3f0-a9fd-4889-d698-0c77c89bcbc3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ead9f3f0-a9fd-4889-d698-0c77c89bcbc3@gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: dri-devel@lists.freedesktop.org, cuigaosheng1@huawei.com,
 linaro-mm-sig@lists.linaro.org, quic_charante@quicinc.com,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 07:17:41PM +0100, Christian König wrote:
> Am 13.12.22 um 18:09 schrieb Daniel Vetter:
> > On Sat, Dec 10, 2022 at 08:43:47AM +0530, Sumit Semwal wrote:
> > > Hi Christian,
> > > 
> > > On Fri, 9 Dec 2022 at 12:45, Christian König
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > The init order and resulting error handling in dma_buf_export
> > > > was pretty messy.
> > > > 
> > > > Subordinate objects like the file and the sysfs kernel objects
> > > > were initializing and wiring itself up with the object in the
> > > > wrong order resulting not only in complicating and partially
> > > > incorrect error handling, but also in publishing only halve
> > > > initialized DMA-buf objects.
> > > > 
> > > > Clean this up thoughtfully by allocating the file independent
> > > > of the DMA-buf object. Then allocate and initialize the DMA-buf
> > > > object itself, before publishing it through sysfs. If everything
> > > > works as expected the file is then connected with the DMA-buf
> > > > object and publish it through debugfs.
> > > > 
> > > > Also adds the missing dma_resv_fini() into the error handling.
> > > > 
> > > > v2: add some missing changes to dma_bug_getfile() and a missing NULL
> > > >      check in dma_buf_file_release()
> > > > 
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > Thank you for this nice cleanup.
> > > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > For reasons that aren't clear to me this ended up in drm-misc-fixes, but
> > doesn't have a Fixes: or cc: stable tag, and because it missed the merge
> > window it now wont go into any stable releases.
> 
> Mhm, crap I was hoping I would get that in before the merge window.

Well even then, if it's for -fixes it should have had cc: stable. Or
neither of those things.

> Should I push it to drm-misc-next  with a CC: stable tag then?
> 
> It's more of a theoretical issues if we run into problems during sysfs
> creation.

Nah, it's really not a practical bugfix imo, so neither -fixes nor stable
material imo.

> > So either this isn't a fix and should have landed in drm-misc-next or so,
> > or it was, and then it should have had Fixes: line (and cc: stable most
> > likely too).
> > 
> > I spotted this becaue it caused a conflict in drm-tip that was left behind
> > unresovled. I fixed it up.
> 
> Well then there is something wrong with drm-tip, cause I've fixed that up
> before.

This can happen if you have a massively mismatched git version compared to
everyone else. git tends to change it's rr format occasionally :-/ Modern
distro instead of lts works best so everyone has roughly the same git.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > Tsk :-)
> > -Daniel
> > 
> > > Best,
> > > Sumit.
> > > > ---
> > > >   drivers/dma-buf/dma-buf-sysfs-stats.c |  7 +--
> > > >   drivers/dma-buf/dma-buf-sysfs-stats.h |  4 +-
> > > >   drivers/dma-buf/dma-buf.c             | 84 +++++++++++++--------------
> > > >   3 files changed, 43 insertions(+), 52 deletions(-)
> > > > 
> > > > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > index 2bba0babcb62..4b680e10c15a 100644
> > > > --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > @@ -168,14 +168,11 @@ void dma_buf_uninit_sysfs_statistics(void)
> > > >          kset_unregister(dma_buf_stats_kset);
> > > >   }
> > > > 
> > > > -int dma_buf_stats_setup(struct dma_buf *dmabuf)
> > > > +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
> > > >   {
> > > >          struct dma_buf_sysfs_entry *sysfs_entry;
> > > >          int ret;
> > > > 
> > > > -       if (!dmabuf || !dmabuf->file)
> > > > -               return -EINVAL;
> > > > -
> > > >          if (!dmabuf->exp_name) {
> > > >                  pr_err("exporter name must not be empty if stats needed\n");
> > > >                  return -EINVAL;
> > > > @@ -192,7 +189,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
> > > > 
> > > >          /* create the directory for buffer stats */
> > > >          ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
> > > > -                                  "%lu", file_inode(dmabuf->file)->i_ino);
> > > > +                                  "%lu", file_inode(file)->i_ino);
> > > >          if (ret)
> > > >                  goto err_sysfs_dmabuf;
> > > > 
> > > > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
> > > > index a49c6e2650cc..7a8a995b75ba 100644
> > > > --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> > > > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> > > > @@ -13,7 +13,7 @@
> > > >   int dma_buf_init_sysfs_statistics(void);
> > > >   void dma_buf_uninit_sysfs_statistics(void);
> > > > 
> > > > -int dma_buf_stats_setup(struct dma_buf *dmabuf);
> > > > +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
> > > > 
> > > >   void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> > > >   #else
> > > > @@ -25,7 +25,7 @@ static inline int dma_buf_init_sysfs_statistics(void)
> > > > 
> > > >   static inline void dma_buf_uninit_sysfs_statistics(void) {}
> > > > 
> > > > -static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
> > > > +static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
> > > >   {
> > > >          return 0;
> > > >   }
> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > > index e6f36c014c4c..eb6b59363c4f 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -95,10 +95,11 @@ static int dma_buf_file_release(struct inode *inode, struct file *file)
> > > >                  return -EINVAL;
> > > > 
> > > >          dmabuf = file->private_data;
> > > > -
> > > > -       mutex_lock(&db_list.lock);
> > > > -       list_del(&dmabuf->list_node);
> > > > -       mutex_unlock(&db_list.lock);
> > > > +       if (dmabuf) {
> > > > +               mutex_lock(&db_list.lock);
> > > > +               list_del(&dmabuf->list_node);
> > > > +               mutex_unlock(&db_list.lock);
> > > > +       }
> > > > 
> > > >          return 0;
> > > >   }
> > > > @@ -523,17 +524,17 @@ static inline int is_dma_buf_file(struct file *file)
> > > >          return file->f_op == &dma_buf_fops;
> > > >   }
> > > > 
> > > > -static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
> > > > +static struct file *dma_buf_getfile(size_t size, int flags)
> > > >   {
> > > >          static atomic64_t dmabuf_inode = ATOMIC64_INIT(0);
> > > > -       struct file *file;
> > > >          struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
> > > > +       struct file *file;
> > > > 
> > > >          if (IS_ERR(inode))
> > > >                  return ERR_CAST(inode);
> > > > 
> > > > -       inode->i_size = dmabuf->size;
> > > > -       inode_set_bytes(inode, dmabuf->size);
> > > > +       inode->i_size = size;
> > > > +       inode_set_bytes(inode, size);
> > > > 
> > > >          /*
> > > >           * The ->i_ino acquired from get_next_ino() is not unique thus
> > > > @@ -547,8 +548,6 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
> > > >                                   flags, &dma_buf_fops);
> > > >          if (IS_ERR(file))
> > > >                  goto err_alloc_file;
> > > > -       file->private_data = dmabuf;
> > > > -       file->f_path.dentry->d_fsdata = dmabuf;
> > > > 
> > > >          return file;
> > > > 
> > > > @@ -614,19 +613,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
> > > >          size_t alloc_size = sizeof(struct dma_buf);
> > > >          int ret;
> > > > 
> > > > -       if (!exp_info->resv)
> > > > -               alloc_size += sizeof(struct dma_resv);
> > > > -       else
> > > > -               /* prevent &dma_buf[1] == dma_buf->resv */
> > > > -               alloc_size += 1;
> > > > -
> > > > -       if (WARN_ON(!exp_info->priv
> > > > -                         || !exp_info->ops
> > > > -                         || !exp_info->ops->map_dma_buf
> > > > -                         || !exp_info->ops->unmap_dma_buf
> > > > -                         || !exp_info->ops->release)) {
> > > > +       if (WARN_ON(!exp_info->priv || !exp_info->ops
> > > > +                   || !exp_info->ops->map_dma_buf
> > > > +                   || !exp_info->ops->unmap_dma_buf
> > > > +                   || !exp_info->ops->release))
> > > >                  return ERR_PTR(-EINVAL);
> > > > -       }
> > > > 
> > > >          if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
> > > >                      (exp_info->ops->pin || exp_info->ops->unpin)))
> > > > @@ -638,10 +629,21 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
> > > >          if (!try_module_get(exp_info->owner))
> > > >                  return ERR_PTR(-ENOENT);
> > > > 
> > > > +       file = dma_buf_getfile(exp_info->size, exp_info->flags);
> > > > +       if (IS_ERR(file)) {
> > > > +               ret = PTR_ERR(file);
> > > > +               goto err_module;
> > > > +       }
> > > > +
> > > > +       if (!exp_info->resv)
> > > > +               alloc_size += sizeof(struct dma_resv);
> > > > +       else
> > > > +               /* prevent &dma_buf[1] == dma_buf->resv */
> > > > +               alloc_size += 1;
> > > >          dmabuf = kzalloc(alloc_size, GFP_KERNEL);
> > > >          if (!dmabuf) {
> > > >                  ret = -ENOMEM;
> > > > -               goto err_module;
> > > > +               goto err_file;
> > > >          }
> > > > 
> > > >          dmabuf->priv = exp_info->priv;
> > > > @@ -653,44 +655,36 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
> > > >          init_waitqueue_head(&dmabuf->poll);
> > > >          dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
> > > >          dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
> > > > +       mutex_init(&dmabuf->lock);
> > > > +       INIT_LIST_HEAD(&dmabuf->attachments);
> > > > 
> > > >          if (!resv) {
> > > > -               resv = (struct dma_resv *)&dmabuf[1];
> > > > -               dma_resv_init(resv);
> > > > +               dmabuf->resv = (struct dma_resv *)&dmabuf[1];
> > > > +               dma_resv_init(dmabuf->resv);
> > > > +       } else {
> > > > +               dmabuf->resv = resv;
> > > >          }
> > > > -       dmabuf->resv = resv;
> > > > 
> > > > -       file = dma_buf_getfile(dmabuf, exp_info->flags);
> > > > -       if (IS_ERR(file)) {
> > > > -               ret = PTR_ERR(file);
> > > > +       ret = dma_buf_stats_setup(dmabuf, file);
> > > > +       if (ret)
> > > >                  goto err_dmabuf;
> > > > -       }
> > > > 
> > > > +       file->private_data = dmabuf;
> > > > +       file->f_path.dentry->d_fsdata = dmabuf;
> > > >          dmabuf->file = file;
> > > > 
> > > > -       mutex_init(&dmabuf->lock);
> > > > -       INIT_LIST_HEAD(&dmabuf->attachments);
> > > > -
> > > >          mutex_lock(&db_list.lock);
> > > >          list_add(&dmabuf->list_node, &db_list.head);
> > > >          mutex_unlock(&db_list.lock);
> > > > 
> > > > -       ret = dma_buf_stats_setup(dmabuf);
> > > > -       if (ret)
> > > > -               goto err_sysfs;
> > > > -
> > > >          return dmabuf;
> > > > 
> > > > -err_sysfs:
> > > > -       /*
> > > > -        * Set file->f_path.dentry->d_fsdata to NULL so that when
> > > > -        * dma_buf_release() gets invoked by dentry_ops, it exits
> > > > -        * early before calling the release() dma_buf op.
> > > > -        */
> > > > -       file->f_path.dentry->d_fsdata = NULL;
> > > > -       fput(file);
> > > >   err_dmabuf:
> > > > +       if (!resv)
> > > > +               dma_resv_fini(dmabuf->resv);
> > > >          kfree(dmabuf);
> > > > +err_file:
> > > > +       fput(file);
> > > >   err_module:
> > > >          module_put(exp_info->owner);
> > > >          return ERR_PTR(ret);
> > > > --
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > Thanks and regards,
> > > 
> > > Sumit Semwal (he / him)
> > > Tech Lead - LCG, Vertical Technologies
> > > Linaro.org │ Open source software for ARM SoCs
> > > _______________________________________________
> > > Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> > > To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
