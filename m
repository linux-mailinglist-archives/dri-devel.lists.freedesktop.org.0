Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DE4C98A67
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCBF10E446;
	Mon,  1 Dec 2025 18:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="f4PUV0hS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D45310E440;
 Mon,  1 Dec 2025 18:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764612372;
 bh=orbc3nuJhRBtP9HgFH/P7FPSU37dWjp236YX9cJ7qE8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f4PUV0hSvnZmXOb2ZWccPOP5NEDYIGqGFgBkNrbZyFaHM7AR8XkGmUCu6OnkAodFA
 lj5NCIdmHu1VugxhaE8lMbzPaT6HbXdt5WZnd5bt3N42gHcTYxhDWAzN9HVwBIwjOs
 wdh52nnjvww3IORZATNTc/QuBF4ZPRL+RPQm7US6QnUUen3lLtN6Dv1IYOTdi4dcWS
 AiGsuJvFHisXkpA/o+9Kz0ReKG5F2tmIUDUJW25d4tnP+kt56w/AIqTphtfRva/KiA
 u6FWll/izQjWEpNlUNWFGTrJo9QZHfBgL6O4c1OlNQ0vK4YGvQYfqiR60p6q1ijFoC
 QluNngkMsJeTA==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DD47317E1157;
 Mon,  1 Dec 2025 19:06:11 +0100 (CET)
Message-ID: <e2102c82-6b8f-4f6e-80ea-ee185bb1e52e@collabora.com>
Date: Mon, 1 Dec 2025 19:06:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] drm/shmem-helper: Simplify page offset
 calculation in fault handler
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Al Viro
 <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251128185252.3092-1-loic.molinari@collabora.com>
 <20251128185252.3092-2-loic.molinari@collabora.com>
 <20251201090507.1ee10c65@fedora>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20251201090507.1ee10c65@fedora>
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

Hi Boris,

On 01/12/2025 09:05, Boris Brezillon wrote:
> On Fri, 28 Nov 2025 19:52:43 +0100
> Loïc Molinari <loic.molinari@collabora.com> wrote:
> 
>> For a fault at address addr, the page offset is
>>    page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT
>>                = ((addr & PAGE_MASK) - vma->vm_start) >> PAGE_SHIFT
>> 	      = (addr - vma->vm_start) >> PAGE_SHIFT
>>
>> Since the faulty logical page offset based on VMA is
>>    vmf->pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT)
>>
>> We can slightly simplify the calculation using
>>    page_offset = vmf->pgoff - vma->vm_pgoff
>>
>> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> One nit below
> 
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index dc94a27710e5..be89be1c804c 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -577,8 +577,8 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>>   	struct page *page;
>>   	pgoff_t page_offset;
>>   
>> -	/* We don't use vmf->pgoff since that has the fake offset */
>> -	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
>> +	/* Offset to faulty address in the VMA (without the fake offset). */
> 
> It's weird to say "without the fake offset" here, because IIUC, both
> vmf->pgoff and vma->vm_pgoff contain the fake offset. And that's fine,
> the problem really is when one of the subtraction operand is not
> relative to the fake offset.

Yes, both values contain the fake offset. vma->vm_pgoff is the actual 
fake offset (mmap offset in the GEM context). vmf->pgoff is the fake 
offset added to the offset we're looking for (offset from start of VMA 
to faulty address). So the difference just gets rid of it, hence the 
precision, but now that I read it again after a few weeks, it's a bit 
misleading so I'll just remove it.

Regards,
Loïc

>> +	page_offset = vmf->pgoff - vma->vm_pgoff;
>>   
>>   	dma_resv_lock(shmem->base.resv, NULL);
>>   
> 

