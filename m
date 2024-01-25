Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4860383CA9B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 19:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B54910E5D1;
	Thu, 25 Jan 2024 18:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD5710E5D1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 18:11:15 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-55d095e6ab5so180163a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 10:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706206214; x=1706811014; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tOrqes/9yVROTQ69tGyE0dsjLuB7wrcHht59zsTqBI=;
 b=d6m1+jOjldrbX9U7tIoLUBexsh84c4Tkew72BjRfZvm9ALy9suVe1Za5EgENtLZgdB
 4XqHfpkTRy21xPF/M3zwOifZl6eqinwcOuz3gAYJY1DBUO3KcJOI1Wdveb687cgg0Fxp
 dO6KSPJWbLIL63gt1yR9H8Bny0UNkQBogCcaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706206214; x=1706811014;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5tOrqes/9yVROTQ69tGyE0dsjLuB7wrcHht59zsTqBI=;
 b=aJx7xVz2EmK09MLRFqvXZBWvXDs4A4rlagHzhuoiaT7uX37skuK5E6UQmG7pjph0Ii
 ItjGbwG8xyQAvRUi/hhsWwUGqhQt4bZk2/QyISJMGBIwBxwQzcopBBUT3J8+xjdd6vlo
 jLmV8Au0Lx6cEG0l3WuonHTtvOJN+bWKBbfqOElQ5+njZ7Z9Fp/78EH8fi/6jf6IprUF
 NKExtpWe3swb06mlFNpRfaTjY3G9PAC5BkDbroB/TdkkH55b2uQkR0mQ34/pWlghke/N
 XH3uPCFk6OrKCxaOZskBbWk4Eg6d9CWXrdRV5Rja6V1EDrdbQmVnpGInsW7CRH7EnUMb
 XNug==
X-Gm-Message-State: AOJu0YxkvTA0I6LD6Ts4Tne4I6TqSUuEznZ7xY/xHs/mS4szHeDV8tW8
 GWUoRy2VdXQ/gfOf3aBScJl/KCG5lJIJei70CWTlKeMBB+h0i9sygF7feMQHFtk=
X-Google-Smtp-Source: AGHT+IHiPqW8oQ3VVW2VkOd3YkCZla2B2xfbN2rRDbyJzKzFaaBeBkii2OIRJhk353wOIuVlybUpFg==
X-Received: by 2002:aa7:c595:0:b0:55c:c283:30c6 with SMTP id
 g21-20020aa7c595000000b0055cc28330c6mr63184edq.0.1706206213777; 
 Thu, 25 Jan 2024 10:10:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 fj9-20020a0564022b8900b00559cb738c1bsm10748896edb.4.2024.01.25.10.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 10:10:13 -0800 (PST)
Date: Thu, 25 Jan 2024 19:10:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/6] dma-buf: Add dma_buf_{begin,end}_access()
Message-ID: <ZbKkA68PuekJGIrP@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119141402.44262-2-paul@crapouillou.net>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 03:13:57PM +0100, Paul Cercueil wrote:
> These functions should be used by device drivers when they start and
> stop accessing the data of DMABUF. It allows DMABUF importers to cache
> the dma_buf_attachment while ensuring that the data they want to access
> is available for their device when the DMA transfers take place.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Putting my detailed review comments here just so I don't have to remember
them any longer. We need to reach consensus on the big picture direction
first.

