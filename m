Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGrxDHQeg2nWhwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:24:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD9FE473A
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D6410E5AF;
	Wed,  4 Feb 2026 10:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E88C10E5AF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 10:24:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 159CC339;
 Wed,  4 Feb 2026 02:24:41 -0800 (PST)
Received: from [10.57.54.249] (unknown [10.57.54.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAB983F632;
 Wed,  4 Feb 2026 02:24:42 -0800 (PST)
Message-ID: <20026be6-1a2b-4b79-902c-94300d781fdb@arm.com>
Date: Wed, 4 Feb 2026 10:24:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] drm/panthor: Add a GEM shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Akash Goel <akash.goel@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com, nd@arm.com
References: <20260202113607.1745667-1-boris.brezillon@collabora.com>
 <20260202113607.1745667-9-boris.brezillon@collabora.com>
 <31c3f2bf-e530-45ae-900e-4e25db54f367@arm.com>
 <e44be9f6-b7d8-4586-a72f-21e704b8579e@arm.com>
 <20260203090912.10b4e6bc@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260203090912.10b4e6bc@fedora>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:akash.goel@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,m:nd@arm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 7AD9FE473A
X-Rspamd-Action: no action

On 03/02/2026 08:09, Boris Brezillon wrote:
> On Mon, 2 Feb 2026 20:08:30 +0000
> Akash Goel <akash.goel@arm.com> wrote:
> 
>>>> +bool panthor_gem_try_evict(struct drm_gem_object *obj,
>>>> +			   struct ww_acquire_ctx *ticket)  
>>>
>>> I think this could be static - I don't see any reference outside this
>>> file (other than the header).
> 
> Will do.
> 
>>>   
>>>> +{
>>>> +	/*
>>>> +	 * Track last locked entry for unwinding locks in error and
>>>> +	 * success paths
>>>> +	 */
>>>> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>>> +	struct drm_gpuvm_bo *vm_bo, *last_locked = NULL;
>>>> +	enum panthor_gem_reclaim_state old_state;
>>>> +	int ret = 0;
>>>> +
>>>> +	/* To avoid potential lock ordering issue between bo_gpuva and
>>>> +	 * mapping->i_mmap_rwsem, unmap the pages from CPU side before
>>>> +	 * acquring the bo_gpuva lock. As the bo_resv lock is held, CPU
>>>> +	 * page fault handler won't be able to map in the pages whilst
>>>> +	 * eviction is in progress.
>>>> +	 */
>>>> +	drm_vma_node_unmap(&bo->base.vma_node, bo->base.dev->anon_inode->i_mapping);  
>>>
>>> There might be an issue here - drm_gem_lru_scan() will have taken the
>>> resv lock. drm_vma_node_unmap() could cause a callback to
>>> panthor_vm_close(). If that ends up being the last reference to
>>> bo->cmap.mmap_count then we'll deadlock attempting to aquire the resv
>>> lock again.  
>>
>> Actually drm_vma_node_unmap() would just invalidate the CPU PTEs.
>> The CPU mapping won't be removed and so panthor_vm_close() won't get called.
> 
> Yep, that's also my understanding of drm_vma_node_unmap(): it kills the
> relevant PTEs in the user VM, but leave the VMA active, so next time
> there's an access, the fault handler will be called.
> 
>>
>>>
>>> I not 100% on that, and sadly it seems my test setup has died so I can't
>>> test that out today.
>>>  
>>
>> We have tests that tries to trigger an evicition for a CPU mapped BO and 
>> so far we didn't see a deadlock problem.
> 
> Actually, that's one of the very few tests I have in my igt branch [1],
> and it was passing fine.
> 
> [1]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/commit/fc76934a5579767d2aabe787d40e38a17c3f4ea4#67d3c5d7df01192b03c20b43ad33249c663a95f5_80_97

Cool - I was going to test this out, but I was working at home and my
machine in the office decided to lose its USB devices so I couldn't get
my board working. The joys of working in two different locations.

Anyway, with that resolved, it looks good to me. So with that minor
change to panthor_gem_try_evict() you have my:

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

