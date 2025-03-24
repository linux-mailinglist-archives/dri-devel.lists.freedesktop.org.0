Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00633A6E298
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 19:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4962110E442;
	Mon, 24 Mar 2025 18:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="CYhCmkbn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F288F10E442
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 18:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742841851; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jV18Lr3WTYIwr0VI2NcmhfG0ucWBw3XpA4ZLsKhvb5kvwFLQXK20hR6HZNmlLmjDlQT7cI1bkqRhOLrjpslLrBFI6AJ58Q/5IcbEB8AmzdXVEA4Dq13mvbGJMKeqiyZ8mjF5hcsUueSPwRv6tqwRsEtxUe0H9Esn8cdUi+o/IIQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742841851;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3i45atEj/Em1zgDsdIfHqKPyZD2/NFVdU7m9egEFrkg=; 
 b=cDn1geDA7XOV87TV37z9IW2J87l1HmdTS78uig6xXK/sM5sK1IXGQNWmLRz3bvKtotjKfKQnWNTu+1cvRwEJKE8R7AH4QsOXA9pDXO2E2YgD/OdX6Qe52bwVB6uaIDmLhu/+Eej4s0Z4xdCSb1Eb0DXkFCWyfonJ7RzTWAPBITA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742841851; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=3i45atEj/Em1zgDsdIfHqKPyZD2/NFVdU7m9egEFrkg=;
 b=CYhCmkbnpAtqmznlseu04bydQY+U12ExisubT8wS/U7AiTY1OXhIXVdf/nic22dS
 jCGNhkINUOfj6Xpr9MEqXYLqAb1yOggK9z+xMauUpXP0WRy+Ae6uBY7zTkSQFPLS36q
 istxulDhzmrK4P/W/AVPcv18FjZtDX6xCsEaaa7Y=
Received: by mx.zohomail.com with SMTPS id 1742841849727969.7923025073931;
 Mon, 24 Mar 2025 11:44:09 -0700 (PDT)
Message-ID: <69da05c4-7471-47aa-a72d-b08d9b97e8dc@collabora.com>
Date: Mon, 24 Mar 2025 15:44:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
 <20250317145245.910566-5-ariel.dalessandro@collabora.com>
 <5hl2ahnxeunqebenguxjwwie6ura3lxknu766xthov2m4qvsot@imrrfqftlmv4>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <5hl2ahnxeunqebenguxjwwie6ura3lxknu766xthov2m4qvsot@imrrfqftlmv4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Adrian,

On 3/22/25 3:48 PM, Adrian Larumbe wrote:
> On 17.03.2025 11:52, Ariel D'Alessandro wrote:
>> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
>> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
>> Address Extension", which in Linux we've called "mali_lpae".
>>
>> This commit adds support for conditionally enabling AARCH64_4K page
>> table format. To achieve that, a "GPU optional quirks" field was added
>> to `struct panfrost_features` with the related flag.
>>
>> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
>> the HW_FEATURE_AARCH64_MMU feature flag present.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 140 +++++++++++++++++++--
>>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 +++++
>>   3 files changed, 183 insertions(+), 7 deletions(-)

[snip]

>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index 294f86b3c25e7..506f42ccfd5fc 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c

[snip]

>> +static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
>> +				  enum io_pgtable_fmt fmt)
>> +{
>> +	struct panfrost_device *pfdev = mmu->pfdev;
>> +
>> +	switch (fmt) {
>> +	case ARM_64_LPAE_S1:
>> +		return mmu_cfg_init_aarch64_4k(mmu);
>> +	case ARM_MALI_LPAE:
>> +		return mmu_cfg_init_mali_lpae(mmu);
>> +	default:
>> +		/* This should never happen */
>> +		drm_WARN(pfdev->ddev, "Invalid pgtable format");
> 
> I think there's a '1' missing here before the string literal.
> Other than that,
> 
> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Fixed, thanks!

Will send v5 right away.

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

