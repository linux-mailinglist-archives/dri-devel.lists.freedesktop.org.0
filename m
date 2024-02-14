Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63040854D3D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 16:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B3610E457;
	Wed, 14 Feb 2024 15:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="jugqqVoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CBB10E402
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 15:47:34 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41EFlJKq059688;
 Wed, 14 Feb 2024 09:47:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1707925639;
 bh=42OOgF4IEsciCzy4HGPu7+BcjYJ3RR40X6NYVnnz8qE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=jugqqVoCuwykHtv+V+RHovowjbVT0dMBwGRm75SNMdD8jr/39Jk9z52BxcXTPTCG7
 j/CS8ikCqgCT3FdvlaY4OKVFgwIHquVY/xQp4U/yOyuNmZCMuj9pNsqSxOBnMPhxAz
 JJ1RPu6S1Eim6LTEggNcUv7QF/XRruh4koR4lNg8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41EFlJtg030857
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 14 Feb 2024 09:47:19 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 09:47:19 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 09:47:19 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41EFlC25046625;
 Wed, 14 Feb 2024 09:47:13 -0600
Message-ID: <2f4cf2a7-ce7a-bb34-f722-7e66ea41def7@ti.com>
Date: Wed, 14 Feb 2024 21:17:12 +0530
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
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <qiqrhpqtnox47wj6az7t3fjp4vc6k32fw42tp5slqggrhe6utb@i7lkpaf3v3od>
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

Thanks for the quick reply.

On 13/02/24 19:34, Maxime Ripard wrote:
> Hi Devarsh,
> 
> On Thu, Feb 08, 2024 at 06:26:17PM +0530, Devarsh Thakkar wrote:
>> Hi Maxime,
>>
>> Thanks a lot for checking on this.
>>
>> On 26/01/24 17:45, Maxime Ripard wrote:
>>> Hi,
>>>
>>> Thanks a lot for working on that.
>>>
>>> On Tue, Jan 16, 2024 at 07:11:41PM +0530, Devarsh Thakkar wrote:
>>>> Display subsystem present in TI Keystone family of devices supports sharing
>>>> of display between multiple hosts as it provides separate register space
>>>> (common* region) for each host to programming display controller and also a
>>>> unique interrupt line for each host.
>>>>
>>>> This adds support for display sharing, by allowing partitioning of
>>>> resources either at video port level or at video plane level as
>>>> described below :
>>>>
>>>> 1) Linux can own (i.e have write access) completely one or more of video
>>>> ports along with corresponding resources (viz. overlay managers,
>>>> video planes) used by Linux in context of those video ports.
>>>> Even if Linux is owning
>>>> these video ports it can still share this video port with a remote core
>>>> which can own one or more video planes associated with this video port.
>>>>
>>>> 2) Linux owns one or more of the video planes with video port
>>>> (along with corresponding overlay manager) associated with these planes
>>>> being owned and controlled by a remote core. Linux still has read-only
>>>> access to the associated video port and overlay managers so that it can
>>>> parse the settings made by remote core.
>>>
>>> So, just to make sure we're on the same page. 1) means Linux drives the
>>> whole display engine, but can lend planes to the R5? How does that work,
>>> is Linux aware of the workload being there (plane size, format, etc) ?
>>>
>>
>> Well, there is no dynamic procedure being followed for lending. The
>> partitioning scheme is decided and known before hand, and the remote
>> core firmware updated and compiled accordingly, and similarly the
>> device-tree overlay for Linux is also updated with partitioning
>> information before bootup.
>>
>> What would happen here is that Linux will know before-hand this
>> partitioning information via device-tree properties and won't enumerate
>> the plane owned by RTOS, but it will enumerate the rest of the display
>> components and initialize the DSS, after which user can load the DSS
>> firmware on remote core and this firmware will only have control of
>> plane as it was compiled with that configuration.
> 
> Right. If the RTOS is in control of a single plane, how it is expected
> to deal with Linux shutting the CRTC down, or enforcing a configuration
> that isn't compatible with what the RTOS expects (like a plane with a
> higher zpos masking its plane), what is the mechanism to reconcile it?
> 

