Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4993C98A6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 08:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B936E52D;
	Thu, 15 Jul 2021 06:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8506E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 06:06:17 +0000 (UTC)
X-UUID: 40aeff00ac31441ca8e334c1ffb4b277-20210715
X-UUID: 40aeff00ac31441ca8e334c1ffb4b277-20210715
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 11811868; Thu, 15 Jul 2021 14:06:13 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 14:06:11 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas07.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 15 Jul 2021 14:06:11 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: add kernel count for dma_buf
Date: Thu, 15 Jul 2021 14:06:07 +0800
Message-ID: <20210715060607.98339-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <424d5f2e-2ad5-cc33-5615-7d4a235af3dc@amd.com>
References: <424d5f2e-2ad5-cc33-5615-7d4a235af3dc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
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
Cc: linaro-mm-sig@lists.linaro.org, guangming.cao@mediatek.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, caoguangming34@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming.Cao <guangming.cao@mediatek.com>

On Wed, 2021-07-14 at 14:28 +0200, Christian König wrote:
> Am 14.07.21 um 14:03 schrieb guangming.cao@mediatek.com:
> > From: Guangming.Cao <guangming.cao@mediatek.com>
> > 
> > On Wed, 2021-07-14 at 12:43 +0200, Christian K鰊ig wrote:
> > > Am 14.07.21 um 11:44 schrieb guangming.cao@mediatek.com:
> > > > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > > > 
> > > > On Wed, 2021-07-14 at 10:46 +0200, Christian K鰊ig wrote:
> > > > > Am 14.07.21 um 09:11 schrieb guangming.cao@mediatek.com:
> > > > > > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > > > > > 
> > > > > > Add a refcount for kernel to prevent UAF(Use After Free)
> > > > > > issue.
> > > > > 
> > > > > Well NAK on so many levels.
> > > > > 
> > > > > > We can assume a case like below:
> > > > > >        1. kernel space alloc dma_buf(file count = 1)
> > > > > >        2. kernel use dma_buf to get fd(file count = 1)
> > > > > >        3. userspace use fd to do mapping (file count = 2)
> > > > > 
> > > > > Creating an userspace mapping increases the reference count
> > > > > for
> > > > > the
> > > > > underlying file object.
> > > > > 
> > > > > See the implementation of mmap_region():
> > > > > ...
> > > > >                    vma->vm_file = get_file(file);
> > > > >                    error = call_mmap(file, vma);
> > > > > ...
> > > > > 
> > > > > What can happen is the the underlying exporter redirects the
> > > > > mmap
> > > > > to
> > > > > a
> > > > > different file, e.g. TTM or GEM drivers do that all the time.
> > > > > 
> > > > > But this is fine since then the VA mapping is independent of
> > > > > the
> > > > > DMA-
> > > > > buf.
> > > > > 
> > > > > >        4. kernel call dma_buf_put (file count = 1)
> > > > > >        5. userpsace close buffer fd(file count = 0)
> > > > > >        6. at this time, buffer is released, but va is
> > > > > > valid!!
> > > > > >           So we still can read/write buffer via mmap va,
> > > > > >           it maybe cause memory leak, or kernel exception.
> > > > > >           And also, if we use "ls -ll" to watch
> > > > > > corresponding
> > > > > > process
> > > > > >               fd link info, it also will cause kernel
> > > > > > exception.
> > > > > > 
> > > > > > Another case:
> > > > > >         Using dma_buf_fd to generate more than 1 fd,
> > > > > > because
> > > > > >         dma_buf_fd will not increase file count, thus, when
> > > > > > close
> > > > > >         the second fd, it maybe occurs error.
> > > > > 
> > > > > Each opened fd will increase the reference count so this is
> > > > > certainly
> > > > > not correct what you describe here.
> > > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > 
> > > > Yes, mmap will increase file count by calling get_file, so
> > > > step[2]
> > > > ->
> > > > step[3], file count increase 1.
> > > > 
> > > > But, dma_buf_fd() will not increase file count.
> > > > function "dma_buf_fd(struct dma_buf *dmabuf, int flags)" just
> > > > get
> > > > an
> > > > unused fd, via call "get_unused_fd_flags(flags)", and call
> > > > "fd_install(fd, dmabuf->file)", it will let associated "struct
> > > > file*"
> > > > in task's fdt->fd[fd] points to this dma_buf.file, not increase
> > > > the
> > > > file count of dma_buf.file.
> > > > I think this is confusing, I can get more than 1 fds via
> > > > dma_buf_fd,
> > > > but they don't need to close it because they don't increase
> > > > file
> > > > count.
> > > > 
> > > > However, dma_buf_put() can decrease file count at kernel side
> > > > directly.
> > > > If somebody write a ko to put file count of dma_buf.file many
> > > > times, it
> > > > will cause buffer freed earlier than except. At last on
> > > > Android, I
> > > > think this is a little bit dangerous.
> > > 
> > > dma_buf_fd() takes the dma_buf pointer and converts it into a fd.
> > > So
> > > the
> > > reference is consumed.
> > > 
> > > That's why users of this interface make sure to get a separate
> > > reference, see drm_gem_prime_handle_to_fd() for example:
> > > 
> > > ...
> > > out_have_handle:
> > >       ret = dma_buf_fd(dmabuf, flags);
> > >       /*
> > >        * We must _not_ remove the buffer from the handle cache
> > > since
> > > the
> > > newly
> > >        * created dma buf is already linked in the global obj-
> > > >dma_buf
> > > pointer,
> > >        * and that is invariant as long as a userspace gem handle
> > > exists.
> > >        * Closing the handle will clean out the cache anyway, so
> > > we
> > > don't
> > > leak.
> > >        */
> > >       if (ret < 0) {
> > >           goto fail_put_dmabuf;
> > >       } else {
> > >           *prime_fd = ret;
> > >           ret = 0;
> > >       }
> > > 
> > >       goto out;
> > > 
> > > fail_put_dmabuf:
> > >       dma_buf_put(dmabuf);
> > > out:
> > > ...
> > > 
> > > You could submit a patch to improve the documentation and
> > > explicitly
> > > note on dma_buf_fd() that the reference is consumed, but all of
> > > this
> > > is
> > > working perfectly fine.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > 
> > Thanks for your reply!
> > 
> > Yes, drm works fine because it fully understand what dma-buf api
> > will
> > do. Improve the documentation is really good idea to prevent this
> > case.
> > 
> > But, what I can't understand is, for kernel api exported to
> > corresponding users, we don't need to ensure all api is safe?
> 
> Well the API is perfectly safe, it is just not what you are
> expecting.
> 
> > And for general cases, dma-buf framework also need to prevent this
> > case, isn't it, it will make dma-buf framework more strong?
> 
> What we could do is to move getting the reference into that function
> if 
> all users of that function does that anyway.
> 
> This would then be more defensive because new users of dma_buf_fd() 
> can't forget to grab a reference.
> 
> But this needs a complete audit of the kernel with all of the users
> of 
> dma_buf_fd().
> 
> Regards,
> Christian.
> 
Thanks for your patient explanation! Now I think I get what you said.
dmabuf framework works fine, no risk, and reference should grab by users.

