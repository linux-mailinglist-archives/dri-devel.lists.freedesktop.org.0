Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5C4B36F5
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 19:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6C410E21A;
	Sat, 12 Feb 2022 18:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 106F410E21A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 18:11:43 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:60616.1189609616
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 611C3100139;
 Sun, 13 Feb 2022 02:11:33 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 30291ab50f664b3aaf0ab2bf57b87b99 for maxime@cerno.tech; 
 Sun, 13 Feb 2022 02:11:40 CST
X-Transaction-ID: 30291ab50f664b3aaf0ab2bf57b87b99
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Message-ID: <8b7bcb57-4450-ed67-bd5f-d8e8f2e74510@189.cn>
Date: Sun, 13 Feb 2022 02:11:30 +0800
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
 <84bfb2fc-595c-3bae-e8a0-c19ccbcfcfd8@189.cn>
 <20220209161624.42ijbnhanaaari46@houat>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220209161624.42ijbnhanaaari46@houat>
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


On 2022/2/10 00:16, Maxime Ripard wrote:
> On Wed, Feb 09, 2022 at 10:38:41PM +0800, Sui Jingfeng wrote:
>> On 2022/2/9 16:49, Maxime Ripard wrote:
>>> On Fri, Feb 04, 2022 at 12:04:19AM +0800, Sui Jingfeng wrote:
>>>>>> +/* Get the simple EDID data from the device tree
>>>>>> + * the length must be EDID_LENGTH, since it is simple.
>>>>>> + *
>>>>>> + * @np: device node contain edid data
>>>>>> + * @edid_data: where the edid data to store to
>>>>>> + */
>>>>>> +static bool lsdc_get_edid_from_dtb(struct device_node *np,
>>>>>> +				   unsigned char *edid_data)
>>>>>> +{
>>>>>> +	int length;
>>>>>> +	const void *prop;
>>>>>> +
>>>>>> +	if (np == NULL)
>>>>>> +		return false;
>>>>>> +
>>>>>> +	prop = of_get_property(np, "edid", &length);
>>>>>> +	if (prop && (length == EDID_LENGTH)) {
>>>>>> +		memcpy(edid_data, prop, EDID_LENGTH);
>>>>>> +		return true;
>>>>>> +	}
>>>>>> +
>>>>>> +	return false;
>>>>>> +}
>>>>> You don't have a device tree binding for that driver, this is something
>>>>> that is required. And it's not clear to me why you'd want EDID in the
>>>>> DTB?
>>>> 1) It is left to the end user of this driver.
>>>>
>>>> The downstream motherboard maker may use a dpi(XRGB888) or LVDS panel
>>>> which don't have DDC support either, doing this way allow them put a
>>>> EDID property into the dc device node in the DTS. Then the entire system works.
>>>> Note those panel usually support only one display mode.
>>> I guess it depends on what we mean exactly by the user, but the DTB
>>> usually isn't under the (end) user control. And the drm.edid_firmware is
>>> here already to address exactly this issue.
>>>
>>> On the other end, if the board has a static panel without any DDC lines,
>>> then just put the timings in the device tree, there's no need for an
>>> EDID blob.
>> Loongson have a long history of using PMON firmware, The PMON firmware
>> support flush the dtb into the the firmware before grub loading the kernel.
>> You press 'c' key, then the PMON will give you a shell. it is much like a
>> UEFI shell. Suppose foo.dtb is what you want to pass to the vmlinuz.
>> Then type the follow single command can flush the dtb into the PMON firmware.
>>
>> |load_dtb /dev/fs/fat@usb0/foo.dtb|
>>
>> For our PMON firmware, it**is**  totally under developer/pc board maker's control.
>> You can flush whatever dtb every time you bootup until you satisfied.
>> It(the pmon firmware) is designed to let downstream motherboard maker and/or
>> customers to play easily.
>>
>> Support of reading EDID from the dtb is really a feature which downstream
>> motherboard maker or customer wanted. They sometimes using eDP also whose
>> resolution is not 1024x768. This is out of control for a graphic driver
>> developer like me.
> And, to reinstate, we already have a mechanism to set an EDID, and if it
> wasn't an option, the DT is not the place to store an EDID blob.

I know, put edid blob in the dts maybe abuse, but i am not push dts with edid blob either.

It is left to other people, and the ./arch/powerpc/boot/dts/ac14xx.dts already have edid blob.

>> And drm.edid_firmware have only a few limited resolution which is weak.
> You're wrong. There's no limitation, it's just as limited as your
> solution. You put the same thing, you get the same thing out of it. The
> only difference is where the data are coming from.

It is extremely difficult to use, it have difficulty to specify which firmware edid is for which connector.
because we have a 1024x600 panel and a 1920x1080 monitor.

It require you to know the connector's name at first, it is not as intuitive as my method.
I am exhausted by it.

>> I will consider to adding drm.edid_firmware support, thanks.
> It just works if you use drm_get_edid.
>
>>>> 2) That is for the display controller in ls2k1000 SoC.
>>>>
>>>> Currently, the upstream kernel still don't have GPIO, PWM and I2C driver support
>>>> for LS2K1000 SoC.
>>>>
>>>> How dose you read EDID from the monitor without a I2C driver?
>>>>
>>>> without reading EDID the device tree support, the screen just black,
>>>> the lsdc driver just stall. With reading EDID from device tree support
>>>> we do not need a i2c driver to light up the monitor.
>>>>
>>>> This make lsdc drm driver work on various ls2k1000 development board
>>>> before I2C driver and GPIO driver and PWM backlight driver is upstream.
>>>>
>>>> I have many local private dts with the bindings, those local change just can not
>>>> upstream at this time, below is an example.
>>>>
>>>> The device tree is a platform description language. It's there to let
>>>> the OS know what the hardware is, but the state of hardware support in
>>>> the said OS isn't a parameter we have to take into account for a new
>>>> binding.
>>>>
>>>> If you don't have any DDC support at the moment, use the firmware
>>>> mechanism above, or add fixed modes using drm_add_modes_noedid in the
>>>> driver, and leave the DT out of it. Once you'll gain support for the
>>>> EDID readout in the driver, then it'll just work and you won't need to
>>>> change the DT again.
>>>>
>> The resolution will be 1024x768, it will also add a lot modes which may
>> not supported by the specific panel. Take 1024x600 as an example,
>> Both drm_add_modes_noedid() and firmware mechanism above will fail.
>>
>> Because the user supply EDID only and manufacturer of some strange panel
>> supply EDID only.
> It's fairly easy to address: if the panel has some EDID, make the driver
> able to read it; if it doesn't, describe the mode in the DT.
>
> And if you want to be nice to your users, the firmware can even patch
> the DT at boot time to add the necessary bits based on whatever info it
> has, it doesn't have to be static.
>
> Maxime
