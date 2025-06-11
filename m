Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690BBAD59D9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 17:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2210E6B7;
	Wed, 11 Jun 2025 15:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rqw65BvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E981510E6A8;
 Wed, 11 Jun 2025 15:11:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 33B2F6154F;
 Wed, 11 Jun 2025 15:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C487C4CEF0;
 Wed, 11 Jun 2025 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749654698;
 bh=AZ4wDcpsWJ3H8yCTVb5dzOXJT6dvBCZ+vmOI0j4K/1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rqw65BvJTlHU9O00D6wwXYmKuMAbsQjTf5TPrLB+zP4Mi+MRe32hjlpkThpSw1IZN
 +qVyv5dGQUHBM8vnUJR5GeIPJUdkB7JP+0rWteUBuuOOYk37aYwERIi89fWIaUKIUO
 J6Sp2PuzQGE+InLPsWJRu2ZUkdK7V3FSX+FFQcw6d8s7CKXlnaR/YNvIsm1r4lSxdD
 6Q4Nwo6VimDGvw0GPBOyAz3fQPKi+bAWvTKa127JP5pkMJJQk39Kay90qHBkrAgIiP
 a7MWA6JITqCnx5YoSGVIQtCUAayUUnXMXlynbYLd0eVguOIDd7mWr+iJY1AKp+0bdC
 KQOp4DJgMDEdg==
Date: Wed, 11 Jun 2025 17:11:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
Message-ID: <aEmcpsXwS8dLNGUg@cassiopeiae>
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc661205-1e5b-4697-863b-36a299365219@amd.com>
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

On Wed, Jun 11, 2025 at 04:57:50PM +0200, Christian König wrote:
> On 6/11/25 16:25, Danilo Krummrich wrote:
> > (Cc: dri-devel)
> > 
> > On Tue, Jun 10, 2025 at 03:05:34PM +0200, Christian König wrote:
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> >>> index 5a8bc6342222..6108a6f9dba7 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> >>> @@ -44,6 +44,22 @@
> >>>  struct amdgpu_fence;
> >>>  enum amdgpu_ib_pool_type;
> >>>  
> >>> +/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
> >>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
> >>> +#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)
> > 
> > Why not
> > 
> > 	(U64_MAX - {1, 2, ...})?
> 
> That's what Pierre came up with as well, but I thought that this is ugly because it makes it hard to match the numbers from the trace back to something in the code.
> 
> >> Mhm, reiterating our internal discussion on the mailing list.
> >>
> >> I think it would be nicer if we could use negative values for the kernel submissions and positive for userspace. But as discussed internally we would need to adjust the scheduler trace points for that once more.
> >>
> >> @Philip and @Danilo any opinion on that?
> > 
> > Both, the U64_MAX and the positive-negative approach, are a bit hacky. I wonder
> > why we need client_id to be a u64, wouldn't a u32 not be enough?
> 
> That can trivially overflow on long running boxes.

I don't know if "trivially" is the word of choice given that the number is
4,294,967,295.

But I did indeed miss that this is a for ever increasing atomic. Why is it an
atomic? Why is it not an IDA?

> > Anyways, if client_id remains to be a u64, we could add a global DRM constant
> > instead, e.g.
> > 
> > 	#define DRM_CLIENT_ID_MAX	0x0fffffffffffffff
> > 	#define DRM_KERNEL_ID_BASE	(DRM_CLIENT_ID_MAX + 1)
> > 
> > And in drm_file_alloc() fail if we're out of IDs.
> 
> Mhm, I wouldn't mind printing the client id as hex and then always setting the highest bit for kernel submissions.
> 
> But when we keep printing them as base 10 it kind of becomes unreadable.
> 
> Christian.
> 
> > 
> > I think this would be much cleaner.
> 
