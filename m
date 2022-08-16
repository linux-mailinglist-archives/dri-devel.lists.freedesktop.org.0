Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40F4595E49
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 16:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3108210E43B;
	Tue, 16 Aug 2022 14:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28DA10E43B;
 Tue, 16 Aug 2022 14:25:33 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id r141so4780558iod.4;
 Tue, 16 Aug 2022 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=hlPqld0MkkDzkP6nlR9+xwe5ym6yN7qtcrF+O0hs2y8=;
 b=hhVXCUBxtngsOXAc6MKLkbqPptQ7caYH5YoYz2TsHCZipiu4nB29ljNurOc4WPWzPW
 MKo0WvLARZDo7zmak1U7qrJRQGZY2nuEfNDIyp3qhsQJH63Am9rDKPpYCNg9Njwt8E+T
 kkz7fH0b+PvbqqQxyp1Hqlw/MvWlGDdWRxq+h5cp4jqYQVwiK4rf5afli4fdqfiFe55B
 32rP5fbB3A/l0fbZKr6FqUaoruUWBKCOxh1WnaAalrQPPtNVrMdSw8GMEQipYOEKyVcY
 4OS9ujSuNDmzZZSSWm4EnJ2fPyJq5xr5V2yjx3bikhUe0j6rgFtCKyE5sJYgf9GY4yoP
 5SkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=hlPqld0MkkDzkP6nlR9+xwe5ym6yN7qtcrF+O0hs2y8=;
 b=7pgRX/J5iek7YmK6yYa4HjxV2sszyvUgJje7pWxfjrGeUJEBqmUTMX7oU5PVm2f1df
 ayHAiPTHYxxxSHl6fU2S1AhJMC3YLwBz3N3sQGUYkVd86CeJjmSOJ7C5Cy2eeL/m0OUL
 ut0mQ9jmtvXTuexu/JkM+WsyH8uyuNCVpcl7seCDbBVo+mbSRytuJASubH412C2CKYyM
 E3yXInV5VoBD7cuuXAxwB6ZCF2A1gKI1V7yR6yhYv1BK29kKmC3fVLx0Vpo49leJAeoW
 uepZCtI2eGHORUW/YfluLDG1vXWYjSi7FG5JqRFz4+0QPk7qtXf/T67LYNpbTLa9iv75
 2oMQ==
X-Gm-Message-State: ACgBeo0kcACxnirONslkU7CYvK0WMwLOVp5PiI4x9dFN/LWlv2w/S9me
 1xR/VPrgPNyCxxy9Ic6x+obnGIyKbRBDAo+Igvk=
X-Google-Smtp-Source: AA6agR4xEs1XMyR1EW/f5TP3OUKn5DGc+mwcUXNgPFGPvWU/puhG5LB5XDjy/1yi/N+effprNDe6LAh/XgDwkBH0SD4=
X-Received: by 2002:a05:6638:25d6:b0:342:916c:d59a with SMTP id
 u22-20020a05663825d600b00342916cd59amr9425579jat.51.1660659932782; Tue, 16
 Aug 2022 07:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220815211516.3169470-1-robdclark@gmail.com>
 <20220815211516.3169470-2-robdclark@gmail.com>
 <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
In-Reply-To: <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Aug 2022 07:26:04 -0700
Message-ID: <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 1:27 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 15.08.22 um 23:15 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This is a fairly narrowly focused interface, providing a way for a VMM
> > in userspace to tell the guest kernel what pgprot settings to use when
> > mapping a buffer to guest userspace.
> >
> > For buffers that get mapped into guest userspace, virglrenderer returns
> > a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
> > pages into the guest VM, it needs to report to drm/virtio in the guest
> > the cache settings to use for guest userspace.  In particular, on some
> > architectures, creating aliased mappings with different cache attribute=
s
> > is frowned upon, so it is important that the guest mappings have the
> > same cache attributes as any potential host mappings.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > v2: Combine with coherency, as that is a related concept.. and it is
> >      relevant to the VMM whether coherent access without the SYNC ioctl
> >      is possible; set map_info at export time to make it more clear
> >      that it applies for the lifetime of the dma-buf (for any mmap
> >      created via the dma-buf)
>
> Well, exactly that's a conceptual NAK from my side.
>
> The caching information can change at any time. For CPU mappings even
> without further notice from the exporter.

