Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C622B43D38
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 15:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34E410EA48;
	Thu,  4 Sep 2025 13:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="cCDyB7iH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3990710EA42
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 13:30:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756992619; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AspmHjs0J9N8R8aQtXbHzPdhHkih1Ukc2YC119QihtRgV6gqK3JNRvLNZHNIsZz6VN4o3J5FfHmWo+aoEWjxtGpbo59IhSPIMTmoQ9EriKfiwdyTm3OH6xDF26ltRB0K7Hba7GfWABALez3rCiWXoX+UkNO0ZHBHTbn/eo3HMZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756992619;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Jt9TDRg9vypXcsn/2cLvRfCa62ax4BK86VzMaQ8tCLg=; 
 b=jg8caw3SAd9Dz7SwScv+AAtwLqJLS4uKTcnA8uZBej6HEsgR82d5ykmCKx/zfwhqoiIHXPkEfG9TW9AHGWpsPhZzbx3R3Z3ksc0NxmqijoiyqhP5pIg0s6+zYbeZVESsiMZE9xo8G5OXgWLDlxbGBOXa9cN2SBPWJElCiFzyBB8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756992619; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=Jt9TDRg9vypXcsn/2cLvRfCa62ax4BK86VzMaQ8tCLg=;
 b=cCDyB7iHNwSeEaMsnx/InFLAiSAmoBw9OZeCtsghwiRm51grvh0wiJq51DuS/+lV
 Qbc8gofk8gF6DB2qk6TR/5xbh5wwZIxtQXBEasc5wpxbCgS7Ha45muoLI03fxKAHEyT
 RwsIvcnzgTppWR1l5fWFu7UIWd+CaAbsE0akmK3g=
Received: by mx.zohomail.com with SMTPS id 1756992616735300.35543377674844;
 Thu, 4 Sep 2025 06:30:16 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 07/14] drm/gem/shmem: Extract drm_gem_shmem_init() from
 drm_gem_shmem_create()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-8-lyude@redhat.com>
Date: Thu, 4 Sep 2025 10:29:59 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <891BE2DC-6B2D-409D-970C-F57BA7D86598@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-8-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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

Hi Lyude,

Did something happen here? All the indentation seems off.

It looks ok when applied though.

> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> With gem objects in rust, the most ideal way for us to be able to =
handle
> gem shmem object creation is to be able to handle the memory =
allocation of
> a gem object ourselves - and then have the DRM gem shmem helpers =
initialize
> the object we've allocated afterwards. So, let's spit out
> drm_gem_shmem_init() from drm_gem_shmem_create() to allow for doing =
this.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> drivers/gpu/drm/drm_gem_shmem_helper.c | 75 +++++++++++++++++---------
> include/drm/drm_gem_shmem_helper.h     |  1 +
> 2 files changed, 51 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c =
b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 5d1349c34afd3..b20a7b75c7228 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -48,28 +48,12 @@ static const struct drm_gem_object_funcs =
drm_gem_shmem_funcs =3D {
> .vm_ops =3D &drm_gem_shmem_vm_ops,
> };
>=20
> -static struct drm_gem_shmem_object *
> -__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool =
private,
> -       struct vfsmount *gemfs)
> +static int __drm_gem_shmem_init(struct drm_device *dev, struct =
drm_gem_shmem_object *shmem,
> + size_t size, bool private, struct vfsmount *gemfs)
> {
> - struct drm_gem_shmem_object *shmem;
> - struct drm_gem_object *obj;
> + struct drm_gem_object *obj =3D &shmem->base;
> int ret =3D 0;
>=20
> - size =3D PAGE_ALIGN(size);
> -
> - if (dev->driver->gem_create_object) {
> - obj =3D dev->driver->gem_create_object(dev, size);
> - if (IS_ERR(obj))
> - return ERR_CAST(obj);
> - shmem =3D to_drm_gem_shmem_obj(obj);
> - } else {
> - shmem =3D kzalloc(sizeof(*shmem), GFP_KERNEL);
> - if (!shmem)
> - return ERR_PTR(-ENOMEM);
> - obj =3D &shmem->base;
> - }
> -
> if (!obj->funcs)
> obj->funcs =3D &drm_gem_shmem_funcs;
>=20
> @@ -81,7 +65,7 @@ __drm_gem_shmem_create(struct drm_device *dev, =
size_t size, bool private,
> }
> if (ret) {
> drm_gem_private_object_fini(obj);
> - goto err_free;
> + return ret;
> }
>=20
> ret =3D drm_gem_create_mmap_offset(obj);
> @@ -102,14 +86,55 @@ __drm_gem_shmem_create(struct drm_device *dev, =
size_t size, bool private,
>     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> }
>=20
> - return shmem;
> -
> + return 0;
> err_release:
> drm_gem_object_release(obj);
> -err_free:
> - kfree(obj);
> + return ret;
> +}
>=20
> - return ERR_PTR(ret);
> +/**
> + * drm_gem_shmem_init - Initialize an allocated object.
> + * @dev: DRM device
> + * @obj: The allocated shmem GEM object.
> + *
> + * Returns:
> + * 0 on success, or a negative error code on failure.
> + */
> +int drm_gem_shmem_init(struct drm_device *dev, struct =
drm_gem_shmem_object *shmem, size_t size)
> +{
> + return __drm_gem_shmem_init(dev, shmem, size, false, NULL);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_init);
> +
> +static struct drm_gem_shmem_object *
> +__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool =
private,
> +       struct vfsmount *gemfs)
> +{
> + struct drm_gem_shmem_object *shmem;
> + struct drm_gem_object *obj;
> + int ret =3D 0;
> +
> + size =3D PAGE_ALIGN(size);
> +
> + if (dev->driver->gem_create_object) {
> + obj =3D dev->driver->gem_create_object(dev, size);
> + if (IS_ERR(obj))
> + return ERR_CAST(obj);
> + shmem =3D to_drm_gem_shmem_obj(obj);
> + } else {
> + shmem =3D kzalloc(sizeof(*shmem), GFP_KERNEL);
> + if (!shmem)
> + return ERR_PTR(-ENOMEM);
> + obj =3D &shmem->base;
> + }
> +
> + ret =3D __drm_gem_shmem_init(dev, shmem, size, private, gemfs);
> + if (ret) {
> + kfree(obj);
> + return ERR_PTR(ret);
> + }
> +
> + return shmem;
> }
> /**
>  * drm_gem_shmem_create - Allocate an object with the given size
> diff --git a/include/drm/drm_gem_shmem_helper.h =
b/include/drm/drm_gem_shmem_helper.h
> index 92f5db84b9c22..235dc33127b9a 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -107,6 +107,7 @@ struct drm_gem_shmem_object {
> #define to_drm_gem_shmem_obj(obj) \
> container_of(obj, struct drm_gem_shmem_object, base)
>=20
> +int drm_gem_shmem_init(struct drm_device *dev, struct =
drm_gem_shmem_object *shmem, size_t size);
> struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device =
*dev, size_t size);
> struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct =
drm_device *dev,
>   size_t size,
> --=20
> 2.50.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

