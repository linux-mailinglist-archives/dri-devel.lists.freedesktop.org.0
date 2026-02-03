Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDzyGzKtgWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:09:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB312D6035
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B531210E309;
	Tue,  3 Feb 2026 08:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Gqg6gnD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B191410E309
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770106156;
 bh=/BsFhkAr/P6dmm+SObo5hoCAw1XYuLAysEwJ0Kr/kcA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gqg6gnD3MC8TOaKBjebwQGDG/1wZllwxaYbDYfY20gIUrdG/HCxiB9E6bHwarw/Ng
 oT7NnSmwYHoQs7ZUgs6GmFqKW3FRQV1MDIUad8VFC/WhyirZGTcLDvRPbL0vri63+Y
 cyhvs4LKbwVZB1gFUfNM1K08KVQfelebYccUXbQsfxiPb9MZ4bhEr35vkljZDBAnzx
 JkYjCrA7v2aix73JZa0SpM28QRjmin212+QbRil6Cmdex8Ipm3bTDbKbZOo2IInExB
 QBab7yn3tt2TKlFnHDphFyMO0IZ4GeKpPiNTm7KBPLsmCBfpH2Nb9g5GijsNJaNU7J
 aYf3PBSPHc98Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6591E17E12A9;
 Tue,  3 Feb 2026 09:09:15 +0100 (CET)
Date: Tue, 3 Feb 2026 09:09:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean
 Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P
 Oommen <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com, nd@arm.com
Subject: Re: [PATCH v2 8/8] drm/panthor: Add a GEM shrinker
Message-ID: <20260203090912.10b4e6bc@fedora>
In-Reply-To: <e44be9f6-b7d8-4586-a72f-21e704b8579e@arm.com>
References: <20260202113607.1745667-1-boris.brezillon@collabora.com>
 <20260202113607.1745667-9-boris.brezillon@collabora.com>
 <31c3f2bf-e530-45ae-900e-4e25db54f367@arm.com>
 <e44be9f6-b7d8-4586-a72f-21e704b8579e@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:akash.goel@arm.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,m:nd@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[]
X-Rspamd-Queue-Id: CB312D6035
X-Rspamd-Action: no action

On Mon, 2 Feb 2026 20:08:30 +0000
Akash Goel <akash.goel@arm.com> wrote:

> >> +bool panthor_gem_try_evict(struct drm_gem_object *obj,
> >> +			   struct ww_acquire_ctx *ticket)  
> > 
> > I think this could be static - I don't see any reference outside this
> > file (other than the header).

Will do.

> >   
> >> +{
> >> +	/*
> >> +	 * Track last locked entry for unwinding locks in error and
> >> +	 * success paths
> >> +	 */
> >> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> >> +	struct drm_gpuvm_bo *vm_bo, *last_locked = NULL;
> >> +	enum panthor_gem_reclaim_state old_state;
> >> +	int ret = 0;
> >> +
> >> +	/* To avoid potential lock ordering issue between bo_gpuva and
> >> +	 * mapping->i_mmap_rwsem, unmap the pages from CPU side before
> >> +	 * acquring the bo_gpuva lock. As the bo_resv lock is held, CPU
> >> +	 * page fault handler won't be able to map in the pages whilst
> >> +	 * eviction is in progress.
> >> +	 */
> >> +	drm_vma_node_unmap(&bo->base.vma_node, bo->base.dev->anon_inode->i_mapping);  
> > 
> > There might be an issue here - drm_gem_lru_scan() will have taken the
> > resv lock. drm_vma_node_unmap() could cause a callback to
> > panthor_vm_close(). If that ends up being the last reference to
> > bo->cmap.mmap_count then we'll deadlock attempting to aquire the resv
> > lock again.  
> 
> Actually drm_vma_node_unmap() would just invalidate the CPU PTEs.
> The CPU mapping won't be removed and so panthor_vm_close() won't get called.

Yep, that's also my understanding of drm_vma_node_unmap(): it kills the
relevant PTEs in the user VM, but leave the VMA active, so next time
there's an access, the fault handler will be called.

> 
> > 
> > I not 100% on that, and sadly it seems my test setup has died so I can't
> > test that out today.
> >  
> 
> We have tests that tries to trigger an evicition for a CPU mapped BO and 
> so far we didn't see a deadlock problem.

Actually, that's one of the very few tests I have in my igt branch [1],
and it was passing fine.

[1]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/commit/fc76934a5579767d2aabe787d40e38a17c3f4ea4#67d3c5d7df01192b03c20b43ad33249c663a95f5_80_97
