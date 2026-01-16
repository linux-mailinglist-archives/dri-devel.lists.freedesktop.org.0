Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57820D30E0B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A071D10E11B;
	Fri, 16 Jan 2026 12:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA2F710E11B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:09:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72BCD1515;
 Fri, 16 Jan 2026 04:09:17 -0800 (PST)
Received: from [10.1.27.18] (e122027.cambridge.arm.com [10.1.27.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 397E03F694;
 Fri, 16 Jan 2026 04:09:20 -0800 (PST)
Message-ID: <d183092c-9cbb-4986-ac50-d7059a6f91e5@arm.com>
Date: Fri, 16 Jan 2026 12:09:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] drm/panthor: Part ways with drm_gem_shmem_object
To: Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-6-boris.brezillon@collabora.com>
 <aWkbE6BLd4wutXet@e142607> <20260115182700.05c21ec3@fedora>
 <aWknoRP7MNdtzUOd@e142607>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <aWknoRP7MNdtzUOd@e142607>
Content-Type: text/plain; charset=UTF-8
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

On 15/01/2026 17:45, Liviu Dudau wrote:
> On Thu, Jan 15, 2026 at 06:27:00PM +0100, Boris Brezillon wrote:
>> On Thu, 15 Jan 2026 16:51:31 +0000
>> Liviu Dudau <liviu.dudau@arm.com> wrote:
>>
>>> On Fri, Jan 09, 2026 at 02:07:57PM +0100, Boris Brezillon wrote:
[...]
>>>> +static void *
>>>> +panthor_gem_vmap_get_locked(struct panthor_gem_object *bo)
>>>> +{
>>>> +	pgprot_t prot = PAGE_KERNEL;
>>>> +	void *vaddr;
>>>> +	int ret;
>>>> +
>>>> +	dma_resv_assert_held(bo->base.resv);
>>>> +
>>>> +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
>>>> +		return ERR_PTR(-EINVAL);
>>>> +
>>>> +	if (refcount_inc_not_zero(&bo->cmap.vaddr_use_count)) {
>>>> +		drm_WARN_ON_ONCE(bo->base.dev, !bo->cmap.vaddr);  
>>>
>>> Is this drm_WARN_ON_ONCE() necessary? I can't see how we can ever trigger it.
>>
>> I know it's not supposed to happen, but isn't WARN_ON() exactly about
>> catching unexpected situations? :p
> 
> Agree, but I'm not convinced the WARN_ON() can be triggered at all as cmap.vaddr
> should not be zero if cmap.vaddr_use_count is non-zero.

If you can ever see how a WARN_ON can be triggered, then there's a bug
to fix. If we went around removing WARN_ON()s that we think cannot be
triggered then we'd have no WARN_ON()s left.

A better argument here is that we could handle the error. At the moment
we'd end up returning NULL, but the caller (panthor_gem_vmap_locked())
checks IS_ERR. So either we could return a ERR_PTR in this case, or
handle the NULL in the caller. [Although given this is a "can never
happen" case I don't tend to worry too much about the error handling...]

Thanks,
Steve

