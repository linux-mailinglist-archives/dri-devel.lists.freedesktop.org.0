Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A62A89B65
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E6010E734;
	Tue, 15 Apr 2025 11:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="E58DCs1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A6910E74D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:05:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250415110519euoutp0106565487def6ca22cdb6162b332129a1~2eShd2ICl2215322153euoutp01w
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:05:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250415110519euoutp0106565487def6ca22cdb6162b332129a1~2eShd2ICl2215322153euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744715119;
 bh=aLn/AEFMpttKdygzkWg+Y5Dq2mkLBesLmZHzH94VPGc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=E58DCs1NUaSwKao4LKfxIj91XGUjTRE+nn/2SlezVw44dT2oSDAzJQzbtnewYVs5V
 5SG8ZmRRzrNc4s4jn8FAFf0xWOfQgCIb74/W90JlULhd3ko4CrbGngOJgUodgV52X4
 vITh7Szz7rSlLJyjmG/7Obrxx/tiaswKAjsJCDUU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250415110519eucas1p13d350463a1db089b07e6f07975d75457~2eShF3vr-1800318003eucas1p1M;
 Tue, 15 Apr 2025 11:05:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 21.CB.20409.F6D3EF76; Tue, 15
 Apr 2025 12:05:19 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250415110519eucas1p282dfd609fa94c8d7dc2f8c5582124fe7~2eSgnW5bQ0518205182eucas1p2E;
 Tue, 15 Apr 2025 11:05:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250415110518eusmtrp225a31cef6c14e09144833c668f90dac0~2eSgmFd9S2890028900eusmtrp2h;
 Tue, 15 Apr 2025 11:05:18 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-b9-67fe3d6fce8c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 46.17.19920.E6D3EF76; Tue, 15
 Apr 2025 12:05:18 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250415110517eusmtip2fcfb3b74759928d6aab8b3af31fed6a3~2eSfcbQPF1773317733eusmtip2w;
 Tue, 15 Apr 2025 11:05:17 +0000 (GMT)
Message-ID: <a3142259-1c72-45b9-b148-5e5e6bef87f9@samsung.com>
Date: Tue, 15 Apr 2025 13:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/imagination: Skip clocks if platform PM
 manages resources
