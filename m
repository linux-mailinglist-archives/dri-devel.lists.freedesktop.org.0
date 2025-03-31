Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8858FA766CF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 15:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2E010E124;
	Mon, 31 Mar 2025 13:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="k492Rhox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F98010E124
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 13:26:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743427559; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lFpzyWNT0USwVhZo90t1H8YsKmXjkTiA40JVXFnWo4QCPAIk2thx7TRBlAU1K8dPThDc1FIFEYAX4FIom3w23pokpTh/x1Mg4e6yP3fzKqbgKWLkiz6TFLxuYaiHAXXHS1mctV24fS+qH0cfeKzobVyKDJR8eZNUgAT0or9iiF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743427559;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HWooIc3os8p0nMskc5BNvunTe8NZcWqXI8Mkie2yYgw=; 
 b=FyJqWhpbofJ3JePl7TCwFDAJ1r9kM5DiBswVCtsyEncz5aO++A94Lv8x+2b07Y9how9mN2ZYTEzuIXH7sWOFWYsErvYs5Tlozrd39DA4FXoO0K3wrZeyw5MY3OKlUnpeFyi1Rl1LyqK8YwL7wqgRhF+B7m8ykeFtEUCss6ggIWo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743427559; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HWooIc3os8p0nMskc5BNvunTe8NZcWqXI8Mkie2yYgw=;
 b=k492Rhoxz+7diXbMUgv1Ut3B3mjToaQHx37PzVyEGSmze1bsEZQIfeJ4NgBDdA2M
 NL0HbA23ybIE+SErXhBegGTPl66oS60Ti0OBi5XFh9YJ5aK85GWX/ReGY9ALX10OBi5
 U/1UtHTusAnM4Mt5ZDDLjk2AT4H/jHxGWhZDasK0=
Received: by mx.zohomail.com with SMTPS id 1743427556313451.45814764603153;
 Mon, 31 Mar 2025 06:25:56 -0700 (PDT)
Message-ID: <114525a6-950e-4894-92de-fa7655bb9156@collabora.com>
Date: Mon, 31 Mar 2025 10:25:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
 <20250324185801.168664-5-ariel.dalessandro@collabora.com>
 <2aa3bf07-924b-4359-b566-0db57d53cdf5@arm.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <2aa3bf07-924b-4359-b566-0db57d53cdf5@arm.com>
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

Hi Steven,

On 3/31/25 8:15 AM, Steven Price wrote:
> On 24/03/2025 18:57, Ariel D'Alessandro wrote:
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
>> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> (one very minor nit below)
> 
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 140 +++++++++++++++++++--
>>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 +++++
>>   3 files changed, 183 insertions(+), 7 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index 294f86b3c25e..ccf51fd5f9c0 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> [...]
>> +
>> +static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
>> +				  enum io_pgtable_fmt fmt)
> 
> NIT: It's always hard to see in the diff, but the alignment of the
> second line is wrong. But I'll fix this up when merging.

Indeed, you're right. Thanks for the nitpick!

Happy to see this hitting drm-misc-next soon :)

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

