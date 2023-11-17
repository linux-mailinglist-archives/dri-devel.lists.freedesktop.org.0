Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32157EEEC7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 10:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D17E10E2EE;
	Fri, 17 Nov 2023 09:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3488210E2EE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 09:34:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1C32561CB2;
 Fri, 17 Nov 2023 09:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728CAC433C8;
 Fri, 17 Nov 2023 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700213685;
 bh=eBENRcN04XFObXCwkZuspBbWllYJKOoKRyOlrq+5Ul4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SZIZVjFq7Vhi6Zm33vPxtiOWCg2yw4aNXfAl0ugk4hesPOgIe3ijgqA6jnlh5zCm4
 4il3hkmay6p+G3+V98299doX3fX1qF4Xw9XzKF5CjRayrBvigjS7N2Gup8//NBule0
 YkyK7eGqhnYNsdJcvushkc0JVP8ZTIFuoNwi3ezCwq1urKqnVc5GD/pA/rn6+OrDBe
 FuF9gvVhcMRyv4IA5uSGwVMW3ekXjbcVoZ9gfDjT/9cQonhc0+8Dv7Jq1MDjAS8JNk
 /xdctyQW98WyRFi1zrcEKYq9o/f2dal73qnFpLMAJmUZzVJtZmi6RDBQRuQVVxUg5l
 W4lvSKk+BI2Ag==
Date: Fri, 17 Nov 2023 10:34:42 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 0/7] drm: Reuse temporary memory for format conversion
Message-ID: <skb2mpjs5hawsl4daczcunfplds65uj762vdpcvp3lurrldxdb@e65uaawi2kpu>
References: <20231009141018.11291-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q46pdj3l53ku3l5x"
Content-Disposition: inline
In-Reply-To: <20231009141018.11291-1-tzimmermann@suse.de>
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
Cc: jfalempe@redhat.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, noralf@tronnes.org, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q46pdj3l53ku3l5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 04:06:29PM +0200, Thomas Zimmermann wrote:
> DRM's format-conversion helpers require temporary memory. Pass the
> buffer from the caller to allow the caller to preallocate the buffer
> memory.
>=20
> The motivation for this patchset is the recent work on a DRM panic
> handler. [1] The panic handler requires format conversion to display an
> error to the screen. But allocating memory during a kernel panic is
> fragile. The changes in this patchset enable the DRM panic handler to
> preallocate buffer storage before the panic occurs.
>=20
> Patch 1 adds struct drm_format_conv_state, a simple interface to pass
> around the buffer storage. Patch 2 adds an instance of the struct to
> the shadow-plane state. Patch 3 moves the buffer's memory management
> from the format helpers into their callers within the DRM drivers. Most
> of the affected drivers use the state instance stored in their shadow-
> plane state. The shadow-plane code releases the buffer memory automatical=
ly.
>=20
> Patches 4 to 7 update three drivers to pre-allocate the format-conversion
> buffer in their plane's atomic_check function. The drivers thus detect OOM
> errors before the display update begins.
>=20
> Tested with simpledrm.

So, I just discovered that you merged that series.

You've complained before about "sneaking patches in", and while I was
disagreeing with you then, this particular instance is definitely a
strong case for it. You've merged it without telling anyone, and despite
our ongoing conversation on the v4 that was active more recently than
the v5. And that you never responded to.

Awesome.

Maxime

--q46pdj3l53ku3l5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVczsgAKCRDj7w1vZxhR
xd0uAP97ARd4GrcByKrGedFG3EXP+0MrdQSLO3S/Elt1L95jLwD/e0HhOGtIzBTG
KJ3yb8X3MwT1cVHI9oRLHwCEnvEGqQU=
=rFH+
-----END PGP SIGNATURE-----

--q46pdj3l53ku3l5x--
