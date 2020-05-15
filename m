Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5B91D4A98
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCB289F07;
	Fri, 15 May 2020 10:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0549789F07
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 10:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589537635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jyQOE3+SkaVkSO/7md1YvnjZQrQMGjMiOYyHXoqnMIo=;
 b=e5+0BiSc9mRijO/Gxq8XtYolbQqv+HE5bYS1qZD3gNiSlJkKQLj/WRD/OQ5BN7LH9J7wpT
 s2efR2hJOiMJzV1wn6Isde0eLGTkw1H0m43K2vDXNglAF3Xnz87Q/EdZ7h6Pv/csAo61Tt
 Sr4vCFiSmdzSmJS5ln/OcoSU+d75s20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-w3BMy0_SM1mEjilMgqtsgA-1; Fri, 15 May 2020 06:13:50 -0400
X-MC-Unique: w3BMy0_SM1mEjilMgqtsgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBF8A18FE863;
 Fri, 15 May 2020 10:13:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-145.ams2.redhat.com
 [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A9535F72E;
 Fri, 15 May 2020 10:13:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 484C416E16; Fri, 15 May 2020 12:13:47 +0200 (CEST)
Date: Fri, 15 May 2020 12:13:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5 30/38] dmabuf: fix common struct sg_table related issues
Message-ID: <20200515101347.sbdiriypovujohkm@sirius.home.kraxel.org>
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133318eucas1p1dd6c1ac6a777874c115070d8b5197f34@eucas1p1.samsung.com>
 <20200513133245.6408-30-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513133245.6408-30-m.szyprowski@samsung.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index acb26c6..89e293b 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -63,10 +63,9 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>  					GFP_KERNEL);
>  	if (ret < 0)
>  		goto err;
> -	if (!dma_map_sg(dev, sg->sgl, sg->nents, direction)) {
> -		ret = -EINVAL;
> +	ret = dma_map_sgtable(dev, sg, direction, 0);
> +	if (ret < 0)
>  		goto err;
> -	}
>  	return sg;
>  
>  err:
> @@ -78,7 +77,7 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>  static void put_sg_table(struct device *dev, struct sg_table *sg,
>  			 enum dma_data_direction direction)
>  {
> -	dma_unmap_sg(dev, sg->sgl, sg->nents, direction);
> +	dma_unmap_sgtable(dev, sg, direction, 0);
>  	sg_free_table(sg);
>  	kfree(sg);
>  }

Easy straightforward conversation.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
