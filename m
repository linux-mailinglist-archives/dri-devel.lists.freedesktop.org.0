Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C8CA880BB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 14:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DD510E59F;
	Mon, 14 Apr 2025 12:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="E4IyG+u1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33B010E59F;
 Mon, 14 Apr 2025 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744634839;
 bh=FtuV1I9r5ORmAmIQzvU3eugKHXmZmLnbHyVdBpBMaKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E4IyG+u19u+fMeXNLo6eMBgOc8GdIBPF9XgZBnGRjzuiLGfwjBaeE4Dr7bqX/+A4h
 NEPD+25IwElUZDbrnakYKfk5YbxdX+27OlVt4QcIrOTW7mctElBkWRc3AqzMaPUWYf
 WNZp59AHBw7YBfTW3X0LocommSpPVmlN9NQfA7lPzsy+gZKHi96vrfaeRBo8Ovjbus
 0UGKV5BwbPnGmBBa0251LfdP8xmkEJKTjFRBF8XGqmpau8EUYK+PCpNLm7p6exKVDL
 XJ7t7s8Db4CdzTWbM/phZtHS28H1vKFDDK+0KWnqGnmOyKB8Lcb8cbKr58cwJwdoWb
 sfInK6pxRMD6Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CD9F17E0FD5;
 Mon, 14 Apr 2025 14:47:18 +0200 (CEST)
Date: Mon, 14 Apr 2025 14:47:14 +0200
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
Message-ID: <20250414144714.6372738b@collabora.com>
In-Reply-To: <20250411163902.1d0db9da@collabora.com>
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
 <20250411150056.62cb7042@collabora.com>
 <c15cef68-bab5-4e09-89ae-52266ab1e4dd@amd.com>
 <20250411163902.1d0db9da@collabora.com>
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

On Fri, 11 Apr 2025 16:39:02 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 11 Apr 2025 15:13:26 +0200
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>=20
> > >   =20
> > >> Background is that you don't get a crash, nor error message, nor
> > >> anything indicating what is happening.   =20
> > > The job times out at some point, but we might get stuck in the fault
> > > handler waiting for memory, which is pretty close to a deadlock, I
> > > suspect.   =20
> >=20
> > I don't know those drivers that well, but at least for amdgpu the
> > problem would be that the timeout handling would need to grab some of
> > the locks the memory management is holding waiting for the timeout
> > handling to do something....
> >=20
> > So that basically perfectly closes the circle. With a bit of lock you
> > get a message after some time that the kernel is stuck, but since
> > that are all sleeping locks I strongly doubt so.
> >=20
> > As immediately action please provide patches which changes those
> > GFP_KERNEL into GFP_NOWAIT. =20
>=20
> Sure, I can do that.

Hm, I might have been too prompt at claiming this was doable. In
practice, doing that might regress Lima and Panfrost in situations
where trying harder than GFP_NOWAIT would free up some memory. Not
saying this was right to use GFP_KERNEL in the first place, but some
expectations were set by this original mistake, so I'll probably need
Lima developers to vouch in for this change after they've done some
testing on a system under high memory pressure, and I'd need to do the
same kind of testing for Panfrost and ask Steve if he's okay with that
too.

For Panthor, I'm less worried, because we have the incremental rendering
fallback, and assuming GFP_NOWAIT tries hard enough to reclaim
low-hanging fruits, the perfs shouldn't suffer much more than they
would today with GFP_KERNEL allocations potentially delaying tiling
operations longer than would have been with a primitive flush.
