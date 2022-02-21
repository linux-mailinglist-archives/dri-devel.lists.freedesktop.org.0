Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C664BDB08
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 17:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1148E10E781;
	Mon, 21 Feb 2022 16:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 284D710E781
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 16:58:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D5461042;
 Mon, 21 Feb 2022 08:58:12 -0800 (PST)
Received: from [10.57.40.147] (unknown [10.57.40.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB2533F70D;
 Mon, 21 Feb 2022 08:58:09 -0800 (PST)
Message-ID: <56cf458b-080b-2e22-69d7-039ff7d0b56a@arm.com>
Date: Mon, 21 Feb 2022 16:58:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/9] dt-bindings: host1x: Add memory-contexts property
Content-Language: en-GB
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-2-mperttunen@nvidia.com>
 <48ac567b-37e8-1fa2-c389-536e276fdd2c@arm.com>
 <2e9c4ea5-6bbd-9724-0f4e-ed25f7294aa2@kapsi.fi>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <2e9c4ea5-6bbd-9724-0f4e-ed25f7294aa2@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-21 15:28, Mikko Perttunen wrote:
> On 2/21/22 17:23, Robin Murphy wrote:
>> On 2022-02-18 11:39, Mikko Perttunen via iommu wrote:
>>> Add schema information for the memory-contexts property used to
>>> specify context stream IDs. This uses the standard iommu-map property
>>> inside a child node.
>>
>> Couldn't you simply make "iommu-map" an allowed property on the host1x 
>> node itself? From a DT perspective I'm not sure the intermediate node 
>> really fits meaningfully, and I can't see that it serves much purpose 
>> in practice either, other than perhaps defeating fw_devlink.
>>
>> Robin.
> 
> The stream IDs described here are not used by the host1x device itself, 
> so I don't think I can. Host1x's memory transactions still go through 
> the stream ID specified in its 'iommus' property, these stream IDs are 
> used by engines (typically in addition to the stream ID specified in 
> their own nodes).
> 
> Host1x 'iommus' -- Channel commands
> Engine 'iommus' -- Engine firmware (and data if context isolation is not 
> enabled)
> memory-contexts 'iommu-map' -- Data used by engines.

Right, that still appears to match my understanding, that as far as 
software sees, the host1x is effectively acting as a bridge to the 
engines in itself. Even if it's not physically routing traffic in and/or 
out, the host1x device is the place where the context IDs *logically* 
exist, and thus owns the mapping between context IDs and the StreamIDs 
emitted by any engine working in a given context.

Consider a PCIe root complex with integrated endpoints - chances are the 
RCiEPs have their own physical interfaces to issue DMA directly into the 
SoC interconnect, but that doesn't change how we describe the PCI 
Requester ID to StreamID mapping at the root complex, since the RC still 
logically owns the RID space. You can think of a RID as being "consumed" 
at the RC by indexing into config space to ultimately gain control of 
the corresponding endpoint, just like context IDs are "consumed" at the 
  host1x by generating commands to ultimately cause some engine to 
operate in the correct address space.

You don't have to pretend the host1x uses a context for its own 
command-fetching (or whatever) traffic either - it's always been 
intended that the "iommus" and "iommu-map" properties should happily be 
able to coexist on the same node, since they serve distinctly different 
purposes. If it doesn't work in practice then we've got a bug to fix 
somewhere.

If the context-switching mechanism was some distinct self-contained 
thing bolted on beside the other host1x functionality then describing it 
as a separate level of DT hierarchy might be more justifiable, but 
that's not the impression I'm getting from skimming the rest of the 
series. Just reading of the names of things in patch #6, my intuitive 
reaction is that clearly each host1x owns 9 StreamIDs, one for general 
stuff and 8 for contexts. Adding the knowledge that technically the 
context StreamIDs end up delegated to other host1x-controlled engines 
still doesn't shift the paradigm. I don't believe we need a level of DT 
structure purely to help document what the iommu-map means for host1x - 
the binding can do that just fine.

Thanks,
Robin.

> (Perhaps I should add this information to various places in more 
> abundance and clarity.)
> 
> Mikko
> 
>>
>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>> ---
>>> v3:
>>> * New patch
>>> ---
>>>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml  | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>> b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>>
>>> index 4fd513efb0f7..3ac0fde54a16 100644
>>> --- 
>>> a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>>
>>> +++ 
>>> b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>>
>>> @@ -144,6 +144,16 @@ allOf:
>>>           reset-names:
>>>             maxItems: 1
>>> +        memory-contexts:
>>> +          type: object
>>> +          properties:
>>> +            iommu-map:
>>> +              description: Specification of stream IDs available for 
>>> memory context device
>>> +                use. Should be a mapping of IDs 0..n to IOMMU 
>>> entries corresponding to
>>> +                usable stream IDs.
>>> +          required:
>>> +            - iommu-map
>>> +
>>>         required:
>>>           - reg-names
> 
