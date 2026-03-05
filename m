Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFpqOOalqWl5BQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:48:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A629214D38
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886CD10EBD9;
	Thu,  5 Mar 2026 15:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g5vUKlvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA39110EBD9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:48:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA074600C4;
 Thu,  5 Mar 2026 15:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C757DC116C6;
 Thu,  5 Mar 2026 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772725728;
 bh=YRis1SzSpHW3uABNnBV/zIrr4vDbZ4MkJ2utxH9B+fo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g5vUKlvXFZsHe+K/1cQyYLfCmSvL0WtJoURynb2SFAjSPL/tG5kGlii79O3uVJ+sO
 LuXANOFb66Ss+hTKonfFbFu470sS/53e44lPymk4ipRB5hh+ZtYbWU9QsCN9KugJ76
 f+s6N7GhY2iNxtupN4xAPOJVPSipxfVQ7w03NOrLyL6fQSqmqtEyIlJZe7jmt3LjuW
 7ZRHmkD3xOC5RhPyTOxlwob6gFmtp0YYUH4vJ4YZNRz9Ct7yGqIFrDxzZ4iFog68v9
 APlFN3eeXKacEfmpB8GCbGSS2dmFVjbMz7vhJ7xOCPMnUSL8rWzFBseFeFNbj7neHP
 NwpJm4W2cjdMQ==
Message-ID: <21335ee2-4c88-4cf9-ad5a-00fb70c96f68@kernel.org>
Date: Thu, 5 Mar 2026 09:48:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Split mailbox channel create function
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260305062041.3954024-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260305062041.3954024-1-lizhi.hou@amd.com>
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
X-Rspamd-Queue-Id: 3A629214D38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action



