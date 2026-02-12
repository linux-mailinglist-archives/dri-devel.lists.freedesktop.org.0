Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C19D5y0jWl96AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:08:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A712CDC7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05ACA10E720;
	Thu, 12 Feb 2026 11:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Qf+bP6IC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B332510E720
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770894487;
 bh=JnlAQXgUgiWuq1DGy6L5t70OKqjnvUxOUAxTpk1Aq8s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qf+bP6ICDZmNlQzBJHfzkqs7j+FZI0hbCbSAyWgjL0FxOpCTgh9XGRYbBsH5o21ET
 luNf2aaDZapYgIBQnggCTY4nuNcrWTZAgG0Asj4sx5HoSywu0tGf0AJItoKtc+TdKH
 dBNnW3hW0pyoz0Z1z3mueXR14SXuQ3fCs8oE2dVH1QWhEjb3LuQstGvMSCNs9zGxOf
 jp2Z68dJQyYGxDQTZ8dop1dgLaSNtEiC/i3BjIOhGeik4LTQjQWpXu6vMVu5IJeuED
 F7yn26e5beoOszr+gFKOMJ9eAgtm5l9RUma6nIdk8frapa236bQdnIKNTA7xD2XEb3
 OzV0Zocp8hqtg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 96DD917E151C;
 Thu, 12 Feb 2026 12:08:06 +0100 (CET)
Date: Thu, 12 Feb 2026 12:08:00 +0100
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
Subject: Re: [PATCH v3 8/9] drm/panthor: Track the number of mmap on a BO
Message-ID: <20260212120800.25a45426@fedora>
In-Reply-To: <7247f751-ff4b-47fe-a156-d289c288f433@arm.com>
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
 <20260211080343.1887134-9-boris.brezillon@collabora.com>
 <7247f751-ff4b-47fe-a156-d289c288f433@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: C76A712CDC7
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 16:08:23 +0000
Steven Price <steven.price@arm.com> wrote:

> On 11/02/2026 08:03, Boris Brezillon wrote:
> > This will be used to order things by reclaimability.
> > 
> > v2:
> > - Fix refcounting
> > 
> > v3:
> > - Fix refcounting (again)
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> I think we've got the refcounting correct this time, one minor comment
> below but either way:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c | 45 +++++++++++++++++++++++++--
> >  drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
> >  2 files changed, 46 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 8905042b856c..e46bfc4f2063 100644
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
> > @@ -606,6 +607,13 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
> >  	if (is_cow_mapping(vma->vm_flags))
> >  		return -EINVAL;
> >  
> > +	if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
> > +		dma_resv_lock(obj->resv, NULL);
> > +		if (!refcount_inc_not_zero(&bo->cmap.mmap_count))
> > +			refcount_set(&bo->cmap.mmap_count, 1);  
> 
> It could make sense to put a call to
> panthor_gem_update_reclaim_state_locked() in here as we could transition
> from UNUSED to MMAPPED. Things should work out due to the call in
> panthor_gem_try_evict(), but the shrinker will have to work harder.

Sure, I'll add that to the next commit.

> 
> Thanks,
> Steve
> 
> > +		dma_resv_unlock(obj->resv);
> > +	}
> > +
> >  	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> >  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> >  	if (should_map_wc(bo))
> > @@ -732,10 +740,43 @@ static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
> >  	return blocking_page_setup(vmf, bo, page_offset, true);
> >  }
> >  
> > +static void panthor_gem_vm_open(struct vm_area_struct *vma)
> > +{
> > +	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
> > +
> > +	/* mmap_count must have been incremented at mmap time, so it can't be
> > +	 * zero here.
> > +	 */
> > +	if (!drm_gem_is_imported(&bo->base))
> > +		drm_WARN_ON(bo->base.dev, !refcount_inc_not_zero(&bo->cmap.mmap_count));
> > +
> > +	drm_gem_vm_open(vma);
> > +}
> > +
> > +static void panthor_gem_vm_close(struct vm_area_struct *vma)
> > +{
> > +	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
> > +
> > +	if (drm_gem_is_imported(&bo->base))
> > +		goto out;
> > +
> > +	if (refcount_dec_not_one(&bo->cmap.mmap_count))
> > +		goto out;
> > +
> > +	dma_resv_lock(bo->base.resv, NULL);
> > +	if (refcount_dec_and_test(&bo->cmap.mmap_count)) {
> > +		/* Nothing to do, pages are reclaimed lazily. */
> > +	}
> > +	dma_resv_unlock(bo->base.resv);
> > +
> > +out:
> > +	drm_gem_object_put(&bo->base);
> > +}
> > +
> >  const struct vm_operations_struct panthor_gem_vm_ops = {
> >  	.fault = panthor_gem_fault,
> > -	.open = drm_gem_vm_open,
> > -	.close = drm_gem_vm_close,
> > +	.open = panthor_gem_vm_open,
> > +	.close = panthor_gem_vm_close,
> >  };
> >  
> >  static const struct drm_gem_object_funcs panthor_gem_funcs = {
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> > index b66478c9590c..c0a18dca732c 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.h
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> > @@ -80,6 +80,9 @@ struct panthor_gem_cpu_map {
> >  
> >  	/** @vaddr_use_count: Number of active vmap() requests on this GEM */
> >  	refcount_t vaddr_use_count;
> > +
> > +	/** @mmap_count: Number of active mmap() requests on this GEM */
> > +	refcount_t mmap_count;
> >  };
> >  
> >  /**  
> 