You should look before you criticize, as I left you a way out.. the
idea was that DMA_BUF_MAP_INCOHERENT should indicate that the buffer
cannot be mapped to the guest.  We could ofc add more DMA_BUF_MAP_*
values if something else would suit you better.  But the goal is to
give the VMM enough information to dtrt, or return an error if mapping
to guest is not possible.  That seems better than assuming mapping to
guest will work and guessing about cache attrs

BR,
-R

> If the hardware can't use the caching information from the host CPU page
> tables directly then that pretty much completely breaks the concept that
> the exporter is responsible for setting up those page tables.
>
> Regards,
> Christian.
>
> >
> >   drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++------
> >   include/linux/dma-buf.h      | 11 ++++++
> >   include/uapi/linux/dma-buf.h | 68 +++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 132 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 32f55640890c..262c4706f721 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type =3D=
 {
> >       .kill_sb =3D kill_anon_super,
> >   };
> >
> > +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struc=
t *vma)
> > +{
> > +     int ret;
> > +
> > +     /* check if buffer supports mmap */
> > +     if (!dmabuf->ops->mmap)
> > +             return -EINVAL;
> > +
> > +     ret =3D dmabuf->ops->mmap(dmabuf, vma);
> > +
> > +     /*
> > +      * If the exporter claims to support coherent access, ensure the
> > +      * pgprot flags match the claim.
> > +      */
> > +     if ((dmabuf->map_info !=3D DMA_BUF_MAP_INCOHERENT) && !ret) {
> > +             pgprot_t wc_prot =3D pgprot_writecombine(vma->vm_page_pro=
t);
> > +             if (dmabuf->map_info =3D=3D DMA_BUF_COHERENT_WC) {
> > +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) !=3D p=
gprot_val(wc_prot));
> > +             } else {
> > +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) =3D=3D=
 pgprot_val(wc_prot));
