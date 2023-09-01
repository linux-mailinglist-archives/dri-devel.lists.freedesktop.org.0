Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8578FA03
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 10:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A2B10E74C;
	Fri,  1 Sep 2023 08:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 592 seconds by postgrey-1.36 at gabe;
 Fri, 01 Sep 2023 08:35:02 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE10B10E748
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 08:35:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8EDCCCE22C5;
 Fri,  1 Sep 2023 08:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81289C433C9;
 Fri,  1 Sep 2023 08:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693556704;
 bh=Ia2YKPpb8VGizArtf2/JksHQM98ix2QTPhtXfsg80Co=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=caGGvcqelZ3VTnyY9z2yJ3CzHd/XH2fxxlIn3275iN1nQT1xgnwuSg7KfsXUeMuCr
 9NK8/E3ER268LCX/kp0j5OyE4s6vLCAhpTuxwNoAu7g1BDlpJabZftkrCXG5KKbr0k
 ol3Zz7hyjLil4qeeZyz6zEt+PSe0d/l1oIeS1g7agRQ+jbYlfdLnOz38LmIYsMR8Fn
 5coemk6qRWErF1vpgkUIGutxSJpGDECUudsKlSl6/BtK+Qnbsm8uNn/IQjifU/9G71
 W4wjf+rNtMeQL9sv5XGqu0DrejL0mOKJL6gqsvvbnrwJ3Q0K69U2/Uk3a40up29oaH
 Ol+XEshSYuHIA==
Date: Fri, 1 Sep 2023 10:25:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
Message-ID: <5dj43wxsszikpwbwzxx5v5h7jbx4vjjavnhzi26xgfcdp5wsws@t2hd3pawau4t>
References: <20230830062546.720679-1-javierm@redhat.com>
 <6654778d-1f40-1775-c32c-ebf9728bc9a9@suse.de>
 <87ledqbah2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qhw5hxui7uborewx"
Content-Disposition: inline
In-Reply-To: <87ledqbah2.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qhw5hxui7uborewx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 09:48:09AM +0200, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>=20
> > Hi Javier,
> >
> > another idea about this patch: why not just keep the allocation in the=
=20
> > plane's atomic check, but store the temporary buffers in a plane struct=
=2E=20
> > You'd only grow the arrays length in atomic_check and later fetch the=
=20
> > pointers in atomic_update. It needs some locking, but nothing complicat=
ed.
> >
>=20
> Yes, that would work too. Another option is to just move the buffers to
> struct ssd130x_device as it was before commit 45b58669e532 ("drm/ssd130x:
> Allocate buffer in the plane's .atomic_check() callback") but just make
> them fixed arrays with the size of the biggest format.
>=20
> That will be some memory wasted but will prevent the problem of trying to
> allocate buffers after drm_atomic_helper_swap_state() has been called.

If we want to go that road, we don't even need an extra allocation, it
can be part of the state or object structure itself.

Maxime

--qhw5hxui7uborewx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPGf3gAKCRDj7w1vZxhR
xbKvAQCMJzdResZ3bEsMgrE2V/6WGCsjUuFwfnYt7jg9AHOhYgD+Ku7NT7+Twn6Z
4/7EztFhnNPN1pkQHVmljeupKsxrXQg=
=4h8D
-----END PGP SIGNATURE-----

--qhw5hxui7uborewx--
