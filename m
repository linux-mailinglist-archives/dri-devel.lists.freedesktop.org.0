Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB8A477ED
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 09:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA4210EA5D;
	Thu, 27 Feb 2025 08:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrREfj5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E45E10EA5D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740645415; x=1772181415;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2fgm/t8SmQha9aOuyc63QP2w702ksgRACwKPM3V0uN8=;
 b=LrREfj5DiQwhVhXffllWWtK1C2cJ9daspVoAci2bRjnpZl72QoD3S+Nd
 C1dHeDQlx0k1IULMU5mCkCxlSJSQXZAIXCI67DFz6TLjX+ab2TPLOb0cY
 bew5Aksl2EDypNzEoioyjzBXFJMvM5os7DIWOylIRI32syemFrPSHuef9
 hmy8TxXq/4kwmJueI62LadFHRtrhJcpPD4y+O7dY+Jfy7m6yj9t3ikfqv
 EFqAHHNW+MEafkD8YY6W4sNJFhmmwSPWneSricLIxabzlSodJT+7okKLP
 JGQqqH5qYvqQZGPq2IdKoD8uN3EdJU50hS9zo8visWmNJtDQsG9T7Dfhx g==;
X-CSE-ConnectionGUID: YVYyggFlT7a+dZX2nJfi9Q==
X-CSE-MsgGUID: n4aWc8BaQ0SNTWDyeUCuQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45436096"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="45436096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 00:36:55 -0800
X-CSE-ConnectionGUID: CWHXJ9ImRgSnInY7jL3gyQ==
X-CSE-MsgGUID: kIHcHcaHTSiywuCyrqMY1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="121969913"
Received: from akadakia-mobl2.amr.corp.intel.com (HELO [10.246.17.153])
 ([10.246.17.153])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 00:36:51 -0800
Message-ID: <41667dcc-b57d-44ff-99cf-5a91dbec1e56@linux.intel.com>
Date: Thu, 27 Feb 2025 09:36:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Check interrupt register before
 mailbox_rx_worker exits
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, Mario.Limonciello@amd.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20250226161810.4188334-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250226161810.4188334-1-lizhi.hou@amd.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 2/26/2025 5:18 PM, Lizhi Hou wrote:
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
>  drivers/accel/amdxdna/amdxdna_mailbox.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index de7bf0fb4594..8651b1d3c3ab 100644
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
> @@ -366,6 +364,9 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
>  		return;
>  	}
>  
> +again:
> +	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
> +
>  	while (1) {
>  		/*
>  		 * If return is 0, keep consuming next message, until there is
> @@ -379,10 +380,18 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
>  		if (unlikely(ret)) {
>  			MB_ERR(mb_chann, "Unexpected ret %d, disable irq", ret);
>  			WRITE_ONCE(mb_chann->bad_state, true);
> -			disable_irq(mb_chann->msix_irq);
> -			break;
> +			return;
>  		}
>  	}
> +
> +	/*
> +	 * The hardware will not generate interrupt if firmware creates a new
> +	 * response right after driver clears interrupt register. Check
> +	 * the interrupt register to make sure there is not any new response
> +	 * before exiting.
> +	 */
> +	if (mailbox_reg_read(mb_chann, mb_chann->iohub_int_addr))
> +		goto again;
>  }
>  
>  int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,