> > +             }
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> >   static int dma_buf_mmap_internal(struct file *file, struct vm_area_st=
ruct *vma)
> >   {
> >       struct dma_buf *dmabuf;
> > @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file *fil=
e, struct vm_area_struct *vma)
> >
> >       dmabuf =3D file->private_data;
> >
> > -     /* check if buffer supports mmap */
> > -     if (!dmabuf->ops->mmap)
> > -             return -EINVAL;
> > -
> >       /* check for overflowing the buffer's size */
> >       if (vma->vm_pgoff + vma_pages(vma) >
> >           dmabuf->size >> PAGE_SHIFT)
> >               return -EINVAL;
> >
> > -     return dmabuf->ops->mmap(dmabuf, vma);
> > +     return __dma_buf_mmap(dmabuf, vma);
> >   }
> >
> >   static loff_t dma_buf_llseek(struct file *file, loff_t offset, int wh=
ence)
> > @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *dmabu=
f, const char __user *buf)
> >       return 0;
> >   }
> >
> > +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
> > +{
> > +     struct dma_buf_info arg;
> > +
> > +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     switch (arg.param) {
> > +     case DMA_BUF_INFO_MAP_INFO:
> > +             arg.value =3D dmabuf->map_info;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (copy_to_user(uarg, &arg, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     return 0;
> > +}
> > +
> >   static long dma_buf_ioctl(struct file *file,
> >                         unsigned int cmd, unsigned long arg)
> >   {
> > @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
> >       case DMA_BUF_SET_NAME_B:
> >               return dma_buf_set_name(dmabuf, (const char __user *)arg)=
;
> >
> > +     case DMA_BUF_IOCTL_INFO:
> > +             return dma_buf_info(dmabuf, (void __user *)arg);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
_export_info *exp_info)
> >       dmabuf->priv =3D exp_info->priv;
> >       dmabuf->ops =3D exp_info->ops;
> >       dmabuf->size =3D exp_info->size;
> > +     dmabuf->map_info =3D exp_info->map_info;
> >       dmabuf->exp_name =3D exp_info->exp_name;
> >       dmabuf->owner =3D exp_info->owner;
> >       spin_lock_init(&dmabuf->name_lock);
> > @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct =
vm_area_struct *vma,
> >       if (WARN_ON(!dmabuf || !vma))
> >               return -EINVAL;
> >
> > -     /* check if buffer supports mmap */
> > -     if (!dmabuf->ops->mmap)
> > -             return -EINVAL;
> > -
> >       /* check for offset overflow */
> >       if (pgoff + vma_pages(vma) < pgoff)
> >               return -EOVERFLOW;
> > @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct v=
m_area_struct *vma,
> >       vma_set_file(vma, dmabuf->file);
> >       vma->vm_pgoff =3D pgoff;
> >
> > -     return dmabuf->ops->mmap(dmabuf, vma);
> > +     return __dma_buf_mmap(dmabuf, vma);
> >   }
> >   EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
> >
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 71731796c8c3..37923c8d5c24 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -23,6 +23,8 @@
> >   #include <linux/dma-fence.h>
> >   #include <linux/wait.h>
> >
> > +#include <uapi/linux/dma-buf.h>
> > +
> >   struct device;
> >   struct dma_buf;
> >   struct dma_buf_attachment;
> > @@ -307,6 +309,13 @@ struct dma_buf {
> >        */
> >       size_t size;
> >
> > +     /**
> > +      * @map_info:
> > +      *
> > +      * CPU mapping/coherency information for the buffer.
> > +      */
> > +     enum dma_buf_map_info map_info;
> > +
> >       /**
> >        * @file:
> >        *
> > @@ -533,6 +542,7 @@ struct dma_buf_attachment {
> >    * @ops:    Attach allocator-defined dma buf ops to the new buffer
> >    * @size:   Size of the buffer - invariant over the lifetime of the b=
uffer
> >    * @flags:  mode flags for the file
> > + * @map_info:        CPU mapping/coherency information for the buffer
> >    * @resv:   reservation-object, NULL to allocate default one
> >    * @priv:   Attach private data of allocator to this buffer
> >    *
> > @@ -545,6 +555,7 @@ struct dma_buf_export_info {
> >       const struct dma_buf_ops *ops;
> >       size_t size;
> >       int flags;
> > +     enum dma_buf_map_info map_info;
> >       struct dma_resv *resv;
> >       void *priv;
> >   };
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.=
h
> > index b1523cb8ab30..07b403ffdb43 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -85,6 +85,72 @@ struct dma_buf_sync {
> >
> >   #define DMA_BUF_NAME_LEN    32
> >
> > +/**
> > + * enum dma_buf_map_info - CPU mapping info
> > + *
> > + * This enum describes coherency of a userspace mapping of the dmabuf.
> > + *
> > + * Importing devices should check dma_buf::map_info flag and reject an
> > + * import if unsupported.  For example, if the exporting device uses
> > + * @DMA_BUF_COHERENT_CACHED but the importing device does not support
> > + * CPU cache coherency, the dma-buf import should fail.
> > + */
> > +enum dma_buf_map_info {
> > +     /**
> > +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
> > +      *
> > +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed coherene=
ncy.
> > +      */
> > +     DMA_BUF_MAP_INCOHERENT,
> > +
> > +     /**
> > +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cached.
> > +      *
> > +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not requ=
ired.
> > +      * However fences may be still required for synchronizing access.=
  Ie.
> > +      * coherency can only be relied upon by an explicit-fencing users=
pace.
> > +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
> > +      *
> > +      * The cpu mapping is writecombine.
> > +      */
> > +     DMA_BUF_COHERENT_WC,
> > +
> > +     /**
> > +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU cach=
ed.
> > +      *
> > +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not requ=
ired.
> > +      * However fences may be still required for synchronizing access.=
  Ie.
> > +      * coherency can only be relied upon by an explicit-fencing users=
pace.
> > +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
> > +      *
> > +      * The cpu mapping is cached.
> > +      */
> > +     DMA_BUF_COHERENT_CACHED,
> > +};
> > +
> > +/**
> > + * struct dma_buf_info - Query info about the buffer.
> > + */
> > +struct dma_buf_info {
> > +
> > +#define DMA_BUF_INFO_MAP_INFO    1
> > +
> > +     /**
> > +      * @param: Which param to query
> > +      *
> > +      * DMA_BUF_INFO_MAP_INFO:
> > +      *     Returns enum dma_buf_map_info, describing the coherency an=
d
> > +      *     caching of a CPU mapping of the buffer.
> > +      */
> > +     __u32 param;
> > +     __u32 pad;
> > +
> > +     /**
> > +      * @value: Return value of the query.
> > +      */
> > +     __u64 value;
> > +};
> > +
> >   #define DMA_BUF_BASE                'b'
> >   #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync=
)
> >
> > @@ -95,4 +161,6 @@ struct dma_buf_sync {
> >   #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
> >   #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
> >
> > +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_inf=
o)
> > +
> >   #endif
>
