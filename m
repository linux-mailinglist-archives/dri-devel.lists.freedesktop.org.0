Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD35A569DE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987A110EBB2;
	Fri,  7 Mar 2025 14:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="bOTLs64f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AAD10EBB2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 14:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741356142; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MLurPKlC1elfN1Ga9djK+24eSHs3N/1L0XNgxqacuiZpdaM+LNn8WsQM/xhqYlApJZNqAEAffa4PpmrwKLQpbtI3bsQiVr3m+Iz6+u7xIKhq7xA+4YL5T/AFoivc76K3fjheasR2m/AJI/XVkH/7VFLfVz5fAw+Ofw4d1HDdAXs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741356142;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KTxgJbKE1OR0cJEsl1DelDSQA9kndID/O86cy0Ze3Yk=; 
 b=CNgRBgkhWztM4lcCCq98sq19xeMLA6F4W3pHio4fNQIab0SNFzknsF2o0aGryjYn97F+xaLXotgEkvoSwquxFZs44SxrEMpx6wH4P+9irxHQRrKKWEitIXVjiEznGSb2VjrfMbv0dFns3LOKiV7Mj0lYY2fNW7Yi/Y95gW8xDPo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741356142; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=KTxgJbKE1OR0cJEsl1DelDSQA9kndID/O86cy0Ze3Yk=;
 b=bOTLs64f75Z2dyd5OOMwW1c/9IeTnFIFmOxXquSRnoUPQF6P/tjVDxH8PtoTAV4U
 AkQgWxkgbEWh0ikQ6whEsWDaajLB95GoDmKzDopdRxNzN3ob8/7EE/t7dJhXXeSx/CV
 mq3LaKhLygUm0kGLe8vjtkrNUwCelRmg1lD+hwZw=
Received: by mx.zohomail.com with SMTPS id 1741356140228336.02250564093174;
 Fri, 7 Mar 2025 06:02:20 -0800 (PST)
Message-ID: <6f3b879b-22ea-4d48-ad6e-e75e8b2990f1@collabora.com>
Date: Fri, 7 Mar 2025 11:02:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] drm/panfrost: Split LPAE MMU TRANSTAB register
 values
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
 <20250226183043.140773-3-ariel.dalessandro@collabora.com>
 <20250227092537.63053596@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250227092537.63053596@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Boris,

On 2/27/25 5:25 AM, Boris Brezillon wrote:
> On Wed, 26 Feb 2025 15:30:41 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

[snip]

>> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
>> index b5f279a19a08..4e6064d5feaa 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
>> @@ -317,14 +317,19 @@
>>   #define MMU_AS_STRIDE			(1 << MMU_AS_SHIFT)
>>   
>>   /*
>> - * Begin LPAE MMU TRANSTAB register values
>> + * Begin LPAE MMU TRANSTAB register values (legacy mode)
>>    */
>> -#define AS_TRANSTAB_LPAE_ADDR_SPACE_MASK	0xfffffffffffff000
>> -#define AS_TRANSTAB_LPAE_ADRMODE_IDENTITY	0x2
>> -#define AS_TRANSTAB_LPAE_ADRMODE_TABLE		0x3
>> -#define AS_TRANSTAB_LPAE_ADRMODE_MASK		0x3
>> -#define AS_TRANSTAB_LPAE_READ_INNER		BIT(2)
>> -#define AS_TRANSTAB_LPAE_SHARE_OUTER		BIT(4)
>> +#define AS_TRANSTAB_LEGACY_ADDR_SPACE_MASK	0xfffffffffffff000
>> +#define AS_TRANSTAB_LEGACY_ADRMODE_IDENTITY	0x2
>> +#define AS_TRANSTAB_LEGACY_ADRMODE_TABLE	0x3
>> +#define AS_TRANSTAB_LEGACY_ADRMODE_MASK		0x3
>> +#define AS_TRANSTAB_LEGACY_READ_INNER		BIT(2)
>> +#define AS_TRANSTAB_LEGACY_SHARE_OUTER		BIT(4)
> 
> How about we keep AS_TRANSTAB_LPAE_ here and prefix the new reg values
> with AS_xxx_AARCH64_ when there's a collision between the two formats.

Agreed. Will use AS_TRANSTAB_AARCH64_4K_ prefix for the new ones.

> 
>> +
>> +/*
>> + * Begin LPAE MMU TRANSTAB register values (no-legacy mode)
>> + */
>> +#define AS_TRANSTAB_LPAE_ADDR_SPACE_MASK	0xfffffffffffffff0
> 
> It looks like we're not use AS_TRANSTAB_LPAE_ADDR_SPACE_MASK, so I'm
> not sure it's worth defining the mask for the AARCH64 format.

None of the original AS_TRANSTAB_LPAE_* values are used, but these refer 
to the LPAE (legacy mode) format.

The new mask for the AARCH64 format is required by the follow up patch 
`[RFC PATCH 3/4] drm/panfrost: Support ARM_64_LPAE_S1 page table`. It 
probably makes sense to just squash it now that this patch got 
simplified and the naming will be more clear.

I'll send a new patchset version with these changes.

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

