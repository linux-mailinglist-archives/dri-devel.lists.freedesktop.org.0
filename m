Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D7FAA8D08
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 09:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9E10E28B;
	Mon,  5 May 2025 07:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MmWbvLdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9AD10E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 07:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1746430194;
 bh=uqAzRrNSam0VlsKE9vorYxsmGw5PUh3RsPStunbGhMA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MmWbvLdftaraoFpRW3vnGbLBHRZ/B1D6cEWlZ7zRUV55vjWM+7CVOKlfFdeLJPzOb
 2WJNCN0JffwgL/VkGfTwkPEd7N6sYmbjyuziDSuFF06+LAEknV0c8HVfLIan7ANxOz
 5oy3KtB2vMap76cunv9smFK5IDnSVclhX0VI9kT1i7SwEC77fHCXP+fG4uPemEAzw9
 ujaqRw9n5yr0CsZY3TLtkhMbKyCIPbcsGVCJONvSjmnULIO2bcLnX79Lj3duT4tk8p
 v9/ckNr3AddNKjeaKbs0F7ElE0IpWlcqT5He57OsPxEEUy6Dy/WWIdabvhGlnxml/Q
 9jidHaMb9MIgw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FF6217E0858;
 Mon,  5 May 2025 09:29:54 +0200 (CEST)
Date: Mon, 5 May 2025 09:29:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 christian.koenig@amd.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org, Sumit
 Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <20250505092949.1124657d@collabora.com>
In-Reply-To: <aBHoRTdsdOLFhzfg@phenom.ffwll.local>
References: <20250416065820.26076-1-tzimmermann@suse.de>
 <Z_96e7Lv-sEDUS6U@phenom.ffwll.local>
 <aBHoRTdsdOLFhzfg@phenom.ffwll.local>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Wed, 30 Apr 2025 11:07:17 +0200
Simona Vetter <simona.vetter@ffwll.ch> wrote:

> On Wed, Apr 16, 2025 at 11:38:03AM +0200, Simona Vetter wrote:
> > On Wed, Apr 16, 2025 at 08:57:45AM +0200, Thomas Zimmermann wrote: =20
> > > Test struct drm_gem_object.import_attach to detect imported objects.
> > >=20
> > > During object clenanup, the dma_buf field might be NULL. Testing it in
> > > an object's free callback then incorrectly does a cleanup as for nati=
ve
> > > objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
> > > clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
> > >=20
> > > v3:
> > > - only test for import_attach (Boris)
> > > v2:
> > > - use import_attach.dmabuf instead of dma_buf (Christian)
> > >=20
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with hel=
per")
> > > Reported-by: Andy Yan <andyshrk@163.com>
> > > Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.C=
oremail.andyshrk@163.com/
> > > Tested-by: Andy Yan <andyshrk@163.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Anusha Srivatsa <asrivats@redhat.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linaro-mm-sig@lists.linaro.org =20
> >=20
> > Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch> =20
>=20
> Also quick doc request: We do have a bit of overview documentation for
> prime here about specifically this lifetime fun, and why there's a chain
> of references and hence a distinction between imported foreign dma-buf and
> re-imported native dma-buf:
>=20
> https://dri.freedesktop.org/docs/drm/gpu/drm-mm.html#reference-counting-f=
or-gem-drivers
>=20
> I think it would be good to augment this with more links to functions
> (like this one recently added and fixed in this patch here) and struct
> members to that overview. And maybe also link from key function and struct
> functions back to that overview doc. Otherwise I think the next person
> will get confused by this rather tricky code again and break a corner
> cases.

BTW, could we also backmerge 6.15-rc5 into drm-misc-next so the fix is
also present in drm-misc-next?
