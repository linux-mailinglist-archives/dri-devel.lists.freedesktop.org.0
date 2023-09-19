Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5617A5E8B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 11:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A329C10E33E;
	Tue, 19 Sep 2023 09:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A9B10E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695116995; x=1726652995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XFiN8bdb0MrIinkJpoDMElYDjAQLe3/+Jc909gf2ZmA=;
 b=Ye4XgHYU12im8iBJHlAlKcpFHrz9Wv7HUxm60YIclDlaOnH35sinFltG
 8xPpp2JQxYNrBDA3JMCNFB4bfcQc7UsNolv1Smb3q++5LFvEYELIJtV0Y
 LuRi+Z1VcCJ/Ic5RyogjLmGIuEVGiAIs8oTgqajumpj5A7t3OjQu6M1e9
 WIoe6giIX4Cn879dujOCsl8/SCdjkqWz2hUKqNTa2KDfLUzbRD3uvX2+X
 cQLre7aB5ZnFRMHo90Vgo3PnEmMaJA7pj98lV1InZTXl3kc5YIhuzpLfE
 fKRYVUG66urjCCk/MwMDx3PutGzmn4JwcIfq/QOxOjLh/lKLw0eUCkL5Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383723040"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383723040"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811667580"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="811667580"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:49:32 -0700
Date: Tue, 19 Sep 2023 11:49:30 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [RFC 3/4] accel/ivpu: Remove support for uncached buffers
Message-ID: <20230919094930.GB563961@linux.intel.com>
References: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
 <20230901164842.178654-4-stanislaw.gruszka@linux.intel.com>
 <9925ef5c-f4f9-6553-f720-35fb0b1a5aa1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9925ef5c-f4f9-6553-f720-35fb0b1a5aa1@quicinc.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 09:24:42AM -0600, Jeffrey Hugo wrote:
> On 9/1/2023 10:48 AM, Stanislaw Gruszka wrote:
> > From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > 
> > Usages of DRM_IVPU_BO_UNCACHED should be replaced by DRM_IVPU_BO_WC.
> > There is no functional benefit from DRM_IVPU_BO_UNCACHED if these
> > buffers are never mapped to host VM.
> > 
> > This allows to cut the buffer handling code in the kernel driver
> > by half.
> > 
> > Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >   drivers/accel/ivpu/ivpu_fw.c  | 2 +-
> >   drivers/accel/ivpu/ivpu_gem.c | 3 ---
> >   include/uapi/drm/ivpu_accel.h | 2 +-
> >   3 files changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> > index 2fef9fe154aa..8ab0f3225205 100644
> > --- a/drivers/accel/ivpu/ivpu_fw.c
> > +++ b/drivers/accel/ivpu/ivpu_fw.c
> > @@ -248,7 +248,7 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
> >   	if (fw->shave_nn_size) {
> >   		fw->mem_shave_nn = ivpu_bo_alloc_internal(vdev, vdev->hw->ranges.shave.start,
> > -							  fw->shave_nn_size, DRM_IVPU_BO_UNCACHED);
> > +							  fw->shave_nn_size, DRM_IVPU_BO_WC);
> >   		if (!fw->mem_shave_nn) {
> >   			ivpu_err(vdev, "Failed to allocate shavenn buffer\n");
> >   			ret = -ENOMEM;
> > diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> > index 915c53d7bb97..2a91eb1e3627 100644
> > --- a/drivers/accel/ivpu/ivpu_gem.c
> > +++ b/drivers/accel/ivpu/ivpu_gem.c
> > @@ -89,8 +89,6 @@ static int __must_check shmem_alloc_pages_locked(struct ivpu_bo *bo)
> >   	if (bo->flags & DRM_IVPU_BO_WC)
> >   		set_pages_array_wc(pages, npages);
> > -	else if (bo->flags & DRM_IVPU_BO_UNCACHED)
> > -		set_pages_array_uc(pages, npages);
> >   	bo->pages = pages;
> >   	return 0;
> > @@ -366,7 +364,6 @@ ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags, const struct ivpu_b
> >   	switch (flags & DRM_IVPU_BO_CACHE_MASK) {
> >   	case DRM_IVPU_BO_CACHED:
> > -	case DRM_IVPU_BO_UNCACHED:
> >   	case DRM_IVPU_BO_WC:
> >   		break;
> >   	default:
> > diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
> > index 262db0c3beee..de1944e42c65 100644
> > --- a/include/uapi/drm/ivpu_accel.h
> > +++ b/include/uapi/drm/ivpu_accel.h
> > @@ -196,7 +196,7 @@ struct drm_ivpu_bo_create {
> >   	 *
> >   	 * %DRM_IVPU_BO_UNCACHED:
> >   	 *
> > -	 * Allocated BO will not be cached on host side nor snooped on the VPU side.
> > +	 * Not supported. Use DRM_IVPU_BO_WC instead.
> >   	 *
> >   	 * %DRM_IVPU_BO_WC:
> >   	 *
> 
> Feels like this will break existing userspace.  You could see if userspace
> specified UNCACHED and change it to WC before processing the request.  Maybe
> also use WARN_ONCE to indicate that userspace should be updated.
> 
> Or is it the case that userspace never actually used this?

Usage of those buffers was removed some time ago:
https://github.com/intel/linux-vpu-driver/commit/c473c9826cb28fa3dcf8883fc804b1e84c6b5fb1

And will not be part of first user-mode driver release. I think we can
safely do the change.

Regards
Stanislaw
