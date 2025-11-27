Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452FAC8DDBE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DFF10E7BE;
	Thu, 27 Nov 2025 10:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ZwnqEigH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAE110E7BE;
 Thu, 27 Nov 2025 10:57:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dHD0S3Y2Lz9tgD;
 Thu, 27 Nov 2025 11:57:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764241048; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQoR8mNlqA2oCRhrxvCTyx9bmQGgxtrjxR27vUhKuSM=;
 b=ZwnqEigHKsgIS6x7IdHgcM3q6+kVZJofivGnyQK42WzEXMWmQY0smwklGu5QFf2szUeAfm
 +RMLwG/an+gi+Ao0XX6vEnCOtOQ8PRf2idoXi+yf7iXOhVKtYqgNP5jL+XlwalFbK9fvja
 TaJ38Js5m2PqwNNVZc+2Ak491+4ZYBD21QziQcEvpgGnCO1Bj0mKYH6U/cML5XlM8hwxXi
 wlLmKi26T+VUS5WiynItOaECLEC47aPU9tFZc3jsMwSIw/yiEuEctUChxOyKH0Gweg3gQ9
 11gKYkFJiwLoiHf3Cw+k0SfTN3zjgsk5WgVAnA4SXRLJZiyKCxIxGx9gS6O+tA==
Message-ID: <cbf607a647ab40ef800b3deb23f7b9c14f0b38e7.camel@mailbox.org>
Subject: Re: [PATCH 09/18] drm/amdgpu: fix KFD eviction fence
 enable_signaling path
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 11:57:25 +0100
In-Reply-To: <20251113145332.16805-10-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-10-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: xka7bskk1rf18y3f3m8pzy4j37qgwxek
X-MBO-RS-ID: 60230be4350f9a5540d
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

On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> Calling dma_fence_is_signaled() here is illegal!

OK, but why is that patch in this series?

P.

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
> =C2=A01 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> index 1ef758ac5076..09c919f72b6c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct dma=
_fence *f)
> =C2=A0{
> =C2=A0	struct amdgpu_amdkfd_fence *fence =3D to_amdgpu_amdkfd_fence(f);
> =C2=A0
> -	if (!fence)
> -		return false;
> -
> -	if (dma_fence_is_signaled(f))
> -		return true;
> -
> =C2=A0	if (!fence->svm_bo) {
> =C2=A0		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
> =C2=A0			return true;

