Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57813ABD059
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A620310E128;
	Tue, 20 May 2025 07:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="utsHWFdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF55D10E128;
 Tue, 20 May 2025 07:23:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C73D6113B;
 Tue, 20 May 2025 07:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFF2C4CEE9;
 Tue, 20 May 2025 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747725792;
 bh=axV148epcCnH8V4IUGh3tEhgUD1SmtDSAbyYQaGyLUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=utsHWFdp+aNZIybpy2w2/kulETWFThZUUGtwqTkkH59zikOi3fzIgH20T0ExBzDS/
 vbe5Wq5brUWmJCyNOtMSIH8TkgPKhDRaaU1h/IivjV8dTKTv/Mg1thBbqJ/qr2s2Uk
 I07KmNQokCcfH2NFUAc5Qu2Y4lRhMjNIe4SdDid1tgbmDxWMRZkvsbpdsVicBS4TY/
 G2Rq8A3zbns2w7FQkSiIH6g07DY7ESqpATWYJOWfD6hXH8uZBgaerRvq1TyxYvOk/T
 iupLImO3zK8kHdu66CVFNOI1hTVGN4kTB8CICzhVdgqXOzfKX0XxntGQ/LTwTtjOQN
 NlSai1pVNunDw==
Date: Tue, 20 May 2025 09:23:07 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aCwt20O7SH1zQLlV@pollux>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519175348.11924-2-robdclark@gmail.com>
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

On Mon, May 19, 2025 at 10:51:24AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> msm_gem_free_object()") for justification.

I asked for a proper commit message in v4.

Only referring to a driver commit and let the people figure out how the driver
works and what it does in order to motivate a change in the generic
infrastructure is simply unreasonable.

> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..1e89a98caad4 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
>  	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
>  	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
>  
> -	drm_gem_gpuva_assert_lock_held(obj);
> +	if (kref_read(&obj->refcount) > 0)
> +		drm_gem_gpuva_assert_lock_held(obj);

Again, this is broken. What if the reference count drops to zero right after
the kref_read() check, but before drm_gem_gpuva_assert_lock_held() is called?

Putting conditionals on a refcount is always suspicious.

If you still really want this, please guard it with

	if (unlikely(gpuvm->flags & DRM_GPUVM_MSM_LEGACY_QUIRK))

and get an explicit waiver from Dave / Sima.
