Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F5FD10DF2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A2010E2E7;
	Mon, 12 Jan 2026 07:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ad7cpsYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C786610E2E7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768203027;
 bh=76zyp142nntWg5LlS/nv3Nl2RH9S13/nhsMEPzRvEZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ad7cpsYQwtAGoKU1XwjMsU7sod3vJTSP319cM5veROpebmrd+kBreqRtkvn7tlLWy
 BzoTdxUllU56ErwcRjQPFWrPO3mVL1fB9JM18fBi2PSvkdXmOoL+M9NOm3P3Hy0mEn
 Q165wScn4C148E4DZHqQnYkcnYXaHTiSSCfa0qoOBmvX78LcuYP4OsLGo2+c75YH9t
 C4LelxiGyec83G/UtRoXShPiBISeZHXvCceP33DK6go5y/bvKaGyBkq6Ih2DefMlXm
 BuIyfmaHhQJa2KTLwUMEaUOcqXD3wNdqeg0hYDgAJ7uv9LRK6MgCekrnaFOeu+Wzh7
 PgFYb5LDurGKw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A0E217E0B8E;
 Mon, 12 Jan 2026 08:30:26 +0100 (CET)
Date: Mon, 12 Jan 2026 08:30:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Steven Price" <steven.price@arm.com>, "Liviu Dudau"
 <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, <dri-devel@lists.freedesktop.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Akash
 Goel" <akash.goel@arm.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>,
 "Sean Paul" <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Akhil P Oommen" <akhilpo@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Chris Diamand" <chris.diamand@arm.com>,
 "Matthew Brost" <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2?=
 =?UTF-8?B?bQ==?= <thomas.hellstrom@linux.intel.com>, "Alice Ryhl"
 <aliceryhl@google.com>, <kernel@collabora.com>
Subject: Re: [PATCH v1 2/9] drm/gpuvm: Validate BOs in the extobj list when
 VM is resv protected
Message-ID: <20260112083014.52fb8232@fedora>
In-Reply-To: <DFKB9OUFLT3A.2TJ21YPFZPATD@kernel.org>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-3-boris.brezillon@collabora.com>
 <DFKB9OUFLT3A.2TJ21YPFZPATD@kernel.org>
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

On Fri, 09 Jan 2026 20:38:37 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Fri Jan 9, 2026 at 2:07 PM CET, Boris Brezillon wrote:
> > When the VM is protected with the root object resv, evicted extobjs
> > are not inserted in the evict list.  
> 
> I'd rather say: "When the evicted object list is protected with the root object
> reservation lock, ...".
> 
> > Make sure we record when the extobj
> > list contains evicted BOs that are not already in the evict list so we
> > can validate those when drm_gpuvm_validate() is called.  
> 
> Why is this necessary in the first place? drm_gpuvm_prepare_objects() picks up
> the affected external objects already.

Oops, that's correct. Was looking for something calling
->vm_bo_validate() on evicted objects, but those are added to the
evict list instead. I'll drop this patch.

Thanks,

Boris

> 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 23 ++++++++++++++++++++++-
> >  include/drm/drm_gpuvm.h     |  6 ++++++
> >  2 files changed, 28 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 0bb115b6b59c..95f0a1c843ad 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -1505,6 +1505,22 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
> >  			drm_gpuvm_bo_list_del_init(vm_bo, evict, false);
> >  	}
> >  
> > +	if (READ_ONCE(gpuvm->extobj.check_evicted)) {
> > +		list_for_each_entry_safe(vm_bo, next, &gpuvm->extobj.list,
> > +					 list.entry.extobj) {  
> 
> Running the external object list (again) seems wasteful given that this case can
> never happen when drm_gpuvm_prepare_objects() is called before (which has to be
> the case, given that somehow the objects have to be locked).
> 
> And even if for some reason you open code this, it would be much better to add a
> helper doing the check when the object is locked.
> 
> > +			dma_resv_assert_held(vm_bo->obj->resv);
> > +
> > +			if (!vm_bo->evicted)
> > +				continue;
> > +
> > +			ret = ops->vm_bo_validate(vm_bo, exec);
> > +			if (ret)
> > +				break;
> > +		}
> > +
> > +		WRITE_ONCE(gpuvm->extobj.check_evicted, false);  
> 
> Why do we need READ_ONCE() and WRITE_ONCE() here? Don't we hold the object's
> reservation lock whenever we touch check_evicted anyways?
> 

