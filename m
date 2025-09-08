Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1781B48B2D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 13:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306CC10E136;
	Mon,  8 Sep 2025 11:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TQrPBfUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E0C10E136
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 11:11:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9BB1E43498;
 Mon,  8 Sep 2025 11:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A381CC4CEF9;
 Mon,  8 Sep 2025 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757329896;
 bh=Gf3bKLVGBIqbxULlO+jSRJmsI6c3oODRH0Ft0N6BqUk=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=TQrPBfUDMaZ8w+ALMfFLKSvgLIRPLaLK+W+CWaalH/wWCWUoPzFjZ0G2iLGamw9OJ
 sv/zKxaR4+T5jJ7SlDF0D02rm1kLWcdlVtlN+UecUnq8RnmqniP1DiQHi/epJbcvvh
 Acy8thCDU9Y3ngaMXb2C3Zrzki91T9VsEu/fW0dCjk8ttFHBLP4wOVAOlJevIuer1a
 wnl5aRQezmoltG6R5YsniEjt7uN38e74A18aOSfBjpfifVPK/lFqkqaEsQdNZC2Gtm
 ua/od/aQ0Apavh28JTCwMemQtBmhlN7drI+ol2HVKQJTuDplWF3v87MuF6DkG1PehD
 MZIT9elzG9kpQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 13:11:32 +0200
Message-Id: <DCNDGFE7RR5Q.X3PCDW0KIX89@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Steven Price"
 <steven.price@arm.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org> <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org> <aL1u_YxOkuj1kIq6@google.com>
 <20250908091140.44856fde@fedora> <aL6TJYRmWIkQXujj@google.com>
 <DCNAE3CJMEJ0.JH1F0MJABXQI@kernel.org> <20250908122002.2c80dd3a@fedora>
In-Reply-To: <20250908122002.2c80dd3a@fedora>
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

On Mon Sep 8, 2025 at 12:20 PM CEST, Boris Brezillon wrote:
> I'm not following. Yes there's going to be a
> drm_gpuva_unlink_defer_put() that skips the
>
>         va->vm_bo =3D NULL;
>         drm_gpuvm_bo_put(vm_bo);
>
> and adds the gpuva to a list for deferred destruction. But I'm not
> seeing where the leak is. Once the gpuva has been put in this list,
> there should be no existing component referring to this object, and it's
> going to be destroyed or recycled, but not re-used as-is.

I'm saying exactly what you say: "has to be a special unlink function" ->
drm_gpuva_unlink_defer_put(). :)

>> Yeah, we really want to avoid that.
>
> I think I agree that we want to avoid it, but I'm not too sure about
> the solution that involves playing with vm_bo::kref. I'm particularly
> worried by the fact drivers can iterate the evict/extobj lists
> directly, and can thus see objects scheduled for destruction. I know
> there's a gpuvm_bo_is_dead() helper, and drivers should be aware of the
> risks, but I don't feel comfortable about this.

No, drivers can't iterate the evict/extobj lists directly; or at least this=
 is
not intended by GPUVM's API and if drivers do so, this is considered peekin=
g
into GPUVM internals, so drivers are on their own anyways.

Iterators, such as for_each_vm_bo_in_list() are not exposed to drivers.

> And since we've mentioned the possibility of having to support
> gpuva destruction deferral too, I'm wondering it wouldn't be cleaner
> to just go for this approach from the start (gpuva owns a ref to a
> vm_bo, which gets released when the gpuva object is released).
