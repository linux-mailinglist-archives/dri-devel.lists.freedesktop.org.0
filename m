Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B03A1B1E8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E147310E91A;
	Fri, 24 Jan 2025 08:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Bnj4pJtZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146FC10E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737708569;
 bh=fxFDZsIVmHb3FecdTmipK6E011R+3S1pmQ1B4v6mNuk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bnj4pJtZiJYg4OsuUKaGjka4QtE8iP1YhTQmMMLJ0FS6pQOOEyraQEuFgh5OekJ7O
 6x+ltyxbQ6PIuFUdTwjeD7Kf1rkAVorgpOp45zndjO/MzZxGL88na1fRhDQKx6ETe7
 zx55QAeYKT+7wGhaZpIg0W5zrB89MX6ScokNpXfhIoCZZmOV4aD2bpCbuoGADEdIvP
 RvlFLqgFWkQhUnLwnqTaj9lFb7wm6cYgPDVUMzamt9zvBELdmS5Dab7Ygj66JNLtqb
 RHBAZPEff2MGyusJghbKzgv6CO8NxA0GghnivAQfCvWimVP0CFhEPZNAxY37g8O3W8
 qwhSCwT7Kjfrg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B0EA17E0E57;
 Fri, 24 Jan 2025 09:49:29 +0100 (CET)
Date: Fri, 24 Jan 2025 09:48:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, kernel@collabora.com, Tvrtko Ursulin
 <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mihail Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v9 3/5] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <20250124094830.12c17b93@collabora.com>
In-Reply-To: <20250123225325.3271764-4-adrian.larumbe@collabora.com>
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
 <20250123225325.3271764-4-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 23 Jan 2025 22:53:00 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +/**
> + * panthor_vm_heaps_sizes() - Calculate size of all heap chunks across a=
ll
> + * heaps over all the heap pools in a VM
> + * @pfile: File.
> + * @stats: Memory stats to be updated.
> + *
> + * Calculate all heap chunk sizes in all heap pools bound to a VM. If th=
e VM
> + * is active, record the size as active as well.
> + */
> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memor=
y_stats *stats)
> +{
> +	struct panthor_vm *vm;
> +	unsigned long i;
> +
> +	if (!pfile->vms)
> +		return;
> +
> +	xa_lock(&pfile->vms->xa);
> +	xa_for_each(&pfile->vms->xa, i, vm) {
> +		size_t size;
> +
> +		mutex_lock(&vm->heaps.lock);
> +		if (!vm->heaps.pool) {
> +			mutex_unlock(&vm->heaps.lock);
> +			continue;
> +		}
> +		size =3D panthor_heap_pool_size(vm->heaps.pool);
> +		mutex_unlock(&vm->heaps.lock);

Let's keep the locking scheme simple:

		size_t size =3D 0;

		mutex_lock(&vm->heaps.lock);
		if (vm->heaps.pool)
			size =3D panthor_heap_pool_size(vm->heaps.pool);
		mutex_unlock(&vm->heaps.lock);

		stats->resident +=3D size;
		if (vm->as.id >=3D 0)
			stats->active +=3D size;
	=09
> +
> +		stats->resident +=3D size;
> +		if (vm->as.id >=3D 0)
> +			stats->active +=3D size;
> +	}
> +	xa_unlock(&pfile->vms->xa);
> +}
> +
