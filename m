Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E75886FD1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 16:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618F112578;
	Fri, 22 Mar 2024 15:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="XHbGkUhR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E364112578
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 15:29:44 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42MFTIo6104288;
 Fri, 22 Mar 2024 10:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1711121358;
 bh=YDEh6vjq3UwcEBJ0N/6xSwcjv32TsahveBskrzcD3as=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=XHbGkUhRcB6pm27e3GHuf402qnkLWeMAYQDXMpafjQlNnQg47P6SiWLX4C3ASVWCn
 JiUZezeGQQ+FxKNhPgETwl+vOQmXaxXYgoU4Iif1mOPuNIq6EqCum3k86e3s9yy9v1
 B0wi8IoJP1nTnhSeW5SAPY7wnv1dThG72C9qD1dQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42MFTImX122885
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Mar 2024 10:29:18 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Mar 2024 10:29:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Mar 2024 10:29:18 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42MFTCj5015776;
 Fri, 22 Mar 2024 10:29:13 -0500
Message-ID: <03e2d653-731c-bb30-321b-b5477d7b82b2@ti.com>
Date: Fri, 22 Mar 2024 20:59:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 2/3] drm/tidss: Add support for display sharing
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
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
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240314-hospitable-attractive-cuttlefish-a2f504@houat>
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

Hi Maxime,

