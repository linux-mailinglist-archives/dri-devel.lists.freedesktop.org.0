Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2FEA71A46
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA86810E6F5;
	Wed, 26 Mar 2025 15:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MaP+Kg4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F1B10E6F5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:30:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 85796A41399;
 Wed, 26 Mar 2025 15:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C5AC4CEE2;
 Wed, 26 Mar 2025 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743003015;
 bh=TeB6D6AmiWYlcJujHXlvdqSxpcIN79E+17sC10w3lzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MaP+Kg4Jm+Lbs9xo6HPLVa7Uafk/BUH8+5nA0H2RfrBZTevyA8tQf6PK84q0vmJk9
 n5R2AHp9Wy36yl6cbZrdb8XsjMoxS7aMnDHOb4MRO67roMi1nlACTgmqH+AcBF/UQd
 ps/9WvuDWwUOxNE1xTW8ILz+rGAsRhzBslP8ENVP1wI8Uri9pasbW+iL1jrVoJ64jg
 ymVy2S1cJO39B3lDFG7ypfRZNt+xf8G8x02YpFzrXFKCvdg3yXyvcWHK6g2sytoJG2
 yFh/AffrH1SZALBkErcWMxJ85uh/JrZEKBxuZFgu+4nm6Oq7ZO6J1D21XcsbuM8nTw
 DTF4OLcfw3fCg==
Date: Wed, 26 Mar 2025 16:30:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/panel: Add refcount support
Message-ID: <20250326-crazy-brilliant-lyrebird-4658a0@houat>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-2-4e2bf5d19c5d@redhat.com>
 <20250326102304.49510630@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="im2pz5whtdrkkr4p"
Content-Disposition: inline
In-Reply-To: <20250326102304.49510630@booty>
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


--im2pz5whtdrkkr4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] drm/panel: Add refcount support
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 10:23:04AM +0100, Luca Ceresoli wrote:
> On Tue, 25 Mar 2025 13:24:09 -0400
> Anusha Srivatsa <asrivats@redhat.com> wrote:
>=20
> > Allocate panel via reference counting.
> > Add _get() and _put() helper functions
> > to ensure panel allocations are refcounted.
> > Avoid use after free by ensuring panel is
> > valid and can be usable till the last reference
> > is put. This avoids use-after-free
>=20
> "panel is valid and can be usable" is not totally correct. When there
> are still references held, you ensure the panel struct is still
> _allocated_, not necessarily valid and usable.

I guess "panel pointer is valid" is a better wording indeed.

> > +/**
> > + * drm_panel_put - Release a panel reference
> > + * @panel: DRM panel
> > + *
> > + * This function decrements the panel's reference count and frees the
> > + * object if the reference count drops to zero.
> > + */
> > +struct drm_panel *drm_panel_put(struct drm_panel *panel)
> > +{
> > +	if (!panel)
> > +		return panel;
> > +
> > +	kref_put(&panel->refcount, __drm_panel_free);
> > +
> > +	return panel;
>=20
> While this is using the same structure as my bridge work, I now realize
> the _put() should probably not return the panel (or bridge) pointer, it
> should just be a void function. The reason is the pointer might have
> been freed when _put() returns (depending on the refcount) so that
> pointer value might be dangling and whoever calls _put() must not use
> that pointer anymore.
>=20
> Other get/put APIs do this, e.g. of_node_get/put().
>=20
> So I'm going to change drm_bridge_put() to return void, unless there
> are good reasons to keep it and that I'm missing.

Oh, right, definitely.

Maxime

--im2pz5whtdrkkr4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+QdhAAKCRDj7w1vZxhR
xac3AP4v6vCSJmHzeBPGjiw3ELrWvb4fWG8OFdEqXe3xei+ynwEA9peid70Pg1ZG
7QMf6BMoUbn5Lw5aMWwgwBzO1EstwAg=
=LMsb
-----END PGP SIGNATURE-----

--im2pz5whtdrkkr4p--
