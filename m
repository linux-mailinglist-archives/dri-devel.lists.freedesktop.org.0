Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72A4E8ED2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 09:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E7010E606;
	Mon, 28 Mar 2022 07:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA53110E0F2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 02:22:18 +0000 (UTC)
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KRbxw5HL5zCrBW;
 Mon, 28 Mar 2022 10:20:04 +0800 (CST)
Received: from [10.174.178.212] (10.174.178.212) by
 kwepemi500015.china.huawei.com (7.221.188.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Mar 2022 10:22:15 +0800
Subject: Re: [PATCH v2 -next] drm/vc4: Fix build error when CONFIG_DRM_VC4=y
 && CONFIG_RASPBERRYPI_FIRMWARE=m
To: Maxime Ripard <maxime@cerno.tech>
References: <20220325021831.2812735-1-zhengbin13@huawei.com>
 <20220325130541.tjxq4kjgmkaz32en@houat>
From: "Zhengbin (OSKernel)" <zhengbin13@huawei.com>
Message-ID: <601a9682-6afc-d87b-cfa7-5c683271f7a5@huawei.com>
Date: Mon, 28 Mar 2022 10:22:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20220325130541.tjxq4kjgmkaz32en@houat>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.212]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 28 Mar 2022 07:18:23 +0000
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
Cc: emma@anholt.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tangyizhou@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/3/25 21:05, Maxime Ripard wrote:
> Hi,
>
> On Fri, Mar 25, 2022 at 10:18:31AM +0800, Zheng Bin wrote:
>> If CONFIG_DRM_VC4=y, CONFIG_RASPBERRYPI_FIRMWARE=m, CONFIG_COMPILE_TEST=n,
>> bulding fails:
>>
>> drivers/gpu/drm/vc4/vc4_drv.o: In function `vc4_drm_bind':
>> vc4_drv.c:(.text+0x320): undefined reference to `rpi_firmware_get'
>> vc4_drv.c:(.text+0x320): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rpi_firmware_get'
>> vc4_drv.c:(.text+0x34c): undefined reference to `rpi_firmware_property'
>> vc4_drv.c:(.text+0x34c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rpi_firmware_property'
>> vc4_drv.c:(.text+0x354): undefined reference to `rpi_firmware_put'
>> vc4_drv.c:(.text+0x354): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rpi_firmware_put'
>>
>> Make DRM_VC4 depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST to fix this.
>>
>> Fixes: c406ad5e4a85 ("drm/vc4: Notify the firmware when DRM is in charge")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
>> ---
>> v2: follow Maxime's advise, add RASPBERRYPI_FIRMWARE as an additional depends
>>   drivers/gpu/drm/vc4/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
>> index de3424fed2fc..92d74ba7c449 100644
>> --- a/drivers/gpu/drm/vc4/Kconfig
>> +++ b/drivers/gpu/drm/vc4/Kconfig
>> @@ -2,6 +2,7 @@
>>   config DRM_VC4
>>   	tristate "Broadcom VC4 Graphics"
>>   	depends on ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST
>> +	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
> Why do we need the || COMPILE_TEST here?
>
> The rpi_firmware_get, _property and _put functions aren't define if
> RASPBERRYPI_FIRMWARE, so we need that dependency every time, even if
> COMPILE_TEST is set?

include/soc/bcm2835/raspberrypi-firmware.h

#if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)

struct rpi_firmware *rpi_firmware_get(struct device_node 
*firmware_node);/_property/_put

#else    -->empty function

  static inline struct rpi_firmware *rpi_firmware_get(struct device_node 
*firmware_node)/_property/_put
{
          return NULL;
  }
#endif


We can refer to drivers/pwm/Kconfig

config PWM_RASPBERRYPI_POE
          tristate "Raspberry Pi Firwmware PoE Hat PWM support"
          # Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can 
only
         # happen when COMPILE_TEST=y, hence the added 
!RASPBERRYPI_FIRMWARE.
          depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && 
!RASPBERRYPI_FIRMWARE)  -->There is no need to add (&& 
!RASPBERRYPI_FIRMWARE)

>
> Maxime
