Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D782AE92A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 07:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33BD89F03;
	Wed, 11 Nov 2020 06:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED5389F03
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 06:40:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AB6eIvH035181;
 Wed, 11 Nov 2020 00:40:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605076819;
 bh=IcDsB8KsET7h6YqC9INM8Cbp9cg17R8rn2B5UDZiGUU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=SqHBvScZRHqHuWeUuMGSFs3DeB2aI3s3NJuG6lds36/LGVw83LXI2MtP9tv1BymOS
 sKslBErbUd7B8rm2PiKjOmUWYkhAYe3eWjyRxQx55q2O6kmojxk4WgDo1rM3hdIbXy
 D80O+w56GSmt80GFj7G69eAwQnDSoinqbf6bBI58=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AB6eI0R052893
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 00:40:18 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 00:40:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 00:40:18 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AB6eGQw074077;
 Wed, 11 Nov 2020 00:40:16 -0600
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
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
 <AEAA7281-7B82-47A6-A0BA-EF08C56824A8@goldelico.com>
 <917fe1c6-4009-7788-f815-fcc1fc2ba7df@ti.com>
 <2265AEF5-42BC-4E7B-B263-D0B93B78DE91@goldelico.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <dd0a41eb-aa86-7c5c-3151-313a0d9d0883@ti.com>
Date: Wed, 11 Nov 2020 08:40:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2265AEF5-42BC-4E7B-B263-D0B93B78DE91@goldelico.com>
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
 Sebastian Reichel <sre@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/2020 23:04, H. Nikolaus Schaller wrote:
> 
>> Am 10.11.2020 um 17:52 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>
>> On 10/11/2020 18:49, H. Nikolaus Schaller wrote:
>>
>> I guess you have the same issue. It goes to dsi_bridge_mode_valid, then __dsi_calc_config, and stays
>> there finding good clocks.
> 
> Yes, I could trace it down to exactly this point.
> 
> So the culprit is somehow the panel driver. Because it asks for clocks that the PLL driver does not want to provide...
> Or is it the victim?
> 
> Here is what dmesg reports with even more printk():
> 
> [  276.970635] drm_helper_probe_single_connector_modes 12 count=1
> [  277.003509] drm_mode_validate_pipeline 2 ret=0 status=0
> [  277.038678] drm_bridge_chain_mode_valid: func=dsi_bridge_mode_valid+0x0/0xa0 [omapdrm]
> [  277.047199] dsi_bridge_mode_valid
> [  277.050786] __dsi_calc_config
> [  277.057270] dsi_vm_calc
> [  277.073251] dss_pll_calc_a clkin=19200000 pll_min=1555386656 pll_max=1555410656 func=dsi_vm_calc_pll_cb+0x0/0x48 [omapdrm]
> [  277.084975] dss_pll_calc_a pll_hw_max=1800000000 fint_hw_min=150000 fint_hw_max=52000000
> [  277.093637] dss_pll_calc_a n_start=1 n_inc=1 n_stop=128 pll_max'=1555410656
> [  277.101062] dss_pll_calc_a n=1 clkin=19200000 fint=19200000
> [  277.107152] dss_pll_calc_a m_start=41 m_inc=1 m_stop=40
> 
> Ok, we have to wait quite a while until the for(m;;) loop ends, because m_stop < m_start and m_inc is positive.
> 
> So something in the formulae in dss_pll_calc_a() does not fit or has unintended rounding effects.
> Or the values reported by w677l_get_modes() do not fit anything.
> 
> I think these findings and ideas should help to find a fix.

drm_display_mode.clock is in kHz, but the panel driver writes Hz (w677l_PIXELCLOCK) to it. But
there's more after fixing that. The DSI gets configured in bridge's modeset, which I think is before
w677l_prepare where the panel already sends DSI commands. Also, the dsi driver fails to lock the
PLL, so possibly the clock calcs are still wrong.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
