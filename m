Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A1E99C4FD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B928310E3DD;
	Mon, 14 Oct 2024 09:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rfd/Ssfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530ED10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:12:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6778C5C59A1;
 Mon, 14 Oct 2024 09:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6E1C4CEC7;
 Mon, 14 Oct 2024 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728897147;
 bh=nkSs4ZYs/RlbtRbJnQoFHtVRNGXONx0cS2oxXr+jVCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rfd/SsfmGkAexMnnEPRK+L3kmVtDUCJHdJ+BQr85NZJpTX7yfGWHL5+1+fhg2DvLy
 otCaWW0vDpC7sGSe9l/s+bJ004jYBPfeM3zs9IfOdHJxqnjd7TAeoWAs6Pttl5yv/B
 EIr+xXZTgo1zS62sHDTRTRLBH4erMSYCWoebhLMZyrISDLiAtcjZht3Fs1Nl6peRBP
 /IFMzB+tNMvrvrT96ZrA+Mwew+37pNzsvEn9aI9bBAwCRNhq9vnEhOetDicxiXOdCD
 DtObrIIUh1G1h/HXx1zO/rGN/xo2Ca8ZyIk7awij8CL3ink2KPNi+UmUIqVd+ColYC
 gjdw1FlqkLKrQ==
Date: Mon, 14 Oct 2024 11:12:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, christian.koenig@amd.com, ray.huang@amd.com,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com, mcanal@igalia.com,
 quic_jjohnson@quicinc.com, karolina.stolarek@intel.com,
 Arunpravin.PaneerSelvam@amd.com, 
 thomas.hellstrom@linux.intel.com, asomalap@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/tests: hdmi: Fix memory leaks in
 drm_display_mode_from_cea_vic()
Message-ID: <20241014-translucent-shrew-of-pluck-82abd5@houat>
References: <20241014071632.989108-1-ruanjinjie@huawei.com>
 <20241014071632.989108-4-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zpuwtj3jjpvxw4oq"
Content-Disposition: inline
In-Reply-To: <20241014071632.989108-4-ruanjinjie@huawei.com>
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


--zpuwtj3jjpvxw4oq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 03:16:32PM GMT, Jinjie Ruan wrote:
> modprobe drm_hdmi_state_helper_test and then rmmod it, the following
> memory leak occurs.
>=20
> The `mode` allocated in drm_mode_duplicate() called by
> drm_display_mode_from_cea_vic() is not freed, which cause the memory leak:
>=20
> 	unreferenced object 0xffffff80ccd18100 (size 128):
> 	  comm "kunit_try_catch", pid 1851, jiffies 4295059695
> 	  hex dump (first 32 bytes):
> 	    57 62 00 00 80 02 90 02 f0 02 20 03 00 00 e0 01  Wb........ .....
> 	    ea 01 ec 01 0d 02 00 00 0a 00 00 00 00 00 00 00  ................
> 	  backtrace (crc c2f1aa95):
> 	    [<000000000f10b11b>] kmemleak_alloc+0x34/0x40
> 	    [<000000001cd4cf73>] __kmalloc_cache_noprof+0x26c/0x2f4
> 	    [<00000000f1f3cffa>] drm_mode_duplicate+0x44/0x19c
> 	    [<000000008cbeef13>] drm_display_mode_from_cea_vic+0x88/0x98
> 	    [<0000000019daaacf>] 0xffffffedc11ae69c
> 	    [<000000000aad0f85>] kunit_try_run_case+0x13c/0x3ac
> 	    [<00000000a9210bac>] kunit_generic_run_threadfn_adapter+0x80/0xec
> 	    [<000000000a0b2e9e>] kthread+0x2e8/0x374
> 	    [<00000000bd668858>] ret_from_fork+0x10/0x20
> 	......
>=20
> Free `mode` by calling drm_mode_destroy() to fix it.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 4af70f19e559 ("drm/tests: Add RGB Quantization tests")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 34ee95d41f29..70b91e8c8219 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -466,6 +466,8 @@ static void drm_test_check_broadcast_rgb_auto_cea_mod=
e_vic_1(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> =20
>  	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_limited_range);
> +
> +	drm_mode_destroy(drm, mode);
>  }

Same comment than on patch 1

Maxime

--zpuwtj3jjpvxw4oq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZwzgeAAKCRAnX84Zoj2+
dthhAX95EFCmz4YfB2uFG4r5vFoH+Pw2zFz5wObKVxWkg/ycJBQMzJR1vCCvdTUR
3EruXsoBgN7TtI4aZzl8FSO7hu3Ie1RKiYtx98hknQoGMTSbre5R6j1GcYnduNkC
uKJAHkRnuA==
=v3d6
-----END PGP SIGNATURE-----

--zpuwtj3jjpvxw4oq--
