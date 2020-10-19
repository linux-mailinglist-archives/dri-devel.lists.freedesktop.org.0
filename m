Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A00292704
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 14:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB4E6E926;
	Mon, 19 Oct 2020 12:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C34E6E926
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 12:11:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JCB6eg006109;
 Mon, 19 Oct 2020 07:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603109466;
 bh=c0x2CWzXqzxkxqHJKanWzm6Kvi68vSPZZXNm6+VmyRs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hFOTJyuVLuGWsghL9aXItnXK9USJZVs80ho8tpc7qEIANUUQrMIZp3PxclMjjWlDc
 1Hqh9N8qcuPiFhvJxIEsZXkWHMJ0bJrXtkwzuGALbo/w20qNT05BSBGgekHh1024AQ
 Z3G81/HSLrpC7Xh5zLkepqp446iDCdNpG3G3XO4I=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JCB6BB104470
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Oct 2020 07:11:06 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 19
 Oct 2020 07:11:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 19 Oct 2020 07:11:05 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JCB482085435;
 Mon, 19 Oct 2020 07:11:04 -0500
Subject: Re: [PATCH 0/5] drm/tidss: Use new connector model for tidss
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <bce76514-897e-ee9b-e51d-76b40345c49a@ti.com>
Date: Mon, 19 Oct 2020 15:11:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016103917.26838-1-nikhil.nd@ti.com>
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
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikhil,

On 16/10/2020 13:39, Nikhil Devshatwar wrote:
> This series moves the tidss to using new connectoe model, where the 
> SoC driver (tidss) creates the connector and all the bridges are 
> attached with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
> 
> Since the bridges do not create the connector, the bus format and
> bus_flag is set after the format negotiation.
> Support format negotiations in the tfp410 and mhdp bridge drivers.
> 
> Nikhil Devshatwar (5):
>   drm/tidss: Move to newer connector model
>   drm/tidss: Set bus_format correctly from bridge/connector
>   drm: bridge: Propagate the bus flags from bridge->timings
>   drm/bridge: tfp410: Support format negotiation
>   drm/bridge: mhdp8564: Support format negotiation

I think the patch order could be a bit different. If you first change the tidss to use the new
connector model, and only afterwards fix the bridges we use, then there's a time when the displays
won't work.

Also, with J7 EVM and DP, when I unload the modules I see:

[   43.238895] irq 31: nobody cared (try booting with the "irqpoll" option)
[   43.245591] CPU: 0 PID: 349 Comm: irq/31-mhdp8546 Not tainted 5.9.0-rc5-00605-g08a291316f86 #4
[   43.254186] Hardware name: Texas Instruments K3 J721E SoC (DT)
[   43.260006] Call trace:
[   43.262453]  dump_backtrace+0x0/0x1d8
[   43.266107]  show_stack+0x18/0x28
[   43.269416]  dump_stack+0xe0/0x14c
[   43.272810]  __report_bad_irq+0x4c/0xdc
[   43.276637]  note_interrupt+0x2cc/0x388
[   43.280465]  handle_irq_event_percpu+0x88/0x90
[   43.284898]  handle_irq_event+0x48/0xf8
[   43.288725]  handle_fasteoi_irq+0xcc/0x180
[   43.292811]  generic_handle_irq+0x30/0x48
[   43.296811]  __handle_domain_irq+0x94/0x108
[   43.300986]  gic_handle_irq+0x60/0x158
[   43.304726]  el1_irq+0xbc/0x180
[   43.307862]  _raw_spin_unlock_irq+0x48/0x90
[   43.312035]  irq_finalize_oneshot.part.0+0x68/0x108
[   43.316903]  irq_thread_fn+0x60/0xa0
[   43.320469]  irq_thread+0x1b8/0x248
[   43.323949]  kthread+0x128/0x160
[   43.327169]  ret_from_fork+0x10/0x34
[   43.330735] handlers:
[   43.333020] [<000000005367c4f9>] irq_default_primary_handler threaded [<000000007e02b601>]
cdns_mhdp_irq_handler [cdns_mhdp8546]
[   43.344607] Disabling IRQ #31

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
