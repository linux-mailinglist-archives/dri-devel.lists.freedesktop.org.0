Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428FBC47424
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AA010E22E;
	Mon, 10 Nov 2025 14:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fq/6bZr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED52C10E072;
 Mon, 10 Nov 2025 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762785579;
 bh=PmfHj5puT5EuJo5jMH3r8sbaCa9NbA7iIIBw3q5tS7U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fq/6bZr3AF2h2wkMNGSn1bXsocPuQEeBd+ezF2avzPXvHo/lvHsrcNC+tZbS8E5Iq
 xkJB4+am2a5IfxqIp+ehb9NPVKFSgvleVHdn4CivlgZRwnuPF9SnL8ajyR0NknfvP2
 s7xp9Kqk+2jipyZbRtQfHx9eyAwAhm/ABmTkeAkIjdOiTtc2+8qqtYFcn7QauIky0J
 qi2AkZfthvSdYWmtrRTHuQs5oTa836l4Rwoz4pKgCE7iGHMIdDFb3F2YXgGACOPt1d
 jxQdyUfGkeW7/htZh8Ig5e8reM+6vEQVZbJRkW4WM4vf5Ct5o9PibWgvFUQrFyq3hO
 0R67ZlTin9JNA==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 17CAE17E0610;
 Mon, 10 Nov 2025 15:39:38 +0100 (CET)
Message-ID: <e19cdd3a-0d33-4c06-9c9a-7e9e2df51c4b@collabora.com>
Date: Mon, 10 Nov 2025 15:39:37 +0100
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
 <f564735b-7cbd-486c-9dd4-a4555e73edde@collabora.com>
 <aPK4YwMmYTDsKHcL@casper.infradead.org>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <aPK4YwMmYTDsKHcL@casper.infradead.org>
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

On 17/10/2025 23:42, Matthew Wilcox wrote:
> On Thu, Oct 16, 2025 at 01:17:07PM +0200, Loïc Molinari wrote:
>>> It looks to me like we have an opportunity to do better here by
>>> adding a vmf_insert_pfns() interface.  I don't think we should delay
>>> your patch series to add it, but let's not forget to do that; it can
>>> have very good performnce effects on ARM to use contptes.
>>
>> Agreed. I initially wanted to provide such an interface based on set_ptes()
>> to benefit from arm64 contptes but thought it'd better be a distinct patch
>> series.
> 
> Agreed.
> 
>>>
>>>> @@ -617,8 +645,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>>> [...]
>>>> -		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
>>>> +	if (drm_gem_shmem_map_pmd(vmf, vmf->address, pages[page_offset])) {
>>>> +		ret = VM_FAULT_NOPAGE;
>>>> +		goto out;
>>>>    	}
>>>
>>> Does this actually work?
>>
>> Yes, it does. Huge pages are successfully mapped from both map_pages and
>> fault handlers. Anything wrong with it?
> 
> No, I just wasn't sure that this would work correctly.
> 
>> There seems to be an another issue thought. There are failures [1], all
>> looking like that one [2]. I think it's because map_pages is called with the
>> RCU read lock taken and the DRM GEM map_pages handler must lock the GEM
>> object before accessing pages with dma_resv_lock(). The locking doc says:
>> "If it's not possible to reach a page without blocking, filesystem should
>> skip it.". Unlocking the RCU read lock in the handler seems wrong and doing
>> without a map_pages implementation would be unfortunate. What would you
>> recommend here?
> 
> I'm not familiar with GEM locking, so let me describe briefly how
> pagecache locking works.
> 
> Calling mmap bumps the refcount on the inode.  That keeps the inode
> around while the page fault handler runs.  For each folio, we
> get a refcount on it, then we trylock it.  Then we map each page in the
> folio.
> 
> So maybe you can trylock the GEM object?  It isn't clear to me whether
> you want finer grained locking than that.  If the trylock fails, no big
> deal, you just fall through to the fault path (with the slightly more
> heavy-weight locking that allows you to sleep).

I proposed a series v5 using dma_resv_trylock(). This actually fails 
later because the vmf_insert_pfn*() functions end up locking too. Not 
sure how to fix that yet so I proposed a v6 with no fault-around path 
and will get back to it (along with contptes) later.

Loïc

