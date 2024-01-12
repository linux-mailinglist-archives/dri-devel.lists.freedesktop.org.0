Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8422482BD9C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05FF10E107;
	Fri, 12 Jan 2024 09:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093A10E109
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:49:07 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-557678c50feso1379782a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705052946; x=1705657746; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=us7FlGdER6e8HJOcJ9DbE8FEDZwENOAoyDuutoH2bnc=;
 b=i44ivCbR/YuY9z0M6v0S6NJu9uQ9RayoibSUTlbcMhn9vHeQXTIzNymkayYbZdiZk5
 F7gJ6vkFp0FD7dUDcOKFDnBLs2SXf3INJAkrA14oS4c3JZzZX6NEmrlUlyBh7bMGf7GS
 DHSSgbY850gmU+ee/jPLF/jNqP5ImTaA3j8Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705052946; x=1705657746;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=us7FlGdER6e8HJOcJ9DbE8FEDZwENOAoyDuutoH2bnc=;
 b=so0/IxxCnBmrOuzlGL9D4AtixhAWSjK2RyGvD3aspxsbrARxtMz7xLCsWdkkwxN8ym
 zndBaEVPvXHsV0ZCIfsoBYw6eYY6ZwXucUaqmhvcpjM1LgYldNc0pb6A5XWr3UHX3uN4
 Gg8RiUTQB/43ASNifQneZ7tP0r851RuotYQtug1fESMQ97XPCkHRqiekEPlonhr2njgP
 dt957xBmC20N6mtBTBy4yuwbwBHIhasUD3xgkkPL/10qS/SO0bD36Bd+V2KqH8q1kecm
 eEpbc4n8I8qbViUr2CSyujxvIXIEpFncvi9KkE8vUC2/+D4REpDgcWDx7TTEeqo+2m7/
 Mt0A==
X-Gm-Message-State: AOJu0YyI4TWzs2HqhHeeiEe1swqZolEZwpR5QvqFPjkxYL8IGt3CQ5YD
 /E8+1xQmMgHNefJvJRS6uxVdgraFL/blvg==
X-Google-Smtp-Source: AGHT+IEOiq3FXhd4T4HCBcGkiMyRtMKljt8lxwRBUf3NerLJ5gdqm06t+lKy82F5LT4WBLgvMEXbXw==
X-Received: by 2002:a05:6402:148d:b0:557:4249:44 with SMTP id
 e13-20020a056402148d00b0055742490044mr760113edv.1.1705052946272; 
 Fri, 12 Jan 2024 01:49:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 dh19-20020a0564021d3300b00557332d657fsm1610937edb.39.2024.01.12.01.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:49:05 -0800 (PST)
Date: Fri, 12 Jan 2024 10:49:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Pavel Machek <pavel@ucw.cz>, Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 4/7] dma-buf: heaps: restricted_heap: Add dma_ops
Message-ID: <ZaELD4APVuX4p77P@phenom.ffwll.local>
Mail-Followup-To: Yong Wu <yong.wu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Pavel Machek <pavel@ucw.cz>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org,
 Pekka Paalanen <ppaalanen@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-5-yong.wu@mediatek.com>
 <ZaEJOjXP2EJIe9rK@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZaEJOjXP2EJIe9rK@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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

