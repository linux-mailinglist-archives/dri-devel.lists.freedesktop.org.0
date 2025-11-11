Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01A2C4CC5E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 10:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77C010E05B;
	Tue, 11 Nov 2025 09:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CK1iDT5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB86A10E05B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 09:52:03 +0000 (UTC)
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id Il2dvVh0IctOkIl2dvVzyv; Tue, 11 Nov 2025 10:52:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1762854722;
 bh=gfy7N/mDK+VpLubk+NOWvskvwmHqqBPmJx4tUfYEUDw=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=CK1iDT5h78TDCDCJVut3FTukn6kfp8u9E5nv+falxzhViaXuy1bB/KwPURIcrvV5o
 DUXwXXWG1m7CFhTSXVUsTF/nIe4W7iOex2qnuMit4hluqk0y30+VMCZrk7Q0u6vkGV
 4i3zz+5xj9VplSUgN+3jYQskKbiippzWrwgaoB2bPA/NNKAl0qMANU1tzorsxAdSkH
 BVsUwrnSGWjtvgkrmPjmvYJAFoMd3sjxLchzA+anMBwn6gXRqQutigL7qKOHLQFIzg
 Q6dzLdeWUcPYz9b+oQdeguevKtXVpes5SIjF6f5f2QCmZYdbpIFJjBJs6Cc2e0cLiY
 GwCRSuoF9gRwQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 11 Nov 2025 10:52:02 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <3f40d64a-5312-40b1-890d-68d6c5e5203b@wanadoo.fr>
Date: Tue, 11 Nov 2025 10:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/5] accel/amd_vpci: Add Remote Management (RM) queue
 service APIs
To: David Zhang <yidong.zhang@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sonal.santan@amd.com,
 mario.limonciello@amd.com, lizhi.hou@amd.com, Nishad Saraf <nishads@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
 <20251111011550.439157-5-yidong.zhang@amd.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20251111011550.439157-5-yidong.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 11/11/2025 à 02:15, David Zhang a écrit :
> This patch introduces a set of APIs for allowing the PCIe driver submit
> commands, transfer binary payloads and retrieve firmware metadata.
> 
> Key features:
> - RM queue command APIs:
>    - create and destroy RM queue commands
>    - Initialized command data payloads
>    - Send and poll for command completion
> - Service-level operations:
>    - Retrieve firmware ID
>    - Program accelerator and APU firmware images
>    - Periodic health monitoring
> 
> Co-developed-by: Nishad Saraf <nishads@amd.com>
> Signed-off-by: Nishad Saraf <nishads@amd.com>
> Signed-off-by: David Zhang <yidong.zhang@amd.com>

...

> +static void rm_check_health(struct work_struct *w)
> +{
> +	struct rm_device *rdev = to_rdev_health_monitor(w);
> +	u32 max_len = PAGE_SIZE;
> +	struct rm_cmd *cmd;
> +	int ret;
> +
> +	ret = rm_queue_create_cmd(rdev, RM_QUEUE_OP_GET_LOG_PAGE, &cmd);
> +	if (ret)
> +		return;
> +
> +	ret = rm_queue_payload_init(cmd, RM_CMD_LOG_PAGE_AXI_TRIP_STATUS);
> +	if (ret)
> +		goto destroy_cmd;
> +
> +	ret = rm_queue_send_cmd(cmd, RM_CMD_WAIT_CONFIG_TIMEOUT);
> +	if (ret == -ETIME || ret == -EINVAL)
> +		goto payload_fini;
> +
> +	if (ret) {
> +		u32 log_len = cmd->cq_msg.data.page.len;
> +
> +		if (log_len > max_len) {
> +			vdev_warn(rdev->vdev, "msg size %d is greater than requested %d",
> +				  log_len, max_len);
> +			log_len = max_len;
> +		}
> +
> +		if (log_len) {
> +			char *buffer = vzalloc(log_len);
> +
> +			if (!buffer)
> +				goto payload_fini;
> +
> +			ret = rm_queue_copy_response(cmd, buffer, log_len);
> +			if (ret) {
> +				vfree(buffer);
> +				goto payload_fini;
> +			}
> +
> +			vdev_err(rdev->vdev, "%s", buffer);

This looks like the normal path. is vdev_err() expected here?

> +			vfree(buffer);
> +
> +		} else {
> +			vdev_err(rdev->vdev, "firewall check ret%d", ret);
> +		}
> +
> +		rdev->firewall_tripped = 1;
> +	}
> +
> +payload_fini:
> +	rm_queue_payload_fini(cmd);
> +destroy_cmd:
> +	rm_queue_destroy_cmd(cmd);
> +
> +	vdev_dbg(rdev->vdev, "check result: %d", ret);
> +}

...

> +struct rm_device *versal_pci_rm_init(struct versal_pci_device *vdev)
> +{
> +	struct rm_header *header;
> +	struct rm_device *rdev;
> +	u32 status;
> +	int ret;
> +
> +	rdev = devm_kzalloc(&vdev->pdev->dev, sizeof(*rdev), GFP_KERNEL);
> +	if (!rdev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rdev->vdev = vdev;
> +	header = &rdev->rm_metadata;
> +
> +	rm_shmem_bulk_read(rdev, RM_HDR_OFF, (u32 *)header, sizeof(*header));
> +	if (header->magic != RM_HDR_MAGIC_NUM) {
> +		vdev_err(vdev, "Invalid RM header 0x%x", header->magic);
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	status = rm_shmem_read(rdev, header->status_off);
> +	if (!status) {
> +		vdev_err(vdev, "RM status %d is not ready", status);

This can be simplified, status is knwon to be 0.

> +		ret = -ENODEV;
> +		goto err;
> +	}

...

CJ
