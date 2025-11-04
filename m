Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FDC320E9
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 17:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F3610E63D;
	Tue,  4 Nov 2025 16:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="twgIotC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47F410E63D;
 Tue,  4 Nov 2025 16:28:34 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d1DR36C17z9v7X;
 Tue,  4 Nov 2025 17:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762273711; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wITnhR3EvC+dI/yujkxdjLNb5bZzQ8KO3x8uJ+Jlz3c=;
 b=twgIotC0No6zX/HdxCrqAfv6BLDqB75meYWqKMSTQ8uvDfrxBlaei0ImcupQUco1DSjLDi
 op5zNvc3dMxpQhdbvdobaguQSvF5pUMEFaPhVnROBxQBNL8UaDlwPO/DrrhOhZNiDd92WJ
 ri+xXxPGm19MNSSbg7srGVsIqKvnHCCjNc9uI2c677VMVbGtJuG8rIxqXVN3so5ApCzSIc
 R3JOSpU5eQzvjvOBJRlL3ZyMxL6qKvn/cljay3uj+ZR1IeQNYxZV1sfbyoh37HnGSp3q6Q
 FTRH4vfZDHLCydT1CFFvruI/mic4JJ/anlo+I/Sd4gxyQzzGqwJUfuStfbXoYg==
Message-ID: <febe733b667c1700333044bce8649c6520d69148.camel@mailbox.org>
Subject: Re: [PATCH 11/20] drm/amdgpu: fix KFD eviction fence
 enable_signaling path
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Tue, 04 Nov 2025 17:28:27 +0100
In-Reply-To: <20251031134442.113648-12-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-12-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 976ce5614da2987c880
X-MBO-RS-META: ooaw7imi65yaf7epnsbf3i51hwaipo86
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-10-31 at 14:16 +0100, Christian K=C3=B6nig wrote:
> Calling dma_fence_is_signaled() here is illegal!

The series was sent as a v2. But is this still an RFC?

If not, more detailed commit messages are a desirable thing.


P.

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
> =C2=A01 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> index 1ef758ac5076..09c919f72b6c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct
> dma_fence *f)
> =C2=A0{
> =C2=A0	struct amdgpu_amdkfd_fence *fence =3D
> to_amdgpu_amdkfd_fence(f);
> =C2=A0
> -	if (!fence)
> -		return false;
> -
> -	if (dma_fence_is_signaled(f))
> -		return true;
> -
> =C2=A0	if (!fence->svm_bo) {
> =C2=A0		if
> (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
> =C2=A0			return true;

