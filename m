Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B842C4CBDA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 10:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E247310E4E8;
	Tue, 11 Nov 2025 09:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MyrqbHIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C99710E4E8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 09:44:18 +0000 (UTC)
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id Ikv8vvv4mV77oIkv9vtG0N; Tue, 11 Nov 2025 10:44:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1762854257;
 bh=CHfLli/YyfFwV3T0yFA5G67pC7Ph9J6EzmMhdJSTX8Q=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=MyrqbHIwDIIicrv0dBc9pNSUOif9qqZ3Q74BUyuUG1+zXfgFU0lbDirwv10WniNvE
 rpD9UL+grgg+40XvtnkngWeCx8xhVlpzXrzr+M6KEmQ7UsG5MF+EbVTJrLlSagSQHC
 yEyuCfK2BpKelwB1h9BXz6G+vP2I6Fn8Lt4Cdy2lDhrpL7kMVVWdGTTz0Ej4bmLF7i
 MpsGvTklr9drVCRxy29UCnCESthcl6okud7P0l+RvE5YWQTq1yowP+MBboUpug4UsI
 97D612mB25qwdaNeavvsy/yFeH8vQiL2LYklYvLkHqeUFaVvh1Nu9D6qbnCANbKFPE
 CbzWXS+pBLuQA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 11 Nov 2025 10:44:17 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <269e26c5-556c-47c5-bd1a-163bf2386365@wanadoo.fr>
Date: Tue, 11 Nov 2025 10:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/5] accel/amd_vpci: Add Remote Management(RM) queue
 infrastructure
To: David Zhang <yidong.zhang@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sonal.santan@amd.com,
 mario.limonciello@amd.com, lizhi.hou@amd.com, Nishad Saraf <nishads@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
 <20251111011550.439157-4-yidong.zhang@amd.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20251111011550.439157-4-yidong.zhang@amd.com>
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
> This patch introduces a Remote Management (RM) queue service, which
> provides a way to communicate between the management PCIe function (PF0)
> and the embedded firmware running on AMD Versal SoCs.
> 
> The RM service implements a hardware-based ring buffer for bidirectional
> command and response exchange between the host driver and the firmware.
> 
> This patch adds the core infrastructure for:
>    - Initializing and managing the RM queue
>    - Submitting commands to the embedded firmware
>    - Polling for command completion
> 
> Subsequent patches will integrate the infrastructure with the firmware
> management logic to enable firmware download, status query, and other
> control operations.
> 
> Co-developed-by: Nishad Saraf <nishads@amd.com>
> Signed-off-by: Nishad Saraf <nishads@amd.com>
> Signed-off-by: David Zhang <yidong.zhang@amd.com>

...

> diff --git a/drivers/accel/amd_vpci/versal-pci-rm-service.h b/drivers/accel/amd_vpci/versal-pci-rm-service.h
> new file mode 100644
> index 000000000000..d2397a1a672c
> --- /dev/null
> +++ b/drivers/accel/amd_vpci/versal-pci-rm-service.h

...

> +#define RM_CMD_ID_MIN			1
> +#define RM_CMD_ID_MAX			(BIT(17) - 1)
> +#define RM_CMD_SQ_HDR_OPS_MSK		GENMASK(15, 0)
> +#define RM_CMD_SQ_HDR_SIZE_MSK		GENMASK(14, 0)
> +#define RM_CMD_SQ_SLOT_SIZE		SZ_512
> +#define RM_CMD_CQ_SLOT_SIZE		SZ_16
> +#define RM_CMD_CQ_BUFFER_SIZE		(1024 * 1024)

SZ_1M to be consistent with other xx_SIZE macro?

> +#define RM_CMD_CQ_BUFFER_OFFSET		0x0
> +#define RM_CMD_LOG_PAGE_TYPE_MASK	GENMASK(15, 0)
> +#define RM_CMD_VMR_CONTROL_MSK		GENMASK(10, 8)
> +#define RM_CMD_VMR_CONTROL_PS_MASK	BIT(9)
> +
> +#define RM_CMD_WAIT_CONFIG_TIMEOUT	msecs_to_jiffies(10 * 1000)
> +#define RM_CMD_WAIT_DOWNLOAD_TIMEOUT	msecs_to_jiffies(300 * 1000)

secs_to_jiffies() maybe to be less verbose?

> +
> +#define RM_COMPLETION_TIMER		(HZ / 10)
> +#define RM_HEALTH_CHECK_TIMER		(HZ)

...

CJ
