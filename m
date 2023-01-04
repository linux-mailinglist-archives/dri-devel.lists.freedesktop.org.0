Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC865DC04
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 19:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB010E45C;
	Wed,  4 Jan 2023 18:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21BD10E45C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1672856422; bh=QAtVPb8/maBAbEqyYYU7IL6BXcXNEnFbxuu32oqJJJI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=lnGCVp14IXWc1a0bHW/OxEU36gmLzoKKVgB7Jh3zydP3ngINWML9BsBdOs1FHlJfw
 QdVtB3Ci3uOZvzxcvEMcsECTEe1DZSqYlFHFDP/RMe+NJ/OuZtYiQRFG3O8u6O7rEh
 TCOf8vUACbUD++hWnX06kWF6Dxe5xqDssfD+lGTvZSML47tqUEgtJ/9PTavEpNugqd
 h2OFsttYS+8I7ZoLuARVIfnaBuoGTxjeWuojFb+Kyqz2gc1E5Y8J+DIo4EPyClXihO
 eG33DMa6R0WBjY/Pl1/VlaiXEqTqtFRPOlFYZWEgyD7m6d8WtKgrJLXsFZR4pUBtdq
 kcUjhMJh0ajDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.135.20]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2V0H-1onx0z2eI3-013uIe; Wed, 04
 Jan 2023 19:11:26 +0100
Message-ID: <a187d1a7-fdf4-560f-7b04-7b050adeae26@gmx.de>
Date: Wed, 4 Jan 2023 19:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] fbdev: omapfb: avoid stack overflow warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20221215170234.2515030-1-arnd@kernel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221215170234.2515030-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o7jEKVSLoyMQ1mu2kGuybgdfN422oA9LLfcwWrY3jDvf/72dkTw
 jkaB7DZ6/dKNZJeUACKaGCerZFkZzKeinztdfPrjENYIhQF5e5Tquucglcilg/c9JiTzHiB
 BJS3CcM5hD5LrAliUQML2Mu03+ZCPNd873aeH3FUsmZpAd9q9kRw6HQKSyCeffRnAeZKe1E
 8CeAvs8XdZHlA7/lR+mkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3Z0Vj2yhjxo=;+QK86zuN1fNOOPtVcfRCLQKDf7L
 bXfZq9SL+EmWgHxWEq8jP9anpJosKa8cMEci9F3PfGunf1WQ7ymBhEyACVVjba8EXnJOCKo2z
 C+R0JSFFrc4XPvBKVArP2h3LPIQU3L/o2sn1dqEpyx/jDP+XeMWGQhuxCG0TReuyJWKjcVmZU
 gI/jmxyaJpxnMx7vFtsJX8IGORksGbI+VPgKX4yySpoUX/3wZ2nMpLJlIin/434TtqXzo8z8Z
 YDepjrDmRygPkMIOi3w3mUpuEDulojObqJ2AYJJpdqJ1ejkiufKzusEJscnxRHJvX9LPerp7O
 eBPArZ9u6t4IBVKNuXjw2jEXsF3stF94XlaDK9OXEWPtNxVvCvcfJvLhggRFiCNbhg4uQXk/V
 uyPLwTAnf63ecZU7cHDD22TFMbx5/ecTtGdwZpLBT8mHvVjmrppCHdHyF/SNdzwDOtUC/ZKOH
 HbLhZzGTO8jaML6bkiRqjVVURbXrvXfH3Ds6PMITAbN2A6tTNd3qhfB1AEAA6OnSEcWnssevo
 x4PPlBAEc+MKKYJZkyHIFUwOhdQ5lfPHAlJL38qcG4do6EGYeF8cu8d4LDoqTaeJaH2/m8LzF
 4EF5hgQwn9eSiVo8lQTw8vTzLlHZ3Wx2UTjZCSj5+8HWjJouwRNp1IbhMRWXUR2L45/amfG22
 n2JH2MuG7ujCUG1tHRZpJOpU5qw20d9gZ0oDlEucwatjce10VaHVVS4z4KvQKpnDBW/C5tUE6
 VA7ioFEyItHvXSyqlX315xzz/mgjd79znO/SSq94PNCyqc58JrHZEvM2/S6NikNekIlUaLkIr
 D15iahvg8DFRy27tUYjJH7+yLzDRUUJOOxByr+VKGgU3ID6OlfALQJgo4XYKepxIx/Qe+xiXF
 3vrshK4rHjWc9nizYZED7eI6bIqZbCq5FT1PphxUDwJQO2oZXg1RQ79hUy5nm/eBLA/HDsNHh
 +ya4ZgrNo+2rfuqAT5c2+Hl7SWQ=
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Zhang Qilong <zhangqilong3@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/15/22 18:02, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The dsi_irq_stats structure is a little too big to fit on the
> stack of a 32-bit task, depending on the specific gcc options:
>
> fbdev/omap2/omapfb/dss/dsi.c: In function 'dsi_dump_dsidev_irqs':
> fbdev/omap2/omapfb/dss/dsi.c:1621:1: error: the frame size of 1064 bytes=
 is larger than 1024 bytes [-Werror=3Dframe-larger-than=3D]
