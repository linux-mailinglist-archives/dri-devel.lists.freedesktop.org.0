Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D1D0C16D
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E2210E1EA;
	Fri,  9 Jan 2026 19:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kq7zAsaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4671310E1EA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 19:38:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C70C60150;
 Fri,  9 Jan 2026 19:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2F2C4CEF7;
 Fri,  9 Jan 2026 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767987523;
 bh=nDkn27oYOuMDkWeE+yGnQViGkHKfMDPc1UHkLfEWgHU=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=Kq7zAsaC2Ky2YfeLklHhHMYDdU45bZHTWq6oWSE1bDpn8nMquqByGxDPzlyks14oS
 0Phe/mrPA47IOZmq/lrjNJ5be5FeLq3cvwVizt0eaL3DJUW2TFNVFSa0hmhV75Sdkf
 4Gqt3b2+eUjehrpM06LJtQpMsjj6MafmLdO7zk+2/rxDbiJtTO5PwOo5l0V7w8ySuX
 4nXc6g44+Z1CB3tcy9+9AlJ5aVgYkV+zbTDVG3WhcRR/wAoOxzjvmVxG2egrReBkS3
 +mO6pFsew9m+nghBQ7dC6At9SGXB46mcBZ1+sH0j12YoYQfSGSMicPam31k6vkhHzh
 msWRPW2FIsVZw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 20:38:37 +0100
Message-Id: <DFKB9OUFLT3A.2TJ21YPFZPATD@kernel.org>
Cc: "Steven Price" <steven.price@arm.com>, "Liviu Dudau"
 <liviu.dudau@arm.com>, =?utf-8?q?Adri=C3=A1n_Larumbe?=
 <adrian.larumbe@collabora.com>, <dri-devel@lists.freedesktop.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Akash
 Goel" <akash.goel@arm.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>,
 "Sean Paul" <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Akhil P Oommen" <akhilpo@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Chris Diamand" <chris.diamand@arm.com>,
 "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Alice Ryhl" <aliceryhl@google.com>, <kernel@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1 2/9] drm/gpuvm: Validate BOs in the extobj list when
 VM is resv protected
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-3-boris.brezillon@collabora.com>
In-Reply-To: <20260109130801.1239558-3-boris.brezillon@collabora.com>
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

On Fri Jan 9, 2026 at 2:07 PM CET, Boris Brezillon wrote:
> When the VM is protected with the root object resv, evicted extobjs
> are not inserted in the evict list.

I'd rather say: "When the evicted object list is protected with the root ob=
ject
reservation lock, ...".

> Make sure we record when the extobj
> list contains evicted BOs that are not already in the evict list so we
> can validate those when drm_gpuvm_validate() is called.

Why is this necessary in the first place? drm_gpuvm_prepare_objects() picks=
 up
the affected external objects already.

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 23 ++++++++++++++++++++++-
>  include/drm/drm_gpuvm.h     |  6 ++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 0bb115b6b59c..95f0a1c843ad 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1505,6 +1505,22 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm,=
 struct drm_exec *exec)
>  			drm_gpuvm_bo_list_del_init(vm_bo, evict, false);
>  	}
> =20
> +	if (READ_ONCE(gpuvm->extobj.check_evicted)) {
> +		list_for_each_entry_safe(vm_bo, next, &gpuvm->extobj.list,
> +					 list.entry.extobj) {

Running the external object list (again) seems wasteful given that this cas=
e can
never happen when drm_gpuvm_prepare_objects() is called before (which has t=
o be
the case, given that somehow the objects have to be locked).

And even if for some reason you open code this, it would be much better to =
add a
helper doing the check when the object is locked.

> +			dma_resv_assert_held(vm_bo->obj->resv);
> +
> +			if (!vm_bo->evicted)
> +				continue;
> +
> +			ret =3D ops->vm_bo_validate(vm_bo, exec);
> +			if (ret)
> +				break;
> +		}
> +
> +		WRITE_ONCE(gpuvm->extobj.check_evicted, false);

Why do we need READ_ONCE() and WRITE_ONCE() here? Don't we hold the object'=
s
reservation lock whenever we touch check_evicted anyways?

