Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD828D39A6
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718BA113C88;
	Wed, 29 May 2024 14:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="CLB8dsan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A671F10FE33
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:47:05 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44TEkqLQ125815;
 Wed, 29 May 2024 09:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716994013;
 bh=lVACF7/ivESmEqZ237dH+5br2h2iBMnf9o032PKuje8=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=CLB8dsanLkReZaCjSUYbxkOK1R16rck5cs00GdpP9LdGnqOvwbH5PlN94uipLjfsC
 yY6TEr2lt/xxkyD3Iu+SepWU2KAwpvklPPc5Adge87zf+KKMlkZjqsOPO8VCAWmHvw
 busHn2O3Wl98BMCmvf9RlziZ2bcFy/vvO8GlHL5w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44TEkqwx018000
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 May 2024 09:46:52 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 May 2024 09:46:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 May 2024 09:46:52 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44TEkkft054115;
 Wed, 29 May 2024 09:46:47 -0500
Message-ID: <b3b7fe51-ce9e-1dc4-27ee-e380c242d446@ti.com>
Date: Wed, 29 May 2024 20:16:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 2/3] drm/tidss: Add support for display sharing
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, Maxime Ripard
 <mripard@kernel.org>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <nm@ti.com>, <vigneshr@ti.com>,
 <kristo@kernel.org>, <praneeth@ti.com>, <a-bhatia1@ti.com>,
 <j-luthra@ti.com>
References: <20240116134142.2092483-1-devarsht@ti.com>
 <20240116134142.2092483-3-devarsht@ti.com>
 <vgfzhamtiwkpdyk5ndagsb63subclinotoe6tsi3wu6z7454ec@igxfzjc5gyqm>
 <88018f5f-a7db-7278-e5c3-bb1dbf0e3f14@ti.com>
 <qiqrhpqtnox47wj6az7t3fjp4vc6k32fw42tp5slqggrhe6utb@i7lkpaf3v3od>
 <2f4cf2a7-ce7a-bb34-f722-7e66ea41def7@ti.com>
 <20240314-hospitable-attractive-cuttlefish-a2f504@houat>
 <03e2d653-731c-bb30-321b-b5477d7b82b2@ti.com>
 <87ikzf16dm.fsf@minerva.mail-host-address-is-not-set>
 <ZkYBWnQO8AbGAt06@phenom.ffwll.local>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZkYBWnQO8AbGAt06@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier, Maxime, Daniel,

Sorry for the delay. Please find response inline.

On 16/05/24 18:21, Daniel Vetter wrote:
> On Wed, May 15, 2024 at 04:45:09PM +0200, Javier Martinez Canillas wrote:
>> Devarsh Thakkar <devarsht@ti.com> writes:

[..]

>>
>> If I understand you correctly, for now the only real use case is when the
>> the RTOS owns / manages the complete display pipeline and Linux can only
>> own video planes.
>>

Not exactly, What I mean is that this is the default configuration/example we
intend to provide to customer as an out-of-box demo . But flexibility is
provided to customer to modify the display sharing configuration per their
use-case, for e.g at RTOS side in place of device-tree, we have a sysconfig
menu [1] using which they can select the desired configuration, furthermore
they can go ahead and edit the code too, so Linux driver is expected to be
flexible to support different configurations as supported by the HW.

I have a limited view of all possible use-cases which customer may try out
with different configurations but few examples are shared below part from the
one discussed earlier :

[Examples]:
1) Customer is running Linux as main OS but using RTOS to control some
external peripherals like temperature sensor, motion sensor e.t.c. In that
case if they want to display the sensor data too on the same monitor, then
they can use the configuration where RTOS use single plane and Linux as the
DSS master.

2) Another configuration could be where RTOS want to control one full
end-to-end pipeline going to one connector and Linux want to control full
end-to-end pipeline going to another connector, that can be supported too
using this scheme (as shared in this series).

3) Also I think, this device-tree based scheme could be leveraged in
virtualization too with static partitioning based scheme using Xen for e.g. we
split the DSS resources between host (DOM0) and the guest (DOMU).

>> The opposite is supported by the DSS hardware (thanks to its feature that
>> allows partitioning the register space and having multiple per-host IRQs) 
>> but it's not a real use case yet. The reason why this case is added to the
>> DT binding is as you said for flexiblity and make the design future-proof.
>>

Not really, as explained above we are documenting all possible configurations
which hardware supports as supported in software in the SDK and that's what we
are aiming for upstream too.

[..]>>>> I'm probably missing something then here, but if the Linux side of
>>>> things is expected to keep the current configuration and keep it active
>>>> for it to work, what use-case would it be useful for?
>>>>
>>>
>>> It's just one of the partitioning possibilities that I mentioned here, that
>>> Linux is in control of DSS as a whole and the user want the other host (be it
>>> RTOS or any other core) to control a single plane. For e.g it could be Linux
>>> (with GPU rendering) displaying the graphics and RTOS overlaying a real time
>>> clock or any other signs which need to be displayed in real-time.
>>> But more than the use-case this is inspired by the fact that we want to be
>>> flexible and support in the linux driver whatever partitioning scheme
>>> possibilities are there which are supported in hardware and we let user decide
>>> on the partitioning scheme.
>>>
>>
>> A possible use case here could be if Linux is safer than the other host
>> owning a single plane, right? Then in that case the RTOS could fail but
>> the display pipeline won't be teared down.
>>
>> That is, if your safety tell-tales would be driven by Linux and having
>> other OS dislay the GPU-rendered QT based application on another plane.
>>
>> But as said, for now that's a theorethical use case since the one you
>> mentioned is the opposite.
>>
>> [....]
>>

