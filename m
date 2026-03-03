Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJU/HIX0pmmgawAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:47:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B750F1F1C1E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B021E10E04C;
	Tue,  3 Mar 2026 14:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ATb9Hcfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C84610E04C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772549248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67yY3F56XFWrwiaal1aRX9aq+ZjoX8WGlYCGFwR1Ay0=;
 b=ATb9HcfjF8+tBFdTlQbs8GYDvQCcBDrUJBIrxcKz6GkzwZlVmhkruCPfJ+YJkCZvhVfnYj
 Qc2VEeERPMFzRiRfuomTHkj0b+gixpZtppDtWzWb5MRJBbm2uKcdZajS6zm74rwvU8qbDe
 WoyVrI7YTNRmVTiLJY6bYq8eHmb0KAE=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-WmWDiaj9OKKs6oKrJZhDvw-1; Tue, 03 Mar 2026 09:47:27 -0500
X-MC-Unique: WmWDiaj9OKKs6oKrJZhDvw-1
X-Mimecast-MFC-AGG-ID: WmWDiaj9OKKs6oKrJZhDvw_1772549246
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-64ca2fce827so12175560d50.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 06:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772549246; x=1773154046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=67yY3F56XFWrwiaal1aRX9aq+ZjoX8WGlYCGFwR1Ay0=;
 b=Z3OnHnTjXT8BQlBC8FV1np+v+KRWt3zTkDFlW7Z43CEvqY7ZjXsOiOxXhc2VWqjuvN
 vJuI8mj5V9K/jiMNh7ix2A91IBEYkIt4on2evH24S21FyPaquxPkBdSuTnGMgBoawmfa
 6NItFdt+q7hDAweCEIfFfI2ScKckmdwf79MoYuT89AOtqdIPJFhyukbQ28SFfboKy43q
 Iyps0bv+iUn+1Dzx0B/ckb/s31h7x/Bpu2M/lHw2n1Sf39vfD3YrvQdpR06ruBJ1bsKS
 /E9Uj7ffNyRNk2mRYHvDHZCCqTqyzdzwtxaV+yVR5+HkIXfiHn525v2xp11EeQWRYU3B
 bOuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtCdRa8SvNYpHRFf2J9XPKL+g40L1HEz4KoLVMU6kcNdBvD8u/Dus0u0WoligHCOQGYDX1jatFBQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylEgJSLKpKX6QbISEaa3ERfUHRfe9lc+XZw3AcMKY5UzbeCTrA
 RUz4Q2wlkAuTHL6nltaG0TJozG6nsaZZV4MC5zIgZeR/GgoIBMtjoKcqcE1+adGZ8di+z/pZ3G4
 D9NzOL0LxBi6inkVwQGy6UkiGJFhD7VBkvbdjHkteDsZy56ZeNut+wnDPoXb/nSXgwNUaM4ITIk
 DjOytTq0ATBOHGYqSDR+3nbABULOG8Gp4yV1+U5/Z8ECeQ
X-Gm-Gg: ATEYQzwGygR4kAQ0pGXe4CHQBUXmxWSV4prymE1/6bmc+8VIpVhm494yaCea6Unm31b
 EJ9kMqeYLszwFZ5gNnd2A075Y95+oWgOZM3jLGhAqJEUnG7N7TMyH0dzoY8OqfK5mll4yIqHtNB
 CNP27l4fYahvasDnUPGqCzmhep43c4ygf3hz2YW2x0eWlNkbdxKrbFzeqHhZIDl2//5Wj1U193/
 g==
X-Received: by 2002:a05:690e:b4b:b0:64c:cfae:a9c4 with SMTP id
 956f58d0204a3-64cedbb766amr1502460d50.15.1772549245639; 
 Tue, 03 Mar 2026 06:47:25 -0800 (PST)
X-Received: by 2002:a05:690e:b4b:b0:64c:cfae:a9c4 with SMTP id
 956f58d0204a3-64cedbb766amr1502428d50.15.1772549245221; Tue, 03 Mar 2026
 06:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com>
 <20260303-rigorous-cow-of-saturation-23f87b@houat>
