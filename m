Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89312433628
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782646EC05;
	Tue, 19 Oct 2021 12:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86DC6E171
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 12:41:18 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r18so12504019edv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=EHf1d6jYC47N493Pv/6pFABfQdMKx4e8O3xhKroDPbE=;
 b=NyuJgkOEqVr2HgSuFzucrmFl6uCC47sSvbC4sO8TJI5tKjSPUp2CuXuUVzlYed/0Wd
 UuwdEFSyvQRiZn4dT7Vi6Yr2OGeienXD0cr3JRJIZxso6VZBlHhPqR4DRBDUcM22HpyY
 aTuV8ClK37PNqKNrFn6vFa4AlhIToFy9MbcfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=EHf1d6jYC47N493Pv/6pFABfQdMKx4e8O3xhKroDPbE=;
 b=49Bv+8iX1H71SLQ8/u7MH0mKs2cBvc51phq71oLzBox0ycowjLJJMFrOinLjAmeAZ8
 6YlUFE0svus64KjJUJRu/n9oCaqvlUINS178WFZlbKPAN49IT0bK89RyqBhWBdWke9do
 tljNVoGNbVfjt2p0F6kKNbRPv9PuBbxsOpIM0g7PhSqAcBNudNUnsH7/l2vtx+u37CSk
 28OFoc2EMUV1svZJFRBEvRZ5BNXe1Qqwdog/1hy6kLLUW7tOdfz0WC1FnIZzY+PUXCCv
 /7Ez6P2KCl1gAAIlHD3GEGHMqE0g5zMwkXbltbdk+1tLmsi0lDT/ejs0nrBCanDM9mRA
 xOFw==
X-Gm-Message-State: AOAM532xCRX5kRn+xUfwW8A0ZoMx0TH8PSqkBnWIOotABIUd4TuLoF3k
 rPTV0qgeQxj+hkk9r/8VdQTp8V2tJVEfjg==
X-Google-Smtp-Source: ABdhPJx6vSo6OufSaFH9rFLrzmjtgXdXhc8T6jVm1AlxqNyN88YtlQU+itfte1ctjSnqHOIrQwPvAg==
X-Received: by 2002:a05:6402:84d:: with SMTP id
 b13mr54514480edz.110.1634647277354; 
 Tue, 19 Oct 2021 05:41:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p23sm12148807edw.94.2021.10.19.05.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 05:41:16 -0700 (PDT)
Date: Tue, 19 Oct 2021 14:41:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: guangming.cao@mediatek.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH] dma-buf: add attachments empty check for dma_buf_release
Message-ID: <YW686sIZie4xRUQO@phenom.ffwll.local>
Mail-Followup-To: guangming.cao@mediatek.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com
References: <20211019122345.160555-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019122345.160555-1-guangming.cao@mediatek.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Oct 19, 2021 at 08:23:45PM +0800, guangming.cao@mediatek.com wrote:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> Since there is no mandatory inspection for attachments in dma_buf_release.
> There will be a case that dma_buf already released but attachment is still
> in use, which can points to the dmabuf, and it maybe cause
> some unexpected issues.
> 
> With IOMMU, when this cases occurs, there will have IOMMU address
> translation fault(s) followed by this warning,
> I think it's useful for dma devices to debug issue.
> 
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>

This feels a lot like hand-rolling kobject debugging. If you want to do
this then I think adding kobject debug support to
dma_buf/dma_buf_attachment would be better than hand-rolling something
bespoke here.

Also on the patch itself: You don't need the trylock. For correctly
working code non one else can get at the dma-buf, so no locking needed to
iterate through the attachment list. For incorrect code the kernel will be
on fire pretty soon anyway, trying to do locking won't help :-) And
without the trylock we can catch more bugs (e.g. if you also forgot to
unlock and not just forgot to detach).
-Daniel

> ---
>  drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..672404857d6a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -74,6 +74,29 @@ static void dma_buf_release(struct dentry *dentry)
>  	 */
>  	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
>  
> +	/* attachment check */
> +	if (dma_resv_trylock(dmabuf->resv) && WARN(!list_empty(&dmabuf->attachments),
> +	    "%s err, inode:%08lu size:%08zu name:%s exp_name:%s flags:0x%08x mode:0x%08x, %s\n",
> +	    __func__, file_inode(dmabuf->file)->i_ino, dmabuf->size,
> +	    dmabuf->name, dmabuf->exp_name,
> +	    dmabuf->file->f_flags, dmabuf->file->f_mode,
> +	    "Release dmabuf before detach all attachments, dump attach:\n")) {
> +		int attach_cnt = 0;
> +		dma_addr_t dma_addr;
> +		struct dma_buf_attachment *attach_obj;
> +		/* dump all attachment info */
> +		list_for_each_entry(attach_obj, &dmabuf->attachments, node) {
> +			dma_addr = (dma_addr_t)0;
> +			if (attach_obj->sgt)
> +				dma_addr = sg_dma_address(attach_obj->sgt->sgl);
> +			pr_err("attach[%d]: dev:%s dma_addr:0x%-12lx\n",
> +			       attach_cnt, dev_name(attach_obj->dev), dma_addr);
> +			attach_cnt++;
> +		}
> +		pr_err("Total %d devices attached\n\n", attach_cnt);
> +		dma_resv_unlock(dmabuf->resv);
> +	}
> +
>  	dmabuf->ops->release(dmabuf);
>  
>  	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
