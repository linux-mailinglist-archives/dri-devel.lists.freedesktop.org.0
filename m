Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE22C0E29
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926AD899A5;
	Mon, 23 Nov 2020 14:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28BB899A5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:54:38 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ANEsXCC025461;
 Mon, 23 Nov 2020 08:54:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606143273;
 bh=0U26LSVl82OgM0IJVaWDOHaWYbr2bf96lefxFn/2/LM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Uei2La13mQq7DXw7H4Kvbfy6S74V14vQDnlsSf7ZlFovsNVECUapvYGBL9PFG7CPq
 Bspk0hfxjJohpB6yBxv0wXmb7XHHA/ClZWjXVOiB0YZaD3UHAYHyo9THegJWnUAIwQ
 o1qEoJEs82IuL2lt8RyEwLkgBy+4AXwnjfNvJe6I=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ANEsX67096764
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 23 Nov 2020 08:54:33 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 23
 Nov 2020 08:54:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 23 Nov 2020 08:54:33 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ANEsVmr018018;
 Mon, 23 Nov 2020 08:54:31 -0600
Subject: Re: [PATCH v3 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-7-nikhil.nd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <784bb22e-2199-cdfd-985b-5c58474e1e88@ti.com>
Date: Mon, 23 Nov 2020 16:54:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119160134.9244-7-nikhil.nd@ti.com>
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
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/11/2020 18:01, Nikhil Devshatwar wrote:
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
> Use the enable / disable function as required in other places.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Reviewed-by: Swapnil Jakhade <sjakhade@cadence.com>

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

I think this is fine as a fix for this issue, but at some point the irq management needs some work.
E.g. we call cdns_mhdp_bridge_hpd_enable when attaching/enabling the hw, but also via
drm_bridge_funcs->hpd_enable. This doesn't make sense, as one of those calls doesn't achieve
anything, as cdns_mhdp_bridge_hpd_enable has already been called.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
