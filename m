Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB443B568
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB586E459;
	Tue, 26 Oct 2021 15:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D336E454
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:21:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 718731F43A2F
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RFC 08/13] soc: mediatek: apu: Add apusys rv driver
To: Flora Fu <flora.fu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-9-flora.fu@mediatek.com>
Message-ID: <5a67997f-737a-5bd1-9ba3-25b5330b7dc6@collabora.com>
Date: Tue, 26 Oct 2021 17:21:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023111409.30463-9-flora.fu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Il 23/10/21 13:14, Flora Fu ha scritto:
> Add driver for control APU tinysys
> 
> APU integrated subsystem having MD32RV33 (MD32) that runs tinysys
> The tinsys is running on a micro processor in APU.
> Its firmware is load and boot from Kernel side. Kernel and tinysys use
> IPI to tx/rx messages.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>   drivers/soc/mediatek/apusys/Makefile        |   6 +
>   drivers/soc/mediatek/apusys/apu-config.h    | 100 +++
>   drivers/soc/mediatek/apusys/apu-core.c      |   2 +
>   drivers/soc/mediatek/apusys/apu-core.h      |   2 +
>   drivers/soc/mediatek/apusys/apu-ipi.c       | 486 ++++++++++++

I'm not sure of that, but your apu-ipi.c may be more suited to be in
drivers/remoteproc instead.

>   drivers/soc/mediatek/apusys/apu-mbox.c      |  83 ++

apu-mbox.c should go to drivers/mailbox/ and you should register it with
the mailbox API as a mailbox controller instead of what you're currently
doing...

 From what I see, you have functions in there that can be indeed mapped
to struct mbox_chan_ops .send_data and .peek_data... also your function
apu_mbox_wait_inbox seems to be waiting on an interrupt, and such irq is
apparently your "mbox0_irq" (as you named it in the dt).
In that case, you can also manage that in your drivers/mailbox/ driver.
+
>   drivers/soc/mediatek/apusys/apu-mbox.h      |  27 +
>   drivers/soc/mediatek/apusys/apu-rproc.c     | 806 ++++++++++++++++++++

The apu-rproc.c driver seems to be a good candidate to be moved away from

drivers/soc/mediatek/apusys/ - as this is indeed a remoteproc driver.

Having it as drivers/remoteproc/mtk_apu.c seems to be a good option.



>   drivers/soc/mediatek/apusys/apu-sw-logger.c | 429 +++++++++++

This one definitely belongs here in drivers/soc/mediatek, and it's a consumer
of the mailbox driver.

>   drivers/soc/mediatek/apusys/apu.h           | 256 +++++++
>   drivers/soc/mediatek/apusys/mt81xx-plat.c   | 320 ++++++++

If we end up keeping to be in need to have a separate mt81xx-plat.c file,
then I believe this should have another name, so that it becomes one that
aggregates all of the very-platform-specific functions in one, instead of
having one file for each platform.

Though, it may also be possible that this file will disappear entirely:
since most of the things here will be moved around, it may become mostly
empty... but it's probably too soon to judge.

>   11 files changed, 2517 insertions(+)
>   create mode 100644 drivers/soc/mediatek/apusys/apu-config.h
>   create mode 100644 drivers/soc/mediatek/apusys/apu-ipi.c
>   create mode 100644 drivers/soc/mediatek/apusys/apu-mbox.c
>   create mode 100644 drivers/soc/mediatek/apusys/apu-mbox.h
>   create mode 100644 drivers/soc/mediatek/apusys/apu-rproc.c
>   create mode 100644 drivers/soc/mediatek/apusys/apu-sw-logger.c
>   create mode 100644 drivers/soc/mediatek/apusys/apu.h
>   create mode 100644 drivers/soc/mediatek/apusys/mt81xx-plat.c
> 

snip...

> diff --git a/drivers/soc/mediatek/apusys/apu-ipi.c b/drivers/soc/mediatek/apusys/apu-ipi.c
> new file mode 100644
> index 000000000000..547e034b3620
> --- /dev/null
> +++ b/drivers/soc/mediatek/apusys/apu-ipi.c

snip...

