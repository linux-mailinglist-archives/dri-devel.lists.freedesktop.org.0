Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75A3A45A23
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 10:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5575610E897;
	Wed, 26 Feb 2025 09:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9M72BxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9937510E897
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740562268; x=1772098268;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aA4r9kRPrOXQ3QUTG85erLmJ/9y+2oi5pl5vJZHAoBc=;
 b=W9M72BxFjKGCx7PYUQXCfOUu4WRoSxaNOfC0nFKgf3Okc7qnICmgkvx4
 qehvUkt5eanFCe+f4uOjkB4yziB/aQjrKUOV66EmeiN7B2+O+leIfNtdI
 7Ryx1yhJ5uq6RKjln8VKrVp0ny9Ptm8t6raC+nfzE5BFzO0sGJeuXCYoi
 Uo5ZEAe7y2amAy/Bh5B2SfyzdUEqG1gu3uzsEdtAdOLnOBZSui7Wa1lNC
 wX7yGBN9yX1DOvhOsU4zm3t+IClM7F2SliQ9qwrekkB1H/OZtyHrXd2EM
 NELD/qq8amKnjq14VQJ+wHZ4iwAZwSiQf1rsFMnzhc8PaLMwse41/FYH3 A==;
X-CSE-ConnectionGUID: cc14qoEnRvOa/LD7K3uJEg==
X-CSE-MsgGUID: GGfT3gopReeSArIgCc1gdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66771145"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="66771145"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:31:07 -0800
X-CSE-ConnectionGUID: sVN5g470S+ehj+gWsf2C5Q==
X-CSE-MsgGUID: vlU7jzCmRFCNI6l159fVpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117572913"
Received: from avijaya-mobl2.gar.corp.intel.com (HELO [10.245.115.15])
 ([10.245.115.15])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:31:03 -0800
Message-ID: <8c8fbd0a-7c5f-49e7-b02d-031e8b712883@linux.intel.com>
Date: Wed, 26 Feb 2025 10:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Check interrupt register before
 mailbox_rx_worker exits
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, Mario.Limonciello@amd.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20250225172616.3804796-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250225172616.3804796-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 2/25/2025 6:26 PM, Lizhi Hou wrote:
> There is a timeout failure been found during stress tests. If the firmware
> generates a mailbox response right after driver clears the mailbox channel
> interrupt register, the hardware will not generate an interrupt for the
> response. This causes the unexpected mailbox command timeout.
> 
> To handle this failure, driver checks the interrupt register before
> exiting mailbox_rx_worker(). If there is a new response, driver goes back
> to process it.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/amdxdna/amdxdna_mailbox.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index de7bf0fb4594..efe6cbc44d14 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -348,8 +348,6 @@ static irqreturn_t mailbox_irq_handler(int irq, void *p)
>  	trace_mbox_irq_handle(MAILBOX_NAME, irq);
>  	/* Schedule a rx_work to call the callback functions */
>  	queue_work(mb_chann->work_q, &mb_chann->rx_work);
> -	/* Clear IOHUB register */
> -	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -357,6 +355,7 @@ static irqreturn_t mailbox_irq_handler(int irq, void *p)
>  static void mailbox_rx_worker(struct work_struct *rx_work)
>  {
>  	struct mailbox_channel *mb_chann;
> +	u32 iohub;
There is no need for this variable. Just use if (mailbox_reg_read()).

>  	int ret;
>  
>  	mb_chann = container_of(rx_work, struct mailbox_channel, rx_work);
> @@ -366,6 +365,9 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
>  		return;
>  	}
>  
> +again:
> +	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
> +
>  	while (1) {
>  		/*
>  		 * If return is 0, keep consuming next message, until there is
> @@ -380,9 +382,19 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
>  			MB_ERR(mb_chann, "Unexpected ret %d, disable irq", ret);
>  			WRITE_ONCE(mb_chann->bad_state, true);
>  			disable_irq(mb_chann->msix_irq);
> -			break;
> +			return;
disable_irq() should not be called here. It will be called for the second time in xdna_mailbox_stop_channel() and enable/disable calls should be balanced.

>  		}
>  	}
> +
> +	/*
> +	 * The hardware will not generate interrupt if firmware creates a new
> +	 * response right after driver clears interrupt register. Check
> +	 * the interrupt register to make sure there is not any new response
> +	 * before exiting.
> +	 */
> +	iohub = mailbox_reg_read(mb_chann, mb_chann->iohub_int_addr);
> +	if (iohub)
> +		goto again;
>  }
>  
>  int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,

Regards,
Jacek
