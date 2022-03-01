Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 620924C8E71
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D333210E36E;
	Tue,  1 Mar 2022 14:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B886E10E36E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S4GKHj+TGeEAFsd0JvjT4NMBJW11sRJTvUnVl0nG4Uo=; b=b2MZfR9uyRhYcLWYD8pPiFaZws
 lRzUUUXkMiY5Xh1SwzQ8FHizW5BhZLlZLqqJoZPk2dg7HcHuO1BYwfMgi6kIN0VBOgu+1PcWiAj6i
 TKEZ0R6kLpRBKy4DUgYSMQ0uBvbMyOQL6fupqARx5E8i1ZzyYoHGeGvsmzwzstEZ6jrUlgt42LQZ3
 mhcesizyMFWaOPaj0sf/OdaYu44B3lvyPhMqLoi8R+ZcwM+Nhb0qyuTAGE3YvOl09Un19Idfcc93Y
 gf2ez9ya6xfTXk9GI3FYn1XxOhRG4FLsdZfQG72jzBAnZn4/AWIMw0yCg8d8sKfbSQknE3dpIZWiJ
 sT4janyw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nP3xy-0001jD-6C; Tue, 01 Mar 2022 15:59:06 +0100
Date: Tue, 1 Mar 2022 13:58:26 -0100
From: Melissa Wen <mwen@igalia.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/vc4: add tracepoints for CL submissions
Message-ID: <20220301145826.6ofizv226oqzesed@mail.igalia.com>
References: <20220201212651.zhltjmaokisffq3x@mail.igalia.com>
 <20220225161126.6n7puj5p7saf57u4@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bokq6fs5zzvbzrxv"
Content-Disposition: inline
In-Reply-To: <20220225161126.6n7puj5p7saf57u4@houat>
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
Cc: David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bokq6fs5zzvbzrxv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/25, Maxime Ripard wrote:
> Hi Melissa,
>=20
> On Tue, Feb 01, 2022 at 08:26:51PM -0100, Melissa Wen wrote:
> > Trace submit_cl_ioctl and related IRQs for CL submission and bin/render
> > jobs execution. It might be helpful to get a rendering timeline and
> > track job throttling.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
>=20
> I'm not really sure what to do about this patch to be honest.
>=20
> My understanding is that tracepoints are considered as userspace ABI,
> but I can't really judge whether your traces are good enough or if it's
> something that will bit us some time down the road.

Hi Maxime,

Thanks for taking a look at this patch.

So, I followed the same path of tracing CL submissions on v3d. I mean,
tracking submit_cl ioctl, points when a job (bin/render) starts it
execution, and irqs of completion (bin/render job). We used it to
examine job throttling when running Chromium and, therefore, in addition
to have the timeline of jobs execution, I show some data submitted in
the ioctl to make connections. I think these tracers might be useful for
some investigation in the future, but I'm also not sure if all data are
necessary to be displayed.

Melissa

>=20
> Emma, Daniel, David, any insight?
>=20
> Thanks,
> Maxime



--bokq6fs5zzvbzrxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmIeNI0ACgkQwqF3j0dL
ehyK/A/9EImTcj2Die9IqccFnG3XtJNyTg/8vC1TW5yfwglXtX0lp1ciy2Awmokp
ZytlMmZx5r73RyfoJG3zRphfzNpBS46ooh0FzOrb6tYfKJIWCFomHrFP+lg11UU4
44WWRdO/h5O1nJCS2kBEXPDrgG0Nv28mOLylsC7NDHYuPi2D+Ol9ZGO0moUsoNHu
gHM2jj7PEukiXF9FuYeaL7JRArRBJqnCOrnRxCBLk49MrvSfRV1n6BnuJddYsHup
TsiEBP69Y/4nHvgWna91nedmdRqm0E3ORRXVYTIbWBnLA4rhAvlTZAk7Mxb66hYD
kN2bwBnTa5M9V1VBZpuBR+EU6IjUxlAE+cAqRtV4PsSiy5qLtB8BANX2ko35zjui
UwGLtLjpdIoA07UC1PAMRUL19k1vQjXxCp8q1CgBIobThySR6qN3j+aNngNkLoMF
w0cYQq6idiNbrbK95ls4iWiJgOl38BqzbqNSwdB/SInx1TliXSDYkKuRwS8yV0F7
PnGtdoEZBJG1meSaTMaFxsMnZKPiysbMYeTsJCfbxSpCM5F3lmzavCoPCDBz4d7v
zCMLqySF+C/SCo0jwsBFVn2fBtBWRNFJi6zq+A1UADCfLYyJ9uiABvwsInlKd2oe
N0j4zTUDd/7sv4zhaa0QFiPJHPIPRtxf6yZRiRdhEBgjRDgrKaY=
=/B95
-----END PGP SIGNATURE-----

--bokq6fs5zzvbzrxv--