To: Matt Coster <Matt.Coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, Drew Fustini
 <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <1226d261-247a-4a7c-a414-7db4a24fab9e@imgtec.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzNfe/xXlsseRYnV2G6NXMLMlDApTcKZl3MfIYt0USzRVhYM58t
 jFLTWrc5jEUqX9JRl8GkOEDGxIDdEtoiJVZmRSorKwY/mIavoeVLGCDI2IZ0tA83/jvnd889
 53duLg8XlZHreWmZR1l1pixDTAqIxra/PNGqxEX51vIRiG51V2PossODoSelUySqbPUEob4u
 K4buPpsk0Y/e2xQacWQTaNTUR6I7zedJNGNoBahxRk8ic2svhS5M2whU09QMUG7BxSDU23eL
 QPmTOhx9N1uCI9/VJgqV/9FCIev42SDkMn+A9C3fEG9DxjFXRTB2Uy/FFNk7ANNQV0AyPfev
 kkxF+z6m/4wLYyw1Jxm9uQ1jip9vZSav3SOZr6x1gLG4v2RmGjbsDTkoSDjEZqQdY9Vbdn4s
 UNwe9GJHciI+d7oZHRhdWwj4PEhvg48W/sQLgYAnoi8B+GDOSHJkFsCuAiPFkRkAx30l4MWV
 0dxHy6paAIftFwiOTABYfLMG86uE9E5YPKsP8mOC3gTLr+fh3Hw1bC97TPjxS/RG2P/wHOXH
 oXQyNJvPBTRr6PfgQP8g5jfF6XsUHPH6AtE4HQYfPq4MBJB0HByorQwE8JfC6utdGKfZCHNs
 5YFGkC4RQOMZ3VICb4nsghU5kVyFUDjmslIcjoA+O+cJaRUcsD3FOZwF7UWuZbwD9nj+Jv02
 OB0Jf2rewo2l8J8HUzjnHgJ/m1jNbRACv278dnkshPm5Ik79OiwpMvwX6rnUiBmB2LTiUUwr
 OppWdDH9n1sFiDoQxmo1SjmrictkP4vRyJQabaY85hOVsgEs/V73omu2CdSOTcc4AcYDTgB5
 uHiN0CNZlIuEh2RfHGfVqlS1NoPVOEE4jxCHCatbTstFtFx2lP2UZY+w6henGI+/XocFJ0VG
 O7M6ReEuKqkwqk2sWzfklTtTwgddJ/Lu8FNCpYezsr5XTwpf80jm4EScPSr/d4fkF6H1h7OG
 7F8lb1lTO7xlJ4NF18MXDCrK5pPOG1Aqybe4z79yyjfx6oHazYrEjlVD2fWV65Lw0hsZ764F
 80V7lFdu7nk2ZaGHxm9clC0+feN4T3vy5X1m0TXYGf3+R0N1yfGbWu+e2LZr1c+6aS27vdCR
 3j12umy38YDCfcqnaP/Q2lHK16ftjY/OdrwTvBDV25Kg7ZZapMPKiq5OZ/7+xKoE/nZJyv34
 w+nzZGzI7mNPDs4/3297ebg4Qm6MHWCrI64kWvLS1Rve3MEXExqFLHYzrtbI/gXYpfatLAQA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsVy+t/xe7p5tv/SDc6dNrE4cX0Rk8WaveeY
 LF5P+8BmMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYvJx1j83i8q45bBafe48wWmz73MJm
 sfbIXXaLhR+3slgs2bGL0aKtcxmrxd17J1gsOt43MFvM/TKV2eL/nh3sFrPf7We32PJmIqvF
 8bXhFi37p7A4SHjs/baAxWPnrLvsHj07zzB6bFrVyeZx59oeNo95JwM97ncfZ/LYvKTeo2Xt
 MSaP/r8GHu/3XWXz6NuyitFj8+lqj8+b5AL4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws
 9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyLjx6ylTQLFNx6LRHA+NLsS5GTg4JAROJl22P2boY
 uTiEBJYySjxY84kdIiEjca37JQuELSzx51oXVNFrRonGW3eYQRK8AnYS/V9aWEFsFgFVidkH
 26HighInZz4BaxYVkJe4f2sG2FBhgWiJtWtngNWICPhIPLj/iAlkKLPAbXaJmx+msUBs2Msk
 sXtuL1g3s4C4xK0n85lAbDYBI4kHy+eDbeME2rx69XGgOAdQjbrE+nlCEOXyEs1bZzNPYBSa
 heSOWUgmzULomIWkYwEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAZLPt2M/NOxjnvfqo
 d4iRiYPxEKMEB7OSCO8583/pQrwpiZVVqUX58UWlOanFhxhNgWExkVlKNDkfmO7ySuINzQxM
 DU3MLA1MLc2MlcR53S6fTxMSSE8sSc1OTS1ILYLpY+LglGpg2n0mbPpWl+LNEfO5Zh0S+PW+
 /9ENuwrhs9vkpezVz0Zcvmu8U3j1mo/l0hJPQmdOcuYrcPope7iues3L5m+LWesKDPZO0O5r
 5wt9tezaW63G+dfaFaM/nqpNbWCxuZr18azF3YQ7XDMdtHV0D/7Tkz09UWf+JiaGY5u37dm1
 gG/dvLJfhTFbLrLH2x9Yti66O6b8WnNA6NoWn5Ut4k1b5jFkrteeKmC6bl7bHHu18AMf9sh7
 KohsjGALXOBZuCNR161gZ8x0X/Nl3q+7H7q3X2zpUI43qXX2ucQxzatd2d1uqbTAtFVac/hf
 ld0od1hvvnL+f26bNzxSh37dP53BJMC4v4RJ4+belvpjPs2blFiKMxINtZiLihMBJxWbGL8D
 AAA=