In-Reply-To: <20260303-rigorous-cow-of-saturation-23f87b@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 3 Mar 2026 15:47:14 +0100
X-Gm-Features: AaiRm519G2sejRBJyA3Xs8Zi4JtzQv5MBBjaKxQXlykPb9RAYNkCbJ50N8lMMy0
Message-ID: <CADSE00+jCZSHi=OLbmOebBwnue5tjG7AFPKN76CbYDWYBcP+AA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, echanude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EvVk0MqDFxZjLPLpRjNVIXQ3p8m5MX5AlmZwoGVQ_60_1772549246
X-Mimecast-Originator: redhat.com
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
X-Rspamd-Queue-Id: B750F1F1C1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mripard@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:echanude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 2:20=E2=80=AFPM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> Hi,
>
> On Tue, Mar 03, 2026 at 01:33:47PM +0100, Albert Esteve wrote:
> > Add a dma-buf heap for DT coherent reserved-memory
> > (i.e., 'shared-dma-pool' without 'reusable' property),
> > exposing one heap per region for userspace buffers.
> >
> > The heap binds the heap device to each memory region so
> > coherent allocations use the correct dev->dma_mem, and
> > it defers registration until module_init when normal
> > allocators are available.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/dma-buf/dma-heap.c            |   4 +-
> >  drivers/dma-buf/heaps/Kconfig         |   9 +
> >  drivers/dma-buf/heaps/Makefile        |   1 +
> >  drivers/dma-buf/heaps/coherent_heap.c | 426 ++++++++++++++++++++++++++=
++++++++
> >  include/linux/dma-heap.h              |  11 +
> >  include/linux/dma-map-ops.h           |   7 +
> >  6 files changed, 456 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 88189d4e48561..ba87e5ac16ae2 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -390,8 +390,8 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >
> >       heap =3D dma_heap_create(exp_info);
> >       if (IS_ERR(heap)) {
> > -             pr_err("dma_heap: failed to create heap (%d)\n", PTR_ERR(=
heap));
> > -             return PTR_ERR(heap);
> > +             pr_err("dma_heap: failed to create heap (%ld)\n", PTR_ERR=
(heap));
> > +             return ERR_CAST(heap);
>
> This looks unrelated and should possibly be squashed into the previous
> patch that introduces dma_heap_create()?
>
> > +static int coherent_heap_init_dma_mask(struct device *dev)
> > +{
> > +     int ret;
> > +
> > +     ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
> > +     if (!ret)
> > +             return 0;
> > +
> > +     /* Fallback to 32-bit DMA mask */
> > +     return dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > +}
>
> Why do you need to mess with the DMA mask? I'd expect that device to be
> able to access everything.

When I tested I was getting: "reserved memory is beyond device's set
DMA address range", so I tested if it was fixed with
dma_coerce_mask_and_coherent() and/or dma_set_mask_coherent(). I did
not debug the value of coherent_dma_mask, but given the error I assume
it was not set properly? Ultimately, using the 64 bit mask fixed it,
and I added a 32-bit fallback to ensure support for 32-bit systems.

>
> > +static int __coherent_heap_register(struct reserved_mem *rmem)
> > +{
> > +     struct dma_heap_export_info exp_info;
> > +     struct coherent_heap *coh_heap;
> > +     struct device *heap_dev;
> > +     int ret;
> > +
> > +     if (!rmem || !rmem->name)
> > +             return -EINVAL;
> > +
> > +     coh_heap =3D kzalloc_obj(*coh_heap);
> > +     if (!coh_heap)
> > +             return -ENOMEM;
> > +
> > +     coh_heap->rmem =3D rmem;
> > +     coh_heap->name =3D kstrdup(rmem->name, GFP_KERNEL);
> > +     if (!coh_heap->name) {
> > +             ret =3D -ENOMEM;
> > +             goto free_coherent_heap;
> > +     }
> > +
> > +     exp_info.name =3D coh_heap->name;
> > +     exp_info.ops =3D &coherent_heap_ops;
> > +     exp_info.priv =3D coh_heap;
> > +
> > +     coh_heap->heap =3D dma_heap_create(&exp_info);
> > +     if (IS_ERR(coh_heap->heap)) {
> > +             ret =3D PTR_ERR(coh_heap->heap);
> > +             goto free_name;
> > +     }
> > +
> > +     heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> > +     ret =3D coherent_heap_init_dma_mask(heap_dev);
> > +     if (ret) {
> > +             pr_err("coherent_heap: failed to set DMA mask (%d)\n", re=
t);
> > +             goto destroy_heap;
> > +     }
> > +
> > +     ret =3D of_reserved_mem_device_init_with_mem(heap_dev, rmem);
> > +     if (ret) {
> > +             pr_err("coherent_heap: failed to initialize memory (%d)\n=
", ret);
> > +             goto destroy_heap;
> > +     }
> > +
> > +     ret =3D dma_heap_register(coh_heap->heap);
> > +     if (ret) {
> > +             pr_err("coherent_heap: failed to register heap (%d)\n", r=
et);
> > +             goto destroy_heap;
> > +     }
>
> I guess it's more of a comment about your previous patch, but it's not
> clear to me why you needed to split dma_heap_add into dma_heap_create /
> _register. Can you expand a bit?

So first I tried to just use dma_heap_add() and then use the heap_dev
afterward to call of_reserved_mem_device_init_with_mem(), but if that
call failed, the error path required some kind dma_heap_remove()
function as the heap was already registered by then.

In the CMA heap for example, dma_heap_add() is invoked at the end of
the `init` function. Therefore, you do not have this issue, if it
failed it means the heap was not added and you just need to clean
everything else.

However, performing a remove() does not sound like something that can
be done safely. I've spent some time thinking on alternatives, but
splitting felt the best pattern.

This way I can:
1. Create the device
2. Call of_reserved_mem_device_init_with_mem
3. Register the heap

This places registration at the end, making every error path and
cleanup easy to handle.

Also, the `dma_heap_add()` code already seemed to handle these two
parts/phases implicitly with device_create(), so splitting felt
architecturally sound.

>
> > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > index 1b0ea43ba66c3..77e6cb66ffce1 100644
> > --- a/include/linux/dma-heap.h
> > +++ b/include/linux/dma-heap.h
> > @@ -9,10 +9,12 @@
> >  #ifndef _DMA_HEAPS_H
> >  #define _DMA_HEAPS_H
> >
> > +#include <linux/errno.h>
> >  #include <linux/types.h>
> >
> >  struct dma_heap;
> >  struct device;
> > +struct reserved_mem;
> >
> >  /**
> >   * struct dma_heap_ops - ops to operate on a given heap
> > @@ -53,4 +55,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_=
export_info *exp_info);
> >
> >  extern bool mem_accounting;
> >
> > +#if IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)
> > +int dma_heap_coherent_register(struct reserved_mem *rmem);
> > +#else
> > +static inline int dma_heap_coherent_register(struct reserved_mem *rmem=
)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +#endif
> > +
> >  #endif /* _DMA_HEAPS_H */
>
> Do you still need that now that you switched to an iterator-like
> function?
>
> > diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> > index 60b63756df821..c87e5e44e5383 100644
> > --- a/include/linux/dma-map-ops.h
> > +++ b/include/linux/dma-map-ops.h
> > @@ -12,6 +12,7 @@
> >
> >  struct cma;
> >  struct iommu_ops;
> > +struct reserved_mem;
> >
> >  struct dma_map_ops {
> >       void *(*alloc)(struct device *dev, size_t size,
> > @@ -161,6 +162,7 @@ int dma_alloc_from_dev_coherent(struct device *dev,=
 ssize_t size,
> >  int dma_release_from_dev_coherent(struct device *dev, int order, void =
*vaddr);
> >  int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_stru=
ct *vma,
> >               void *cpu_addr, size_t size, int *ret);
> > +struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx=
);
> >  #else
> >  static inline int dma_declare_coherent_memory(struct device *dev,
> >               phys_addr_t phys_addr, dma_addr_t device_addr, size_t siz=
e)
> > @@ -172,6 +174,11 @@ static inline int dma_declare_coherent_memory(stru=
ct device *dev,
> >  #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
> >  #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
> >  static inline void dma_release_coherent_memory(struct device *dev) { }
> > +static inline
> > +struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx=
)
> > +{
> > +     return NULL;
> > +}
> >  #endif /* CONFIG_DMA_DECLARE_COHERENT */
> >
> >  #ifdef CONFIG_DMA_GLOBAL_POOL
>
> To preserve bisectability, you shouldn't do it that way. Introduce this
> function into a preliminary patch, and then use it in this one.
>
> Maxime