On 14/03/24 20:04, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Feb 14, 2024 at 09:17:12PM +0530, Devarsh Thakkar wrote:
>> On 13/02/24 19:34, Maxime Ripard wrote:
>>> On Thu, Feb 08, 2024 at 06:26:17PM +0530, Devarsh Thakkar wrote:
>>>> On 26/01/24 17:45, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> Thanks a lot for working on that.
>>>>>
>>>>> On Tue, Jan 16, 2024 at 07:11:41PM +0530, Devarsh Thakkar wrote:
>>>>>> Display subsystem present in TI Keystone family of devices supports sharing
>>>>>> of display between multiple hosts as it provides separate register space
>>>>>> (common* region) for each host to programming display controller and also a
>>>>>> unique interrupt line for each host.
>>>>>>
>>>>>> This adds support for display sharing, by allowing partitioning of
>>>>>> resources either at video port level or at video plane level as
>>>>>> described below :
>>>>>>
>>>>>> 1) Linux can own (i.e have write access) completely one or more of video
>>>>>> ports along with corresponding resources (viz. overlay managers,
>>>>>> video planes) used by Linux in context of those video ports.
>>>>>> Even if Linux is owning
>>>>>> these video ports it can still share this video port with a remote core
>>>>>> which can own one or more video planes associated with this video port.
>>>>>>
>>>>>> 2) Linux owns one or more of the video planes with video port
>>>>>> (along with corresponding overlay manager) associated with these planes
>>>>>> being owned and controlled by a remote core. Linux still has read-only
>>>>>> access to the associated video port and overlay managers so that it can
>>>>>> parse the settings made by remote core.
>>>>>
>>>>> So, just to make sure we're on the same page. 1) means Linux drives the
>>>>> whole display engine, but can lend planes to the R5? How does that work,
>>>>> is Linux aware of the workload being there (plane size, format, etc) ?
>>>>>
>>>>
>>>> Well, there is no dynamic procedure being followed for lending. The
>>>> partitioning scheme is decided and known before hand, and the remote
>>>> core firmware updated and compiled accordingly, and similarly the
>>>> device-tree overlay for Linux is also updated with partitioning
>>>> information before bootup.
>>>>
>>>> What would happen here is that Linux will know before-hand this
>>>> partitioning information via device-tree properties and won't enumerate
>>>> the plane owned by RTOS, but it will enumerate the rest of the display
>>>> components and initialize the DSS, after which user can load the DSS
>>>> firmware on remote core and this firmware will only have control of
>>>> plane as it was compiled with that configuration.
>>>
>>> Right. If the RTOS is in control of a single plane, how it is expected
>>> to deal with Linux shutting the CRTC down, or enforcing a configuration
>>> that isn't compatible with what the RTOS expects (like a plane with a
>>> higher zpos masking its plane), what is the mechanism to reconcile it?
>>>
>>
>> Just for the note, for this "RTOS control single plane" mode, we don't have a
>> firmware available to test (right now we are only supporting example for "RTOS
>> controlling the display mode" as shared here [1]) and hence this is not
>> validated but the idea was to keep dt-bindings generic enough to support them
>> in future and that's why I referred to it here.
>>
>> Coming back to your questions, with the current scheme the Linux (tidss) would
>> be expected to make sure the CRTC being shared with RTOS is never shutdown and
>> the RTOS plane should never gets masked.
> 
> I'm probably missing something then here, but if the Linux side of
> things is expected to keep the current configuration and keep it active
> for it to work, what use-case would it be useful for?
> 

It's just one of the partitioning possibilities that I mentioned here, that
Linux is in control of DSS as a whole and the user want the other host (be it
RTOS or any other core) to control a single plane. For e.g it could be Linux
(with GPU rendering) displaying the graphics and RTOS overlaying a real time
clock or any other signs which need to be displayed in real-time.
But more than the use-case this is inspired by the fact that we want to be
flexible and support in the linux driver whatever partitioning scheme
possibilities are there which are supported in hardware and we let user decide
on the partitioning scheme.

>> I think the IPC based scheme would have been mainly needed for the case where
>> you have a single entity controlling the display for e.g you have a single
>> display controller register space and a single IRQ but you have multiple
>> planes and say you want to divide these planes to different host processors.
> 
> And with, I assume, different OS on those host processors? Otherwise why
> would we need to handle some planes at the firmware level?
> 
>> In that case you want a single entity to act as a main entity and be in
>> control of DSS and rest of the processors communicate with the "main entity"
>> to request display resources and plane updates and main entity also programs
>> dss on their behalf.
>>
>> But unlike above, TI DSS7 is designed to support static partitioning of
>> display resources among multiple hosts, where each host can program the
>> display hardware independently using separate register space and having a
>> separate irq and without requirement of any communication between the hosts.
>> Now as this feature is unique to TI DSS7 we want to support this feature in
>> tidss driver. The DSS resource partitioning feature is described in detail
>> here [2]
> 
> So, if I understand this properly, and in KMS terms, DSS7 can assign the
> planes, CRTCs or encoders to a given VM or CPU, and you can segment the
> hardware that way. It looks like a good way to split encoders between
> VMs, but going back to the discussion about one plane being handled by
> the firmware, I don't really see how it can work with something else
> than splitting away the whole pipeline and having a VM claiming a CRTC
> and encoder, and another VM claiming another pipeline.
> 
> Like, if they share either a CRTC or encoder, we will still go back to
> the discussion about arbitration about who has the final word if the two
> have conflicting requirements, or if it changes something the other
> probably has to know about it.

There should not be any conflicting requirements as this sharing scheme is a
static one i.e. it is pre-negotiated or decided by the user before Linux
kernel compilation or RTOS firmware compilation and resources are split
statically and the sharing scheme is communicated to Linux via device-tree and
RTOS side firmware configured and compiled accordingly, and this scheme stays
intact without any change after device boots up. So for e.g. if Linux is
assigned only one plane and RTOS is the DSS master controlling all other
entities then this scheme will stay intact as long as device is up.

Also there could be only a single DSS master (the one in control of global
common0 reg space, i.e. having access to global DSS registers and also in
control of dss clock and power domains) and whichever core is acting as DSS
master will be knowing which of the CRTC and encoders are shared with other
hosts so that it doesn't power them off given other cores may still be using it.

> 
>>>>> And 2) would mean that the display engine is under the R5 control and
>>>>> Linux only gets to fill the plane and let the firmware know of what it
>>>>> wants?
>>>>>
>>>>
>>>> Here too the partitioning information is pre-decided and remote core
>>>> firmware and device-tree overlay for Linux updated accordingly. But in
>>>> this case as remote core firmware owns the display (minus the plane
>>>> owned by Linux) it is started and initialized during the bootloader
>>>> phase itself where it initializes the DSS and starts rendering using the
>>>> plane owned by it and Linux just latches to the DSS without
>>>> re-initializing it, with write access only to the plane that is owned by
>>>> Linux. You can refer [1] for more details on this.
>>>>
>>>>> If so, do we even need the tidss driver in the second case? We could
>>>>> just write a fwkms driver of some sorts that could be used by multiple
>>>>> implementations of the same "defer to firmware" logic.
>>>>>
>>>>
>>>> This feature of static partitioning of DSS resources is specific to DSS7
>>>> hardware (which is controlled by tidss driver) which supports dedicated
>>>> register space and interrupt line for each of the hosts [0], so that
>>>> multiple hosts can drive the display controller simultaneously as  per
>>>> the desired static partitioning of resources, and so I don't think a
>>>> separate driver is required here and tidss seems the right place to
>>>> support this, where using this device-tree approach different resource
>>>> partitioning schemas can be achieved as described here [1]. This was
>>>> also aligned with Tomi too where we discussed that tidss is the right
>>>> place to support this as we are simply leveraging the DSS hardware
>>>> capabilities of static partitioning here.
>>>
>>> If the only thing tidss does in the "owned by RTOS" is forwarding KMS
>>> atomic states to the RTOS, then I'm still not sure why we need to
>>> involve tidss at all.
>>
>> I think maybe here is the point of misunderstanding. We are not forwarding
>> atomic states to RTOS here. Linux (tidss) is infact, accessing the display
>> register space assigned to it (common1 assigned to Linux, commmon0 assigned to
>> RTOS) and also writing to DSS plane registers for the plane assigned to it
>> (say VID assigned to Linux and VIDL assigned to RTOS).
>>
>>> It's not just about interrupts, it's also about how your arbitrate
>>> between what Linux wants and what the RTOS wants. Like if the RTOS still
>>> wants to output something but Linux wants to disable it, how do you
>>> reconcile the two?
>>>
>>
>> The scheme involves static partitioning of display resource which are assigned
>> compile-time to RTOS and Linux. Here the RTOS firmware is compiled with
>> specific ownership/display resources as desired by user and this assignment
>> stays intact.
>>
>> If there is a more complex use-case which requires dynamic
>> assignment/arbitration of resources then I agree those require some sort of
>> IPC scheme but this is not what we target with these series. This series is
>> simply to support static partitioning feature (separate register space,
>> separate irq, firewalling support etc) of TI DSS hardware across the multiple
>> hosts and there are use-cases too for which this scheme suffices.
> 
> I think you're right and we have a misunderstanding. My initial
> assumption was that it was to prevent the Linux side of sides from
> screwing up the output if it was to crash.
> 
> But it looks like it's not the main point of this series, so could you
> share some use-cases you're trying to address?
> 

The end use-case we have demonstrated right now with this series is a
proof-of-concept display cluster use-case where RTOS boots early on MCU core
(launched at bootloader stage) and initializes the display (using the global
common0 register space and irq) and starts displaying safety tell-tales on one
plane, and once Linux boots up on application processor,
Linux (using common1 register space and irq) controls the other plane with GPU
rendering using a QT based application. And yes, we also support the scenario
where Linux crashes but RTOS being the DSS master and in control of DSS power,
clock domain and global register space is not impacted by the crash.
This is demonstrated in this video [1] and steps to simulate the same are also
documented here [2].

[1]: https://www.youtube.com/watch?v=WIcds6HGeMI&t=884s
[2]:
https://software-dl.ti.com/processor-sdk-linux/esd/AM62PX/09_01_00_08/exports/docs/system/Demo_User_Guides/Display_Cluster_User_Guide.html

Regards
Devarsh

> Thanks!
> Maxime
