Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93094A90E09
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 23:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1972910E0A0;
	Wed, 16 Apr 2025 21:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jFUjLFUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421E410E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 21:52:03 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-47666573242so146081cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 14:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744840322; x=1745445122;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vcVDTghmW04E6h1mVPVRbo3+jKHYQBJaKcTlOvLQS3c=;
 b=jFUjLFUgWyXPy2128V7H4/lPP5mDb8LzJf2J5dffKoJiVBpPA3jlHustqLtybqJxLN
 YyYCQmTxumjx+w4+Iszhwq9YtVNxEJ1OC9OjIVPHDMl9KWenGoa1EDs20AEpxqaMjBJ2
 8ErtLme2YtOAWsdeoeyCG8sefFpY4tHWZ4Tl+aLl7p8+cP/rYFvDJIWM1hOALdyx+teZ
 FtUOjSBjr4/7snogkL7PLMk6bOWGIiMmakXhNWDsVNZVUvfmNUuXD26N1qx4R8puIBgU
 QUSGb9RK8B4ajPp0I1yXTKmPKdV3pUw2WDxipeaotoZR4lV3/qgwRVm9lhhxNc0ufNmB
 XEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744840322; x=1745445122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vcVDTghmW04E6h1mVPVRbo3+jKHYQBJaKcTlOvLQS3c=;
 b=VObnXC4qpeTvCMzVKZN2OQOZZSeTYvdKhF+mcPneBfvzqsChcRFJtyUkeNd/6Zarqf
 3LJQYAZ9FFjgte2anuRhU4tJlCi5QvlZj5CLjaN5g516D3SJz88EDH7iB+f1rjptVY1R
 ZMjA3faYmHrsDwJRdqtFX70InWLwYpLcP+7Gxm6o53stUjmRDSf7inBxP+AB77RcE/ZI
 nFdVSKhYuc2LismUw9yAE4XYSbILykBIP6MY6SYo7TYnRm2aWLQ0ugTPittBxmbqcBq5
 QuCo/gORgG9ztf+sZRjeWyJBuctKBbEcUHeAT1T6HNYj9kkEIG9n5cY0Nztzvrvrh1/5
 aQeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx3VoLlaYv5+WkkUFkdJhfaF2MMgjLd+FYpyLdgT9kO5eKl6XhZ9ZwOx/sAaE1KJqfhN5DcY5u8zo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5jD0Kluguf9RV1Rfwpu2yCW7n53NyieU5zY3HdGj7BbUhVq/5
 lOj/QiOff3Fm+XP7e3i3YrcN/bkITp8zf70fITIuvRIHraI26Fi8qU3UpXCijimkF89al+uRNww
 8HzjzPqfutiJGRjhyF7oZCz487pk/hwFypnyK
X-Gm-Gg: ASbGnctR8Ad5HlQULvfl29GfIj1Fo/5TA3dTkHGZQJEWwzGSQCO3w7eF/SISgQHkmJj
 VLaFENudeK1PExxATclXs1PRbDsqCsn0lP385KNNQz7Z8mFmGRk0rhZNrWbqELAycEFSkhV0EDw
 chCompdGd76pUV35RXPgH/grg7F3Hq3/EHRU+L3brDTfRP/gaTnZf0
X-Google-Smtp-Source: AGHT+IHUQzspiUQJB+h7jm1wn/s441E3wihWsN9WRc0OUtNm8hJrE+FZspPEgeONpMrV/FAEudR5KbsUS/x37qcmMAY=
X-Received: by 2002:a05:622a:1889:b0:477:1f86:178c with SMTP id
 d75a77b69052e-47ade69b055mr1113711cf.26.1744840322252; Wed, 16 Apr 2025
 14:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com>
 <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
In-Reply-To: <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
From: Juan Yescas <jyescas@google.com>
Date: Wed, 16 Apr 2025 14:51:50 -0700
X-Gm-Features: ATxdqUE4qcI7Wp5CpFV-fRsQMsGVa_XUUphYkpYa0zt1M4zmiCfXplv8_xdchy8
Message-ID: <CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page
 sizes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, baohua@kernel.org, 
 dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
 Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
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

On Wed, Apr 16, 2025 at 4:34=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 15.04.25 um 19:19 schrieb Juan Yescas:
> > This change sets the allocation orders for the different page sizes
> > (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> > for large page sizes were calculated incorrectly, this caused system
> > heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
> >
> > This change was tested on 4k/16k page size kernels.
> >
> > Signed-off-by: Juan Yescas <jyescas@google.com>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 26d5dc89ea16..54674c02dcb4 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -50,8 +50,15 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH=
_ORDER_GFP, LOW_ORDER_GFP};
> >   * to match with the sizes often found in IOMMUs. Using order 4 pages =
instead
> >   * of order 0 pages can significantly improve the performance of many =
IOMMUs
> >   * by reducing TLB pressure and time spent updating page tables.
> > + *
> > + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The=
 possible
> > + * page sizes for ARM devices could be 4K, 16K and 64K.
> >   */
> > -static const unsigned int orders[] =3D {8, 4, 0};
> > +#define ORDER_1M (20 - PAGE_SHIFT)
> > +#define ORDER_64K (16 - PAGE_SHIFT)
> > +#define ORDER_FOR_PAGE_SIZE (0)
> > +static const unsigned int orders[] =3D {ORDER_1M, ORDER_64K, ORDER_FOR=
_PAGE_SIZE};
> > +#
>
> Good catch, but I think the defines are just overkill.
>
> What you should do instead is to subtract page shift when using the array=
.
>

There are several occurrences of orders in the file and I think it is
better to do the calculations up front in the array. Would you be ok
if we get rid of the defines as per your suggestion and make the
calculations during the definition of the array. Something like this:

static const unsigned int orders[] =3D {20 - PAGE_SHIFT, 16 - PAGE_SHIFT, 0=
};

> Apart from that using 1M, 64K and then falling back to 4K just sounds ran=
dom to me. We have especially pushed back on 64K more than once because it =
is actually not beneficial in almost all cases.
>

In the hardware where the driver is used, the 64K is beneficial for:

Arm SMMUv3 (4KB granule size):
           64KB (contiguous bit groups 16 4KB pages)

SysMMU benefits from 64KB (=E2=80=9Clarge=E2=80=9D page) on 4k/16k page siz=
es.

> I suggest to fix the code in system_heap_allocate to not over allocate in=
stead and just try the available orders like TTM does. This has proven to b=
e working architecture independent.
>

Do you mean to have an implementation similar to __ttm_pool_alloc()?

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/ttm/ttm_pool.c?h=3Dv6.15-rc2#n728

If that is the case, we can try the change, run some benchmarks and
submit the patch if we see positive results.

Thanks
Juan

> Regards,
> Christian.
>
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >
> >  static struct sg_table *dup_sg_table(struct sg_table *table)
>
