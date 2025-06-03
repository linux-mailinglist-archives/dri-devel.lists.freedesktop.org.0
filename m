Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDACFACCDC4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 21:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4362110E669;
	Tue,  3 Jun 2025 19:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Wsr43rha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E0810E669
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 19:43:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250603194324euoutp0113131abe8f3a3bbdb4d0b45381c9b66b~Fn921ZJ8N1156211562euoutp01S
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 19:43:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250603194324euoutp0113131abe8f3a3bbdb4d0b45381c9b66b~Fn921ZJ8N1156211562euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748979804;
 bh=k6PWReahnB4o9xhLZy2nP1dUtfgYd6gAWiwYwq7Ovuw=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Wsr43rhawhY4vbAbAfmkUF6zLCXJipuCtFZbq6YWOT5dlxIpjpUKIarA3+gdWtEFs
 EQz3hxPD2W+ry28gzBtnQUhOm7RSWkB/LBLOeOT2XV7kdQUR1ZioZHFNrs4o4B1cWb
 nytr3LQkfl/nwMeuH+Mrte0WLT+A/pel4488Ejms=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250603194324eucas1p2752406c355cfbd93e1acf8ccb30d9f55~Fn92HrNH50957009570eucas1p2i;
 Tue,  3 Jun 2025 19:43:24 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250603194322eusmtip2c13b4dfea6d39b7a619c012500cf58f9~Fn91EU57e2231322313eusmtip2B;
 Tue,  3 Jun 2025 19:43:22 +0000 (GMT)
Message-ID: <d42a8c49-7ad2-49ef-bd9c-1e3d9981b58e@samsung.com>
Date: Tue, 3 Jun 2025 21:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
 Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250603-whispering-jaybird-of-thunder-f87867@kuoka>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250603194324eucas1p2752406c355cfbd93e1acf8ccb30d9f55
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1
X-EPHeader: CA
X-CMS-RootMailID: 20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-3-83d5744d997c@samsung.com>
 <20250603-whispering-jaybird-of-thunder-f87867@kuoka>
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



On 6/3/25 15:28, Krzysztof Kozlowski wrote:
> On Fri, May 30, 2025 at 12:23:50AM GMT, Michal Wilczynski wrote:
>> Update the Imagination PVR DRM driver to leverage the pwrseq framework
>> for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.
>>
>> In pvr_device_init(), the driver now attempts to get a handle to the
>> "gpu-power" sequencer target using devm_pwrseq_get(). If successful,
>> the responsibility for powering on and off the GPU's core clocks and
>> resets is delegated to the power sequencer. Consequently, the GPU
>> driver conditionally skips acquiring the GPU reset line if the pwrseq
>> handle is obtained, as the sequencer's match function will acquire it.
>> Clock handles are still acquired by the GPU driver for other purposes
>> like devfreq.
>>
>> The runtime PM callbacks, pvr_power_device_resume() and
>> pvr_power_device_suspend(), are modified to call pwrseq_power_on() and
>> pwrseq_power_off() respectively when the sequencer is present.  If no
>> sequencer is found, the driver falls back to its existing manual clock
>> and reset management. A helper function,
>> pvr_power_off_sequence_manual(), is introduced to encapsulate the manual
>> power-down logic.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/imagination/Kconfig      |  1 +
>>  drivers/gpu/drm/imagination/pvr_device.c | 33 +++++++++++--
>>  drivers/gpu/drm/imagination/pvr_device.h |  6 +++
>>  drivers/gpu/drm/imagination/pvr_power.c  | 82 +++++++++++++++++++++-----------
>>  4 files changed, 89 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
>> index 3bfa2ac212dccb73c53bdc2bc259bcba636e7cfc..737ace77c4f1247c687cc1fde2f139fc2e118c50 100644
>> --- a/drivers/gpu/drm/imagination/Kconfig
>> +++ b/drivers/gpu/drm/imagination/Kconfig
>> @@ -11,6 +11,7 @@ config DRM_POWERVR
>>  	select DRM_SCHED
>>  	select DRM_GPUVM
>>  	select FW_LOADER
>> +  select POWER_SEQUENCING
> 
> Messed indent.
> 
>>  	help
>>  	  Choose this option if you have a system that has an Imagination
>>  	  Technologies PowerVR (Series 6 or later) or IMG GPU.
>> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
>> index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..19d48bbc828cf2b8dbead602e90ff88780152124 100644
>> --- a/drivers/gpu/drm/imagination/pvr_device.c
>> +++ b/drivers/gpu/drm/imagination/pvr_device.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>> +#include <linux/pwrseq/consumer.h>
>>  #include <linux/reset.h>
>>  #include <linux/slab.h>
>>  #include <linux/stddef.h>
>> @@ -631,10 +632,34 @@ pvr_device_init(struct pvr_device *pvr_dev)
>>  	if (err)
>>  		return err;
>>  
>> -	/* Get the reset line for the GPU */
>> -	err = pvr_device_reset_init(pvr_dev);
>> -	if (err)
>> -		return err;
>> +	/*
>> +	 * Try to get a power sequencer. If successful, it will handle clocks
>> +	 * and resets. Otherwise, we fall back to managing them ourselves.
>> +	 */
>> +	pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
>> +	if (IS_ERR(pvr_dev->pwrseq)) {
>> +		int pwrseq_err = PTR_ERR(pvr_dev->pwrseq);
>> +
>> +		/*
>> +		 * If the error is -EPROBE_DEFER, it's because the
>> +		 * optional sequencer provider is not present
>> +		 * and it's safe to fall back on manual power-up.
> 
> It is safe but why it is desirable? The rule is rather to defer the
> probe, assuming this is probe path.

Yeah this is probe path.

The GPU node will depend on the AON node, which will be the sole
provider for the 'gpu-power' sequencer (based on the discussion in patch
1).

Therefore, if the AON/pwrseq driver has already completed its probe, and
devm_pwrseq_get() in the GPU driver subsequently returns -EPROBE_DEFER
(because pwrseq_get found 'no match' on the bus for 'gpu-power'), the
interpretation is that the AON driver did not register this optional
sequencer. Since AON is the only anticipated source, it implies the
sequencer won't become available later from its designated provider.
This specific scenario is when we intend to fall back to manual power
management, which pvr driver is capable of, it just doesn't work for the
TH1520 SoC, as it has a custom requirements implemented by the pwrseq
driver.

> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