X-CMS-MailID: 20250415110519eucas1p282dfd609fa94c8d7dc2f8c5582124fe7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250414185317eucas1p139284a38dc4418ac90bd081c2825142a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250414185317eucas1p139284a38dc4418ac90bd081c2825142a
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <CGME20250414185317eucas1p139284a38dc4418ac90bd081c2825142a@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-4-70c5af2af96c@samsung.com>
 <20250415-poetic-magenta-cicada-9d1ee7@houat>
 <1226d261-247a-4a7c-a414-7db4a24fab9e@imgtec.com>
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



On 4/15/25 11:15, Matt Coster wrote:
> On 15/04/2025 09:55, Maxime Ripard wrote:
>> On Mon, Apr 14, 2025 at 08:52:58PM +0200, Michal Wilczynski wrote:
>>> Update the Imagination PVR driver to skip clock management during
>>> initialization if the platform PM has indicated that it manages platform
>>> resources.
>>>
>>> This is necessary for platforms like the T-HEAD TH1520, where the GPU's
>>> clocks and resets are managed via a PM domain, and should not be
>>> manipulated directly by the GPU driver.
>>>
>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>> ---
>>>  drivers/gpu/drm/imagination/pvr_device.c | 14 ++++++++++----
>>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
>>> index 1704c0268589bdeb65fa6535f9ec63182b0a3e94..f40468b99cf14da418aeecde086f009695ff877c 100644
>>> --- a/drivers/gpu/drm/imagination/pvr_device.c
>>> +++ b/drivers/gpu/drm/imagination/pvr_device.c
>>> @@ -504,10 +504,16 @@ pvr_device_init(struct pvr_device *pvr_dev)
>>>  	if (err)
>>>  		return err;
>>>  
>>> -	/* Enable and initialize clocks required for the device to operate. */
>>> -	err = pvr_device_clk_init(pvr_dev);
>>> -	if (err)
>>> -		return err;
>>> +	/*
>>> +	 * Only initialize clocks if they are not managed by the platform's
>>> +	 * PM domain.
>>> +	 */
>>> +	if (!device_platform_resources_pm_managed(dev)) {
>>> +		/* Enable and initialize clocks required for the device to operate. */
>>> +		err = pvr_device_clk_init(pvr_dev);
>>> +		if (err)
>>> +			return err;
>>> +	}
>>
>> So, how does that work for devfreq? I can understand the rationale for
>> resets and the sys clock, but the core clock at least should really be
>> handled by the driver.

Hi Maxime, Matt,

Thanks for the feedback.

This commit is trying to prevent the pvr RUNTIME_PM_OPS from controlling the
clocks or resets, as there is a custom start/stop sequence needed for
the TH1520 SoC coded in patch 3 of this series.

static const struct dev_pm_ops pvr_pm_ops = {
	RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume, pvr_power_device_idle)
};

So, if the core clock needs to be used for other purposes like devfreq,
we could move the device_platform_resources_pm_managed() check to the
pvr_power_* functions instead. This would prevent the clocks and resets
from being managed in runtime PM in the consumer driver, while still
allowing the GPU driver to access and control clocks like the core clock
as needed for other purposes.

That way, clocks could be safely shared between the PM domain driver and the
device driver, with generic PM driver controlling the start/stop
sequence for reset and clocks. We would probably need to find a
better name for the flag then, to more clearly reflect that it's about
delegating clock/reset PM runtime control, rather than full resource
ownership.

> 
> I agree, this feels a bit "all or nothing" to me. There's only one clock
> on this platform that has issues, we can still control the other two
> just fine.
> 
> I thought fixed clocks were the standard mechanism for exposing
> non-controllable clocks to device drivers?

That's correct — and it's not really about the MEM clock at this point.
The main goal is to ensure the custom power-up sequence for the TH1520
SoC is followed. That sequence is implemented in
th1520_gpu_domain_start() in patch 3 of this series.

Regards,
Michał

> 
> Cheers,
> Matt
> 
>>
>> Maxime
> 
> 
