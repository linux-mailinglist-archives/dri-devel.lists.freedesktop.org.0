Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBwBK1/WgGmFBwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:52:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27713CF325
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412B310E500;
	Mon,  2 Feb 2026 16:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lW+50llU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFB210E500
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770051162;
 bh=1C/eWXfz/8E8OiOMDyZd+lz0fF9dC1XLvsKZslpQO9k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lW+50llUnzR626txg7aIRLHp/2RMuQspRgDqyt7liGLBF/Zk3PL1sZR1bIWzVX+RA
 8Nbt8FYH6tJ165R6MVbwG7LMUzT/v7zG9UOIxDzMLRgWs4rkODRE8LvmQ+p0lvtjIZ
 3zgaZrqGb2tvFP/usA71D21o7hQlS6tStAGhurAvGRFcWMzS8YGmG92eopetIZ7o+e
 KuVmASLwpk6vBuVpeMug8rP3zKWUnNc5KoijJUucCRWI6beUN3GviJbG6mfosdYjnQ
 ApQXre383u9+L3kcybEO4IwT+6hTM/IWulMFay0dIF5Iyu/US7lWMi1xSSJ9EwgzcM
 R0Kg2RkbIOTdA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A55AF17E1203;
 Mon,  2 Feb 2026 17:52:41 +0100 (CET)
Date: Mon, 2 Feb 2026 17:52:36 +0100
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
Subject: Re: [PATCH v2 7/8] drm/panthor: Track the number of mmap on a BO
Message-ID: <20260202175236.0e26e671@fedora>
In-Reply-To: <ffa32c4e-845a-467f-a1ff-064cc9f30b70@arm.com>
References: <20260202113607.1745667-1-boris.brezillon@collabora.com>
 <20260202113607.1745667-8-boris.brezillon@collabora.com>
 <ffa32c4e-845a-467f-a1ff-064cc9f30b70@arm.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 27713CF325
X-Rspamd-Action: no action

On Mon, 2 Feb 2026 16:48:41 +0000
Steven Price <steven.price@arm.com> wrote:

> On 02/02/2026 11:36, Boris Brezillon wrote:
> > This will be used to order things by reclaimability.
> > 
> > v2:
> > - Fix refcounting
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c | 44 +++++++++++++++++++++++++--
> >  drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
> >  2 files changed, 45 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 7e966fbe500f..26fe4be10a86 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -491,6 +491,7 @@ static void panthor_gem_print_info(struct drm_printer *p, unsigned int indent,
> >  	drm_printf_indent(p, indent, "vmap_use_count=%u\n",
> >  			  refcount_read(&bo->cmap.vaddr_use_count));
> >  	drm_printf_indent(p, indent, "vaddr=%p\n", bo->cmap.vaddr);
> > +	drm_printf_indent(p, indent, "mmap_count=%u\n", refcount_read(&bo->cmap.mmap_count));
> >  }
> >  
> >  static int panthor_gem_pin_locked(struct drm_gem_object *obj)
> > @@ -603,6 +604,12 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
> >  	if (is_cow_mapping(vma->vm_flags))
> >  		return -EINVAL;
> >  
> > +	if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
> > +		dma_resv_lock(obj->resv, NULL);
> > +		refcount_set(&bo->cmap.mmap_count, 1);  
> 
> I think you still need to recheck the refcount with the lock held.
> Otherwise two threads could race:
> 
>  Thread 1			| Thread 2
>  -------------------------------+--------------------------
>  if (!refcount_inc_not_zero())  |
> 	<pre-empted>		|
> 				| if (!refcount_inc_not_zero())
> 				| dma_resv_lock()
> 				| refcount_set(..., 1)
> 				| dma_resv_unlock()
>  dma_resv_lock()		|
>  refcount_set(..., 1)		|
>  dma_resv_unlock()		|
> 
> Which leaves a refcount missing.

Uh, right. I fixed that pattern in multiple places but somehow
overlooked this one. Will fix in v3.

Thanks!
