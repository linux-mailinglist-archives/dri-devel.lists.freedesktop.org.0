Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C02ADA5D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 16:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9FC899E7;
	Tue, 10 Nov 2020 15:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D275899E7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:25:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAFPIuD102186;
 Tue, 10 Nov 2020 09:25:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605021918;
 bh=v6dWUXyip8IhYZnCnYGPD+I2Cf7xlYDih/oSG5T5e6Q=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=rwkAO6ED1rKq/RXu1GSOqGTZLtzxeUq7SAlX+Tdt9B7ZOSOj986w+TXyffTY35FBr
 g4/WLEe1FqR+2EBAKRnOXuARnrQuox0DeP9I2NAvOVDUwOu18gPJfrNr39KVQTVQS8
 Pn1yZ60racgkJ+4w/XzrXRWOfx0McWaqD946x6xg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAFPId7028355
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 09:25:18 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 09:25:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 09:25:18 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAFPFfW125916;
 Tue, 10 Nov 2020 09:25:16 -0600
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
 <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
 <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
 <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
 <67786545-23D2-444F-85B8-7A030070B317@goldelico.com>
 <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com>
 <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com>
 <db0b9694-4d04-18ba-fdf0-093b5914bbf0@ti.com>
 <6A9407FC-69F7-4E30-B4A3-FFB2E91CAE3B@goldelico.com>
 <1cf563e5-2dc0-1802-86e3-3e24150f0651@ti.com>
 <BBC7824A-A689-4144-969C-32608A202A75@goldelico.com>
 <7f820fd2-820b-bfdd-a43b-174ad6b09868@ti.com>
 <0AF59BFD-89F2-46D3-9EB6-F47FBB52B183@goldelico.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3c74b6b8-5a25-920f-2ea3-93c26e79a7d1@ti.com>
Date: Tue, 10 Nov 2020 17:25:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0AF59BFD-89F2-46D3-9EB6-F47FBB52B183@goldelico.com>
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/2020 15:49, H. Nikolaus Schaller wrote:

> I did now some tests based on v5.10-rc3 by adding mre and more printk() and dump_stack().
> And I did blacklist the panel driver so that I could boot and after modprobing it manually
> I could trigger a re-probe by inserting some USB memory stick.
> 
> With this procedure I could trace the problem down to this call sequence:
> 
> 	dsi_probe()
>           ...
> 	  w677l_probe()
>             drm_panel_add()   -- after this, of_drm_find_panel() is successful
>           ...
> 	  component_add()
> 	    try_to_bring_up_master()
>  	      master->ops->bind(master->dev)
> 
> This call to bind() does not return and likely the probing thread is then blocked and
> holds some locks which manifests itself in that the system isn't running stable any
> more (e.g. heartbeat LEDs are sometimes stuck although console still works).
> 
> dbg_info() in try_to_bring_up_master() prints:
> 
> [  102.199362] omapdss_dss 58000000.dss: trying to bring up master
> 
> So I am not sure if this is a panel driver issue at all or the DSI patch set is not
> running stable on OMAP5.
> 
> Is a good next step to trace dss_bind() in drivers/gpu/drm/omapdrm//dss/dss.c?

For me, on omap5 uevm, the dss bind goes fine. But it gets stuck in videomode clock calculations.
Something related to pixel clock, I think, as the pclk dsi receives is 3708754968 kHz (so, garbage).
I'll try to debug more tomorrow.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
