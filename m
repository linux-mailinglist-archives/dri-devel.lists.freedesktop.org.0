Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76449A05B2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC9910E6E5;
	Wed, 16 Oct 2024 09:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vHLTpi7/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD8310E6E5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:37:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E27B5C60A1;
 Wed, 16 Oct 2024 09:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E037EC4CEC5;
 Wed, 16 Oct 2024 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729071472;
 bh=zPD6Ui1SHbuo/4X7RwqPvCQ1+gwV5DjidlggjRj2t/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vHLTpi7/itiwYN6DznG9MMg6Wtx3CGbD5hAcjfzgRkDriiEOjIqtqK3xWxVIjPFtW
 GKgRrdbD5Fua0IR5wAaM/DzGtIbSoRom1PV1lx5RanG9BhxqTwrEIN42mBbwPZOhqK
 2eAjQ3eFIta0wJfxmEGT15T4GEQtZ5dloT4gHpuohgMZJWiWAQ1z4uc+tjKEVWXwt6
 rxl+f9cZyf+84RGZSewvbiNY8OXTF8y4k8o+ziP/jjxP9byc+dJq6lNOV9eQuXjXru
 uZA5xXMVqOAM4CgpT4N/gIJ7pE8TLizysCadvWv4UbZznfiWRBSNcbpUg8OBKqXS/1
 B7aXzC1U8ffIA==
Date: Wed, 16 Oct 2024 11:37:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, christian.koenig@amd.com, ray.huang@amd.com,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com, mcanal@igalia.com,
 quic_jjohnson@quicinc.com, skhan@linuxfoundation.org, davidgow@google.com, 
 karolina.stolarek@intel.com, Arunpravin.PaneerSelvam@amd.com, 
 thomas.hellstrom@linux.intel.com, asomalap@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/tests: hdmi: Fix memory leaks in
 drm_display_mode_from_cea_vic()
Message-ID: <20241016-glistening-stalwart-horse-7e5b20@houat>
References: <20241014125204.1294934-1-ruanjinjie@huawei.com>
 <20241014125204.1294934-5-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wctwvgw3f3mboxd2"
Content-Disposition: inline
In-Reply-To: <20241014125204.1294934-5-ruanjinjie@huawei.com>
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


--wctwvgw3f3mboxd2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 08:52:04PM GMT, Jinjie Ruan wrote:
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
> Free `mode` by using drm_kunit_helper_display_mode_from_cea_vic()
> to fix it.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 4af70f19e559 ("drm/tests: Add RGB Quantization tests")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--wctwvgw3f3mboxd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZw+JbQAKCRAnX84Zoj2+
dpkbAX42fNMPJ/pE23rAeWQfIf8QtfGVOmhVhvTD5lAwlxq1YW0D+1R6Npl3DttQ
aM9SX2UBf2hXXeli1f7jcyqZmCdBG6i2ieJ7gTr8LdkuR5oZQu/E61iIY+SMTTyz
+PKp3NT8Cw==
=3BGI
-----END PGP SIGNATURE-----

--wctwvgw3f3mboxd2--
