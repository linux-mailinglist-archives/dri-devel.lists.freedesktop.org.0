Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29EF12F882
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 13:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EE66E2F0;
	Fri,  3 Jan 2020 12:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE126E2F0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:50:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103125042euoutp021e961740165eb8d75b866ff41da03390~mYW2ZPqXw0942109421euoutp02g
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:50:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200103125042euoutp021e961740165eb8d75b866ff41da03390~mYW2ZPqXw0942109421euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578055842;
 bh=0ZeVM/KjBET1JFzYLjy5seckIDWrndtGfSryu8ihgKs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=cXOpPzu5PFuwE5VlgesZx/LMQ+3nxaqzMw/RLtLvDQBlRmOs7WpWv+mqPs0DdXd6e
 rh44rsDrcQd+zB5ZGStbfkoFVcOarnxojd56FVoZcXVc68ynkvbgMy5JmdnnM/O54b
 rWXvpjqv47MGVBIcb26j+VpQSAtPBVs9wR3OS+dw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103125042eucas1p190d0d109ec05b856726b70e1e36f6719~mYW2SM93B1400814008eucas1p1r;
 Fri,  3 Jan 2020 12:50:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id BB.79.60679.2A83F0E5; Fri,  3
 Jan 2020 12:50:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200103125042eucas1p1bcd7c14d3bdf141992015c37db683b15~mYW1z_Phg1400814008eucas1p1q;
 Fri,  3 Jan 2020 12:50:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200103125042eusmtrp282b436f048fa0636dfab60cc089be734~mYW1zUnIn1566015660eusmtrp2A;
 Fri,  3 Jan 2020 12:50:42 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-a6-5e0f38a29d0d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 50.D6.08375.2A83F0E5; Fri,  3
 Jan 2020 12:50:42 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200103125040eusmtip21c99b86af833f345b01fa301fb31bdd5~mYW0q4G8v2676126761eusmtip2n;
 Fri,  3 Jan 2020 12:50:40 +0000 (GMT)
Subject: Re: [PATCH] omapfb: reduce stack usage
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f1c050c1-7ea8-e735-a552-e988ec3930ce@samsung.com>
Date: Fri, 3 Jan 2020 13:50:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djP87qLLPjjDJ68V7K48vU9m8Xs+49Z
 LGavnMxkcaLvA6vF5V1zgGJL+lksDpyewuzA7rFz1l12j6Mr1zJ53O8+zuTxZdU1Zo/Pm+QC
 WKO4bFJSczLLUov07RK4MhZO/Mde0CJT0b27mamBcYl4FyMnh4SAicT6870sXYxcHEICKxgl
 Oi8cZ4ZwvjBK/Fx/gxXC+cwosfHVK0aYlo+7XkIlljNKLGxbAdXyllFi9fGtYFXCAvoSTU1r
 WEBsEQEDibvrlrKDFDELHGGUeDd3MlgRm4CVxMT2VWA2r4CdxPH5k5hAbBYBFYnNEyeyg9ii
 AhESnx4cZoWoEZQ4OfMJ2FBOAQeJty8ugsWZBcQlbj2ZzwRhy0tsfzsH7CIJgV3sEsumn2eD
 uNtFYsGjf1C2sMSr41vYIWwZif87QZpBGtYxSvzteAHVvZ1RYvlkmA5riTvnfgHZHEArNCXW
 79KHCDtKdH1qZQIJSwjwSdx4KwhxBJ/EpG3TmSHCvBIdbUIQ1WoSG5ZtYINZ27VzJfMERqVZ
 SF6bheSdWUjemYWwdwEjyypG8dTS4tz01GKjvNRyveLE3OLSvHS95PzcTYzARHT63/EvOxh3
 /Uk6xCjAwajEw5ugzB8nxJpYVlyZe4hRgoNZSYS3PJA3Tog3JbGyKrUoP76oNCe1+BCjNAeL
 kjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQZGnwcP2U9/3DuF1yL42ZRFkzJOP1I/EfVznXz3
 46tMrRvFqt9mxdtKCW8Ju8h0r+ATNyNHqL7L5pxHy5b+Mt6h/FSnMET3rEpHmbljd/ly14M+
 9wrvl0TzLjr32qHPXbL4XtsDp6lbwmd5B3b6Cy65GRhgEDTHlnV29/KgFz+ZTaOEds7n0tNW
 YinOSDTUYi4qTgQAc5ndEkADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsVy+t/xe7qLLPjjDGYeZbG48vU9m8Xs+49Z
 LGavnMxkcaLvA6vF5V1zgGJL+lksDpyewuzA7rFz1l12j6Mr1zJ53O8+zuTxZdU1Zo/Pm+QC
 WKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MhZO
 /Mde0CJT0b27mamBcYl4FyMnh4SAicTHXS9Zuxi5OIQEljJKPOl8wN7FyAGUkJE4vr4MokZY
 4s+1LjYQW0jgNaNE3xxDEFtYQF+iqWkNC4gtImAgcXfdUnaQOcwCRxgllm5oYoQYOplR4vGp
 h4wgVWwCVhIT21eB2bwCdhLH509iArFZBFQkNk+cyA5iiwpESBzeMQuqRlDi5MwnYBs4BRwk
 3r64yApiMwuoS/yZd4kZwhaXuPVkPhOELS+x/e0c5gmMQrOQtM9C0jILScssJC0LGFlWMYqk
 lhbnpucWG+oVJ+YWl+al6yXn525iBEbdtmM/N+9gvLQx+BCjAAejEg9vgjJ/nBBrYllxZe4h
 RgkOZiUR3vJA3jgh3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgcmhLySeENTQ3MLS0NzY3Nj
 Mwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYxzjBUnrq722C6dUnuiRWRT17v4Hat2s1k+
 uls/zVv+8vnpQVqTrgeocHm+ji0692/zjSf7hPQ3LWA23e4duoBr/xyLt2I192VcnTkzF1f9
 Vcz9dtv7waawpc80XrQbGjW/zVy02bL46dGVu68HPSw/FL7Q9tLthwdrV/3Q+XD865M5zr0l
 6ypWKbEUZyQaajEXFScCAOw4Q4DQAgAA
