Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJEwE4S0jWl96AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:07:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B112CDBF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12FD10E237;
	Thu, 12 Feb 2026 11:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="d//CJP6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEB910E237
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770894462;
 bh=E/k4M4KrO5oPdNQ6TyxoTcbl0HWeRZk7Wtw8a3OrLkA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d//CJP6j1EC6lohf6+ipyUdcOZUBKA6g90DJssorKLQJ2GGLvgxF5ylXt9KMxq937
 AH82D/yRbIoMUb7qNfrPqS66udA/dXrYMeBFgTXFEBh9k20QzHHs/sPLWB0TJpfvIu
 Fb4jiQZO7XofJubC4CzH7SH4Qyze/JvwWpeXATlg3T4ZLvO83YJOCLplPs4o61j0zf
 IpQAEEnJpdD7iELOdFSTHlC0OXw3tM0awZ+oJ8kIzDxQ1Fk8Aw1ZRGnE16u06RFFpm
 HSiPoqBAycKQkQoBv264aGXMzii9vkw+yrU1RbXgEgbQaW3sZwYAh+AOGStxhd6qbM
 jyvA3uYaOIu6g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FB4817E0A49;
 Thu, 12 Feb 2026 12:07:42 +0100 (CET)
Date: Thu, 12 Feb 2026 12:07:38 +0100
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
 kernel@collabora.com
Subject: Re: [PATCH v3 5/9] drm/panthor: Part ways with drm_gem_shmem_object
Message-ID: <20260212120738.57cc1655@fedora>
In-Reply-To: <4f90ca0b-4291-43a8-b131-19da3ac848e9@arm.com>
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
 <20260211080343.1887134-6-boris.brezillon@collabora.com>
 <4f90ca0b-4291-43a8-b131-19da3ac848e9@arm.com>
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_ORG_HEADER(0.00)[]
X-Rspamd-Queue-Id: A59B112CDBF
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 15:58:27 +0000
Steven Price <steven.price@arm.com> wrote:

> On 11/02/2026 08:03, Boris Brezillon wrote:
> > While drm_gem_shmem_object does most of the job we need it to do, the
> > way sub-resources (pages, sgt, vmap) are handled and their lifetimes
> > gets in the way of BO reclaim. There has been attempts to address
> > that [1], but in the meantime, new gem_shmem users were introduced
> > (accel drivers), and some of them manually free some of these resources.
> > This makes things harder to control/sanitize/validate.
> > 
> > Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resources
> > and forcing gem_shmem users to go through new gem_shmem helpers when they
> > need manual control of some sort, and I believe this is a dead end if
> > we don't force users to follow some stricter rules through carefully
> > designed helpers, because there will always be one user doing crazy things
> > with gem_shmem_object internals, which ends up tripping out the common
> > helpers when they are called.
> > 
> > The consensus we reached was that we would be better off forking
> > gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
> > current transition tries to minimize the changes, but there are still
> > some aspects that are different, the main one being that we no longer
> > have a pages_use_count, and pages stays around until the GEM object is
> > destroyed (or when evicted once we've added a shrinker). The sgt also
> > no longer retains pages. This is losely based on how msm does things by
> > the way.
> > 
> > If there's any interest in sharing code (probably with msm, since the
> > panthor shrinker is going to be losely based on the msm implementation),
> > we can always change gears and do that once we have everything
> > working/merged.
> > 
> > [1]https://patchwork.kernel.org/project/dri-devel/patch/20240105184624.508603-1-dmitry.osipenko@collabora.com/
> > 
> > v2:
> > - Fix refcounting
> > - Add a _locked suffix to a bunch of functions expecting the resv lock
> >   to be held
> > - Take the lock before releasing resources in panthor_gem_free_object()
> > 
> > v3:
> > - Use ERR_CAST() to fix an ERR-ptr deref
> > - Add missing resv_[un]lock() around a panthor_gem_backing_unpin_locked()
> >   call
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Looks good, but one issue I missed previously below.
> 
> [...]
> 
> > +
> > +static void *
> > +panthor_gem_vmap_get_locked(struct panthor_gem_object *bo)
> > +{
> > +	pgprot_t prot = PAGE_KERNEL;
> > +	void *vaddr;
> > +	int ret;
> > +
> > +	dma_resv_assert_held(bo->base.resv);
> > +
> > +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (refcount_inc_not_zero(&bo->cmap.vaddr_use_count)) {
> > +		drm_WARN_ON_ONCE(bo->base.dev, !bo->cmap.vaddr);
> > +		return bo->cmap.vaddr;
> > +	}
> > +
> > +	ret = panthor_gem_backing_pin_locked(bo);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	ret = panthor_gem_prep_for_cpu_map_locked(bo);
> > +	if (ret)
> > +		return ERR_PTR(ret);  
> 
> This should be "goto err_unpin" to drop the pin.

Oops, will fix in v4.