> +int apu_ipi_init(struct platform_device *pdev, struct mtk_apu *apu)
> +{
> +	struct device *dev = apu->dev;
> +	int i, ret;
> +
> +	tx_serial_no = 0;
> +	rx_serial_no = 0;
> +
> +	mutex_init(&apu->send_lock);
> +	spin_lock_init(&apu->usage_cnt_lock);
> +	for (i = 0; i < APU_IPI_MAX; i++) {
> +		mutex_init(&apu->ipi_desc[i].lock);
> +		lockdep_set_class_and_name(&apu->ipi_desc[i].lock,
> +					   &ipi_lock_key[i],
> +					   apu->platdata->ipi_attrs[i].name);
> +	}
> +
> +	init_waitqueue_head(&apu->run.wq);
> +	init_waitqueue_head(&apu->ack_wq);
> +
> +	/* APU initialization IPI register */
> +	ret = apu_ipi_register(apu, APU_IPI_INIT, apu_init_ipi_handler, apu);
> +	if (ret) {
> +		dev_err(dev, "failed to register ipi for init, ret=%d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	/* add rpmsg subdev */
> +	apu_add_rpmsg_subdev(apu);
> +
> +	/* register mailbox IRQ */
> +	apu->mbox0_irq_number = platform_get_irq_byname(pdev, "mbox0_irq");
> +	dev_info(&pdev->dev, "%s: mbox0_irq = %d\n", __func__,
> +		 apu->mbox0_irq_number);
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, apu->mbox0_irq_number,
> +					NULL, apu_ipi_handler, IRQF_ONESHOT,
> +					"apu_ipi", apu);

This is the mailbox interrupt... but it's handled in this driver instead of
being handler in the mailbox driver... it's a bit confusing.

Is this interrupt supposed to fire as a mailbox doorbell or..?
In that case, you should request it in the mailbox driver and register an
interrupt controller (still, in the mailbox driver) so that you can export
a sw interrupt to this one.

Or, maybe you can use notifiers to catch the mailbox message in this driver?

> +	if (ret < 0)
> +		goto remove_rpmsg_subdev;
> +
> +	apu_mbox_hw_init(apu);
> +
> +	return 0;
> +
> +remove_rpmsg_subdev:
> +	apu_remove_rpmsg_subdev(apu);
> +	apu_ipi_unregister(apu, APU_IPI_INIT);
> +
> +	return ret;
> +}

snip...

> diff --git a/drivers/soc/mediatek/apusys/apu-rproc.c b/drivers/soc/mediatek/apusys/apu-rproc.c
> new file mode 100644
> index 000000000000..e2fe63dd6cc1
> --- /dev/null
> +++ b/drivers/soc/mediatek/apusys/apu-rproc.c
> @@ -0,0 +1,806 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/iommu.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/remoteproc.h>
> +#include <linux/time64.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/sched/clock.h>
> +#include <linux/time64.h>
> +#include <linux/workqueue.h>
> +
> +#include "apu.h"
> +#include "apu-config.h"
> +#include "apu-core.h"
> +
> +/* cmd */
> +enum {
> +	DPIDLE_CMD_LOCK_IPI = 0x5a00,
> +	DPIDLE_CMD_UNLOCK_IPI = 0x5a01,
> +	DPIDLE_CMD_PDN_UNLOCK = 0x5a02,
> +};
> +
> +/* ack */
> +enum {
> +	DPIDLE_ACK_OK = 0,
> +	DPIDLE_ACK_LOCK_BUSY,
> +	DPIDLE_ACK_POWER_DOWN_FAIL,
> +};
> +
> +static struct work_struct *apu_pwr_work;
> +static struct workqueue_struct *apu_pwr_wq;
> +static struct dentry *dbg_root;
> +
> +static void *apu_da_to_va(struct rproc *rproc, u64 da, size_t len,
> +			  bool *is_iomem)
> +{
> +	void *ptr = NULL;
> +	struct mtk_apu *apu = (struct mtk_apu *)rproc->priv;
> +
> +	if (da >= DRAM_OFFSET && da < DRAM_OFFSET + CODE_BUF_SIZE) {
> +		ptr = apu->code_buf + (da - DRAM_OFFSET);
> +	} else {
> +		dev_err(apu->dev, "%s: invalid da: da = 0x%llx, len = %zu\n",
> +			__func__, da, len);
> +	}
> +	return ptr;
> +}
> +
> +static int apu_run(struct rproc *rproc)
> +{
> +	struct mtk_apu *apu = (struct mtk_apu *)rproc->priv;
> +	struct mtk_apu_hw_ops *hw_ops = &apu->platdata->ops;
> +	struct device *dev = apu->dev;
> +	struct apu_run *run = &apu->run;
> +	struct timespec64 begin, end, delta;
> +	int ret;
> +
> +	pm_runtime_get_sync(apu->dev);
> +	hw_ops->start(apu);

Don't forget to always check return values.....

> +
> +	/* check if boot success */
> +	ktime_get_ts64(&begin);
> +	ret = wait_event_interruptible_timeout(run->wq,
> +					       run->signaled,
> +					       msecs_to_jiffies(10000));

#define APU_INIT_TIMEOUT_MS	10000

...but then, does it really need 10 *seconds* for that?! That's a lot of time...

> +	ktime_get_ts64(&end);
> +	if (ret == 0) {
> +		dev_info(dev, "APU initialization timeout!!\n");
> +		ret = -ETIME;
> +		goto stop;
> +	}
> +	if (ret == -ERESTARTSYS) {
> +		dev_info(dev, "wait APU interrupted by a signal!!\n");
> +		goto stop;
> +	}
> +
> +	apu->boot_done = true;
> +	delta = timespec64_sub(end, begin);
> +	dev_info(dev, "APU uP boot success. boot time: %llu s, %llu ns\n",
> +		 (u64)delta.tv_sec, (u64)delta.tv_nsec);
> +
> +	return 0;
> +
> +stop:
> +	hw_ops->stop(apu);
> +
> +	return ret;
> +}
> +


snip...


> +
> +static int apu_config_setup(struct mtk_apu *apu)
> +{
> +	struct device *dev = apu->dev;
> +	unsigned long flags;
> +	int ret;
> +
> +	apu->conf_buf = dma_alloc_coherent(apu->dev, CONFIG_SIZE,
> +					   &apu->conf_da, GFP_KERNEL);
> +
> +	if (!apu->conf_buf || apu->conf_da == 0) {
> +		dev_info(dev, "%s: dma_alloc_coherent fail\n", __func__);
> +		return -ENOMEM;
> +	}
> +	memset(apu->conf_buf, 0, CONFIG_SIZE);
> +
> +	apu_config_user_ptr_init(apu);
> +	spin_lock_irqsave(&apu->reg_lock, flags);
> +	iowrite32((u32)apu->conf_da, apu->apu_mbox + HOST_CONFIG_ADDR);
> +	spin_unlock_irqrestore(&apu->reg_lock, flags);
> +
> +	apu->conf_buf->time_offset = sched_clock();
> +	ret = apu_ipi_config_init(apu);
> +	if (ret) {
> +		dev_info(dev, "apu ipi config init failed\n");
> +		goto out;
> +	}
> +
> +	ret = sw_logger_config_init(apu);

 From what I understand, the sw logger is not critical for functionality... so
it should probably be a "pluggable" instead.
Also, since that sw logger seems to be "simply" reading from a mailbox, it
should be pretty straightforward to make it so, in which case, you wouldn't
be initializing it here, but as a platform driver instead (if debugging enabled?)

> +	if (ret) {
> +		dev_err(dev, "sw logger config init failed\n");
> +		goto err_sw_logger;
> +	}
> +
> +	return 0;
> +
> +err_sw_logger:
> +	apu_ipi_config_remove(apu);
> +out:
> +	return ret;
> +}
> +

snip...

> diff --git a/drivers/soc/mediatek/apusys/apu.h b/drivers/soc/mediatek/apusys/apu.h
> new file mode 100644
> index 000000000000..5bbc46416a19
> --- /dev/null
> +++ b/drivers/soc/mediatek/apusys/apu.h
> @@ -0,0 +1,256 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef APU_H
> +#define APU_H
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/rpmsg/mtk_rpmsg.h>
> +
> +#include "apu-config.h"
> +
> +/* setup the SMC command ops */
> +#define MTK_SIP_APU_START_MCU	0x00
> +#define MTK_SIP_APU_STOP_MCU	0x01
> +
> +/* md32_sysctrl register definition */
> +#define MD32_SYS_CTRL	0x0
> +#define MD32_MON_PC		0x838
> +#define MD32_MON_LR		0x83c
> +#define MD32_MON_SP		0x840
> +#define MD32_STATUS		0x844
> +
> +/*wdt register */
> +#define WDT_INT		0x0
> +#define WDT_CTRL0	0x4
> +#define WDT_EN		BIT(31)
> +
> +/* apu_mbox spare regiter */

/* apu_mbox spare register: mbox 0..6, spare 0..3 */
#define REG_MBOX_SPARE(mbox, reg) 	((0x40 + (0x100 * mbox)) + (reg * 0x4))
#define REG_MBOX0_SPARE(n)		REG_MBOX_SPARE(0, n)
#define REG_MBOX6_SPARE(n)		REG_MBOX_SPARE(6, n)

#define HOST_CONFIG_ADDR		REG_MBOX_SPARE(0, 2)

Would that be better? Granted, mbox1-5 are also accessible and perhaps used
in the future.

> +#define MBOX0_SPARE0 0x40
> +#define MBOX0_SPARE1 0x44
> +#define MBOX0_SPARE2 0x48
> +#define MBOX0_SPARE3 0x4C
> +#define MBOX6_SPARE0 0x640
> +#define MBOX6_SPARE1 0x644
> +#define MBOX6_SPARE2 0x648
> +#define MBOX6_SPARE3 0x64C
> +
> +#define HOST_CONFIG_ADDR MBOX0_SPARE2
> +
> +#define LOG_W_PTR (MBOX0_SPARE0)
> +#define LOG_R_PTR (MBOX0_SPARE1)
> +#define LOG_OV_FLG (MBOX0_SPARE3)
> +
> +/* rv setup  */
> +#define F_PRELOAD_FIRMWARE	BIT(0)
> +#define F_AUTO_BOOT		BIT(1)
> +

Use SZ_* macros where possible

> +#define TCM_SIZE (128UL * 1024UL)
> +#define CODE_BUF_SIZE (1024UL * 1024UL)
> +#define DRAM_DUMP_SIZE (CODE_BUF_SIZE - TCM_SIZE)
> +#define REG_SIZE (4UL * 151UL)
> +#define TBUF_SIZE (4UL * 32UL)
> +#define CACHE_DUMP_SIZE (37UL * 1024UL)
> +#define DRAM_OFFSET (0x00000UL)
> +#define DRAM_DUMP_OFFSET (TCM_SIZE)
> +#define TCM_OFFSET (0x1d700000UL)
> +#define CODE_BUF_DA (DRAM_OFFSET)
> +
> +/* ipi */
> +#define APU_FW_VER_LEN	       32
> +#define APU_SHARE_BUFFER_SIZE  256
> +
> +#define IPI_LOCKED			1
> +#define IPI_UNLOCKED		0
> +
> +#define IPI_HOST_INITIATE	0
> +#define IPI_APU_INITIATE	1
> +#define IPI_WITH_ACK		1
> +#define IPI_WITHOUT_ACK		0
> +
> +enum {
> +	APU_IPI_INIT = 0,
> +	APU_IPI_NS_SERVICE,
> +	APU_IPI_DEEP_IDLE,
> +	APU_IPI_CTRL_RPMSG,
> +	APU_IPI_MIDDLEWARE,
> +	APU_IPI_REVISER_RPMSG,
> +	APU_IPI_PWR_TX,
> +	APU_IPI_PWR_RX,
> +	APU_IPI_MDLA_TX,
> +	APU_IPI_MDLA_RX,
> +	APU_IPI_TIMESYNC,
> +	APU_IPI_EDMA_TX,
> +	APU_IPI_MNOC_TX,
> +	APU_IPI_MAX,
> +};
> +
> +struct mtk_apu;
> +
> +struct mtk_apu_hw_ops {
> +	int (*init)(struct mtk_apu *apu);
> +	int (*exit)(struct mtk_apu *apu);
> +	int (*start)(struct mtk_apu *apu);
> +	int (*stop)(struct mtk_apu *apu);
> +	int (*resume)(struct mtk_apu *apu);
> +	int (*apu_memmap_init)(struct mtk_apu *apu);
> +	void (*apu_memmap_remove)(struct mtk_apu *apu);
> +	void (*cg_gating)(struct mtk_apu *apu);
> +	void (*cg_ungating)(struct mtk_apu *apu);
> +	void (*rv_cachedump)(struct mtk_apu *apu);
> +
> +	/* power related ops */
> +	int (*power_init)(struct mtk_apu *apu);
> +	int (*power_on)(struct mtk_apu *apu);
> +	int (*power_off)(struct mtk_apu *apu);
> +};
> +
> +struct apu_ipi {
> +	char *name;
> +	unsigned int direction:1;
> +	unsigned int ack:1;
> +};
> +
> +struct mtk_apu_platdata {
> +	u32 flags;
> +	struct mtk_apu_hw_ops ops;
> +	const struct apu_ipi *ipi_attrs;
> +};
> +
> +struct dpidle_msg {
> +	u32 cmd;
> +	u32 ack;
> +};
> +
> +struct apu_run {
> +	s8 fw_ver[APU_FW_VER_LEN];
> +	u32 signaled;
> +	wait_queue_head_t wq;
> +};
> +
> +struct apu_ipi_desc {
> +	struct mutex lock; /*ipi hanlder mutex */

typo

> +	ipi_handler_t handler;
> +	void *priv;
> +	/*
> +	 * positive: host-initiated ipi outstanding count
> +	 * negative: apu-initiated ipi outstanding count
> +	 */
> +	int usage_cnt;
> +};
> +
> +struct mtk_share_obj {
> +	u8 share_buf[APU_SHARE_BUFFER_SIZE];
> +};
> +
> +struct sw_logger_seq_data {
> +	u32 w_ptr;
> +	u32 r_ptr;
> +	u32 overflow_flg;
> +	int i;
> +	int is_finished;
> +	char *data;
> +	bool startl_first;
> +};
> +
> +struct mtk_apu {
> +	struct rproc *rproc;
> +	struct device *dev;
> +	void __iomem *apu_mbox;
> +	void __iomem *md32_sysctrl;
> +	void __iomem *apu_wdt;
> +	int mbox0_irq_number;
> +	int wdt_irq_number;
> +	spinlock_t reg_lock; /* register r/w lock */
> +
> +	/* Buffer to place execution area */
> +	void *code_buf;
> +	dma_addr_t code_da;
> +
> +	/* Buffer to place config area */
> +	struct config_v1 *conf_buf;
> +	dma_addr_t conf_da;
> +
> +	/* to synchronize boot status of remote processor */
> +	struct apu_run run;
> +
> +	/* to prevent multiple ipi_send run concurrently */
> +	struct mutex send_lock;
> +	spinlock_t usage_cnt_lock; /* ipi occipued lock */
> +	struct apu_ipi_desc ipi_desc[APU_IPI_MAX];
> +	bool ipi_id_ack[APU_IPI_MAX]; /* per-ipi ack */
> +	bool ipi_inbound_locked;
> +	wait_queue_head_t ack_wq; /* for waiting for ipi ack */
> +
> +	/* ipi */
> +	struct rproc_subdev *rpmsg_subdev;
> +	dma_addr_t recv_buf_da;
> +	struct mtk_share_obj *recv_buf;
> +	dma_addr_t send_buf_da;
> +	struct mtk_share_obj *send_buf;
> +
> +	/* time sync */
> +	struct work_struct timesync_work;
> +	struct workqueue_struct *timesync_wq;
> +	u64 timesync_stamp;
> +
> +	/*deep idle */
> +	struct dpidle_msg recv_msg;
> +	struct work_struct deepidle_work;
> +	struct workqueue_struct *apu_deepidle_workq;
> +	struct work_struct pwron_dbg_wk;
> +
> +	struct mtk_apu_platdata	*platdata;
> +
> +	/* link power deive */
> +	struct device *power_dev;
> +	bool boot_done;
> +	struct work_struct pwr_work;
> +
> +	/* logger and debug */
> +	struct dentry *dbg_root;
> +	dma_addr_t handle;
> +	char *sw_log_buf;
> +	spinlock_t sw_logger_spinlock; /* logger status update lock */
> +	struct sw_logger_seq_data pseqdata_lock;
> +	struct sw_logger_seq_data *pseqdata;
> +};
> +
> +struct apu_coredump {
> +	char tcmdump[TCM_SIZE];
> +	char ramdump[DRAM_DUMP_SIZE];
> +	char regdump[REG_SIZE];
> +	char tbufdump[TBUF_SIZE];
> +	u32 cachedump[CACHE_DUMP_SIZE / sizeof(u32)];
> +} __packed;
> +
> +int apu_ipi_config_init(struct mtk_apu *apu);
> +void apu_ipi_config_remove(struct mtk_apu *apu);
> +void apu_ipi_remove(struct mtk_apu *apu);
> +int apu_ipi_init(struct platform_device *pdev, struct mtk_apu *apu);
> +int apu_ipi_register(struct mtk_apu *apu, u32 id,
> +		     ipi_handler_t handler, void *priv);
> +void apu_ipi_unregister(struct mtk_apu *apu, u32 id);
> +int apu_ipi_send(struct mtk_apu *apu, u32 id, void *data, u32 len,
> +		 u32 wait_ms);
> +int apu_ipi_lock(struct mtk_apu *apu);
> +void apu_ipi_unlock(struct mtk_apu *apu);
> +
> +void apu_deepidle_power_on_aputop(struct mtk_apu *apu);
> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +int sw_logger_config_init(struct mtk_apu *apu);
> +void sw_logger_config_remove(struct mtk_apu *apu);
> +int apu_sw_logger_init(struct mtk_apu *apu);
> +void apu_sw_logger_remove(struct mtk_apu *apu);
> +#else
> +static inline int sw_logger_config_init(struct mtk_apu *apu) { return 0; }
> +static inline void sw_logger_config_remove(struct mtk_apu *apu) { }
> +static inline int apu_sw_logger_init(struct mtk_apu *apu) { return 0; }
> +static inline void apu_sw_logger_remove(struct mtk_apu *apu) { }
> +#endif
> +
> +extern const struct mtk_apu_platdata mt8192_platdata;
> +#endif /* APU_H */
> diff --git a/drivers/soc/mediatek/apusys/mt81xx-plat.c b/drivers/soc/mediatek/apusys/mt81xx-plat.c
> new file mode 100644
> index 000000000000..54f75c8d07c3
> --- /dev/null
> +++ b/drivers/soc/mediatek/apusys/mt81xx-plat.c
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/sched/clock.h>
> +#include <linux/soc/mediatek/mtk_sip_svc.h>
> +
> +#include "apu.h"
> +
> +static const struct apu_ipi mt81xx_ipi_attrs[APU_IPI_MAX] = {

In here, this is used only to pass it to the remoteproc "ipi" driver: it would make
sense if this was in the ipi driver, associated to a compatible like
mediatek,mt8192-ipi.

> +		   [APU_IPI_INIT] = {
> +			   .name = "init",
> +			   .direction = IPI_APU_INITIATE,
> +			   .ack = IPI_WITHOUT_ACK,
> +		   },
> +		   [APU_IPI_NS_SERVICE] = {
> +			   .name = "name-service",
> +			   .direction = IPI_APU_INITIATE,
> +			   .ack = IPI_WITHOUT_ACK,
> +		   },
> +		   [APU_IPI_DEEP_IDLE] = {
> +			   .name = "deep_idle",
> +			   .direction = IPI_APU_INITIATE,
> +			   .ack = IPI_WITH_ACK,
> +		   },
> +		   [APU_IPI_CTRL_RPMSG] = {
> +			   .name = "apu-ctrl-rpmsg",
> +			   .direction = IPI_APU_INITIATE,
> +			   .ack = IPI_WITH_ACK,
> +		   },
> +		   [APU_IPI_MIDDLEWARE] = {
> +			   .name = "apu-mdw-rpmsg",
> +			   .direction = IPI_HOST_INITIATE,
> +			   .ack = IPI_WITH_ACK,
> +		   },
> +		   [APU_IPI_REVISER_RPMSG] = {
> +			   .name = "apu-reviser-rpmsg",
> +			   .direction = IPI_HOST_INITIATE,
> +			   .ack = IPI_WITH_ACK,
> +		   },
> +		   [APU_IPI_PWR_TX] = {
> +			   .name = "apupwr-tx-rpmsg",
> +			   .direction = IPI_HOST_INITIATE,
> +			   .ack = IPI_WITH_ACK,
> +		   },
> +		   [APU_IPI_PWR_RX] = {
> +			   .name = "apupwr-rx-rpmsg",
> +			   .direction = IPI_APU_INITIATE,
> +			   .ack = IPI_WITH_ACK,
> +		   },
> +		   [APU_IPI_MDLA_TX] = {
> +			   .name = "mdla-tx-rpmsg",
> +			   .direction = IPI_HOST_INITIATE,
> +			   .ack = IPI_WITH_ACK,
> +		   },
> +		   [APU_IPI_MDLA_RX] = {
> +			   .name = "mdla-rx-rpmsg",
> +			   .direction = IPI_APU_INITIATE,
> +			   .ack = IPI_WITH_ACK,
> +		   },
> +		   [APU_IPI_TIMESYNC] = {
> +			   .name = "apu-timesync",
> +			   .direction = IPI_APU_INITIATE,
> +			   .ack = IPI_WITH_ACK,
> +		   },
> +		   [APU_IPI_EDMA_TX] = {
> +			   .name = "apu-edma-rpmsg",
> +			   .direction = IPI_HOST_INITIATE,
> +			   .ack = IPI_WITHOUT_ACK,
> +		   },
> +		   [APU_IPI_MNOC_TX] = {
> +			   .name = "apu-mnoc-rpmsg",
> +			   .direction = IPI_HOST_INITIATE,
> +			   .ack = IPI_WITHOUT_ACK,
> +		   },
> +};
> +
> +static void apu_reset_mcu(struct mtk_apu *apu)
> +{
> +	u32 reg;
> +
> +	/* assert mcu reset */
> +	reg = ioread32(apu->md32_sysctrl);
> +	iowrite32(reg & ~0x1, apu->md32_sysctrl);
> +	mdelay(10);
> +	iowrite32(reg | 0x1, apu->md32_sysctrl);
> +}
> +
> +static int apu_start_mcu(struct mtk_apu *apu)
> +{
> +	struct arm_smccc_res ares;
> +
> +	/* initialize IOMMU and ACP config (iommu_tr_en=1, acp_en=0) */
> +	iowrite32(0xEA9, apu->md32_sysctrl);
> +
> +	arm_smccc_smc(MTK_SIP_APUSYS_CONTROL, MTK_SIP_APU_START_MCU,
> +		      0, 0, 0, 0, 0, 0, &ares);
> +	if (ares.a0)
> +		dev_err(apu->dev, "start mcu fail: %lu\n", ares.a0);
> +
> +	return 0;
> +}
> +
> +static int apu_stop_mcu(struct mtk_apu *apu)
> +{
> +	struct arm_smccc_res ares;
> +
> +	arm_smccc_smc(MTK_SIP_APUSYS_CONTROL, MTK_SIP_APU_STOP_MCU,
> +		      0, 0, 0, 0, 0, 0, &ares);
> +	if (ares.a0)
> +		dev_err(apu->dev, "stop mcufail: %lu\n", ares.a0);
> +
> +	return 0;
> +}

Is it expected for other SoCs to have different (or more) secure world calls?
If it is, then it may be worth it to move this to a different driver in
drivers/firmware, so that you will be able to map different/more values to
different compatibles.

Otherwise, keep it here.

> +

Thanks,
- Angelo
