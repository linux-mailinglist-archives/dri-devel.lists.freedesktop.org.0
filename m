Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B86B3B999
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 13:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD8D10EB7F;
	Fri, 29 Aug 2025 11:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ssyolx5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA5510EB7F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 11:03:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C2D160054;
 Fri, 29 Aug 2025 11:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E946C4CEF4;
 Fri, 29 Aug 2025 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756465419;
 bh=f9YyhOAnfw9Q+1HExjzGooFyxpYu9F/flh2lrEu8qlA=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Ssyolx5M55qdacaeElkzcLLK2r88SoCCU8A9Q+FzEXsj35F1DyiNmv0fY9uuMRbF1
 M1O/rXnWP4vHC5+0quMQyzVty2nrrZAVtfRwCRhnRyMglCQEv9qhjk5ivMrMbioAuD
 tncxTYSt9OZWzsA/+u0SPvbcu/NFsqpPya2XZ0iWbdWIhRU0JhFQBDblLtzYzRML+r
 7wa1dBsUCO1zGZsFlwoq8kmjpK591r2VxBvJBq8brXVY9ES41UZjSKz6O/YYbYi2oM
 0S9+3B7uJ7kEXn+rycqozVEPkFxTeZBK9Uob+guEPHl8tKQVD98Bt8+4aGIAkPzBYg
 qKPu4dz1yXXTQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 13:03:35 +0200
Message-Id: <DCEV0WH99TA7.2O5C0STM3MQCS@kernel.org>
Subject: Re: [PATCH] drm/test: drm_exec: use kzalloc() to allocate GEM objects
Cc: <dri-devel@lists.freedesktop.org>, "Alice Ryhl" <aliceryhl@google.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250829075633.2306-1-dakr@kernel.org>
In-Reply-To: <20250829075633.2306-1-dakr@kernel.org>
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

On Fri Aug 29, 2025 at 9:55 AM CEST, Danilo Krummrich wrote:
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/test=
s/drm_exec_test.c
> index d6c4dd1194a0..d59ec3baae1d 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -150,14 +150,22 @@ static void test_prepare(struct kunit *test)
>  static void test_prepare_array(struct kunit *test)
>  {
>  	struct drm_exec_priv *priv =3D test->priv;
> -	struct drm_gem_object gobj1 =3D { };
> -	struct drm_gem_object gobj2 =3D { };
> -	struct drm_gem_object *array[] =3D { &gobj1, &gobj2 };
> +	struct drm_gem_object *gobj1;
> +	struct drm_gem_object *gobj2;
> +	struct drm_gem_object *array[] =3D {
> +		(gobj1 =3D kzalloc(sizeof(*gobj1), GFP_KERNEL)),
> +		(gobj2 =3D kzalloc(sizeof(*gobj2), GFP_KERNEL)),
> +	};

Actually, I think this should use kunit_kzmalloc() instead. Unless anyone
disagrees, I'd apply the following hunk when applying the patch.

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/=
drm_exec_test.c
index d59ec3baae1d..3a20c788c51f 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -153,15 +153,15 @@ static void test_prepare_array(struct kunit *test)
        struct drm_gem_object *gobj1;
        struct drm_gem_object *gobj2;
        struct drm_gem_object *array[] =3D {
-               (gobj1 =3D kzalloc(sizeof(*gobj1), GFP_KERNEL)),
-               (gobj2 =3D kzalloc(sizeof(*gobj2), GFP_KERNEL)),
+               (gobj1 =3D kunit_kzalloc(test, sizeof(*gobj1), GFP_KERNEL))=
,
+               (gobj2 =3D kunit_kzalloc(test, sizeof(*gobj2), GFP_KERNEL))=
,
        };
        struct drm_exec exec;
        int ret;

        if (!gobj1 || !gobj2) {
                KUNIT_FAIL(test, "Failed to allocate GEM objects.\n");
-               goto out;
+               return;
        }

        drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
@@ -176,10 +176,6 @@ static void test_prepare_array(struct kunit *test)

        drm_gem_private_object_fini(gobj1);
        drm_gem_private_object_fini(gobj2);
-
-out:
-       kfree(gobj1);
-       kfree(gobj2);
 }

 static void test_multiple_loops(struct kunit *test)
