Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C16BE3076
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 13:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1AC10E9BA;
	Thu, 16 Oct 2025 11:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hxewQKBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9236610E9B8;
 Thu, 16 Oct 2025 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760613429;
 bh=DSWwjOXOC7bi7nAeIFr1fihi8RD0f4mgzm3t1e4srsw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hxewQKBU4XBHVdn3n/KWzRglcS5kWQfTmJoEpRWVU198WIarQ/E/+omVH/nlKQX86
 zAeUuogdHv/xjZLpNQ5nYCedzd5JkS8lINjMIOZ+2UbMzQLQO2ie1ZhE/JJ8+rSr1t
 gU6UQhHE0FeXHYklZgaWiD7c4UI1m1YLcHSrqe/gcID9ypINTXCRdjOjrQU9APyPJh
 IQ7djMFdCLeplC77JE9a1JNCPjJPBYOGMzeQ7JOk2pHwdEnPDqf8t9CWC5Mm6/lqIk
 +WSWiXPyBreEMGKgPGQZPAEGB887tu0Is9V//WxznJuFGUUVk/Z5bfYL3y1/LCK1en
 jE954CUpZbWmQ==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F59C17E0C54;
 Thu, 16 Oct 2025 13:17:08 +0200 (CEST)
Message-ID: <f564735b-7cbd-486c-9dd4-a4555e73edde@collabora.com>
Date: Thu, 16 Oct 2025 13:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/13] drm/shmem-helper: Map huge pages in fault
 handlers
To: Matthew Wilcox <willy@infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251015153018.43735-1-loic.molinari@collabora.com>
 <20251015153018.43735-4-loic.molinari@collabora.com>
 <aO_ZmA6yoqbzTKt9@casper.infradead.org>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <aO_ZmA6yoqbzTKt9@casper.infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

On 15/10/2025 19:27, Matthew Wilcox wrote:
> On Wed, Oct 15, 2025 at 05:30:07PM +0200, Loïc Molinari wrote:
> 
> This looks fine, no need to resend to fix this, but if you'd written
> the previous patch slightly differently, you'd've reduced the amount of
> code you moved around in this patch, which would have made it easier to
> review.
> 
>> +	/* Map a range of pages around the faulty address. */
>> +	do {
>> +		pfn = page_to_pfn(pages[start_pgoff]);
>> +		ret = vmf_insert_pfn(vma, addr, pfn);
>> +		addr += PAGE_SIZE;
>> +	} while (++start_pgoff <= end_pgoff && ret == VM_FAULT_NOPAGE);
> 
> It looks to me like we have an opportunity to do better here by
> adding a vmf_insert_pfns() interface.  I don't think we should delay
> your patch series to add it, but let's not forget to do that; it can
> have very good performnce effects on ARM to use contptes.

Agreed. I initially wanted to provide such an interface based on 
set_ptes() to benefit from arm64 contptes but thought it'd better be a 
distinct patch series.

> 
>> @@ -617,8 +645,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> [...]
>>   
>> -		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
>> +	if (drm_gem_shmem_map_pmd(vmf, vmf->address, pages[page_offset])) {
>> +		ret = VM_FAULT_NOPAGE;
>> +		goto out;
>>   	}
> 
> Does this actually work?

Yes, it does. Huge pages are successfully mapped from both map_pages and 
fault handlers. Anything wrong with it?


There seems to be an another issue thought. There are failures [1], all 
looking like that one [2]. I think it's because map_pages is called with 
the RCU read lock taken and the DRM GEM map_pages handler must lock the 
GEM object before accessing pages with dma_resv_lock(). The locking doc 
says: "If it's not possible to reach a page without blocking, filesystem 
should skip it.". Unlocking the RCU read lock in the handler seems wrong 
and doing without a map_pages implementation would be unfortunate. What 
would you recommend here?

Loïc

[1] https://patchwork.freedesktop.org/series/156001/
[2] 
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156001v1/bat-dg1-7/igt@vgem_basic@dmabuf-mmap.html
