Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D28989AEA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1C210E2D8;
	Mon, 30 Sep 2024 07:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OJcV2AAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432D510E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:02:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D7CE5C4688;
 Mon, 30 Sep 2024 07:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AA9C4CEC7;
 Mon, 30 Sep 2024 07:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727679721;
 bh=6n9L0YXWQusPKz6NECqA/T9C7TGOjPEUN7og8vjWtFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJcV2AAIFfkRyYEqQyuHPopdXmaaiJEDPW42vTQT5ddmhhEL/CsoN1QjOEfkf8v2+
 SC8e34+zHgTkTIs2PwxrpGzwRhn08+AaLKj2MebQ57HuZId2bcgAQA0NwdtLGGYqXx
 b3wApPV6JKqISdN/xRSXn5uWIB8CtmLn+Ov4QZbYAYOgztGt7CLAlVbPCkqO32xd5P
 PA4sGbK4C+3KWu+UxUmsIjAvzXfK3+/p7RQQuD4TS1m+RFwWuXUOOGnPJKl/2yE/cc
 t351w/lGCU+6pYuh9yXKwgTH21L4bs8RIhyGeibTvMvqppLqc0ckgCzafZEuS3FyxV
 OmwmdszOYNT7g==
Date: Mon, 30 Sep 2024 09:01:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sean Paul <seanpaul@chromium.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/atomic_helper: Add missing NULL check for
 drm_plane_helper_funcs.atomic_update
Message-ID: <htfplghwrowt4oihykcj53orgaeudo7a664ysyybint2oib3u5@lcyhfss3nyja>
References: <20240927204616.697467-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6jrx2cqnw65dpsgi"
Content-Disposition: inline
In-Reply-To: <20240927204616.697467-1-lyude@redhat.com>
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


--6jrx2cqnw65dpsgi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 27, 2024 at 04:46:16PM GMT, Lyude Paul wrote:
> Something I discovered while writing rvkms since some versions of the
> driver didn't have a filled out atomic_update function - we mention that
> this callback is "optional", but we don't actually check whether it's NULL
> or not before calling it. As a result, we'll segfault if it's not filled
> in.
>=20
>   rvkms rvkms.0: [drm:drm_atomic_helper_commit_modeset_disables] modeset =
on [ENCODER:36:Virtual-36]
>   BUG: kernel NULL pointer dereference, address: 0000000000000000
>   PGD 0 P4D 0
>   Oops: Oops: 0010 [#1] PREEMPT SMP NOPTI
>   Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS edk2-20240813-=
1.fc40 08/13/2024
>   RIP: 0010:0x0
>=20
> So, let's fix that.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: c2fcd274bce5 ("drm: Add atomic/plane helpers")
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.19+

So we had kind of a similar argument with drm_connector_init early this
year, but I do agree we shouldn't fault if we're missing a callback.

I do wonder how we can implement a plane without atomic_update though?
Do we have drivers in such a case?

If not, a better solution would be to make it mandatory and check it
when registering.

Maxime

--6jrx2cqnw65dpsgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvpM4AAKCRAnX84Zoj2+
dqTlAYD4AtscFOtZMzUGk6+RMPPzgXq4zWG8oSD8cPPWsXpi5gVkTJUYfc7l9Jr4
nyFWgXYBfiLiv68qoFP1mSgHPoh7oI7J9xfP/VZ5hIo8nOfGie/EctK0ARVasiu2
kSU7UayY0Q==
=CpsN
-----END PGP SIGNATURE-----

--6jrx2cqnw65dpsgi--
