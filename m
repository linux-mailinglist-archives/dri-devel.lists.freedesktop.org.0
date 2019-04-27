Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE0FDCDA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78103891E2;
	Mon, 29 Apr 2019 07:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E754D88F61;
 Sat, 27 Apr 2019 00:01:14 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 814496086B; Sat, 27 Apr 2019 00:01:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from lmark-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: lmark@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BA46E607CA;
 Sat, 27 Apr 2019 00:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BA46E607CA
From: Liam Mark <lmark@codeaurora.org>
To: ckoenig.leichtzumerken@gmail.com
Subject: [PATCH 01/12] dma-buf: add dynamic caching of sg_table
Date: Fri, 26 Apr 2019 17:01:09 -0700
Message-Id: <1556323269-19670-1-git-send-email-lmark@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20190416183841.1577-1-christian.koenig@amd.com>
References: <20190416183841.1577-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Apr 2019 07:28:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1556323274;
 bh=F9CGa1Jb2BIbUCAdHSZn16z6iMU0C8BjBM1CfdG9Eq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FAGEYtkFc5dOVwHcmJJ98hSwBOLXgeDsS8tL1n4kkhHr+6bx6yPOe9Yg8YheRUtpJ
 vzSteCyWdTcCTiNRbkcLuod3cdYefNgywkqmrKAApK9l/u56HnhsJLVIxkeerM0uZn
 u8YrW4O5Wd2JP9jw0rRgbecULmkPY9Yff3Big+24=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1556323274;
 bh=F9CGa1Jb2BIbUCAdHSZn16z6iMU0C8BjBM1CfdG9Eq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FAGEYtkFc5dOVwHcmJJ98hSwBOLXgeDsS8tL1n4kkhHr+6bx6yPOe9Yg8YheRUtpJ
 vzSteCyWdTcCTiNRbkcLuod3cdYefNgywkqmrKAApK9l/u56HnhsJLVIxkeerM0uZn
 u8YrW4O5Wd2JP9jw0rRgbecULmkPY9Yff3Big+24=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=lmark@codeaurora.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: lmark@codeaurora.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0543180853=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0543180853==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Tue, 16 Apr 2019, Christian König wrote:

> To allow a smooth transition from pinning buffer objects to dynamic
> invalidation we first start to cache the sg_table for an attachment
> unless the driver explicitly says to not do so.
> 
> ---
>  drivers/dma-buf/dma-buf.c | 24 ++++++++++++++++++++++++
>  include/linux/dma-buf.h   | 11 +++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 7c858020d14b..65161a82d4d5 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -573,6 +573,20 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  	list_add(&attach->node, &dmabuf->attachments);
>  
>  	mutex_unlock(&dmabuf->lock);
> +
> +	if (!dmabuf->ops->dynamic_sgt_mapping) {
> +		struct sg_table *sgt;
> +
> +		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
> +		if (!sgt)
> +			sgt = ERR_PTR(-ENOMEM);
> +		if (IS_ERR(sgt)) {
> +			dma_buf_detach(dmabuf, attach);
> +			return ERR_CAST(sgt);
> +		}
> +		attach->sgt = sgt;
> +	}
> +
>  	return attach;
>  
>  err_attach:
> @@ -595,6 +609,10 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  	if (WARN_ON(!dmabuf || !attach))
>  		return;
>  
> +	if (attach->sgt)
> +		dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
> +					   DMA_BIDIRECTIONAL);
> +
>  	mutex_lock(&dmabuf->lock);
>  	list_del(&attach->node);
>  	if (dmabuf->ops->detach)
> @@ -630,6 +648,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  	if (WARN_ON(!attach || !attach->dmabuf))
>  		return ERR_PTR(-EINVAL);
>  
> +	if (attach->sgt)
> +		return attach->sgt;
> +

I am concerned by this change to make caching the sg_table the default 
behavior as this will result in the exporter's map_dma_buf/unmap_dma_buf 
calls are no longer being called in 
dma_buf_map_attachment/dma_buf_unmap_attachment.
	
This seems concerning to me as it appears to ignore the cache maintenance 
aspect of the map_dma_buf/unmap_dma_buf calls.
For example won't this potentially cause issues for clients of ION.

If we had the following
- #1 dma_buf_attach coherent_device
- #2 dma_buf attach non_coherent_device
- #3 dma_buf_map_attachment non_coherent_device
- #4 non_coherent_device writes to buffer
- #5 dma_buf_unmap_attachment non_coherent_device
- #6 dma_buf_map_attachment coherent_device
- #7 coherent_device reads buffer
- #8 dma_buf_unmap_attachment coherent_device	

There wouldn't be any CMO at step #5 anymore (specifically no invalidate) 
so now at step #7 the coherent_device could read a stale cache line.

Also, now by default dma_buf_unmap_attachment no longer removes the 
mappings from the iommu, so now by default dma_buf_unmap_attachment is not 
doing what I would expect and clients are losing the potential sandboxing 
benefits of removing the mappings.
Shouldn't this caching behavior be something that clients opt into instead 
of being the default?

Liam

Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project


--===============0543180853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0543180853==--
