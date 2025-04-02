Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B5A78F99
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E3E10E7A5;
	Wed,  2 Apr 2025 13:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Y5MAYP2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4D610E7A5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743600067;
 bh=9sr+NddIGa5PMOQr3Z2ERC47oRBn6mBFjzbWH7raRmg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y5MAYP2/VcL4GfEFkLLMiPQvcSfTTplcdvGR06cRed6GVAatmHXSXaPyHEQfldaUG
 J6wbt8c87zWbnCOshOR/C3xgRTtpxijmi05kLPxsTYgVKTR1tBFtWvQncGgnxb1ydQ
 MxCa9KgI4EmIJurjPOfaWR+duYL96zMSSWGjYKhb2OpHk8B6454fiB8QXPqOukhVTD
 /UQ7LaZkWD9KWOPi+IE/fs6A9AAypcuX9JdNU79WxK1mzPc163WYeBlRDhThnOozLg
 gdjdu2hVYbRVd4gakxeToNbeszoK5JS82jaRwR4KNmYWtmMXdfRtx1UhRiltFFZOyB
 bBsAVPdV41OFg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 16F2917E0B0B;
 Wed,  2 Apr 2025 15:21:07 +0200 (CEST)
Date: Wed, 2 Apr 2025 15:21:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>, Steven Price
 <steven.price@arm.com>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v20 09/10] drm/shmem-helper: Switch
 drm_gem_shmem_vmap/vunmap to use pin/unpin
Message-ID: <20250402152102.01d9cfee@collabora.com>
In-Reply-To: <710cdbd4-2c6e-48b7-b12b-972ab6d12abf@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-10-dmitry.osipenko@collabora.com>
 <ea4f4059-7748-4bfd-9205-8e95222144da@suse.de>
 <710cdbd4-2c6e-48b7-b12b-972ab6d12abf@collabora.com>
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

On Wed, 2 Apr 2025 15:58:55 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 4/2/25 15:47, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 22.03.25 um 22:26 schrieb Dmitry Osipenko: =20
> >> The vmapped pages shall be pinned in memory and previously get/
> >> put_pages()
> >> were implicitly hard-pinning/unpinning the pages. This will no longer =
be
> >> the case with addition of memory shrinker because pages_use_count > 0
> >> won't
> >> determine anymore whether pages are hard-pinned (they will be soft-
> >> pinned),
> >> while the new pages_pin_count will do the hard-pinning. Switch the
> >> vmap/vunmap() to use pin/unpin() functions in a preparation of addition
> >> of the memory shrinker support to drm-shmem. =20
> >=20
> > I've meanwhile rediscovered this patch and I'm sure this is not correct.
> > Vmap should not pin AFAIK. It is possible to vmap if the buffer has been
> > pinned, but that's not automatic.=C2=A0 For other vmaps it is necessary=
 to
> > hold the reservation lock to prevent the buffer from moving.

Hm, is this problematic though? If you want to vmap() inside a section
that's protected by the resv lock, you can

- drm_gem_shmem_vmap_locked()
- do whatever you need to do with the vaddr,
- drm_gem_shmem_vunmap_locked()

and the {pin,page_use}_count will be back to their original values.
Those are just ref counters, and I doubt the overhead of
incrementing/decrementing them makes a difference compared to the heavy
page-allocation/vmap operations...
