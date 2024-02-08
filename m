Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638B84E141
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 13:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7517610E50A;
	Thu,  8 Feb 2024 12:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="KWVtlXAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C194710E50A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 12:56:46 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418CuPGh074250;
 Thu, 8 Feb 2024 06:56:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1707396985;
 bh=kJWir3gepfEI0QDhPbIpModwmcsuWvX/sJYAgHRrEcI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=KWVtlXAtmDTsSrDqoPrILvRnRBL0tND5PMFGvUiwg9JiqY2V0c6zEG5z7pIhm7bQs
 oboZ76SIbYCKRL2FnK/QIEPTLLoRr0rOefrr5BlwtM4oXAMtGKv6stzkDw42/lgyWe
 u8q91BYLPfoLtmawFERC2C31gBiBLEYJCQbNkjKU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418CuPik004649
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Feb 2024 06:56:25 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 06:56:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 06:56:25 -0600
Received: from [10.250.146.202] ([10.250.146.202])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418CuIJ9046995;
 Thu, 8 Feb 2024 06:56:19 -0600
Message-ID: <88018f5f-a7db-7278-e5c3-bb1dbf0e3f14@ti.com>
Date: Thu, 8 Feb 2024 18:26:17 +0530
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
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <vgfzhamtiwkpdyk5ndagsb63subclinotoe6tsi3wu6z7454ec@igxfzjc5gyqm>
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

Thanks a lot for checking on this.

On 26/01/24 17:45, Maxime Ripard wrote:
> Hi,
> 
> Thanks a lot for working on that.
> 
> On Tue, Jan 16, 2024 at 07:11:41PM +0530, Devarsh Thakkar wrote:
>> Display subsystem present in TI Keystone family of devices supports sharing
>> of display between multiple hosts as it provides separate register space
>> (common* region) for each host to programming display controller and also a
>> unique interrupt line for each host.
>>
>> This adds support for display sharing, by allowing partitioning of
>> resources either at video port level or at video plane level as
>> described below :
>>
>> 1) Linux can own (i.e have write access) completely one or more of video
>> ports along with corresponding resources (viz. overlay managers,
>> video planes) used by Linux in context of those video ports.
>> Even if Linux is owning
>> these video ports it can still share this video port with a remote core
>> which can own one or more video planes associated with this video port.
>>
>> 2) Linux owns one or more of the video planes with video port
>> (along with corresponding overlay manager) associated with these planes
>> being owned and controlled by a remote core. Linux still has read-only
>> access to the associated video port and overlay managers so that it can
>> parse the settings made by remote core.
> 
> So, just to make sure we're on the same page. 1) means Linux drives the
> whole display engine, but can lend planes to the R5? How does that work,
> is Linux aware of the workload being there (plane size, format, etc) ?
> 

Well, there is no dynamic procedure being followed for lending. The
partitioning scheme is decided and known before hand, and the remote
core firmware updated and compiled accordingly, and similarly the
device-tree overlay for Linux is also updated with partitioning
information before bootup.

What would happen here is that Linux will know before-hand this
partitioning information via device-tree properties and won't enumerate
the plane owned by RTOS, but it will enumerate the rest of the display
components and initialize the DSS, after which user can load the DSS
firmware on remote core and this firmware will only have control of
plane as it was compiled with that configuration.


> And 2) would mean that the display engine is under the R5 control and
> Linux only gets to fill the plane and let the firmware know of what it
> wants?
> 

Here too the partitioning information is pre-decided and remote core
firmware and device-tree overlay for Linux updated accordingly. But in
this case as remote core firmware owns the display (minus the plane
owned by Linux) it is started and initialized during the bootloader
phase itself where it initializes the DSS and starts rendering using the
plane owned by it and Linux just latches to the DSS without
re-initializing it, with write access only to the plane that is owned by
Linux. You can refer [1] for more details on this.


> If so, do we even need the tidss driver in the second case? We could
> just write a fwkms driver of some sorts that could be used by multiple
> implementations of the same "defer to firmware" logic.
> 

This feature of static partitioning of DSS resources is specific to DSS7
hardware (which is controlled by tidss driver) which supports dedicated
register space and interrupt line for each of the hosts [0], so that
multiple hosts can drive the display controller simultaneously as  per
the desired static partitioning of resources, and so I don't think a
separate driver is required here and tidss seems the right place to
support this, where using this device-tree approach different resource
partitioning schemas can be achieved as described here [1]. This was
also aligned with Tomi too where we discussed that tidss is the right
place to support this as we are simply leveraging the DSS hardware
capabilities of static partitioning here.


>> For both the cases, the resources used in context of processing core
>> running Linux along with ownership information are exposed by user as
>> part of device-tree blob and driver uses an updated feature list tailored
>> for this shared mode accordingly. The driver also auto-populates
>> matching overlay managers and output types from shared video
>> port list provided in device-tree blob.
>> In dispc_feature struct remove const access specfier for output_type
>> array as it is required to be updated dynamically in run-time for shared
>> mode.
> 
> I'm also not entirely sure that the device tree is the right path there.
> Surely the firmware capabilities will evolve over time, while the device
> tree won't. Is there some way to make it discoverable at probe time by
> the driver?
> 

I think the main highlight of the sharing feature is the hardware
capability where each host is provided separate irq and register space
to program display for their display context independently and without
any sort of inter-processor communication and the current implementation
just mirrors by specifying the display context information in the form
of device-tree properties instead of relying on any inter-processor
communication or negotiation phase.

Having said that, for the second case Linux still has read access to
display registers which can be read to infer some of the display
configuration set by the RTOS and we are infact using that to infer some
of the context like for e.g. what was the display mode set by RTOS, but
we don't want to rely completely on register reads of RTOS programmed
registers to gather full information regarding partitioning or even to
infer that we are in sharing mode.

The remote core firmware is compiled with the partitioning information
known before-hand and same is fed in the form of DT properties to Linux
and this looks much cleaner, simple and reliable to us.

But yes we wanted to support firmwares with different partitioning
schemes/capabilities as you said and so the tidss-shared-mode
device-tree properties were designed keeping in mind that they should be
adequate and flexible enough to define all different partition schemes
which can be supported, this is also demonstrated with an example here [1]

[0]:
https://software-dl.ti.com/processor-sdk-linux/esd/AM62PX/09_01_00_08/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Display/DSS7.html#soc-hardware-description


[1]:
https://software-dl.ti.com/processor-sdk-linux/esd/AM62PX/09_01_00_08/exports/docs/linux/How_to_Guides/Target/How_to_enable_display_sharing_between_remotecore_and_Linux.html


Regards
Devarsh


> Maxime