On Fri, Jan 12, 2024 at 10:41:14AM +0100, Daniel Vetter wrote:
> On Fri, Jan 12, 2024 at 05:20:11PM +0800, Yong Wu wrote:
> > Add the dma_ops for this restricted heap. For restricted buffer,
> > cache_ops/mmap are not allowed, thus return EPERM for them.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/dma-buf/heaps/restricted_heap.c | 103 ++++++++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
> > index 8c266a0f6192..ec4c63d2112d 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.c
> > +++ b/drivers/dma-buf/heaps/restricted_heap.c
> > @@ -12,6 +12,10 @@
> >  
> >  #include "restricted_heap.h"
> >  
> > +struct restricted_heap_attachment {
> > +	struct sg_table			*table;
> > +};
> > +
> >  static int
> >  restricted_heap_memory_allocate(struct restricted_heap *heap, struct restricted_buffer *buf)
> >  {
> > @@ -45,6 +49,104 @@ restricted_heap_memory_free(struct restricted_heap *heap, struct restricted_buff
> >  	ops->memory_free(heap, buf);
> >  }
> >  
> > +static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
> > +{
> > +	struct restricted_buffer *restricted_buf = dmabuf->priv;
> > +	struct restricted_heap_attachment *a;
> > +	struct sg_table *table;
> > +	int ret;
> > +
> > +	a = kzalloc(sizeof(*a), GFP_KERNEL);
> > +	if (!a)
> > +		return -ENOMEM;
> > +
> > +	table = kzalloc(sizeof(*table), GFP_KERNEL);
> > +	if (!table) {
> > +		ret = -ENOMEM;
> > +		goto err_free_attach;
> > +	}
> > +
> > +	ret = sg_alloc_table(table, 1, GFP_KERNEL);
> > +	if (ret)
> > +		goto err_free_sgt;
> > +	sg_set_page(table->sgl, NULL, restricted_buf->size, 0);
> 
> So this is definitely broken and violating the dma-buf api rules. You
> cannot let attach succed and supply a dummy/invalid sg table.
> 
> Two options:
> 
> - Reject ->attach for all this buffers with -EBUSY and provide instead a
>   private api for these secure buffers, similar to how virtio_dma_buf has
>   private virto-specific apis. This interface would need to be
>   standardized across all arm TEE users, so that we don't have a
>   disastrous proliferation of apis.
> 
> - Allow ->attach, but _only_ for drivers/devices which can access the
>   secure buffer correctly, and only if you can put the right secure buffer
>   address into the sg table directly. If dma to a secure buffer for a
>   given struct device * will not work correctly (i.e. without data
>   corruption), you _must_ reject the attach attempt with -EBUSY.
> 
> The 2nd approach would be my preferred one, if it's technically possible.
> 
> Also my understanding is that arm TEE is standardized, so I think we'll at
> least want some acks from other soc people whether this will work for them
> too.
> 
> Finally the usual drill:
> - this also needs the driver side support, if there's any changes needed.
>   Just the new heap isn't enough.

Ok I quickly scrolled through your drm patches and that confirms that the
current dma-buf interface you're implementing is just completely breaking
the api. And you need to paper over that will all kinds of very icky
special-casing.

So definitely need to rethink the overall design between dma-buf heaps and
drivers here.
-Sima

> - and for drm you need open userspace for this. Doesn't have to be the
>   full content protection decode pipeline, the drivers in drm that landed
>   secure buffer support thus far enabled it using the
>   EGL_EXT_protected_content extension using gl, which side steps all the
>   complications around content decryption keys and support
> 
> Cheers, Sima
> 
> > +
> > +	a->table = table;
> > +	attachment->priv = a;
> > +
> > +	return 0;
> > +
> > +err_free_sgt:
> > +	kfree(table);
> > +err_free_attach:
> > +	kfree(a);
> > +	return ret;
> > +}
> > +
> > +static void restricted_heap_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
> > +{
> > +	struct restricted_heap_attachment *a = attachment->priv;
> > +
> > +	sg_free_table(a->table);
> > +	kfree(a->table);
> > +	kfree(a);
> > +}
> > +
> > +static struct sg_table *
> > +restricted_heap_map_dma_buf(struct dma_buf_attachment *attachment, enum dma_data_direction direct)
> > +{
> > +	struct restricted_heap_attachment *a = attachment->priv;
> > +	struct sg_table *table = a->table;
> > +
> > +	return table;
> > +}
> > +
> > +static void
> > +restricted_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_table *table,
> > +			      enum dma_data_direction direction)
> > +{
> > +	struct restricted_heap_attachment *a = attachment->priv;
> > +
> > +	WARN_ON(a->table != table);
> > +}
> > +
> > +static int
> > +restricted_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static int
> > +restricted_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static int restricted_heap_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static void restricted_heap_free(struct dma_buf *dmabuf)
> > +{
> > +	struct restricted_buffer *restricted_buf = dmabuf->priv;
> > +	struct restricted_heap *heap = dma_heap_get_drvdata(restricted_buf->heap);
> > +
> > +	restricted_heap_memory_free(heap, restricted_buf);
> > +	kfree(restricted_buf);
> > +}
> > +
> > +static const struct dma_buf_ops restricted_heap_buf_ops = {
> > +	.attach		= restricted_heap_attach,
> > +	.detach		= restricted_heap_detach,
> > +	.map_dma_buf	= restricted_heap_map_dma_buf,
> > +	.unmap_dma_buf	= restricted_heap_unmap_dma_buf,
> > +	.begin_cpu_access = restricted_heap_dma_buf_begin_cpu_access,
> > +	.end_cpu_access	= restricted_heap_dma_buf_end_cpu_access,
> > +	.mmap		= restricted_heap_dma_buf_mmap,
> > +	.release	= restricted_heap_free,
> > +};
> > +
> >  static struct dma_buf *
> >  restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
> >  			 unsigned long fd_flags, unsigned long heap_flags)
> > @@ -66,6 +168,7 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
> >  	if (ret)
> >  		goto err_free_buf;
> >  	exp_info.exp_name = dma_heap_get_name(heap);
> > +	exp_info.ops = &restricted_heap_buf_ops;
> >  	exp_info.size = restricted_buf->size;
> >  	exp_info.flags = fd_flags;
> >  	exp_info.priv = restricted_buf;
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
