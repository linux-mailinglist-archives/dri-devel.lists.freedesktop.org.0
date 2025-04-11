Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E7A85E02
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 15:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923D710EBAC;
	Fri, 11 Apr 2025 13:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="En/fIOJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAFB10EBA8;
 Fri, 11 Apr 2025 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744376460;
 bh=KioU22GXhDXTz3v87bSc+crdpDeGGhLqHnEaZKsf9k0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=En/fIOJd9iN92iXLJmjIrzZn5+PIegf+/0+BYWL60kyau4r/jyhApkKbsZ3ant7bp
 To1DQvx9v1LdItJKPYKJIMZa3+ln36OSSrVlBzEyfgEQ/puHxqjRos4FzNV0+e/0xu
 mXnuMRLijo4oOsxZTvMb9XlfCStD8pvO2bcPzd3bB7hAyfODohRYkzivGrldi5bQfF
 NbAoqsXgT1Vm9GOyuRVg+5ap/+LCkOFoG4Brz9zzGzncjtjOhOR6E9VfEvQ8R0YCLx
 p2Sqkv+hzXS6SRlEVWb1mAl6Aa0ZCMhIuh8oBmo2p0hsD91+xMqCfAO6c7esgHQHwV
 wN18fzh6XxAHg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3384717E1134;
 Fri, 11 Apr 2025 15:01:00 +0200 (CEST)
Date: Fri, 11 Apr 2025 15:00:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <20250411150056.62cb7042@collabora.com>
In-Reply-To: <73a28f35-9576-4089-8976-07cd1aa64432@amd.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
 <20250411103837.753cd92e@collabora.com>
 <9fd6fb8c-7dbb-467d-a759-eec852e1f006@amd.com>
 <20250411140254.042f9862@collabora.com>
 <73a28f35-9576-4089-8976-07cd1aa64432@amd.com>
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

On Fri, 11 Apr 2025 14:45:49 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 11.04.25 um 14:02 schrieb Boris Brezillon:
> >>> I guess this leaves older GPUs that don't support incremental
> >>> rendering in a bad place though.   =20
> >> Well what's the handling there currently? Just crash when you're
> >> OOM? =20
> > It's "alloc(GFP_KERNEL) and crash if it fails or times out", yes. =20
>=20
> Oh, please absolutely don't! Using GFP_KERNEL here is as evil as it
> can be.

I'm not saying that's what we should do, I'm just telling you what's
done at the moment. The whole point of this series is to address some
that mess :P.

>=20
> Background is that you don't get a crash, nor error message, nor
> anything indicating what is happening.

The job times out at some point, but we might get stuck in the fault
handler waiting for memory, which is pretty close to a deadlock, I
suspect.

>=20
> You just get a deadlocked system with the user wondering why the heck
> the system doesn't response any more.

Not sure that's a true deadlock, for the reason explained before (no
shrinker in panthor, and panfrost only reclaims idle BOs, so no waits
on fences there either), but that doesn't make things great either.
