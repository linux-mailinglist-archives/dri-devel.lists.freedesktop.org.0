Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11010B0DF38
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7C10E196;
	Tue, 22 Jul 2025 14:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iObvlvFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDF210E196
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:45:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 73AF4A561EF;
 Tue, 22 Jul 2025 14:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59462C4CEF1;
 Tue, 22 Jul 2025 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753195531;
 bh=gbnu6v4qJ8E6RxAmysMcS7ozBaN1WJkvfllvPveke1w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iObvlvFJoDDH3xMhNJJVO6d5Xj+rdJGAdrzfzTVdtmscgkINHdOLbmh3YBF5jQf1f
 ZB4aGP9JA3tWbfJzH63/YqwnM/QPTnJs41gYNDs3NG3bGwmF1UbiDgWrvYJYquVZIv
 xy6WaCTItaAnhzSYjNyTBt7r0L14WLewWMEmDjjROKMUpvQMaZYbYIuD4QtoqYRCPs
 l1DLZFvcYrDngoH4ZhhglHCUGEm9sT2+B5jGoNQRwJOcEcxT4Lw4IBot1vysrh1uYf
 eFOd80riEbwzpnw1P0COKS5VETCMQ1QMoU9xPfpA4c6ii0NkofZqCFmqPEv2pnpfDN
 YcHTvfLkZT9nQ==
Message-ID: <3e260136-009b-44cd-8fe8-85c34cd93ff8@kernel.org>
Date: Tue, 22 Jul 2025 09:45:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/9] fbcon: Use screen info to find primary device
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
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
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250722143817.GA2783917@bhelgaas>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250722143817.GA2783917@bhelgaas>
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

On 7/22/25 9:38 AM, Bjorn Helgaas wrote:
> On Thu, Jul 17, 2025 at 12:38:11PM -0500, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> On systems with non VGA GPUs fbcon can't find the primary GPU because
>> video_is_primary_device() only checks the VGA arbiter.
>>
>> Add a screen info check to video_is_primary_device() so that callers
>> can get accurate data on such systems.
> 
> This relies on screen_info, which I think is an x86 BIOS-ism.  Isn't
> there a UEFI console path?  How does that compare with this?  Is that
> relevant or is it something completely different?

When I created and tested this I actually did this on a UEFI system 
(which provides a UEFI GOP driver).
  >
>>   bool video_is_primary_device(struct device *dev)
>>   {
>> +#ifdef CONFIG_SCREEN_INFO
>> +	struct screen_info *si = &screen_info;
>> +#endif
>>   	struct pci_dev *pdev;
>>   
>>   	if (!dev_is_pci(dev))
>> @@ -34,7 +38,18 @@ bool video_is_primary_device(struct device *dev)
>>   
>>   	pdev = to_pci_dev(dev);
>>   
>> -	return (pdev == vga_default_device());
>> +	if (!pci_is_display(pdev))
>> +		return false;
>> +
>> +	if (pdev == vga_default_device())
>> +		return true;
>> +
>> +#ifdef CONFIG_SCREEN_INFO
>> +	if (pdev == screen_info_pci_dev(si))
>> +		return true;
>> +#endif
>> +
>> +	return false;
>>   }
>>   EXPORT_SYMBOL(video_is_primary_device);
>>   
>> -- 
>> 2.43.0
>>

