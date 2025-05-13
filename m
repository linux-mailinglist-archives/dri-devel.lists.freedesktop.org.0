Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B37AB5927
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 17:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6E010E0AE;
	Tue, 13 May 2025 15:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="efW/ThUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1682E10E0AE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 15:55:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso74905e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747151716; x=1747756516;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yRTXNt5wlx4Ttr6BURqRzslfwPuD5g2S42H+azbd12o=;
 b=efW/ThUl9+IPKalJOaQTUysHPERnKPejgcW8LTo8lIWgzqUbA7dudAhZnCnlezT7Vn
 5OkDSYEkLKetaPt35xU3xCdKEHbUWvtKqpnRabFHDYGCUeopr2zqfnBKRdwuncPjwjZE
 nmWe/C44FSkp96CZhpgeRmdBOpBUsl83M+76UmlnH1+xURHTdlhira0npNVmHAoKDNMr
 fI7Xor9wyJYv/mvecIwviZwKz+LKZRACbw267n8mKLK74OriYOFOYNsZtxxZ9fs0SVE+
 SBHr7etQRF0KTYWQJevu+t08500D1NO38EAQXdx1XeHFXFvfRFmptfzQQSb0/nD2fH6h
 t8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747151716; x=1747756516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yRTXNt5wlx4Ttr6BURqRzslfwPuD5g2S42H+azbd12o=;
 b=N7F8CibzqWfNWspJ8t2WNi48TNdth0xHC0C+JgDSNz1IPUM6Cmu3zDYVQEIk2BCZud
 fgdbEtULJ6TZlwkl9myk67PeZ0xC/Co5fLnHc9IMHditzFlAqybh7S8pQncACgvcOomw
 /DlBcGMsVzg+K4ESkP6AlY+fjrTPqTOzz9YRPYkH+2NZf+NPSGwoGSQDXcW3Ag2FUiHp
 Nj3Vu03OF+Ma2itd8lx1YFJ38uFgIPEZNDIFRea3885C/7mQ6v1k1piSlXcTIwEoVaOw
 xhLK9E2yaWRF5JOwnrAf7rWnKXHdUXJLzfmD5rKSozXWIwwa6k+ZqTx2hCfWg1J5zxYW
 Rbkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuKGKu6GzMvObqgKS+8j48b/6EG8OzNhznZ86D2786mhmk1r8ZqdaEy+QBMnVzvIwZWT16cMLJXas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFBgPt+A6Wimo04HaXjRrfi+KdcgQlXFGbZKuFadwOQ0NGeM//
 9FWZNU46KuoN8xULa9fPWZkuAI6rq0crCgyurcOCCGwiirBoH7I+tZdW5AnrGQZJy41W+jG1kQA
 NraVfop4/vNxROdXh1GEnekEnVseeDQZQmp+P11iH
X-Gm-Gg: ASbGncsvCu9BxM5BuwVm8S+BbQSuHfagbFL8xXOGyZlnCZQEV/9VIlK6DORnOSKur+l
 mu5nilQLUrxw4Vvp+4Ezm/GmceLaFrGoFYhisW09opDM79GWXdRUz3Ucff3JVByR7ew3kT3avQK
 12miG92oW3CMIkrkzPAe6+APadJFoMl2F+nUkZxHG5CRfarBI/Cqp3e5qkbS/stSw=
X-Google-Smtp-Source: AGHT+IFEcgQRjnETpZrLf1CwPJMfsljDvK6msWH1CS7O+hxdESqyS573c/EllCa1t/nkBSOwWcTEuL4xiyVh96hOYHg=
X-Received: by 2002:a05:600c:3d91:b0:43b:bfe9:8b43 with SMTP id
 5b1f17b1804b1-442eb48219cmr1721565e9.4.1747151716462; Tue, 13 May 2025
 08:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250513092735.1931-1-tao.wangtao@honor.com>
 <d77ed1c0-3f66-447a-956f-37e1dd543ca3@amd.com>
