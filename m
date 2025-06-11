Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2AAD58A7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 16:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5647310E698;
	Wed, 11 Jun 2025 14:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PIXxHMGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CC110E699;
 Wed, 11 Jun 2025 14:26:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C31C8442FF;
 Wed, 11 Jun 2025 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F011C4CEE3;
 Wed, 11 Jun 2025 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749651963;
 bh=Um54iD2Ex08bydeEoFEif2sitRw4yOb8i1SPcZ3nMSo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=PIXxHMGfq4NgV2U9cXcg+gz8SrkTJChw2n6MevmiNnLbDP5AMPQwWfZh/X3qY88Zb
 ZezaGmmH6kQJwOYlkDDyryEP4JJJenA8EqWGNL3+W7sQWPtHY+BNMA1NTg/UgMX47U
 jReWr/0bxLH3Tzjv0L47svZnUFiU7WIkcebIAsU3oPZjgSoMraUpvokz2lWXlVlI5p
 8gUpvUa/Xty2SvHItggTmsNF/aE6xBZY4DcWi5nJy9nV5GfGImMjGnhVNeN735YzD9
 FcZfr79PrjGLuBPommwZh3P5uKHpHX9d16B4/N9aNhoTDyo94fnuWUbc+sws55nB8u
 hrhbmU/JzGWhQ==
Date: Wed, 11 Jun 2025 16:25:59 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
Message-ID: <aEmR9420vj-ISz-W@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cefb0f5-3820-4828-8360-ff8c92e21aa6@amd.com>
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

(Cc: dri-devel)

On Tue, Jun 10, 2025 at 03:05:34PM +0200, Christian König wrote:
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > index 5a8bc6342222..6108a6f9dba7 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > @@ -44,6 +44,22 @@
> >  struct amdgpu_fence;
> >  enum amdgpu_ib_pool_type;
> >  
> > +/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
> > +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
> > +#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)

Why not

	(U64_MAX - {1, 2, ...})?

> Mhm, reiterating our internal discussion on the mailing list.
> 
> I think it would be nicer if we could use negative values for the kernel submissions and positive for userspace. But as discussed internally we would need to adjust the scheduler trace points for that once more.
> 
> @Philip and @Danilo any opinion on that?

Both, the U64_MAX and the positive-negative approach, are a bit hacky. I wonder
why we need client_id to be a u64, wouldn't a u32 not be enough?

Anyways, if client_id remains to be a u64, we could add a global DRM constant
instead, e.g.

	#define DRM_CLIENT_ID_MAX	0x0fffffffffffffff
	#define DRM_KERNEL_ID_BASE	(DRM_CLIENT_ID_MAX + 1)

And in drm_file_alloc() fail if we're out of IDs.

I think this would be much cleaner.
