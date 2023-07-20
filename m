Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213775ABA7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7934310E5A7;
	Thu, 20 Jul 2023 10:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6005810E592
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:07:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2A8861943;
 Thu, 20 Jul 2023 10:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEE0C433C8;
 Thu, 20 Jul 2023 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689847659;
 bh=FfhZgQ+pQ/UDSPLyRjHsPzAtbC9LrIGVDPMAddOMUQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TtgG3RzrHCE4UsgIX10QOxdl4FsX3G8YGwzAMuZLNXLo5WRw80ZhzWl5cIeBLYZPx
 lVwaRLJQQO+AGnPhGUSRr8lHhMjRyFCVERmb20DfVgoFTfWMpnXElOJuRYPkUlXGJ5
 MV6TRixTPKIkfZJT+krnEQxw11O+Mxd6X/qlT/MdatEtDkclPddOVfURhOlErtXMcp
 NKyJJ21cKHiJqq63zOmxVU0O6/UX+eYsOOHH+D1ix3hdWiwhQ0TuBPF6ly3lqw/98H
 ioMd4bi90X0xuV+wZREAR1jzeUHefRIUii/WirAhnHTK6UZ9wcwTuxTOtp4xt2BCBo
 kxr3LeFs9T6zw==
Date: Thu, 20 Jul 2023 12:07:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [05/11] drm/tests: helpers: Create an helper to allocate a
 locking ctx
Message-ID: <5khgq6xy4ztci45qtxzo7fyvmdj3i6rrnl5yuny3gusgeeumdq@eobkes722rky>
References: <20230710-kms-kunit-actions-rework-v1-5-722c58d72c72@kernel.org>
 <970f4a65-25dc-1805-3776-6447a61f77c5@loongson.cn>
 <87o7k7hg1d.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p3xg2ps427f43xcp"
Content-Disposition: inline
In-Reply-To: <87o7k7hg1d.fsf@minerva.mail-host-address-is-not-set>
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
Cc: suijingfeng <suijingfeng@loongson.cn>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--p3xg2ps427f43xcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 09:12:14PM +0200, Javier Martinez Canillas wrote:
> suijingfeng <suijingfeng@loongson.cn> writes:
>=20
> > Hi,
> >
> > On 2023/7/10 15:47, Maxime Ripard wrote:
>=20
> [...]
>=20
> >> +
> >> +/**
> >> + * drm_kunit_helper_context_alloc - Allocates an acquire context
> >> + * @test: The test context object
> >> + *
> >> + * Allocates and initializes a modeset acquire context.
> >> + *
> >> + * The context is tied to the kunit test context, so we must not call
> >> + * drm_modeset_acquire_fini() on it, it will be done so automatically.
> >> + *
> >> + * Returns:
> >> + * An ERR_PTR on error, a pointer to the newly allocated context othe=
rwise
> >> + */
> >> +struct drm_modeset_acquire_ctx *
> >> +drm_kunit_helper_acquire_ctx_alloc(struct kunit *test)
> >> +{
> >> +	struct drm_modeset_acquire_ctx *ctx;
> >> +	int ret;
> >> +
> >> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> >> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> >> +
> >> +	drm_modeset_acquire_init(ctx, 0);
> >> +
> >> +	ret =3D kunit_add_action_or_reset(test,
> >> +					action_drm_release_context,
> >> +					ctx);
> >> +	if (ret)
> >> +		return ERR_PTR(ret);
> >> +
> >> +	return ctx;
> >> +}
> >> +EXPORT_SYMBOL_GPL(drm_kunit_helper_acquire_ctx_alloc);
> >> +
> >
> > I think all of the patch inside this series are quite well.
> >
> > Personally, I can't find problems in it.
> >
> >
> > But I still want to ask a question:
> >
> > Should the managed functions you introduced be prefixed with drmm_=20
> > (instead of drm_) ?
> >
>=20
> That's a good question. But personally I think that the drmm_ prefix
> should be reserved for drm_device managed resources and helpers.

Yeah, to me drmm functions are meant for resources that are tied to the
DRM device lifetime. These resources are tied to the test lifetime, so
they shouldn't share the same prefix.

> > As mindless programmer may still want to call drm_modeset_acquire_fini(=
)=20
> > on the pointer returned by
> >
> > drm_kunit_helper_acquire_ctx_alloc()?
> >
>=20
> The function kernel-doc already mentions that there's no need to do that
> and that will be done automatically by kunit. So shouldn't be different of
> other functions helper where the programmer didn't read the documentation.

Right

Maxime

--p3xg2ps427f43xcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLkHaAAKCRDj7w1vZxhR
xToyAP4hkRI/8aKpOKams5XwxbGYROu5Qb2VT8DyZViYoQZlhAEAky8Oe4eJS3dM
4NDsW3WmKERxiFbfmvNxib5fvgiE9AU=
=7/bm
-----END PGP SIGNATURE-----

--p3xg2ps427f43xcp--
