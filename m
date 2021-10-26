Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE743ADC4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 10:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2430889B83;
	Tue, 26 Oct 2021 08:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77F56E40A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 08:04:49 +0000 (UTC)
X-UUID: a06a541a01624b4490537ec3abd7a2c1-20211026
X-UUID: a06a541a01624b4490537ec3abd7a2c1-20211026
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1877048041; Tue, 26 Oct 2021 16:04:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Oct 2021 16:04:45 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 26 Oct 2021 16:04:44 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>, <sumit.semwal@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <rdunlap@infradead.org>, <wsd_upstream@mediatek.com>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: [PATCH v3] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date: Tue, 26 Oct 2021 16:04:51 +0800
Message-ID: <20211026080451.3763-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211014102551.54983-1-guangming.cao@mediatek.com>
References: <20211014102551.54983-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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

From: Guangming Cao <Guangming.Cao@mediatek.com>

On Thu, 2021-10-14 at 18:25 +0800, guangming.cao@mediatek.com wrote:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> In this patch(https://patchwork.freedesktop.org/patch/310349),
> it add a new IOCTL to support dma-buf user to set debug name.
> 
> But it also added a limitation of this IOCTL, it needs the
> attachments of dmabuf should be empty, otherwise it will fail.
> 
> For the original series, the idea was that allowing name change
> mid-use could confuse the users about the dma-buf.
> However, the rest of the series also makes sure each dma-buf have a
> unique
> inode(https://patchwork.freedesktop.org/patch/310387/), and any
> accounting
> should probably use that, without relying on the name as much.
> 
> So, removing this restriction will let dma-buf userspace users to use
> it
> more comfortably and without any side effect.
> 
Hi christian, sumit,

Just a gentle ping for this patch, please kindly let me know your comments about this patch.
Thanks!

Guangming

> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/dma-buf.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..5fbb3a2068a3 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file,
> poll_table *poll)
>  
>  /**
>   * dma_buf_set_name - Set a name to a specific dma_buf to track the
> usage.
> - * The name of the dma-buf buffer can only be set when the dma-buf
> is not
> - * attached to any devices. It could theoritically support changing
> the
> - * name of the dma-buf if the same piece of memory is used for
> multiple
> - * purpose between different devices.
> + * It could support changing the name of the dma-buf if the same
> + * piece of memory is used for multiple purpose between different
> devices.
>   *
>   * @dmabuf: [in]     dmabuf buffer that will be renamed.
>   * @buf:    [in]     A piece of userspace memory that contains the
> name of
> @@ -341,25 +339,16 @@ static __poll_t dma_buf_poll(struct file *file,
> poll_table *poll)
>  static long dma_buf_set_name(struct dma_buf *dmabuf, const char
> __user *buf)
>  {
>  	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
> -	long ret = 0;
>  
>  	if (IS_ERR(name))
>  		return PTR_ERR(name);
>  
> -	dma_resv_lock(dmabuf->resv, NULL);
> -	if (!list_empty(&dmabuf->attachments)) {
> -		ret = -EBUSY;
> -		kfree(name);
> -		goto out_unlock;
> -	}
>  	spin_lock(&dmabuf->name_lock);
>  	kfree(dmabuf->name);
>  	dmabuf->name = name;
>  	spin_unlock(&dmabuf->name_lock);
>  
> -out_unlock:
> -	dma_resv_unlock(dmabuf->resv);
> -	return ret;
> +	return 0;
>  }
>  
>  static long dma_buf_ioctl(struct file *file,