> 
> ---
> v5: New patch
> ---
>  drivers/dma-buf/dma-buf.c | 66 +++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-buf.h   | 37 ++++++++++++++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8fe5aa67b167..a8bab6c18fcd 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -830,6 +830,8 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>   *     - dma_buf_mmap()
>   *     - dma_buf_begin_cpu_access()
>   *     - dma_buf_end_cpu_access()
> + *     - dma_buf_begin_access()
> + *     - dma_buf_end_access()
>   *     - dma_buf_map_attachment_unlocked()
>   *     - dma_buf_unmap_attachment_unlocked()
>   *     - dma_buf_vmap_unlocked()
> @@ -1602,6 +1604,70 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
>  
> +/**
> + * @dma_buf_begin_access - Call before any hardware access from/to the DMABUF
> + * @attach:	[in]	attachment used for hardware access
> + * @sg_table:	[in]	scatterlist used for the DMA transfer
> + * @direction:  [in]    direction of DMA transfer

I think for the kerneldoc would be good to point at the other function
here, explain why this might be needed and that for most reasonable
devices it's probably not, and link between the function pairs.

Also we need to document that dma_buf_map does an implied
dma_buf_begin_access (because dma_sg_map does an implied
dma_sg_sync_for_device) and vice versa for dma_buf_end_access. Which also
means that dma_buf_map/unmap should link to these functions in their
kerneldoc too.

Finally I think we should document here that it's ok to call these from
dma_fence signalling critical section and link to the relevant discussion
in the dma_fence docs for that.

> + */
> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
> +			 struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	struct dma_buf *dmabuf;
> +	bool cookie;
> +	int ret;
> +
> +	if (WARN_ON(!attach))
> +		return -EINVAL;
> +
> +	dmabuf = attach->dmabuf;
> +
> +	if (!dmabuf->ops->begin_access)
> +		return 0;
> +
> +	cookie = dma_fence_begin_signalling();
> +	ret = dmabuf->ops->begin_access(attach, sgt, dir);
> +	dma_fence_end_signalling(cookie);
> +
> +	if (WARN_ON_ONCE(ret))
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);

So explicit device side coherency management is not going to be very
compatible with dynamic buffer managament where the exporter can move the
buffer around. The reason for that is that for a dynamic exporter we cache
the sg mapping, which means any device-side coherency management which
dma_buf_map/unmap would do will not happen (since it's cached),
potentially breaking things for importers that rely on the assumption that
dma_buf_map/unmap already implies dma_buf_begin/end_device_access.

I think for now it's sufficient to put a WARN_ON(dma_buf_is_dymamic() &&
ops->begin|end_access) or similar into dma_buf_export and bail out with an
error to catch that.

Aside from the nits I do think this is roughly what we brievely discussed
well over a decade ago in the original dma-buf kickoff meeting at a linaro
connect in Budapest :-)

Cheers, Sima

> +
> +/**
> + * @dma_buf_end_access - Call after any hardware access from/to the DMABUF
> + * @attach:	[in]	attachment used for hardware access
> + * @sg_table:	[in]	scatterlist used for the DMA transfer
> + * @direction:  [in]    direction of DMA transfer
> + */
> +int dma_buf_end_access(struct dma_buf_attachment *attach,
> +		       struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	struct dma_buf *dmabuf;
> +	bool cookie;
> +	int ret;
> +
> +	if (WARN_ON(!attach))
> +		return -EINVAL;
> +
> +	dmabuf = attach->dmabuf;
> +
> +	if (!dmabuf->ops->end_access)
> +		return 0;
> +
> +	cookie = dma_fence_begin_signalling();
> +	ret = dmabuf->ops->end_access(attach, sgt, dir);
> +	dma_fence_end_signalling(cookie);
> +
> +	if (WARN_ON_ONCE(ret))
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 8ff4add71f88..8ba612c7cc16 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -246,6 +246,38 @@ struct dma_buf_ops {
>  	 */
>  	int (*end_cpu_access)(struct dma_buf *, enum dma_data_direction);
>  
> +	/**
> +	 * @begin_access:
> +	 *
> +	 * This is called from dma_buf_begin_access() when a device driver
> +	 * wants to access the data of the DMABUF. The exporter can use this
> +	 * to flush/sync the caches if needed.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
> +	int (*begin_access)(struct dma_buf_attachment *, struct sg_table *,
> +			    enum dma_data_direction);
> +
> +	/**
> +	 * @end_access:
> +	 *
> +	 * This is called from dma_buf_end_access() when a device driver is
> +	 * done accessing the data of the DMABUF. The exporter can use this
> +	 * to flush/sync the caches if needed.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
> +	int (*end_access)(struct dma_buf_attachment *, struct sg_table *,
> +			  enum dma_data_direction);
> +
>  	/**
>  	 * @mmap:
>  	 *
> @@ -606,6 +638,11 @@ void dma_buf_detach(struct dma_buf *dmabuf,
>  int dma_buf_pin(struct dma_buf_attachment *attach);
>  void dma_buf_unpin(struct dma_buf_attachment *attach);
>  
> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
> +			 struct sg_table *sgt, enum dma_data_direction dir);
> +int dma_buf_end_access(struct dma_buf_attachment *attach,
> +		       struct sg_table *sgt, enum dma_data_direction dir);
> +
>  struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
>  
>  int dma_buf_fd(struct dma_buf *dmabuf, int flags);
> -- 
> 2.43.0
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
