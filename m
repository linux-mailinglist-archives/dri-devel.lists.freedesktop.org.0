Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG/kOYOkrmkFHQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:44:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E02374A0
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A50910E4CE;
	Mon,  9 Mar 2026 10:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TYefRWqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7254410E4CE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1773053053;
 bh=eV84bk9FhFfN7BpVXp3SXNhSp+EovBeQ7FCK5NofEi0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TYefRWqYPaZbauooGDUdvpnjdc6FHbce0Zv/3P6sE1stb8rc+iiuStIzFYByYQDt0
 hcpGRPKGLk6dJoYzHu85cH2I44Hu1pjeNW8sYH4MGh+2F7U+KGGqsLZKHHo4S5gnoX
 R5a6wnEHpn97vcaZucUlNcdxXrs3M6ccGOVRABLftx/vH2X2QMWtqzytMnWVW4hSrC
 JU40+9SQ721xg/62Uv1cK7ESK5p10hfNEhSw5V9V99fEr+lr7Q4dOdSAEJzrByOSCO
 QGXcf4Mx+3cm28VKYRrfRV3hQu7wvXTJ3x1HrRiQg5e6C1p+NLN4/Nvv5FxwCwPOCl
 gDn2lJHnZTwWg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 555CA17E0DC0;
 Mon,  9 Mar 2026 11:44:12 +0100 (CET)
Date: Mon, 9 Mar 2026 11:44:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Akash Goel
 <akash.goel@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com
Subject: Re: [PATCH v4 9/9] drm/panthor: Add a GEM shrinker
Message-ID: <20260309114407.45d6a8e3@fedora>
In-Reply-To: <0fbe7ff5-62e4-4345-882b-ca27195aa510@arm.com>
References: <20260305124320.156606-1-boris.brezillon@collabora.com>
 <20260305124320.156606-10-boris.brezillon@collabora.com>
 <0fbe7ff5-62e4-4345-882b-ca27195aa510@arm.com>
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
X-Rspamd-Queue-Id: 7F0E02374A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Fri, 6 Mar 2026 15:17:25 +0000
Steven Price <steven.price@arm.com> wrote:

> > +int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo)
> > +{
> > +	struct drm_gpuvm_bo *vm_bo;
> > +
> > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> > +		struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
> > +		struct drm_gpuva *va;
> > +
> > +		/* Skip already evicted GPU mappings. */
> > +		if (vm_bo->evicted)
> > +			continue;
> > +
> > +		if (!mutex_trylock(&vm->op_lock))
> > +			return -EDEADLK;
> > +
> > +		drm_gpuvm_bo_evict(vm_bo, true);
> > +		drm_gpuvm_bo_for_each_va(va, vm_bo) {
> > +			struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
> > +
> > +			if (vma->evicted)
> > +				continue;
> > +
> > +			panthor_vm_lock_region(vm, va->va.addr, va->va.range);  
> 
> NIT: You are ignoring the return value here - it might be better to bail
> out instead if this happens.

Will do in v5.

> Admittedly this is a "should never happen" case.

Better safe than sorry.
