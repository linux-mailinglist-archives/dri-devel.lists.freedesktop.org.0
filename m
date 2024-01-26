Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D382483DA05
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C0710F9D0;
	Fri, 26 Jan 2024 12:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9538110F9D0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:15:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E2DC5CE3533;
 Fri, 26 Jan 2024 12:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C1CC43390;
 Fri, 26 Jan 2024 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706271313;
 bh=HJOduO1JjpKeSMWHdo7UhDLFHAL2ERhNtFLf9tTl7/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PQ/qzxE5wGewrakIg8oLGEkwJ54mnPdktyre3AdnzZTooJ62cM2wyo/1c2eQ52CMd
 5v8345kQSl3s0+GH9MuiP1gFKCALyPqldWAX4Ye6aYB49AnY9r0nl1cBXjLTncedWR
 xkZL4H9TIHmW7Sa5aJX9M+YIeBeR3NDIw4rQ1+9jJGtie+lImWVD7uZk4HVP7cKSCB
 vs74U+EZsVGbSXX4DfbYu0vs9zpuTrrmwWchH393i8gJCfxt8O0dbMwDlmKN5M0v/4
 URpRWrM0l71BkDwt4rB3mbQYdvhL5k50VuzWZW0gtl6B9TTUs5mACbQ78Wv5Byo9Jn
 j72HbCOhq6M/g==
Date: Fri, 26 Jan 2024 13:15:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [RFC PATCH 2/3] drm/tidss: Add support for display sharing
Message-ID: <vgfzhamtiwkpdyk5ndagsb63subclinotoe6tsi3wu6z7454ec@igxfzjc5gyqm>
References: <20240116134142.2092483-1-devarsht@ti.com>
 <20240116134142.2092483-3-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eefocgpe5td6sveu"
Content-Disposition: inline
In-Reply-To: <20240116134142.2092483-3-devarsht@ti.com>
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
Cc: nm@ti.com, devicetree@vger.kernel.org, conor+dt@kernel.org, j-luthra@ti.com,
 daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, praneeth@ti.com,
 tomi.valkeinen@ideasonboard.com, jyri.sarha@iki.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, tzimmermann@suse.de, a-bhatia1@ti.com, airlied@gmail.com,
 kristo@kernel.org, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eefocgpe5td6sveu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks a lot for working on that.

On Tue, Jan 16, 2024 at 07:11:41PM +0530, Devarsh Thakkar wrote:
> Display subsystem present in TI Keystone family of devices supports shari=
ng
> of display between multiple hosts as it provides separate register space
> (common* region) for each host to programming display controller and also=
 a
> unique interrupt line for each host.
>=20
> This adds support for display sharing, by allowing partitioning of
> resources either at video port level or at video plane level as
> described below :
>=20
> 1) Linux can own (i.e have write access) completely one or more of video
> ports along with corresponding resources (viz. overlay managers,
> video planes) used by Linux in context of those video ports.
> Even if Linux is owning
> these video ports it can still share this video port with a remote core
> which can own one or more video planes associated with this video port.
>=20
> 2) Linux owns one or more of the video planes with video port
> (along with corresponding overlay manager) associated with these planes
> being owned and controlled by a remote core. Linux still has read-only
> access to the associated video port and overlay managers so that it can
> parse the settings made by remote core.

So, just to make sure we're on the same page. 1) means Linux drives the
whole display engine, but can lend planes to the R5? How does that work,
is Linux aware of the workload being there (plane size, format, etc) ?

And 2) would mean that the display engine is under the R5 control and
Linux only gets to fill the plane and let the firmware know of what it
wants?

If so, do we even need the tidss driver in the second case? We could
just write a fwkms driver of some sorts that could be used by multiple
implementations of the same "defer to firmware" logic.

> For both the cases, the resources used in context of processing core
> running Linux along with ownership information are exposed by user as
> part of device-tree blob and driver uses an updated feature list tailored
> for this shared mode accordingly. The driver also auto-populates
> matching overlay managers and output types from shared video
> port list provided in device-tree blob.
> In dispc_feature struct remove const access specfier for output_type
> array as it is required to be updated dynamically in run-time for shared
> mode.

I'm also not entirely sure that the device tree is the right path there.
Surely the firmware capabilities will evolve over time, while the device
tree won't. Is there some way to make it discoverable at probe time by
the driver?

Maxime

--eefocgpe5td6sveu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbOiTgAKCRDj7w1vZxhR
xUZHAQC9UEm2aY+VJZIu3cY6lpRxt2+gjm/F09tvTETL6uyTGwD/YkQWVcLu/vz4
MgJdyfGZKivewFLe/q0RCkDicEbLcQI=
=YUl/
-----END PGP SIGNATURE-----

--eefocgpe5td6sveu--