X-CMS-MailID: 20200103125042eucas1p1bcd7c14d3bdf141992015c37db683b15
X-Msg-Generator: CA
X-RootMTR: 20191018163010epcas4p1a11973fbca0b3248dae6b5e87cdbf1f3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191018163010epcas4p1a11973fbca0b3248dae6b5e87cdbf1f3
References: <CGME20191018163010epcas4p1a11973fbca0b3248dae6b5e87cdbf1f3@epcas4p1.samsung.com>
 <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Ladislav Michl <ladis@linux-mips.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/18/19 6:30 PM, Sudip Mukherjee wrote:
> The build of xtensa allmodconfig is giving a warning of:
> In function 'dsi_dump_dsidev_irqs':
> warning: the frame size of 1120 bytes is larger than 1024 bytes
> 
> Allocate the memory for 'struct dsi_irq_stats' dynamically instead
> of assigning it in stack.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> index d620376216e1..43402467bf40 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -1536,22 +1536,25 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
>  {
>  	struct dsi_data *dsi = dsi_get_dsidrv_data(dsidev);
>  	unsigned long flags;
> -	struct dsi_irq_stats stats;
> +	struct dsi_irq_stats *stats;
>  
> +	stats = kmalloc(sizeof(*stats), GFP_KERNEL);
> +	if (!stats)
> +		return;
>  	spin_lock_irqsave(&dsi->irq_stats_lock, flags);
>  
> -	stats = dsi->irq_stats;
> +	memcpy(stats, &dsi->irq_stats, sizeof(*stats));

"stats" copy is only needed for generating debugfs information.

We can probably reduce the stack usage and also simplify the driver
by just accessing dsi->irq_stats directly before cleaning it
(we would also need to extend coverage of spinlock but the code is
debug only so this should not be a problem).

Care to try this approach?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

>  	memset(&dsi->irq_stats, 0, sizeof(dsi->irq_stats));
>  	dsi->irq_stats.last_reset = jiffies;
>  
>  	spin_unlock_irqrestore(&dsi->irq_stats_lock, flags);
>  
>  	seq_printf(s, "period %u ms\n",
> -			jiffies_to_msecs(jiffies - stats.last_reset));
> +			jiffies_to_msecs(jiffies - stats->last_reset));
>  
> -	seq_printf(s, "irqs %d\n", stats.irq_count);
> +	seq_printf(s, "irqs %d\n", stats->irq_count);
>  #define PIS(x) \
> -	seq_printf(s, "%-20s %10d\n", #x, stats.dsi_irqs[ffs(DSI_IRQ_##x)-1]);
> +	seq_printf(s, "%-20s %10d\n", #x, stats->dsi_irqs[ffs(DSI_IRQ_##x)-1]);
>  
>  	seq_printf(s, "-- DSI%d interrupts --\n", dsi->module_id + 1);
>  	PIS(VC0);
> @@ -1575,10 +1578,10 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
>  
>  #define PIS(x) \
>  	seq_printf(s, "%-20s %10d %10d %10d %10d\n", #x, \
> -			stats.vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
> -			stats.vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
> -			stats.vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
> -			stats.vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
> +			stats->vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
> +			stats->vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
> +			stats->vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
> +			stats->vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
>  
>  	seq_printf(s, "-- VC interrupts --\n");
>  	PIS(CS);
> @@ -1594,7 +1597,7 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
>  
>  #define PIS(x) \
>  	seq_printf(s, "%-20s %10d\n", #x, \
> -			stats.cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
> +			stats->cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
>  
>  	seq_printf(s, "-- CIO interrupts --\n");
>  	PIS(ERRSYNCESC1);
> @@ -1618,6 +1621,7 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
>  	PIS(ULPSACTIVENOT_ALL0);
>  	PIS(ULPSACTIVENOT_ALL1);
>  #undef PIS
> +	kfree(stats);
>  }
>  
>  static void dsi1_dump_irqs(struct seq_file *s)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
