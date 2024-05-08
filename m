Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702DC8BFD7D
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 14:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9325E10F947;
	Wed,  8 May 2024 12:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="0dlrTVYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7A710F947
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715172274;
 bh=zmA2+tCDw16RjR/3j2+3tT2/AoPS7qyS7V4GhqwgqXw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=0dlrTVYwZFLMOymDDPlJgMbxax0vrGgshPR1ATXjluKj3gCwGqOe5vshSy1Ca1D90
 f2l0qTwdyAXKnHmvaT5ORfPUx3ApHfGv4O1Uc9V6fcDd8LU47uHDPX3W4y6qaTgTYA
 WBdL/E2V5xvnWpUTjf0ZGE5l/wfenCVvMY7Czjgkdl14CsdLp9eM36npJVbV56HSqF
 YPK2E6LM0FudDvRLGaOHGhLh1QGENj7rSoSL2RqZNJvaYR4K/cIQIoXRmwfo5EgVRg
 AgwV+NQhFNE2JtQmEKzkAY6jF+apNbGMD09fq1NgcerZdL3UsPDXaKE2EsfCqf16Io
 0UCnpCetXVo6A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C7A863782112;
 Wed,  8 May 2024 12:44:33 +0000 (UTC)
Message-ID: <5de7d6af-54ac-49b7-b5c2-fa9381310288@collabora.com>
Date: Wed, 8 May 2024 14:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: Fix sleeping function called from
 invalid context
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>
References: <20240508095143.12023-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240508095143.12023-1-jason-jh.lin@mediatek.com>
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

Il 08/05/24 11:51, Jason-JH.Lin ha scritto:
> When we run kernel with lockdebug option, we will get the BUG below:
> [  106.692124] BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164
> [  106.692190] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 3616, name: kworker/u17:3
> [  106.692226] preempt_count: 1, expected: 0
> [  106.692254] RCU nest depth: 0, expected: 0
> [  106.692282] INFO: lockdep is turned off.
> [  106.692306] irq event stamp: 0
> [  106.692331] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [  106.692376] hardirqs last disabled at (0): [<ffffffee15d37fa0>] copy_process+0xc90/0x2ac0
> [  106.692429] softirqs last  enabled at (0): [<ffffffee15d37fc4>] copy_process+0xcb4/0x2ac0
> [  106.692473] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [  106.692513] CPU: 1 PID: 3616 Comm: kworker/u17:3 Not tainted 6.1.87-lockdep-14133-g26e933aca785 #1 6839942e1cf34914b0a366137843dd2366f52aa9
> [  106.692556] Hardware name: Google Ciri sku0/unprovisioned board (DT)
> [  106.692586] Workqueue: imgsys_runner imgsys_runner_func
> [  106.692638] Call trace:
> [  106.692662]  dump_backtrace+0x100/0x120
> [  106.692702]  show_stack+0x20/0x2c
> [  106.692737]  dump_stack_lvl+0x84/0xb4
> [  106.692775]  dump_stack+0x18/0x48
> [  106.692809]  __might_resched+0x354/0x4c0
> [  106.692847]  __might_sleep+0x98/0xe4
> [  106.692883]  __pm_runtime_resume+0x70/0x124
> [  106.692921]  cmdq_mbox_send_data+0xe4/0xb1c
> [  106.692964]  msg_submit+0x194/0x2dc
> [  106.693003]  mbox_send_message+0x190/0x330
> [  106.693043]  imgsys_cmdq_sendtask+0x1618/0x2224
> [  106.693082]  imgsys_runner_func+0xac/0x11c
> [  106.693118]  process_one_work+0x638/0xf84
> [  106.693158]  worker_thread+0x808/0xcd0
> [  106.693196]  kthread+0x24c/0x324
> [  106.693231]  ret_from_fork+0x10/0x20
> 
> We found that there is a spin_lock_irqsave protection in msg_submit()
> of mailbox.c and it is in the atomic context.
> So when cmdq driver calls pm_runtime_get_sync() in cmdq_mbox_send_data(),
> it will get this BUG report.
> 
> 1. Change pm_runtime_get_sync() to pm_runtime_get() to avoid using sleep
>     in atomic context.
> 2. Move clk_bulk_enable() outside cmdq_runtime_resume() to ensure GCE
>     clocks are enabled before configuring GCE register.
> 3. Add used_count to avoid cmdq_runtime_suspend() being called before
>     calling cmdq_runtime_resume().
> 
> Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM with autosuspend")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 033aff11f87c..b50f42e69aab 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -82,6 +82,7 @@ struct cmdq {
>   	const struct gce_plat	*pdata;
>   	struct cmdq_thread	*thread;
>   	struct clk_bulk_data	clocks[CMDQ_GCE_NUM_MAX];
> +	atomic_t		used_count;
>   	bool			suspended;
>   };
>   
> @@ -317,14 +318,21 @@ static int cmdq_runtime_resume(struct device *dev)
>   {
>   	struct cmdq *cmdq = dev_get_drvdata(dev);
>   
> -	return clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
> +	atomic_inc(&cmdq->used_count);
> +	return 0;
>   }
>   
>   static int cmdq_runtime_suspend(struct device *dev)
>   {
>   	struct cmdq *cmdq = dev_get_drvdata(dev);
>   
> +	if (atomic_read(&cmdq->used_count) == 0) {
> +		dev_warn(dev, "%s when used_count is 0!", __func__);
> +		return -EINVAL;
> +	}
> +
>   	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
> +	atomic_dec(&cmdq->used_count);
>   	return 0;
>   }
>   
> @@ -392,9 +400,8 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   	/* Client should not flush new tasks if suspended. */
>   	WARN_ON(cmdq->suspended);
>   
> -	ret = pm_runtime_get_sync(cmdq->mbox.dev);
> -	if (ret < 0)
> -		return ret;
> +	WARN_ON(pm_runtime_get(cmdq->mbox.dev) < 0);

