Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD0983CD7D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 21:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C518210E248;
	Thu, 25 Jan 2024 20:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D086E10E248
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 20:31:36 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-55d000834dcso213900a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 12:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706214635; x=1706819435; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLwUYXjR6V1ZptUfaHjdXBygjq5la2NuNHiSaIUSLm4=;
 b=ZwKMl+Rhr5Iz049UwITrtJjtLQE8AtKFItgfOIYttoNOjxPegVglvAGiudEFU3uNJS
 eTs90UZV3WciFedQsOA2q1wfOfKZK9vvYjiTdBbw0EfJjjM5bpIRX/AmwSLm2dowsWbK
 YADDj8BXInQ1w82wr8xbPL0Yjd7NzA/PkmTcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706214635; x=1706819435;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fLwUYXjR6V1ZptUfaHjdXBygjq5la2NuNHiSaIUSLm4=;
 b=QCzuV3/hl9RJtIMbcibO+/tnv5iXmgZoa3dj03jX4JYB4GypSW4Dblg9vtsB1oo0AP
 tgrN6DQyj/FUM8wIEaQ4whKtjLQoUi4BqiWyjq4YgU16b9J7jCgOnfNh6HWYDoiFmIGK
 jGY1juZ7bvpCICqeZ4gpil7CzKMaDn5spo6St5imqc2mVghb2dm6W6kUD1zFUyoJZHpS
 q1jwPkHXzY3RHcXI1a3WpsMFtY0/MecFm2I+CmjEYnmTVPF9HNFfGH2XVgVl9kcua3rD
 dgL8X69tnWz3DdIU7htkPAMeaYZBaspzMehl/81XZazOffh/TFVobqdnrUReN+VjTj4x
 KneA==
X-Gm-Message-State: AOJu0Yz12VVszIqYtxywLTQ2FpGj1QKpUbxAlj0djU+r8E1UQEP720A7
 IDHMpzhW2CYw6wif3FNX20BmSVlvxIOxFCf6vKWb03g284Dj4lMZfRH2hEzGeHM=
X-Google-Smtp-Source: AGHT+IGjLsHFOclmZ7s+HWyNGbTWD340yamr9nUQrEdDL92SJyZdmTEbPrGTy0cMfclmD3+5Y2D2qg==
X-Received: by 2002:aa7:d1ce:0:b0:559:c6da:c889 with SMTP id
 g14-20020aa7d1ce000000b00559c6dac889mr263448edp.1.1706214634780; 
 Thu, 25 Jan 2024 12:30:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a056402041900b0055c104274e7sm5770172edv.78.2024.01.25.12.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 12:30:34 -0800 (PST)
Date: Thu, 25 Jan 2024 21:30:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrew Davis <afd@ti.com>
Subject: Re: [Linaro-mm-sig] [PATCH 2/3] udmabuf: Sync buffer mappings for
 attached devices
Message-ID: <ZbLE6FYXFVzTLh28@phenom.ffwll.local>
Mail-Followup-To: Andrew Davis <afd@ti.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20240123221227.868341-1-afd@ti.com>
 <20240123221227.868341-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123221227.868341-2-afd@ti.com>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 04:12:26PM -0600, Andrew Davis wrote:
> Currently this driver creates a SGT table using the CPU as the
> target device, then performs the dma_sync operations against
> that SGT. This is backwards to how DMA-BUFs are supposed to behave.
> This may have worked for the case where these buffers were given
> only back to the same CPU that produced them as in the QEMU case.
> And only then because the original author had the dma_sync
> operations also backwards, syncing for the "device" on begin_cpu.
> This was noticed and "fixed" in this patch[0].
> 
> That then meant we were sync'ing from the CPU to the CPU using
> a pseudo-device "miscdevice". Which then caused another issue
> due to the miscdevice not having a proper DMA mask (and why should
> it, the CPU is not a DMA device). The fix for that was an even
> more egregious hack[1] that declares the CPU is coherent with
> itself and can access its own memory space..
> 
> Unwind all this and perform the correct action by doing the dma_sync
> operations for each device currently attached to the backing buffer.
> 
> [0] commit 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
> [1] commit 9e9fa6a9198b ("udmabuf: Set the DMA mask for the udmabuf device (v2)")
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

So yeah the above hacks are terrible, but I don't think this is better.
What you're doing now is that you're potentially doing the flushing
multiple times, so if you have a lot of importers with life mappings this
is a performance regression.

It's probably time to bite the bullet and teach the dma-api about flushing
for multiple devices. Or some way we can figure out which is the one
device we need to pick which gives us the right amount of flushing.

Cheers, Sima

> ---
>  drivers/dma-buf/udmabuf.c | 41 +++++++++++++++------------------------
>  1 file changed, 16 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 3a23f0a7d112a..ab6764322523c 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -26,8 +26,6 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is
>  struct udmabuf {
>  	pgoff_t pagecount;
>  	struct page **pages;
> -	struct sg_table *sg;
> -	struct miscdevice *device;
>  	struct list_head attachments;
>  	struct mutex lock;
>  };
> @@ -169,12 +167,8 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
>  static void release_udmabuf(struct dma_buf *buf)
>  {
>  	struct udmabuf *ubuf = buf->priv;
> -	struct device *dev = ubuf->device->this_device;
>  	pgoff_t pg;
>  
> -	if (ubuf->sg)
> -		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
> -
>  	for (pg = 0; pg < ubuf->pagecount; pg++)
>  		put_page(ubuf->pages[pg]);
>  	kfree(ubuf->pages);
> @@ -185,33 +179,31 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
>  			     enum dma_data_direction direction)
>  {
>  	struct udmabuf *ubuf = buf->priv;
> -	struct device *dev = ubuf->device->this_device;
> -	int ret = 0;
> -
> -	if (!ubuf->sg) {
> -		ubuf->sg = get_sg_table(dev, buf, direction);
> -		if (IS_ERR(ubuf->sg)) {
> -			ret = PTR_ERR(ubuf->sg);
> -			ubuf->sg = NULL;
> -		}
> -	} else {
> -		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
> -				    direction);
> -	}
> +	struct udmabuf_attachment *a;
>  
> -	return ret;
> +	mutex_lock(&ubuf->lock);
> +
> +	list_for_each_entry(a, &ubuf->attachments, list)
> +		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> +
> +	mutex_unlock(&ubuf->lock);
> +
> +	return 0;
>  }
>  
>  static int end_cpu_udmabuf(struct dma_buf *buf,
>  			   enum dma_data_direction direction)
>  {
>  	struct udmabuf *ubuf = buf->priv;
> -	struct device *dev = ubuf->device->this_device;
> +	struct udmabuf_attachment *a;
>  
> -	if (!ubuf->sg)
> -		return -EINVAL;
> +	mutex_lock(&ubuf->lock);
> +
> +	list_for_each_entry(a, &ubuf->attachments, list)
> +		dma_sync_sgtable_for_device(a->dev, a->table, direction);
> +
> +	mutex_unlock(&ubuf->lock);
>  
> -	dma_sync_sg_for_device(dev, ubuf->sg->sgl, ubuf->sg->nents, direction);
>  	return 0;
>  }
>  
> @@ -307,7 +299,6 @@ static long udmabuf_create(struct miscdevice *device,
>  	exp_info.priv = ubuf;
>  	exp_info.flags = O_RDWR;
>  
> -	ubuf->device = device;
>  	buf = dma_buf_export(&exp_info);
>  	if (IS_ERR(buf)) {
>  		ret = PTR_ERR(buf);
> -- 
> 2.39.2
> 
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