In-Reply-To: <d77ed1c0-3f66-447a-956f-37e1dd543ca3@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 13 May 2025 08:55:04 -0700
X-Gm-Features: AX0GCFvQHw5JTttfdr9IiIizsn3K7ugnMk9VF_pcUalc634nO7GUCLRkaLzylUY
Message-ID: <CABdmKX08DgEi4Gq6mQ-xPrtiNeRvarMyp9t+biRd001TRQzpQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dmabuf: add DMA_BUF_IOCTL_RW_FILE
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: wangtao <tao.wangtao@honor.com>, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 bintian.wang@honor.com, yipengxiang@honor.com, liulu.liu@honor.com, 
 feng.han@honor.com
Content-Type: multipart/mixed; boundary="0000000000006e3fd006350675f0"
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

--0000000000006e3fd006350675f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 4:31=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/13/25 11:27, wangtao wrote:
> > Add DMA_BUF_IOCTL_RW_FILE to save/restore data from/to a dma-buf.
>
> Similar approach where rejected before in favor of using udmabuf.
>
> Is there any reason you can't use that approach as well?

I also recently verified that udmabuf + O_DIRECT works with
sendfile(), and you can even MADV_COLLAPSE the underlying shmem if you
want.

> Regards,
> Christian.
>
> >
> > Signed-off-by: wangtao <tao.wangtao@honor.com>
> > ---
> >  drivers/dma-buf/dma-buf.c    |  8 ++++++++
> >  include/linux/dma-buf.h      |  3 +++
> >  include/uapi/linux/dma-buf.h | 29 +++++++++++++++++++++++++++++
> >  3 files changed, 40 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 5baa83b85515..95d8b0158ffd 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -460,6 +460,7 @@ static long dma_buf_ioctl(struct file *file,
> >       struct dma_buf *dmabuf;
> >       struct dma_buf_sync sync;
> >       enum dma_data_direction direction;
> > +     struct dma_buf_rw_file kfile;
> >       int ret;
> >
> >       dmabuf =3D file->private_data;
> > @@ -504,6 +505,13 @@ static long dma_buf_ioctl(struct file *file,
> >               return dma_buf_import_sync_file(dmabuf, (const void __use=
r *)arg);
> >  #endif
> >
> > +     case DMA_BUF_IOCTL_RW_FILE:
> > +             if (copy_from_user(&kfile, (void __user *) arg, sizeof(kf=
ile)))
> > +                     return -EFAULT;
> > +             if (!dmabuf->ops->rw_file)
> > +                     return -EINVAL;
> > +             return dmabuf->ops->rw_file(dmabuf, &kfile);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 36216d28d8bd..de236ba2094b 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -22,6 +22,7 @@
> >  #include <linux/fs.h>
> >  #include <linux/dma-fence.h>
> >  #include <linux/wait.h>
> > +#include <uapi/linux/dma-buf.h>
> >
> >  struct device;
> >  struct dma_buf;
> > @@ -285,6 +286,8 @@ struct dma_buf_ops {
> >
> >       int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >       void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> > +
> > +     int (*rw_file)(struct dma_buf *dmabuf, struct dma_buf_rw_file *fi=
le);
> >  };
> >
> >  /**
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.=
h
> > index 5a6fda66d9ad..ec9164b7b753 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -167,6 +167,29 @@ struct dma_buf_import_sync_file {
> >       __s32 fd;
> >  };
> >
> > +/**
> > + * struct dma_buf_rw_file - read/write file associated with a dma-buf
> > + *
> > + * Userspace can performs a DMA_BUF_IOCTL_BACK to save data from a dma=
-buf or
> > + * restore data to a dma-buf.
> > + */
> > +struct dma_buf_rw_file {
> > +
> > +     /** @flags: Flags indicating read/write for this dma-buf. */
> > +     __u32 flags;
> > +     /** @fd: File descriptor of the file associated with this dma-buf=
. */
> > +     __s32 fd;
> > +     /** @file_offset: Offset within the file where this dma-buf start=
s.
> > +      *
> > +      *  Offset and Length must be page-aligned for direct I/O.
> > +      */
> > +     __u64 file_offset;
> > +     /** @buf_offset: Offset within this dma-buf where the read/write =
starts. */
> > +     __u64 buf_offset;
> > +     /** @buf_len: Length of this dma-buf read/write. */
> > +     __u64 buf_len;
> > +};
> > +
> >  #define DMA_BUF_BASE         'b'
> >  #define DMA_BUF_IOCTL_SYNC   _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync=
)
> >
> > @@ -179,4 +202,10 @@ struct dma_buf_import_sync_file {
> >  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE       _IOWR(DMA_BUF_BASE, 2, st=
ruct dma_buf_export_sync_file)
> >  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE       _IOW(DMA_BUF_BASE, 3, str=
uct dma_buf_import_sync_file)
> >
> > +#define DMA_BUF_RW_FLAGS_OP_MASK (0xFF << 0)
> > +#define DMA_BUF_RW_FLAGS_READ (1 << 0) /* Restore dma-buf data */
> > +#define DMA_BUF_RW_FLAGS_WRITE (2 << 0) /* Save dma-buf data */
> > +#define DMA_BUF_RW_FLAGS_DIRECT (1u << 31) /* Direct read/write file *=
/
> > +#define DMA_BUF_IOCTL_RW_FILE        _IOW(DMA_BUF_BASE, 4, struct dma_=
buf_rw_file)
> > +
> >  #endif
>

--0000000000006e3fd006350675f0
Content-Type: text/x-c++src; charset="US-ASCII"; name="udmabuf_odirect.cpp"
Content-Disposition: attachment; filename="udmabuf_odirect.cpp"
Content-Transfer-Encoding: base64
Content-ID: <f_mamp0bim0>
X-Attachment-Id: f_mamp0bim0

I2luY2x1ZGUgPGNzdGRsaWI+CiNpbmNsdWRlIDxlcnJuby5oPgojaW5jbHVkZSA8ZmNudGwuaD4K
I2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN5cy9pb2N0
bC5oPgojaW5jbHVkZSA8c3lzL21tYW4uaD4KI2luY2x1ZGUgPHN5cy9zZW5kZmlsZS5oPgojaW5j
bHVkZSA8dW5pc3RkLmg+CgojaW5jbHVkZSA8bGludXgvdWRtYWJ1Zi5oPgoKbmFtZXNwYWNlIHsK
CmludCBjcmVhdGVNZW1mZChzaXplX3QgYnl0ZXMsIHVuc2lnbmVkIGludCBmbGFncykgewoKICAg
IGludCBmZChtZW1mZF9jcmVhdGUoIm1lbWZkX3Rlc3QiLCBmbGFncykpOwogICAgaWYgKGZkID09
IC0xKSB7CiAgICAgICAgcGVycm9yKCJtZW1mZF9jcmVhdGUiKTsKICAgICAgICByZXR1cm4gLTE7
CiAgICB9CgogICAgaW50IHJjID0gZnRydW5jYXRlKGZkLCBieXRlcyk7CiAgICBpZiAocmMgPT0g
LTEpIHsKICAgICAgICBwZXJyb3IoImZ0cnVuY2F0ZSIpOwogICAgICAgIHJldHVybiAtMTsKICAg
IH0KCiAgICByZXR1cm4gZmQ7Cn0KCmludCBjcmVhdGVVZG1hYnVmKHNpemVfdCBieXRlcywgaW50
IG1lbWZkKSB7CiAgICBpbnQgdWRtYWJ1Zl9kZXZfZmQob3BlbigiL2Rldi91ZG1hYnVmIiwgT19S
RE9OTFkpKTsKICAgIGlmICh1ZG1hYnVmX2Rldl9mZCA9PSAtMSkgewogICAgICAgIHBlcnJvcigi
dWRtYWJ1ZiBvcGVuIik7CiAgICAgICAgcmV0dXJuIC0xOwogICAgfQoKICAgIHN0cnVjdCB1ZG1h
YnVmX2NyZWF0ZSBjcmVhdGU7CiAgICBjcmVhdGUubWVtZmQgPSBtZW1mZDsKICAgIGNyZWF0ZS5m
bGFncyA9IFVETUFCVUZfRkxBR1NfQ0xPRVhFQzsKICAgIGNyZWF0ZS5vZmZzZXQgPSAwOwogICAg
Y3JlYXRlLnNpemUgPSBieXRlczsKCiAgICBpbnQgZG1hYnVmX2ZkKGlvY3RsKHVkbWFidWZfZGV2
X2ZkLCBVRE1BQlVGX0NSRUFURSwgJmNyZWF0ZSkpOwogICAgaWYgKGRtYWJ1Zl9mZCA9PSAtMSkg
cGVycm9yKCJVRE1BQlVGX0NSRUFURSIpOwoKICAgIHJldHVybiBkbWFidWZfZmQ7Cn0KCn0gLy8g
YW5vbnltb3VzIG5hbWVzcGFjZQoKCmludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikgewoJ
c2l6ZV90IGJ5dGVzID0gMXVsbCA8PCAzMDsKCglpbnQgbWVtZmQgPSBjcmVhdGVNZW1mZChieXRl
cywgTUZEX0FMTE9XX1NFQUxJTkcpOwoJaWYgKG1lbWZkIDwgMCkgcmV0dXJuIEVYSVRfRkFJTFVS
RTsKCglpZiAoZmNudGwobWVtZmQsIEZfQUREX1NFQUxTLCBGX1NFQUxfU0hSSU5LKSA8IDApIHsK
CQlwZXJyb3IoIkZfU0VBTF9TSFJJTksiKTsKCQlyZXR1cm4gRVhJVF9GQUlMVVJFOwoJfQoKICAg
IGlmIChmdHJ1bmNhdGUobWVtZmQsIGJ5dGVzKSkgewogICAgICAgIHBlcnJvcigiZnRydW5jYXRl
Iik7CiAgICAgICAgcmV0dXJuIEVYSVRfRkFJTFVSRTsKICAgIH0KCiAgICBpbnQgYmlnZmlsZSA9
IG9wZW4oYXJndlsxXSwgT19SRE9OTFkgfCBPX0RJUkVDVCk7CiAgICBpZiAoYmlnZmlsZSA8IDAp
IHsKICAgICAgICBwZXJyb3IoIm9wZW4iKTsKICAgICAgICByZXR1cm4gRVhJVF9GQUlMVVJFOwog
ICAgfQoKICAgIG9mZl90IG9mZnNldCA9IDA7CiAgICBmb3IgKHNzaXplX3QgbiA9IHNlbmRmaWxl
KG1lbWZkLCBiaWdmaWxlLCAmb2Zmc2V0LCBieXRlcyAtIG9mZnNldCk7CiAgICAgICAgIG9mZnNl
dCA8IGJ5dGVzICYmIG4gPiAwOwogICAgICAgICBuID0gc2VuZGZpbGUobWVtZmQsIGJpZ2ZpbGUs
ICZvZmZzZXQsIGJ5dGVzIC0gb2Zmc2V0KSkKICAgIHt9CiAgICBwcmludGYoIk9mZnNldCAlbGRc
biIsIG9mZnNldCk7CgogICAgaW50IHVkbWFidWYgPSBjcmVhdGVVZG1hYnVmKGJ5dGVzLCBtZW1m
ZCk7CiAgICBpZiAodWRtYWJ1ZiA8IDApIHJldHVybiBFWElUX0ZBSUxVUkU7CgogICAgcmV0dXJu
IEVYSVRfU1VDQ0VTUzsKfQo=
--0000000000006e3fd006350675f0--
