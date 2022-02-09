Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D076F4AF438
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1271510E429;
	Wed,  9 Feb 2022 14:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF04B10E429
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:38:48 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:46846.1353479076
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 5A47810013E;
 Wed,  9 Feb 2022 22:38:43 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 b8ba3d7581f14446908f10874ba183d2 for maxime@cerno.tech; 
 Wed, 09 Feb 2022 22:38:45 CST
X-Transaction-ID: b8ba3d7581f14446908f10874ba183d2
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Message-ID: <84bfb2fc-595c-3bae-e8a0-c19ccbcfcfd8@189.cn>
Date: Wed, 9 Feb 2022 22:38:41 +0800
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
 <11ac5696-29e3-fefa-31c0-b7b86c88bbdc@189.cn>
 <20220209084908.kub4bs64rzhvpvon@houat>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220209084908.kub4bs64rzhvpvon@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 2022/2/9 16:49, Maxime Ripard wrote:
> On Fri, Feb 04, 2022 at 12:04:19AM +0800, Sui Jingfeng wrote:
>>>> +/* Get the simple EDID data from the device tree
>>>> + * the length must be EDID_LENGTH, since it is simple.
>>>> + *
>>>> + * @np: device node contain edid data
>>>> + * @edid_data: where the edid data to store to
>>>> + */
>>>> +static bool lsdc_get_edid_from_dtb(struct device_node *np,
>>>> +				   unsigned char *edid_data)
>>>> +{
>>>> +	int length;
>>>> +	const void *prop;
>>>> +
>>>> +	if (np == NULL)
>>>> +		return false;
>>>> +
>>>> +	prop = of_get_property(np, "edid", &length);
>>>> +	if (prop && (length == EDID_LENGTH)) {
>>>> +		memcpy(edid_data, prop, EDID_LENGTH);
>>>> +		return true;
>>>> +	}
>>>> +
>>>> +	return false;
>>>> +}
>>> You don't have a device tree binding for that driver, this is something
>>> that is required. And it's not clear to me why you'd want EDID in the
>>> DTB?
>> 1) It is left to the end user of this driver.
>>
>> The downstream motherboard maker may use a dpi(XRGB888) or LVDS panel
>> which don't have DDC support either, doing this way allow them put a
>> EDID property into the dc device node in the DTS. Then the entire system works.
>> Note those panel usually support only one display mode.
> I guess it depends on what we mean exactly by the user, but the DTB
> usually isn't under the (end) user control. And the drm.edid_firmware is
> here already to address exactly this issue.
>
> On the other end, if the board has a static panel without any DDC lines,
> then just put the timings in the device tree, there's no need for an
> EDID blob.

Loongson have a long history of using PMON firmware, The PMON firmware
support flush the dtb into the the firmware before grub loading the kernel.
You press 'c' key, then the PMON will give you a shell. it is much like a
UEFI shell. Suppose foo.dtb is what you want to pass to the vmlinuz.
Then type the follow single command can flush the dtb into the PMON firmware.

|load_dtb /dev/fs/fat@usb0/foo.dtb|

For our PMON firmware, it**is**  totally under developer/pc board maker's control.
You can flush whatever dtb every time you bootup until you satisfied.
It(the pmon firmware) is designed to let downstream motherboard maker and/or
customers to play easily.

Support of reading EDID from the dtb is really a feature which downstream
motherboard maker or customer wanted. They sometimes using eDP also whose
resolution is not 1024x768. This is out of control for a graphic driver
developer like me. And drm.edid_firmware have only a few limited resolution
which is weak.

I will consider to adding drm.edid_firmware support, thanks.

>> 2) That is for the display controller in ls2k1000 SoC.
>>
>> Currently, the upstream kernel still don't have GPIO, PWM and I2C driver support
>> for LS2K1000 SoC.
>>
>> How dose you read EDID from the monitor without a I2C driver?
>>
>> without reading EDID the device tree support, the screen just black,
>> the lsdc driver just stall. With reading EDID from device tree support
>> we do not need a i2c driver to light up the monitor.
>>
>> This make lsdc drm driver work on various ls2k1000 development board
>> before I2C driver and GPIO driver and PWM backlight driver is upstream.
>>
>> I have many local private dts with the bindings, those local change just can not
>> upstream at this time, below is an example.
>>
>> The device tree is a platform description language. It's there to let
>> the OS know what the hardware is, but the state of hardware support in
>> the said OS isn't a parameter we have to take into account for a new
>> binding.
>>
>> If you don't have any DDC support at the moment, use the firmware
>> mechanism above, or add fixed modes using drm_add_modes_noedid in the
>> driver, and leave the DT out of it. Once you'll gain support for the
>> EDID readout in the driver, then it'll just work and you won't need to
>> change the DT again.
>>
The resolution will be 1024x768, it will also add a lot modes which may
not supported by the specific panel. Take 1024x600 as an example,
Both drm_add_modes_noedid() and firmware mechanism above will fail.

Because the user supply EDID only and manufacturer of some strange panel
supply EDID only.

>> 3) Again, doing this way is for graphic environment bring up.
>>
>> &lsdc {
>>
>>      output-ports = <&dvo0 &dvo1>;
>>      #address-cells = <1>;
>>      #size-cells = <0>;
>>      dvo0: dvo@0 {
>>          reg = <0>;
>>
>>          connector = "dpi-connector";
>>          encoder = "none";
>>          status = "ok";
>>
>>          display-timings {
>>              native-mode = <&mode_0_1024x600_60>;
>>
>>              mode_0_1024x600_60: panel-timing@0 {
>>                  clock-frequency = <51200000>;
>>                  hactive = <1024>;
>>                  vactive = <600>;
>>                  hsync-len = <4>;
>>                  hfront-porch = <160>;
>>                  hback-porch = <156>;
>>                  vfront-porch = <11>;
>>                  vback-porch = <23>;
>>                  vsync-len = <1>;
>>              };
>>
>>              mode_1_800x480_60: panel-timing@1 {
>>                  clock-frequency = <30066000>;
>>                  hactive = <800>;
>>                  vactive = <480>;
>>                  hfront-porch = <50>;
>>                  hback-porch = <70>;
>>                  hsync-len = <50>;
>>                  vback-porch = <0>;
>>                  vfront-porch = <0>;
>>                  vsync-len = <50>;
>>              };
>>          };
>>      };
>>
>>      dvo1: dvo@1 {
>>          reg = <1>;
>>
>>          connector = "hdmi-connector";
>>          type = "a";
>>          encoder = "sil9022";
>>
>>          edid = [ 00 ff ff ff ff ff ff 00 1e 6d 54 5b 0b cc 04 00
>>               02 1c 01 03 6c 30 1b 78 ea 31 35 a5 55 4e a1 26
>>               0c 50 54 a5 4b 00 71 4f 81 80 95 00 b3 00 a9 c0
>>               81 00 81 c0 90 40 02 3a 80 18 71 38 2d 40 58 2c
>>               45 00 e0 0e 11 00 00 1e 00 00 00 fd 00 38 4b 1e
>>               53 0f 00 0a 20 20 20 20 20 20 00 00 00 fc 00 4c
>>               47 20 46 55 4c 4c 20 48 44 0a 20 20 00 00 00 ff
>>               00 38 30 32 4e 54 43 5a 39 38 33 37 39 0a 00 35 ];
>>
>>          status = "ok";
>>      };
>> };
> Yeah, this needs to be documented with a YAML schema
>
> Maxime
Yes, It takes time to learn that.
