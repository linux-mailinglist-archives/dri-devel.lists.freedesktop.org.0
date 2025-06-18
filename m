Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F320ADE610
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5362210E7A6;
	Wed, 18 Jun 2025 08:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="niWXb23o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1685A10E7A6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:49:56 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55I8niJH252504;
 Wed, 18 Jun 2025 03:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1750236584;
 bh=Q2xB7ywuamf1tnr/sOCDBvt3pfiU9lnIYo04w0xjJr8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=niWXb23orKAWNy+o4VK/GEIv/nVDqnPL7kcW0H9VyEl6GbPYdxPTa3zNiqIXbh6zm
 GZN+LqIF6hdkKiluMOP1srCqv1ggKX69ZkvYPp1340bg6zqTTUQjJaMze4wAtXfxiF
 XJp2qAKUrCUInAfh7LFuJtOio1eanjjS5hP/trqY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55I8nhr12769042
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 18 Jun 2025 03:49:43 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 03:49:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 03:49:42 -0500
Received: from [172.24.227.143] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.143])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55I8ndJ43422402;
 Wed, 18 Jun 2025 03:49:40 -0500
Message-ID: <0d72844f-fdc3-4fcb-8590-ee8512179d8f@ti.com>
Date: Wed, 18 Jun 2025 14:19:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tidss: Decouple max_pclk from tidss feats to remove
 clock dependency
To: Maxime Ripard <mripard@kernel.org>
CC: <jyri.sarha@iki.fi>, <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>, 
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>
References: <20250618075804.139844-1-j-choudhary@ti.com>
 <20250618-groovy-stereotyped-aardwolf-27bb40@houat>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20250618-groovy-stereotyped-aardwolf-27bb40@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hello Maxime,

On 18/06/25 14:02, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Jun 18, 2025 at 01:28:04PM +0530, Jayesh Choudhary wrote:
>> TIDSS hardware by itself does not have variable max_pclk for each VP.
>> Each VP supports a fixed maximum pixel clock. K2 devices and AM62*
>> devices uses "ultra-light" version where each VP supports a max of
>> 300MHz whereas J7* devices uses TIDSS where all VP can support a
>> max pclk of 600MHz.
>> The limitation that has been modeled till now comes from the clock
>> (PLL can only be programmed to a particular max value). Due to this
>> we end up using different compatible for each SoC when the clocking
>> architecture changes for VPs, even when the hardware is essentially
>> the same.
>> max_pclk cannot be entirely removed since the display controller
>> should tell if a particular mode clock can be supported or not in crtc's
>> "mode_valid()" call. So remove "max_pclk_khz" from the static display
>> feat and add it to "tidss_device" structure which would be modified in
>> runtime. In mode_valid() call, check if a best frequency match for mode
>> clock can be found or not using "clk_round_rate()". Based on that,
>> propagate "max_pclk" and check max_clk again only if the requested mode
>> clock is greater than saved value. (As the preferred display mode is
>> usually the max resolution, driver ends up checking the maximum clock
>> the first time itself which is used in subsequent checks)
>> Since TIDSS display controller provides clock tolerance of 5%, we use
>> this while checking the max_pclk. Also, move up "dispc_pclk_diff()"
>> before it is called.
>>
>> This will make the existing compatibles reusable.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> 
> We've generally used 0.5% in drivers with similar requirements, because
> that's what VESA requires for some mode generation techniques (and
> what's required by HDMI too iirc).
> 
> We've never had to revisit it on any driver afaik, so unless you have a
> specific reason to do so, I'd really prefer if you stuck with that as
> well.

I agree with 0.5% but I was just trying to keep it in sync with existing
tidss tolerance.

In tidss_crtc.c when we set the clk rate in crtc_atomic_enable() using
dispc_vp_set_clk_rate(), we are giving it 5% tolerance:
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/tidss/tidss_dispc.c#n1446

So I kept it 5%.

Warm Regards,
Jayesh


> 
> Maxime
