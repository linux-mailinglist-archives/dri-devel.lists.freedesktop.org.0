Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D9C56BBE6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 16:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA4810E15A;
	Fri,  8 Jul 2022 14:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C95D10E0CA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 14:44:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 999E51063;
 Fri,  8 Jul 2022 07:44:15 -0700 (PDT)
Received: from [10.57.86.102] (unknown [10.57.86.102])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5642D3F66F;
 Fri,  8 Jul 2022 07:44:14 -0700 (PDT)
Message-ID: <70cb6f20-7028-9cf8-6b3a-a074c0047687@arm.com>
Date: Fri, 8 Jul 2022 15:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] gpu: host1x: Register context bus unconditionally
Content-Language: en-GB
To: Thierry Reding <thierry.reding@gmail.com>
References: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
 <Ysg/7u5gRiDbEm5F@orome>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Ysg/7u5gRiDbEm5F@orome>
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, dri-devel@lists.freedesktop.org,
 mperttunen@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-08 15:32, Thierry Reding wrote:
> On Thu, Jul 07, 2022 at 06:30:44PM +0100, Robin Murphy wrote:
>> Conditional registration is a problem for other subsystems which may
>> unwittingly try to interact with host1x_context_device_bus_type in an
>> uninitialised state on non-Tegra platforms. A look under /sys/bus on a
>> typical system already reveals plenty of entries from enabled but
>> otherwise irrelevant configs, so lets keep things simple and register
>> our context bus unconditionally too.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/gpu/host1x/context_bus.c | 5 -----
>>   1 file changed, 5 deletions(-)
> 
> Applied, thanks.
> 
> Do we need this in v5.19 or is it enough if this gets into v5.20?

It's not strictly a critical fix, so I think 5.20 is fine. I plan to 
post v4 of my bus_set_iommu() series next week as the hopefully-final 
version, but at this point I think it might be safer to hold off 
actually merging that until early next cycle, to give it plenty of time 
in -next.

Thanks,
Robin.