Yes that could be a possible use-case too, we want to provide customer the
flexibility in their app design to select different configuration, as we say
all these configurations as supported in the driver.

[..]
>>>>> If there is a more complex use-case which requires dynamic
>>>>> assignment/arbitration of resources then I agree those require some sort of
>>>>> IPC scheme but this is not what we target with these series. This series is
>>>>> simply to support static partitioning feature (separate register space,
>>>>> separate irq, firewalling support etc) of TI DSS hardware across the multiple
>>>>> hosts and there are use-cases too for which this scheme suffices.
>>>>
>>>> I think you're right and we have a misunderstanding. My initial
>>>> assumption was that it was to prevent the Linux side of sides from
>>>> screwing up the output if it was to crash.
>>>>
>>>> But it looks like it's not the main point of this series, so could you
>>>> share some use-cases you're trying to address?
>>>>
>>>
>>> The end use-case we have demonstrated right now with this series is a
>>> proof-of-concept display cluster use-case where RTOS boots early on MCU core
>>> (launched at bootloader stage) and initializes the display (using the global
>>> common0 register space and irq) and starts displaying safety tell-tales on one
>>> plane, and once Linux boots up on application processor,
>>> Linux (using common1 register space and irq) controls the other plane with GPU
>>> rendering using a QT based application. And yes, we also support the scenario
>>> where Linux crashes but RTOS being the DSS master and in control of DSS power,
>>> clock domain and global register space is not impacted by the crash.
>>
>> You mention 2 scenarios but are actually the same? Or did I misunderstand?
>>

I have explained the other examples (where Linux is the master) above with tag
[Examples].

>> In both cases the RTOS own the display pipeline and Linux can just display
>> using a single plane.
>>
>> That's why I think that agree with Maxime, that a fwkms could be a simpler
>> solution to your use case instead of adding all this complexity to the DSS
>> driver. Yes, I understand the HW supports all this flexibility but there's
>> no real use case yet (you mentioned that don't even have firmware for this
>> single plane owned by the RTOS in the R5F case).
>>

I analyzed the fwkms driver [2] from the RPi repo (as seems like it is not
upstream), here the firmware is the entity owning the display register space
completely and the fwkms driver simply acts as a translating layer which
translates the incoming DRM/KMS ioctls into IPC messages (having unique
message tags) sent over mailbox which the firmware receives and programs
corresponding registers accordingly, so there is no display sharing achieved
here as there is only single display context as coming from Linux and no
separate display context running at firmware side.

But yes, in general for simple display controllers having single register
space and single IRQ, I think that a standard IPC based scheme would be
required for sharing the display between Linux and RTOS where for e.g. RTOS
would be in full control of display register space and the interrupt line.
Linux would send messages to RTOS via IPC scheme (similar to RPi fwkms) to
commit the framebuffer and RTOS would send a frame done message to LInux on
receiving vblank irq which would eventually call drm_crtc_handle_vblank.
Although the IPC layer would need to be standardized (virtio_kms?)


>> The DT binding for a fwkms driver would be trivial, in fact maybe we might
>> even leverage simpledrm for this case and not require a new driver at all.
> 
> I guess you can still do things like pageflipping and maybe use some of
> the color/blending hardware? Maybe even have more than one plane
> available? fwkms/simpledrm conceptually cannot really support pageflipping
> even, so that's a much, much reduced feature set.
>

Yes exactly, fwkms, simpledrm are not related to display sharing.

> That all aside I do think we should limit the support to just the first
> case, where linux gets a few pieces assigned to it and is not the DSS
> master. From what I'm understanding you could assign entire crtc with
> planes and everything to linux, so this shouldn't really constraint
> real-world usage?
> 
> At least until there's support in firmware for this it's all way too
> theoretical, and I agree with Maxime and Javier that there's some serious
> design questions about how this kind of static leasing should work with
> drm sitting on top.

To summarize, as per my understanding there are two schemes for display
sharing possible

1) IPC based scheme  -> This would be useful for simple display controllers
having single register space and single irq line to one host)
2) Static partitioning scheme -> This would require some support in display
controller (per host irq e.t.c) as explained below :

And I think each one has it's own uniqueness and holds on it's own and both
solutions can be pursued independently and development for one scheme should
not block development for another.

As TI display controller supports robust partitioning of DSS processing blocks
(Pipelines, overlays, interrupts etc) among multiple processors allowing
parallel and independent control of the DSS resources in an interference free
environment, the static partitioning scheme was possible to implement and it
sufficed the requirements of display sharing use-case without incurring any
extra overhead and complexity of IPC.

And If there is another display controller having similar feature-set as above
then the bindings for the static partitioning scheme (or at-least some of
them) could be generalized.

	drm,shared-mode;
	drm,shared-mode-crtc = "..";
	drm,shared-mode-crtc-owned = "..";
	drm,shared-mode-planes = "..";

But I could not find any other display controller support above static
partitioning feature and hence I put the bindings as specific to TI.

I still feel the static partitioning approach as adopted in this series still
holds on its own achieving the sharing without extra complexity/overhead of
IPC by utilizing the above mentioned HW features, and all it aims is to simply
add software support for the flexibility of sharing the display resources.

Kindly let me know if we are aligned on this or any further thoughts or queries.

[1]:
https://software-dl.ti.com/mcu-plus-sdk/esd/AM62PX/latest/exports/docs/api_guide_am62px/DRIVERS_DSS_PAGE.html#autotoc_md311
[2]:
https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/gpu/drm/vc4/vc4_firmware_kms.c

Regards
Devarsh
