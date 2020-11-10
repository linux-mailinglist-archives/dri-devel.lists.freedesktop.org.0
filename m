Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A072AD255
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 10:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0A7898AA;
	Tue, 10 Nov 2020 09:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0723A898AA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 09:21:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AA9L83L084131;
 Tue, 10 Nov 2020 03:21:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605000068;
 bh=yO0aUsuh1c/W89Q+KKukKa0yi1ppP25R4mDLQCaAUVc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=d0D9jsQKNDYveuxO+WkfQUB6dWR64gW50TjCgyYHUoe++FjPEYuiS+J+1JP0GJs0T
 9daWzuu+PC72UZzcuNsq6JKHGUyhOjcHR67+iYwz2FnW/qKRo/vAnVwLjQiMpQ5Eha
 cQjeofpFKTGyKyL81BOqjqW/HA9rN1lFqDOrapIk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AA9L8tY105435
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 03:21:08 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 03:21:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 03:21:08 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AA9L6Xq096247;
 Tue, 10 Nov 2020 03:21:07 -0600
Subject: Re: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>,
 Swapnil Jakhade <sjakhade@cadence.com>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <20201109170601.21557-7-nikhil.nd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1e434bb5-c027-792a-0c4d-c3cf057a0ec6@ti.com>
Date: Tue, 10 Nov 2020 11:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109170601.21557-7-nikhil.nd@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Amonkar <yamonkar@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 19:06, Nikhil Devshatwar wrote:
> When removing the tidss driver, there is a warning reported by
> kernel about an unhandled interrupt for mhdp driver.
> 
> [   43.238895] irq 31: nobody cared (try booting with the "irqpoll" option)
> ... [snipped backtrace]
> [   43.330735] handlers:
> [   43.333020] [<000000005367c4f9>] irq_default_primary_handler threaded [<000000007e02b601>]
> cdns_mhdp_irq_handler [cdns_mhdp8546]
> [   43.344607] Disabling IRQ #31
> 
> This happens because as part of cdns_mhdp_bridge_hpd_disable, driver tries
> to disable the interrupts. While disabling the SW_EVENT interrupts,
> it accidentally enables the MBOX interrupts, which are not handled by
> the driver.
> 
> Fix this with a read-modify-write to update only required bits.
> Do the same for enabling interrupts as well.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 2cd809eed827..6beccd2a408e 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2146,7 +2146,8 @@ static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
>  
>  	/* Enable SW event interrupts */
>  	if (mhdp->bridge_attached)
> -		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(readl(mhdp->regs + CDNS_APB_INT_MASK) &
> +		       ~CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
>  }
>  
> @@ -2154,7 +2155,9 @@ static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
>  {
>  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>  
> -	writel(CDNS_APB_INT_MASK_SW_EVENT_INT, mhdp->regs + CDNS_APB_INT_MASK);
> +	writel(readl(mhdp->regs + CDNS_APB_INT_MASK) |
> +	       CDNS_APB_INT_MASK_SW_EVENT_INT,
> +	       mhdp->regs + CDNS_APB_INT_MASK);
>  }
>  
>  static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {

Good catch. I wonder why we need the above functions... We already enable and disable the interrupts
when attaching/detaching the driver. And I think we want to get the interrupt even if we won't
report HPD (but I think we always do report it), as we need the interrupts to track the link status.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
