Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A17BC8C9E
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A142010E9B9;
	Thu,  9 Oct 2025 11:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GdHTDrYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856FB10E9B9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760009237;
 bh=8yYyWkZiJJsYeW345sz5gfJX+xO2eBRcOdxAaPWHPsI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GdHTDrYUjyY+hNDLtc/GWgG71srg8R0g/MfsuijCxhpb5hW/b6J1WZo5P0CI0dSRZ
 7W00otLOIgeVmFJ+GSWPToZ1gojK0jWBFK2v3cKp+4Wo8WwCQbXCp4KgrbopCPNkiC
 678ZbBrnNawUWOEklAETh7Qd01inhsAYyWQN6PB6mOFAG2wlJg1HF0Ihx5UalGLHz/
 Co065qHcnXBSUqq4MdWv7YWt+7QXWwICjy1rUxjL+D+2FdYd0zZNu6AbZ7lkVQ0AfO
 ATLYSh4f3smMFpvM6bT4b8MiVKe8udTrBzuDoVxVpz51VKuKDA5UKkROVOyTyiLwif
 tw5z8LgUNGvZA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 408E117E136C;
 Thu,  9 Oct 2025 13:27:16 +0200 (CEST)
Message-ID: <3c97025f-289e-48a3-9b58-3d469cba7366@collabora.com>
Date: Thu, 9 Oct 2025 13:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/20] mailbox: mtk-cmdq: Refine DMA address handling
 for the command buffer
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> GCE can only fetch the command buffer address from a 32-bit register.
> Some SoCs support a 35-bit command buffer address for GCE, which
> requires a right shift of 3 bits before setting the address into
> the 32-bit register. A comment has been added to the header of
> cmdq_get_shift_pa() to explain this requirement.
> 
> To prevent the GCE command buffer address from being DMA mapped beyond
> its supported bit range, the DMA bit mask for the device is set during
> initialization.
> 
> Additionally, to ensure the correct shift is applied when setting or
> reading the register that stores the GCE command buffer address,
> new APIs, cmdq_reg_shift_addr() and cmdq_reg_revert_addr(), have been
> introduced for consistent operations on this register.
> 
> The variable type for the command buffer address has been standardized
> to dma_addr_t to prevent handling issues caused by type mismatches.
> 
> Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c       | 43 ++++++++++++++++--------
>   include/linux/mailbox/mtk-cmdq-mailbox.h | 10 ++++++
>   2 files changed, 39 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 532929916e99..a60486cbb533 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -92,6 +92,16 @@ struct gce_plat {
>   	u32 gce_num;
>   };
>   
> +static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const struct gce_plat *pdata)

cmdq_format_gce_addr() or cmdq_pa_to_gce_addr()

(or cmdq_va_to_gce_addr() if this is not a physical address)

explains what you're doing here a bit better I think.

> +{
> +	return (addr >> pdata->shift);

You don't need parenthesis; just `return addr >> pdata->shift;` is fine

> +}
> +
> +static inline dma_addr_t cmdq_reg_revert_addr(u32 addr, const struct gce_plat *pdata)

cmdq_gce_to_pa_addr() or cmdq_get_pa_addr() perhaps? :-)

(same comments for s/pa/va/g if this is not physical address)

Everything else looks ok.

Cheers,
Angelo

> +{
> +	return ((dma_addr_t)addr << pdata->shift);
> +}
> +
>   u8 cmdq_get_shift_pa(struct mbox_chan *chan)
>   {
>   	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
> @@ -188,13 +198,12 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
>   	struct cmdq_task *prev_task = list_last_entry(
>   			&thread->task_busy_list, typeof(*task), list_entry);
>   	u64 *prev_task_base = prev_task->pkt->va_base;
> +	u32 shift_addr = cmdq_reg_shift_addr(task->pa_base, task->cmdq->pdata);
>   
>   	/* let previous task jump to this task */
>   	dma_sync_single_for_cpu(dev, prev_task->pa_base,
>   				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
> -	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
> -		(u64)CMDQ_JUMP_BY_PA << 32 |
> -		(task->pa_base >> task->cmdq->pdata->shift);
> +	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] = (u64)CMDQ_JUMP_BY_PA << 32 | shift_addr;
>   	dma_sync_single_for_device(dev, prev_task->pa_base,
>   				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>   
> @@ -237,7 +246,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
>   				    struct cmdq_thread *thread)
>   {
>   	struct cmdq_task *task, *tmp, *curr_task = NULL;
> -	u32 curr_pa, irq_flag, task_end_pa;
> +	u32 irq_flag, shift_addr;
> +	dma_addr_t curr_pa, task_end_pa;
>   	bool err;
>   
>   	irq_flag = readl(thread->base + CMDQ_THR_IRQ_STATUS);
> @@ -259,7 +269,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
>   	else
>   		return;
>   
> -	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->pdata->shift;
> +	shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
> +	curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
>   
>   	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
>   				 list_entry) {
> @@ -378,7 +389,8 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
>   	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
>   	struct cmdq_task *task;
> -	unsigned long curr_pa, end_pa;
> +	u32 shift_addr;
> +	dma_addr_t curr_pa, end_pa;
>   	int ret;
>   
>   	/* Client should not flush new tasks if suspended. */
> @@ -409,20 +421,20 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   		 */
>   		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
>   
> -		writel(task->pa_base >> cmdq->pdata->shift,
> -		       thread->base + CMDQ_THR_CURR_ADDR);
> -		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata->shift,
> -		       thread->base + CMDQ_THR_END_ADDR);
> +		shift_addr = cmdq_reg_shift_addr(task->pa_base, cmdq->pdata);
> +		writel(shift_addr, thread->base + CMDQ_THR_CURR_ADDR);
> +		shift_addr = cmdq_reg_shift_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata);
> +		writel(shift_addr, thread->base + CMDQ_THR_END_ADDR);
>   
>   		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
>   		writel(CMDQ_THR_IRQ_EN, thread->base + CMDQ_THR_IRQ_ENABLE);
>   		writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
>   	} else {
>   		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
> -		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) <<
> -			cmdq->pdata->shift;
> -		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
> -			cmdq->pdata->shift;
> +		shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
> +		curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
> +		shift_addr = readl(thread->base + CMDQ_THR_END_ADDR);
> +		end_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
>   		/* check boundary */
>   		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
>   		    curr_pa == end_pa) {
> @@ -656,6 +668,9 @@ static int cmdq_probe(struct platform_device *pdev)
>   	if (err)
>   		return err;
>   
> +	dma_set_coherent_mask(dev,
> +			      DMA_BIT_MASK(sizeof(u32) * BITS_PER_BYTE + cmdq->pdata->shift));
> +
>   	cmdq->mbox.dev = dev;
>   	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->pdata->thread_nr,
>   					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 4c1a91b07de3..e1555e06e7e5 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -77,6 +77,16 @@ struct cmdq_pkt {
>   	size_t			buf_size; /* real buffer size */
>   };
>   
> +/**
> + * cmdq_get_shift_pa() - get the shift bits of physical address
> + * @chan: mailbox channel
> + *
> + * GCE can only fetch the command buffer address from a 32-bit register.
> + * Some SOCs support more than 32-bit command buffer address for GCE, which
> + * requires some shift bits to make the address fit into the 32-bit register.
> + *
> + * Return: the shift bits of physical address
> + */
>   u8 cmdq_get_shift_pa(struct mbox_chan *chan);
>   
>   #endif /* __MTK_CMDQ_MAILBOX_H__ */