On 3/5/2026 12:20 AM, Lizhi Hou wrote:
> The management channel used for firmware control command submission is
> currently created after the firmware is started. If channel creation
> fails (for example, due to memory allocation failure or workqueue
> creation interruption), the firmware remains in a pending state and is
> unable to receive any control commands.
> 
> To avoid leaving the firmware in this inconsistent state, split
> xdna_mailbox_create_channel() into two separate functions so that
> resource allocation can be completed before interacting with the
> hardware.
>    xdna_mailbox_alloc_channel()
>      Allocates memory and initializes the workqueue. This can be called
>      earlier, before interacting with the hardware.
>    xdna_mailbox_start_channel()
>      Performs the hardware interaction required to start the channel.
> 
> Rename xdna_mailbox_destroy_channel() to xdna_mailbox_free_channel().
> Ensure that xdna_mailbox_stop_channel() and xdna_mailbox_free_channel()
> properly unwind the corresponding start and allocation steps, respectively.
> 
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_message.c    | 17 +++--
>   drivers/accel/amdxdna/aie2_pci.c        | 63 ++++++++++-------
>   drivers/accel/amdxdna/amdxdna_mailbox.c | 91 ++++++++++++-------------
>   drivers/accel/amdxdna/amdxdna_mailbox.h | 31 +++++----
>   4 files changed, 112 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 22e1a85a7ae0..ffcf3be79e23 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -293,13 +293,20 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   	}
>   
>   	intr_reg = i2x.mb_head_ptr_reg + 4;
> -	hwctx->priv->mbox_chann = xdna_mailbox_create_channel(ndev->mbox, &x2i, &i2x,
> -							      intr_reg, ret);
> +	hwctx->priv->mbox_chann = xdna_mailbox_alloc_channel(ndev->mbox);
>   	if (!hwctx->priv->mbox_chann) {
>   		XDNA_ERR(xdna, "Not able to create channel");
>   		ret = -EINVAL;
>   		goto del_ctx_req;
>   	}
> +
> +	ret = xdna_mailbox_start_channel(hwctx->priv->mbox_chann, &x2i, &i2x,
> +					 intr_reg, ret);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Not able to create channel");
> +		ret = -EINVAL;
> +		goto free_channel;
> +	}
>   	ndev->hwctx_num++;
>   
>   	XDNA_DBG(xdna, "Mailbox channel irq: %d, msix_id: %d", ret, resp.msix_id);
> @@ -307,6 +314,8 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   
>   	return 0;
>   
> +free_channel:
> +	xdna_mailbox_free_channel(hwctx->priv->mbox_chann);
>   del_ctx_req:
>   	aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
>   	return ret;
> @@ -322,7 +331,7 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
>   
>   	xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
>   	ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
> -	xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
> +	xdna_mailbox_free_channel(hwctx->priv->mbox_chann);
>   	XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
>   	hwctx->priv->mbox_chann = NULL;
>   	hwctx->fw_ctx_id = -1;
> @@ -921,7 +930,7 @@ void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev)
>   		return;
>   
>   	xdna_mailbox_stop_channel(ndev->mgmt_chann);
> -	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> +	xdna_mailbox_free_channel(ndev->mgmt_chann);
>   	ndev->mgmt_chann = NULL;
>   }
>   
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 977ce21eaf9f..4924a9da55b6 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -361,10 +361,29 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   	}
>   	pci_set_master(pdev);
>   
> +	mbox_res.ringbuf_base = ndev->sram_base;
> +	mbox_res.ringbuf_size = pci_resource_len(pdev, xdna->dev_info->sram_bar);
> +	mbox_res.mbox_base = ndev->mbox_base;
> +	mbox_res.mbox_size = MBOX_SIZE(ndev);
> +	mbox_res.name = "xdna_mailbox";
> +	ndev->mbox = xdnam_mailbox_create(&xdna->ddev, &mbox_res);
> +	if (!ndev->mbox) {
> +		XDNA_ERR(xdna, "failed to create mailbox device");
> +		ret = -ENODEV;
> +		goto disable_dev;
> +	}
> +
> +	ndev->mgmt_chann = xdna_mailbox_alloc_channel(ndev->mbox);
> +	if (!ndev->mgmt_chann) {
> +		XDNA_ERR(xdna, "failed to alloc channel");
> +		ret = -ENODEV;
> +		goto disable_dev;
> +	}
> +
>   	ret = aie2_smu_init(ndev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "failed to init smu, ret %d", ret);
> -		goto disable_dev;
> +		goto free_channel;
>   	}
>   
>   	ret = aie2_psp_start(ndev->psp_hdl);
> @@ -379,18 +398,6 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   		goto stop_psp;
>   	}
>   
> -	mbox_res.ringbuf_base = ndev->sram_base;
> -	mbox_res.ringbuf_size = pci_resource_len(pdev, xdna->dev_info->sram_bar);
> -	mbox_res.mbox_base = ndev->mbox_base;
> -	mbox_res.mbox_size = MBOX_SIZE(ndev);
> -	mbox_res.name = "xdna_mailbox";
> -	ndev->mbox = xdnam_mailbox_create(&xdna->ddev, &mbox_res);
> -	if (!ndev->mbox) {
> -		XDNA_ERR(xdna, "failed to create mailbox device");
> -		ret = -ENODEV;
> -		goto stop_psp;
> -	}
> -
>   	mgmt_mb_irq = pci_irq_vector(pdev, ndev->mgmt_chan_idx);
>   	if (mgmt_mb_irq < 0) {
>   		ret = mgmt_mb_irq;
> @@ -399,13 +406,13 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   	}
>   
>   	xdna_mailbox_intr_reg = ndev->mgmt_i2x.mb_head_ptr_reg + 4;
> -	ndev->mgmt_chann = xdna_mailbox_create_channel(ndev->mbox,
> -						       &ndev->mgmt_x2i,
> -						       &ndev->mgmt_i2x,
> -						       xdna_mailbox_intr_reg,
> -						       mgmt_mb_irq);
> -	if (!ndev->mgmt_chann) {
> -		XDNA_ERR(xdna, "failed to create management mailbox channel");
> +	ret = xdna_mailbox_start_channel(ndev->mgmt_chann,
> +					 &ndev->mgmt_x2i,
> +					 &ndev->mgmt_i2x,
> +					 xdna_mailbox_intr_reg,
> +					 mgmt_mb_irq);
> +	if (ret) {
> +		XDNA_ERR(xdna, "failed to start management mailbox channel");
>   		ret = -EINVAL;
>   		goto stop_psp;
>   	}
> @@ -413,37 +420,41 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   	ret = aie2_mgmt_fw_init(ndev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
> -		goto destroy_mgmt_chann;
> +		goto stop_fw;
>   	}
>   
>   	ret = aie2_pm_init(ndev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
> -		goto destroy_mgmt_chann;
> +		goto stop_fw;
>   	}
>   
>   	ret = aie2_mgmt_fw_query(ndev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "failed to query fw, ret %d", ret);
> -		goto destroy_mgmt_chann;
> +		goto stop_fw;
>   	}
>   
>   	ret = aie2_error_async_events_alloc(ndev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Allocate async events failed, ret %d", ret);
> -		goto destroy_mgmt_chann;
> +		goto stop_fw;
>   	}
>   
>   	ndev->dev_status = AIE2_DEV_START;
>   
>   	return 0;
>   
> -destroy_mgmt_chann:
> -	aie2_destroy_mgmt_chann(ndev);
> +stop_fw:
> +	aie2_suspend_fw(ndev);
> +	xdna_mailbox_stop_channel(ndev->mgmt_chann);
>   stop_psp:
>   	aie2_psp_stop(ndev->psp_hdl);
>   fini_smu:
>   	aie2_smu_fini(ndev);
> +free_channel:
> +	xdna_mailbox_free_channel(ndev->mgmt_chann);
> +	ndev->mgmt_chann = NULL;
>   disable_dev:
>   	pci_disable_device(pdev);
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 235a94047530..46d844a73a94 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -460,26 +460,49 @@ int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,
>   	return ret;
>   }
>   
> -struct mailbox_channel *
> -xdna_mailbox_create_channel(struct mailbox *mb,
> -			    const struct xdna_mailbox_chann_res *x2i,
> -			    const struct xdna_mailbox_chann_res *i2x,
> -			    u32 iohub_int_addr,
> -			    int mb_irq)
> +struct mailbox_channel *xdna_mailbox_alloc_channel(struct mailbox *mb)
>   {
>   	struct mailbox_channel *mb_chann;
> -	int ret;
> -
> -	if (!is_power_of_2(x2i->rb_size) || !is_power_of_2(i2x->rb_size)) {
> -		pr_err("Ring buf size must be power of 2");
> -		return NULL;
> -	}
>   
>   	mb_chann = kzalloc_obj(*mb_chann);
>   	if (!mb_chann)
>   		return NULL;
>   
> +	INIT_WORK(&mb_chann->rx_work, mailbox_rx_worker);
> +	mb_chann->work_q = create_singlethread_workqueue(MAILBOX_NAME);
> +	if (!mb_chann->work_q) {
> +		MB_ERR(mb_chann, "Create workqueue failed");
> +		goto free_chann;
> +	}
>   	mb_chann->mb = mb;
> +
> +	return mb_chann;
> +
> +free_chann:
> +	kfree(mb_chann);
> +	return NULL;
> +}
> +
> +void xdna_mailbox_free_channel(struct mailbox_channel *mb_chann)
> +{
> +	destroy_workqueue(mb_chann->work_q);
> +	kfree(mb_chann);
> +}
> +
> +int
> +xdna_mailbox_start_channel(struct mailbox_channel *mb_chann,
> +			   const struct xdna_mailbox_chann_res *x2i,
> +			   const struct xdna_mailbox_chann_res *i2x,
> +			   u32 iohub_int_addr,
> +			   int mb_irq)
> +{
> +	int ret;
> +
> +	if (!is_power_of_2(x2i->rb_size) || !is_power_of_2(i2x->rb_size)) {
> +		pr_err("Ring buf size must be power of 2");
> +		return -EINVAL;
> +	}
> +
>   	mb_chann->msix_irq = mb_irq;
>   	mb_chann->iohub_int_addr = iohub_int_addr;
>   	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
> @@ -489,61 +512,37 @@ xdna_mailbox_create_channel(struct mailbox *mb,
>   	mb_chann->x2i_tail = mailbox_get_tailptr(mb_chann, CHAN_RES_X2I);
>   	mb_chann->i2x_head = mailbox_get_headptr(mb_chann, CHAN_RES_I2X);
>   
> -	INIT_WORK(&mb_chann->rx_work, mailbox_rx_worker);
> -	mb_chann->work_q = create_singlethread_workqueue(MAILBOX_NAME);
> -	if (!mb_chann->work_q) {
> -		MB_ERR(mb_chann, "Create workqueue failed");
> -		goto free_and_out;
> -	}
> -
>   	/* Everything look good. Time to enable irq handler */
>   	ret = request_irq(mb_irq, mailbox_irq_handler, 0, MAILBOX_NAME, mb_chann);
>   	if (ret) {
>   		MB_ERR(mb_chann, "Failed to request irq %d ret %d", mb_irq, ret);
> -		goto destroy_wq;
> +		return ret;
>   	}
>   
>   	mb_chann->bad_state = false;
>   	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
>   
> -	MB_DBG(mb_chann, "Mailbox channel created (irq: %d)", mb_chann->msix_irq);
> -	return mb_chann;
> -
> -destroy_wq:
> -	destroy_workqueue(mb_chann->work_q);
> -free_and_out:
> -	kfree(mb_chann);
> -	return NULL;
> +	MB_DBG(mb_chann, "Mailbox channel started (irq: %d)", mb_chann->msix_irq);
> +	return 0;
>   }
>   
> -int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
> +void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
>   {
>   	struct mailbox_msg *mb_msg;
>   	unsigned long msg_id;
>   
> -	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
> +	/* Disable an irq and wait. This might sleep. */
>   	free_irq(mb_chann->msix_irq, mb_chann);
> -	destroy_workqueue(mb_chann->work_q);
> -	/* We can clean up and release resources */
>   
> +	/* Cancel RX work and wait for it to finish */
> +	drain_workqueue(mb_chann->work_q);
> +
> +	/* We can clean up and release resources */
>   	xa_for_each(&mb_chann->chan_xa, msg_id, mb_msg)
>   		mailbox_release_msg(mb_chann, mb_msg);
> -
>   	xa_destroy(&mb_chann->chan_xa);
>   
> -	MB_DBG(mb_chann, "Mailbox channel destroyed, irq: %d", mb_chann->msix_irq);
> -	kfree(mb_chann);
> -	return 0;
> -}
> -
> -void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
> -{
> -	/* Disable an irq and wait. This might sleep. */
> -	disable_irq(mb_chann->msix_irq);
> -
> -	/* Cancel RX work and wait for it to finish */
> -	cancel_work_sync(&mb_chann->rx_work);
> -	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
> +	MB_DBG(mb_chann, "Mailbox channel stopped, irq: %d", mb_chann->msix_irq);
>   }
>   
>   struct mailbox *xdnam_mailbox_create(struct drm_device *ddev,
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.h b/drivers/accel/amdxdna/amdxdna_mailbox.h
> index ea367f2fb738..8b1e00945da4 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.h
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.h
> @@ -74,9 +74,16 @@ struct mailbox *xdnam_mailbox_create(struct drm_device *ddev,
>   				     const struct xdna_mailbox_res *res);
>   
>   /*
> - * xdna_mailbox_create_channel() -- Create a mailbox channel instance
> + * xdna_mailbox_alloc_channel() -- alloc a mailbox channel
>    *
> - * @mailbox: the handle return from xdna_mailbox_create()
> + * @mb: mailbox handle
> + */
> +struct mailbox_channel *xdna_mailbox_alloc_channel(struct mailbox *mb);
> +
> +/*
> + * xdna_mailbox_start_channel() -- start a mailbox channel instance
> + *
> + * @mb_chann: the handle return from xdna_mailbox_alloc_channel()
>    * @x2i: host to firmware mailbox resources
>    * @i2x: firmware to host mailbox resources
>    * @xdna_mailbox_intr_reg: register addr of MSI-X interrupt
> @@ -84,28 +91,24 @@ struct mailbox *xdnam_mailbox_create(struct drm_device *ddev,
>    *
>    * Return: If success, return a handle of mailbox channel. Otherwise, return NULL.
>    */
> -struct mailbox_channel *
> -xdna_mailbox_create_channel(struct mailbox *mailbox,
> -			    const struct xdna_mailbox_chann_res *x2i,
> -			    const struct xdna_mailbox_chann_res *i2x,
> -			    u32 xdna_mailbox_intr_reg,
> -			    int mb_irq);
> +int
> +xdna_mailbox_start_channel(struct mailbox_channel *mb_chann,
> +			   const struct xdna_mailbox_chann_res *x2i,
> +			   const struct xdna_mailbox_chann_res *i2x,
> +			   u32 xdna_mailbox_intr_reg,
> +			   int mb_irq);
>   
>   /*
> - * xdna_mailbox_destroy_channel() -- destroy mailbox channel
> + * xdna_mailbox_free_channel() -- free mailbox channel
>    *
>    * @mailbox_chann: the handle return from xdna_mailbox_create_channel()
> - *
> - * Return: if success, return 0. otherwise return error code
>    */
> -int xdna_mailbox_destroy_channel(struct mailbox_channel *mailbox_chann);
> +void xdna_mailbox_free_channel(struct mailbox_channel *mailbox_chann);
>   
>   /*
>    * xdna_mailbox_stop_channel() -- stop mailbox channel
>    *
>    * @mailbox_chann: the handle return from xdna_mailbox_create_channel()
> - *
> - * Return: if success, return 0. otherwise return error code
>    */
>   void xdna_mailbox_stop_channel(struct mailbox_channel *mailbox_chann);
>   