That's a bit sketchy, and I'm afraid that this will break in some other ways.

We could - again - simply change the msg_submit() function in mailbox.c, so that
it takes into account that a driver may need PM done.

A low effort example (which may be good enough or not) is:

static void msg_submit(struct mbox_chan *chan)
{
	unsigned count, idx;
	unsigned long flags;
	void *data;
	int err;

	if (chan->mbox->ops->pm_off) {
		err = chan->mbox->ops->pm_on();
		if (err)
			return err;
	}

	spin_lock_irqsave(&chan->lock, flags);

	if (!chan->msg_count || chan->active_req) {
		err = -EBUSY;
		goto exit;
	}

	......

	exit:
	spin_unlock_irqrestore(&chan->lock, flags);

	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
		/* kick start the timer immediately to avoid delays */
		spin_lock_irqsave(&chan->mbox->poll_hrt_lock, flags);
		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
		spin_unlock_irqrestore(&chan->mbox->poll_hrt_lock, flags);
	}

/* I guess setting it OFF can't fail anyway, so this would be a void function */
	if (chan->mbox->ops->pm_off)
		chan->mbox->ops->pm_off();
}


Then we can wire up the two functions in the MediaTek driver - where our mailbox
only simply needs pm_runtime_get_sync() and pm_runtime_put().

The reason why I'm suggesting a callback is that this would catch the case of
mailboxes that need "more complicated" flows for ON/OFF.

Jassi, do you like the idea?

If you do, I can eventually go for a real commit with better names than pm_off/on
if I can find any - so that then Jason can go on with his mtk-cmdq fix on top of
that.

Cheers,
Angelo

> +	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
>   
>   	task = kzalloc(sizeof(*task), GFP_ATOMIC);
>   	if (!task) {
> @@ -465,7 +472,8 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
>   	struct cmdq_task *task, *tmp;
>   	unsigned long flags;
>   
> -	WARN_ON(pm_runtime_get_sync(cmdq->mbox.dev) < 0);
> +	WARN_ON(pm_runtime_get(cmdq->mbox.dev) < 0);
> +	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
>   
>   	spin_lock_irqsave(&thread->chan->lock, flags);
>   	if (list_empty(&thread->task_busy_list))
> @@ -507,11 +515,9 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
>   	struct cmdq_task *task, *tmp;
>   	unsigned long flags;
>   	u32 enable;
> -	int ret;
>   
> -	ret = pm_runtime_get_sync(cmdq->mbox.dev);
> -	if (ret < 0)
> -		return ret;
> +	WARN_ON(pm_runtime_get(cmdq->mbox.dev) < 0);
> +	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
>   
>   	spin_lock_irqsave(&thread->chan->lock, flags);
>   	if (list_empty(&thread->task_busy_list))