This discussion can be terminated now.
Thanks Christian!

BRs!
Guangming.
> > 
> > 
> > BRs!
> > Guangming
> > > > > > Solution:
> > > > > >        Add a kernel count for dma_buf, and make sure the
> > > > > > file
> > > > > > count
> > > > > >            of dma_buf.file hold by kernel is 1.
> > > > > > 
> > > > > > Notes: For this solution, kref couldn't work because kernel
> > > > > > ref
> > > > > >           maybe added from 0, but kref don't allow it.
> > > > > > 
> > > > > > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > > > > > ---
> > > > > >     drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++----
> > > > > >     include/linux/dma-buf.h   |  6 ++++--
> > > > > >     2 files changed, 23 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-
> > > > > > buf/dma-
> > > > > > buf.c
> > > > > > index 511fe0d217a0..04ee92aac8b9 100644
> > > > > > --- a/drivers/dma-buf/dma-buf.c
> > > > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > > > @@ -62,6 +62,7 @@ static void dma_buf_release(struct dentry
> > > > > > *dentry)
> > > > > >       if (unlikely(!dmabuf))
> > > > > >               return;
> > > > > >     
> > > > > > +   WARN_ON(atomic64_read(&dmabuf->kernel_ref));
> > > > > >       BUG_ON(dmabuf->vmapping_counter);
> > > > > >     
> > > > > >       /*
> > > > > > @@ -555,6 +556,7 @@ struct dma_buf *dma_buf_export(const
> > > > > > struct
> > > > > > dma_buf_export_info *exp_info)
> > > > > >               goto err_module;
> > > > > >       }
> > > > > >     
> > > > > > +   atomic64_set(&dmabuf->kernel_ref, 1);
> > > > > >       dmabuf->priv = exp_info->priv;
> > > > > >       dmabuf->ops = exp_info->ops;
> > > > > >       dmabuf->size = exp_info->size;
> > > > > > @@ -617,6 +619,9 @@ int dma_buf_fd(struct dma_buf *dmabuf,
> > > > > > int
> > > > > > flags)
> > > > > >     
> > > > > >       fd_install(fd, dmabuf->file);
> > > > > >     
> > > > > > +   /* Add file cnt for each new fd */
> > > > > > +   get_file(dmabuf->file);
> > > > > > +
> > > > > >       return fd;
> > > > > >     }
> > > > > >     EXPORT_SYMBOL_GPL(dma_buf_fd);
> > > > > > @@ -626,12 +631,13 @@ EXPORT_SYMBOL_GPL(dma_buf_fd);
> > > > > >      * @fd:   [in]    fd associated with the struct dma_buf
> > > > > > to
> > > > > > be
> > > > > > returned
> > > > > >      *
> > > > > >      * On success, returns the struct dma_buf associated
> > > > > > with an
> > > > > > fd;
> > > > > > uses
> > > > > > - * file's refcounting done by fget to increase refcount.
> > > > > > returns
> > > > > > ERR_PTR
> > > > > > - * otherwise.
> > > > > > + * dmabuf's ref refcounting done by kref_get to increase
> > > > > > refcount.
> > > > > > + * Returns ERR_PTR otherwise.
> > > > > >      */
> > > > > >     struct dma_buf *dma_buf_get(int fd)
> > > > > >     {
> > > > > >       struct file *file;
> > > > > > +   struct dma_buf *dmabuf;
> > > > > >     
> > > > > >       file = fget(fd);
> > > > > >     
> > > > > > @@ -643,7 +649,12 @@ struct dma_buf *dma_buf_get(int fd)
> > > > > >               return ERR_PTR(-EINVAL);
> > > > > >       }
> > > > > >     
> > > > > > -   return file->private_data;
> > > > > > +   dmabuf = file->private_data;
> > > > > > +   /* replace file count increase as ref increase for
> > > > > > kernel
> > > > > > user
> > > > > > */
> > > > > > +   get_dma_buf(dmabuf);
> > > > > > +   fput(file);
> > > > > > +
> > > > > > +   return dmabuf;
> > > > > >     }
> > > > > >     EXPORT_SYMBOL_GPL(dma_buf_get);
> > > > > >     
> > > > > > @@ -662,7 +673,11 @@ void dma_buf_put(struct dma_buf
> > > > > > *dmabuf)
> > > > > >       if (WARN_ON(!dmabuf || !dmabuf->file))
> > > > > >               return;
> > > > > >     
> > > > > > -   fput(dmabuf->file);
> > > > > > +   if (WARN_ON(!atomic64_read(&dmabuf->kernel_ref)))
> > > > > > +           return;
> > > > > > +
> > > > > > +   if (!atomic64_dec_return(&dmabuf->kernel_ref))
> > > > > > +           fput(dmabuf->file);
> > > > > >     }
> > > > > >     EXPORT_SYMBOL_GPL(dma_buf_put);
> > > > > >     
> > > > > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-
> > > > > > buf.h
> > > > > > index efdc56b9d95f..bc790cb028eb 100644
> > > > > > --- a/include/linux/dma-buf.h
> > > > > > +++ b/include/linux/dma-buf.h
> > > > > > @@ -308,6 +308,7 @@ struct dma_buf_ops {
> > > > > >     struct dma_buf {
> > > > > >       size_t size;
> > > > > >       struct file *file;
> > > > > > +   atomic64_t kernel_ref;
> > > > > >       struct list_head attachments;
> > > > > >       const struct dma_buf_ops *ops;
> > > > > >       struct mutex lock;
> > > > > > @@ -436,7 +437,7 @@ struct dma_buf_export_info {
> > > > > >                                        .owner = THIS_MODULE
> > > > > > }
> > > > > >     
> > > > > >     /**
> > > > > > - * get_dma_buf - convenience wrapper for get_file.
> > > > > > + * get_dma_buf - increase a kernel ref of dma-buf
> > > > > >      * @dmabuf:       [in]    pointer to dma_buf
> > > > > >      *
> > > > > >      * Increments the reference count on the dma-buf,
> > > > > > needed in
> > > > > > case
> > > > > > of drivers
> > > > > > @@ -446,7 +447,8 @@ struct dma_buf_export_info {
> > > > > >      */
> > > > > >     static inline void get_dma_buf(struct dma_buf *dmabuf)
> > > > > >     {
> > > > > > -   get_file(dmabuf->file);
> > > > > > +   if (atomic64_inc_return(&dmabuf->kernel_ref) == 1)
> > > > > > +           get_file(dmabuf->file);
> > > > > >     }
> > > > > >     
> > > > > >     /**
> 
> 