>
> Since this is only a debugfs file, performance is not critical,
> so just dynamically allocate it, and print an error message
> in there in place of a failure code when the allocation fails.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

applied to fbdev git tree.

Thanks!
Helge

> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 28 ++++++++++++++--------
>   1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/=
fbdev/omap2/omapfb/dss/dsi.c
> index 54b0f034c2ed..7cddb7b8ae34 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -1536,22 +1536,28 @@ static void dsi_dump_dsidev_irqs(struct platform=
_device *dsidev,
>   {
>   	struct dsi_data *dsi =3D dsi_get_dsidrv_data(dsidev);
>   	unsigned long flags;
> -	struct dsi_irq_stats stats;
> +	struct dsi_irq_stats *stats;
> +
> +	stats =3D kzalloc(sizeof(*stats), GFP_KERNEL);
> +	if (!stats) {
> +		seq_printf(s, "out of memory\n");
> +		return;
> +	}
>
>   	spin_lock_irqsave(&dsi->irq_stats_lock, flags);
>
> -	stats =3D dsi->irq_stats;
> +	*stats =3D dsi->irq_stats;
>   	memset(&dsi->irq_stats, 0, sizeof(dsi->irq_stats));
>   	dsi->irq_stats.last_reset =3D jiffies;
>
>   	spin_unlock_irqrestore(&dsi->irq_stats_lock, flags);
>
>   	seq_printf(s, "period %u ms\n",
> -			jiffies_to_msecs(jiffies - stats.last_reset));
> +			jiffies_to_msecs(jiffies - stats->last_reset));
>
> -	seq_printf(s, "irqs %d\n", stats.irq_count);
> +	seq_printf(s, "irqs %d\n", stats->irq_count);
>   #define PIS(x) \
> -	seq_printf(s, "%-20s %10d\n", #x, stats.dsi_irqs[ffs(DSI_IRQ_##x)-1])
> +	seq_printf(s, "%-20s %10d\n", #x, stats->dsi_irqs[ffs(DSI_IRQ_##x)-1])
>
>   	seq_printf(s, "-- DSI%d interrupts --\n", dsi->module_id + 1);
>   	PIS(VC0);
> @@ -1575,10 +1581,10 @@ static void dsi_dump_dsidev_irqs(struct platform=
_device *dsidev,
>
>   #define PIS(x) \
>   	seq_printf(s, "%-20s %10d %10d %10d %10d\n", #x, \
> -			stats.vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
> -			stats.vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
> -			stats.vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
> -			stats.vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
> +			stats->vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
> +			stats->vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
> +			stats->vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
> +			stats->vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
>
>   	seq_printf(s, "-- VC interrupts --\n");
>   	PIS(CS);
> @@ -1594,7 +1600,7 @@ static void dsi_dump_dsidev_irqs(struct platform_d=
evice *dsidev,
>
>   #define PIS(x) \
>   	seq_printf(s, "%-20s %10d\n", #x, \
> -			stats.cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
> +			stats->cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
>
>   	seq_printf(s, "-- CIO interrupts --\n");
>   	PIS(ERRSYNCESC1);
> @@ -1618,6 +1624,8 @@ static void dsi_dump_dsidev_irqs(struct platform_d=
evice *dsidev,
>   	PIS(ULPSACTIVENOT_ALL0);
>   	PIS(ULPSACTIVENOT_ALL1);
>   #undef PIS
> +
> +	kfree(stats);
>   }
>
>   static void dsi1_dump_irqs(struct seq_file *s)

