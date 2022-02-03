Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DCF4A87EB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853A289021;
	Thu,  3 Feb 2022 15:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 739A810E12E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:47:21 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:58618.813769924
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 2E9991001AF;
 Thu,  3 Feb 2022 23:47:18 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 03f015533ad84bf7b23a2b34974ce730 for maxime@cerno.tech; 
 Thu, 03 Feb 2022 23:47:20 CST
X-Transaction-ID: 03f015533ad84bf7b23a2b34974ce730
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <57805e19-285a-76d3-16e3-09a3eb7a9540@189.cn>
Date: Thu, 3 Feb 2022 23:47:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220203085851.yqstkfgt4dz7rcnw@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/3 16:58, Maxime Ripard wrote:
>> diff --git a/drivers/gpu/drm/lsdc/Kconfig b/drivers/gpu/drm/lsdc/Kconfig
>> new file mode 100644
>> index 000000000000..7ed1b0fdbe1b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/Kconfig
>> @@ -0,0 +1,38 @@
>> +config DRM_LSDC
>> +	tristate "DRM Support for loongson's display controller"
>> +	depends on DRM && PCI
>> +	depends on MACH_LOONGSON64 || LOONGARCH || MIPS || COMPILE_TEST
>> +	select OF
>> +	select CMA if HAVE_DMA_CONTIGUOUS
>> +	select DMA_CMA if HAVE_DMA_CONTIGUOUS
>> +	select DRM_KMS_HELPER
>> +	select DRM_KMS_FB_HELPER
>> +	select DRM_GEM_CMA_HELPER
>> +	select VIDEOMODE_HELPERS
>> +	select BACKLIGHT_PWM if CPU_LOONGSON2K
>> +	select I2C_GPIO if CPU_LOONGSON2K
>> +	select I2C_LS2X if CPU_LOONGSON2K
>> +	default m
>> +	help
>> +	  This is a KMS driver for the display controller in the LS7A1000
>> +	  bridge chip and LS2K1000 SoC. The display controller has two
>> +	  display pipes and it is a PCI device.
>> +	  When using this driver on LS2K1000/LS2K0500 SoC, its framebuffer
>> +	  is located at system memory.
>> +	  If "M" is selected, the module will be called lsdc.
>> +
>> +	  If in doubt, say "Y".
>> +
>> +config DRM_LSDC_VRAM_DRIVER
>> +	bool "vram helper based device driver support"
>> +	depends on DRM_LSDC
>> +	select DRM_VRAM_HELPER
>> +	default y
>> +	help
>> +	  When using this driver on LS7A1000 + LS3A3000/LS3A4000/LS3A5000
>> +	  platform, the LS7A1000 bridge chip has dedicated video RAM. Using
>> +	  "lsdc.use_vram_helper=1" in the kernel command line will enable
>> +	  this driver mode and then the framebuffer will be located at the
>> +	  VRAM at the price of losing PRIME support.
>> +
>> +	  If in doubt, say "Y".
> This doesn't sound right. The driver should make the proper decision
> depending on the platform, not the user or the distribution.

The LS7A1000 north bridge chip has dedicated video RAM, but the DC in LS7A1000
can also scanout from the system memory directly like a display controller in a
SoC does. In fact, this display controller is envolved from early product of
Loongson 2H SoC. This driver still works even if the downstream PC board
manufacturer doesn't solder a video RAM on the mother board.

The lsdc_should_vram_helper_based() function in lsdc_drv.c will examine
if the DC device node contain a use_vram_helper property at driver loading time.
If there is no use_vram_helper property, CMA helper based DRM driver will be used.
Doing this way allow the user using "lsdc.use_vram_helper=0" override the default
behavior even through there is a "use_vram_helper;" property in the DTS.

In short, It is intend to let the command line passed from kernel has higher
priority than the device tree. Otherwise the end user can not switch different
driver mode through the kernel command line once the DC device node contain
"use_vram_helper;" property.

This driver's author already made the decision by the time when the patch is
sent out, even through this**may not proper.

The CMA helper based driver will be used by default, if the DC device node contain
"use_vram_helper;" then VRAM based driver will be used. This is my initial intention.