Just for the note, for this "RTOS control single plane" mode, we don't have a
firmware available to test (right now we are only supporting example for "RTOS
controlling the display mode" as shared here [1]) and hence this is not
validated but the idea was to keep dt-bindings generic enough to support them
in future and that's why I referred to it here.

Coming back to your questions, with the current scheme the Linux (tidss) would
be expected to make sure the CRTC being shared with RTOS is never shutdown and
the RTOS plane should never gets masked.

I think the IPC based scheme would have been mainly needed for the case where
you have a single entity controlling the display for e.g you have a single
display controller register space and a single IRQ but you have multiple
planes and say you want to divide these planes to different host processors.
In that case you want a single entity to act as a main entity and be in
control of DSS and rest of the processors communicate with the "main entity"
to request display resources and plane updates and main entity also programs
dss on their behalf.

But unlike above, TI DSS7 is designed to support static partitioning of
display resources among multiple hosts, where each host can program the
display hardware independently using separate register space and having a
separate irq and without requirement of any communication between the hosts.
Now as this feature is unique to TI DSS7 we want to support this feature in
tidss driver. The DSS resource partitioning feature is described in detail
here [2]

>>> And 2) would mean that the display engine is under the R5 control and
>>> Linux only gets to fill the plane and let the firmware know of what it
>>> wants?
>>>
>>
>> Here too the partitioning information is pre-decided and remote core
>> firmware and device-tree overlay for Linux updated accordingly. But in
>> this case as remote core firmware owns the display (minus the plane
>> owned by Linux) it is started and initialized during the bootloader
>> phase itself where it initializes the DSS and starts rendering using the
>> plane owned by it and Linux just latches to the DSS without
>> re-initializing it, with write access only to the plane that is owned by
>> Linux. You can refer [1] for more details on this.
>>
>>> If so, do we even need the tidss driver in the second case? We could
>>> just write a fwkms driver of some sorts that could be used by multiple
>>> implementations of the same "defer to firmware" logic.
>>>
>>
>> This feature of static partitioning of DSS resources is specific to DSS7
>> hardware (which is controlled by tidss driver) which supports dedicated
>> register space and interrupt line for each of the hosts [0], so that
>> multiple hosts can drive the display controller simultaneously as  per
>> the desired static partitioning of resources, and so I don't think a
>> separate driver is required here and tidss seems the right place to
>> support this, where using this device-tree approach different resource
>> partitioning schemas can be achieved as described here [1]. This was
>> also aligned with Tomi too where we discussed that tidss is the right
>> place to support this as we are simply leveraging the DSS hardware
>> capabilities of static partitioning here.
> 
> If the only thing tidss does in the "owned by RTOS" is forwarding KMS
> atomic states to the RTOS, then I'm still not sure why we need to
> involve tidss at all.
> 

I think maybe here is the point of misunderstanding. We are not forwarding
atomic states to RTOS here. Linux (tidss) is infact, accessing the display
register space assigned to it (common1 assigned to Linux, commmon0 assigned to
RTOS) and also writing to DSS plane registers for the plane assigned to it
(say VID assigned to Linux and VIDL assigned to RTOS).

> It's not just about interrupts, it's also about how your arbitrate
> between what Linux wants and what the RTOS wants. Like if the RTOS still
> wants to output something but Linux wants to disable it, how do you
> reconcile the two?
> 

The scheme involves static partitioning of display resource which are assigned
compile-time to RTOS and Linux. Here the RTOS firmware is compiled with
specific ownership/display resources as desired by user and this assignment
stays intact.

If there is a more complex use-case which requires dynamic
assignment/arbitration of resources then I agree those require some sort of
IPC scheme but this is not what we target with these series. This series is
simply to support static partitioning feature (separate register space,
separate irq, firewalling support etc) of TI DSS hardware across the multiple
hosts and there are use-cases too for which this scheme suffices.

> You have to have something that reconciles both, and typically for
> firmware-based setup this will be the firmware's job.
> 
> That's very similar to what the RaspberryPi did with fkms, and I believe
> that having a generic KMS-on-remoteproc driver when the firmware has
> control over the display is the path forward.
> 

The kms-on-remoteproc scheme is different and maybe more useful for those
processors not supporting this static partitioning hardware feature. On the
other hand, I believe there are still use-cases where this unique static
partitioning hardware feature of TI DSS will suffice without any requirement
of IPC. And it makes the firmware simpler (and the job of RTOS developer
easier too) as no IPC is required.

I am curious to understand Rpi DSS hardware and take a look at fkms and it's
firmware code though if it is public ?

>>>> For both the cases, the resources used in context of processing core
>>>> running Linux along with ownership information are exposed by user as
>>>> part of device-tree blob and driver uses an updated feature list tailored
>>>> for this shared mode accordingly. The driver also auto-populates
>>>> matching overlay managers and output types from shared video
>>>> port list provided in device-tree blob.
>>>> In dispc_feature struct remove const access specfier for output_type
>>>> array as it is required to be updated dynamically in run-time for shared
>>>> mode.
>>>
>>> I'm also not entirely sure that the device tree is the right path there.
>>> Surely the firmware capabilities will evolve over time, while the device
>>> tree won't. Is there some way to make it discoverable at probe time by
>>> the driver?
>>
>> I think the main highlight of the sharing feature is the hardware
>> capability where each host is provided separate irq and register space
>> to program display for their display context independently
> 
> Wait, what do you mean by display context here?
> 

By context I mean to what that specific host wants to display. For e.g. if
RTOS is owning a plane, then it can update it's framebuffer and update plane
registers independently.

[1]
https://software-dl.ti.com/processor-sdk-linux/esd/AM62PX/09_01_00_08/exports/docs/system/Demo_User_Guides/Display_Cluster_User_Guide.html
[2] https://www.ti.com/lit/zip/spruj52 ((Section 12.6.3.14 DISPC Resources
Sharing))

Regards
Devarsh

> Maxime
