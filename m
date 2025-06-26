Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12284AEA89C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 23:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66E510E90E;
	Thu, 26 Jun 2025 21:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y6II7Rpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E81B10E90E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 21:15:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A624C6000A;
 Thu, 26 Jun 2025 21:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0855C4CEEB;
 Thu, 26 Jun 2025 21:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750972503;
 bh=i8F7RXd01Dywi46VTNnRRqKmfFkGAyqmAkKujf2xchs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y6II7RpaOiClQehE8kaAjyaoRjCX+OXC9ykShPztNunmgiMpSEAFLOWaw/OUEMGMU
 WfUzBsd3nqWtdl+TXz5ZguAT6Ma0iRJwd2WKFxoO46JNo5R25xWgkMyAmBcp68oOD/
 +MW+q/R2LJpxc3FCXl7I/Lbl1yHzuTP09EmwQ1y+DxXn23VuBZFEdju6CPBbf+WThD
 +KfZaYM303+jOO+oR80H64o6Lr0VoRw1XWMWeL8EF1xrqOx4cocfuxMyL67T0ZTNji
 pBoUSuTal57aPiRNSSShVeDGcuCjPHLOxA6PQ8jGUlUFAOA58DQiBiAQ/jVgxvZJRU
 TqKGV357+KxBg==
Message-ID: <d8c7c973-0285-4891-9b4a-c8e3d4f0d6b7@kernel.org>
Date: Thu, 26 Jun 2025 16:14:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] PCI: Add helper for checking if a PCI device is a
 display controller
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250626204347.GA1638339@bhelgaas>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250626204347.GA1638339@bhelgaas>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/26/2025 3:43 PM, Bjorn Helgaas wrote:
> On Tue, Jun 24, 2025 at 03:30:34PM -0500, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Several places in the kernel do class shifting to match whether a
>> PCI device is display class.  Introduce a helper for those places to
>> use.
>>
>> Reviewed-by: Daniel Dadap <ddadap@nvidia.com>
>> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> Not sure how this should be merged, let me know if you want me to do
> something with it.

Unless there is opposition I think it's best to take it through PCI.

It's a trivial change to most the other drivers.  If there is opposition 
I think there will need to be an immutable tag for the others to merge.

> 
>> ---
>>   include/linux/pci.h | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 05e68f35f3923..e77754e43c629 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -744,6 +744,21 @@ static inline bool pci_is_vga(struct pci_dev *pdev)
>>   	return false;
>>   }
>>   
>> +/**
>> + * pci_is_display - Check if a PCI device is a display controller
>> + * @pdev: Pointer to the PCI device structure
>> + *
>> + * This function determines whether the given PCI device corresponds
>> + * to a display controller. Display controllers are typically used
>> + * for graphical output and are identified based on their class code.
>> + *
>> + * Return: true if the PCI device is a display controller, false otherwise.
>> + */
>> +static inline bool pci_is_display(struct pci_dev *pdev)
>> +{
>> +	return (pdev->class >> 16) == PCI_BASE_CLASS_DISPLAY;
>> +}
>> +
>>   #define for_each_pci_bridge(dev, bus)				\
>>   	list_for_each_entry(dev, &bus->devices, bus_list)	\
>>   		if (!pci_is_bridge(dev)) {} else
>> -- 
>> 2.43.0
>>

