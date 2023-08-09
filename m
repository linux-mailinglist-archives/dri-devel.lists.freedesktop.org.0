Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E264477714F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4DB10E4CF;
	Thu, 10 Aug 2023 07:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0221410E444
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691589340; x=1723125340;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=gJzCp6ekx7CCevIM8uCATPGn/y4r8KOXNfeq4gNJ+QM=;
 b=WHW0oUZNQA8ySOiq9/RnXeq6OB9FXneGI9GGNZnXIlT7DGsInqTF1ftT
 hOZxGTsfXjQkSNXFT9VpcbE+1VIBdOJZ/RwRXQi8lAdt62k4r8R6Zu0NV
 UjMof+5kX+59i18YrAfAwrP1n86uFZv5vryUadhev9lh2MGV0npkZfDT+
 gy38nV1qw/AYBUzW67uHi4wzgifNl3qve8FyaE7aigWGW+ROI2dNmXOgm
 7NLhdZqxNoQm0HEUvypqaYSdozDjw/+HTxGn9cnZW+lolDxU/RRrEdS3F
 /eJWiXOHsPXw3RPkaocz3MtYtp4x+cy6FRBI+OoTDKtPIrGekYsTRbBcn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370029114"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="370029114"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 06:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845966693"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="845966693"
Received: from cvogler-mobl1.ger.corp.intel.com ([10.252.40.229])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 06:55:23 -0700
Date: Wed, 9 Aug 2023 16:55:20 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v2 05/11] PCI/VGA: Move the new_state assignment out of
 the loop
In-Reply-To: <20230808223412.1743176-6-sui.jingfeng@linux.dev>
Message-ID: <ce60a772-4a6d-e31d-a195-c6a7e36ff26@linux.intel.com>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-6-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Thu, 10 Aug 2023 07:25:03 +0000
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Aug 2023, Sui Jingfeng wrote:

> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> In the vga_arbiter_notify_clients() function, the value of the 'new_state'
> variable will be 'false' on systems that have more than one VGA device.
> The value will be 'true' if there is only one VGA device or no VGA device
> at all. Hence, its value is not relevant to the iteration of the loop.
> 
> So move the assignment clause out of the loop. For a system with multiple
> video cards, this patch saves unnecessary assignment.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index dc10a262fb5e..6883067a802a 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -1468,22 +1468,20 @@ static void vga_arbiter_notify_clients(void)
>  {
>  	struct vga_device *vgadev;
>  	unsigned long flags;
> -	uint32_t new_decodes;
> -	bool new_state;
> +	bool state;
>  
>  	if (!vga_arbiter_used)
>  		return;
>  
> +	state = (vga_count > 1) ? false : true;
> +

Is it safe to move this outside of the lock?

This would be enough (no need for ?: construct):

state = vga_count <= 1;

Or if you want to keep it as > 1:

state = !(vga_count > 1);

>  	spin_lock_irqsave(&vga_lock, flags);
>  	list_for_each_entry(vgadev, &vga_list, list) {
> -		if (vga_count > 1)
> -			new_state = false;
> -		else
> -			new_state = true;
>  		if (vgadev->set_decode) {
> -			new_decodes = vgadev->set_decode(vgadev->pdev,
> -							 new_state);
> -			vga_update_device_decodes(vgadev, new_decodes);
> +			unsigned int decodes;
> +
> +			decodes = vgadev->set_decode(vgadev->pdev, state);
> +			vga_update_device_decodes(vgadev, decodes);
>  		}
>  	}
>  	spin_unlock_irqrestore(&vga_lock, flags);
> 


-- 
 i.


