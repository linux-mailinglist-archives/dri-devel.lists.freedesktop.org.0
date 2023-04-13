Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB166E0D9E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 14:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054F110E3E0;
	Thu, 13 Apr 2023 12:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EF810E3E0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:43:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A825561557;
 Thu, 13 Apr 2023 12:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629DDC433D2;
 Thu, 13 Apr 2023 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681389834;
 bh=yOCVEPTkqmwzrbgaO4trLtk8j+cugrX7CunNTUSAF4o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=eo/swswdEMkWLuTPtC+XSfNe7DxDo2uPvkry0F0awj0Xy5GYN62lRckycHDCOCMu7
 xTfmUHC881NkN6xEPSTxJs6G5rwPTk/OUcFxbKzYP8kJyp0q6BJrFAjtE0YVg52dGa
 l93ocDixpnNZVssYz3IIvocuBFfTq0t72K+VZEeibMLvktwDqj3HLCz/2iA+6z3HW4
 MyiaNaKS4VNCyx0+U8BzxmodHPMZM8Tf0Vnee8zXIaaAPUUcYamTPCurR1YXn2X/Wc
 JUiXEaMgYxyt1j25oDps/VYxBPIEa4XhDa1xKZFX4xJMaXtguQe0XbjNSael1HYD+u
 ONyEslOtsuPag==
Message-ID: <cc3ceecef10fabf6856e29c2dd22b040b3ea757b.camel@kernel.org>
Subject: Re: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle
 NULL state pointer
From: Jeff Layton <jlayton@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 13 Apr 2023 08:43:52 -0400
In-Reply-To: <87edooarpq.fsf@intel.com>
References: <20230413111254.22458-1-jlayton@kernel.org>
 <87edooarpq.fsf@intel.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2023-04-13 at 15:31 +0300, Jani Nikula wrote:
> On Thu, 13 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> > I've been experiencing some intermittent crashes down in the display
> > driver code. The symptoms are ususally a line like this in dmesg:
> >=20
> >     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port 00=
0000006d3a3885: -5
> >=20
> > ...followed by an Oops due to a NULL pointer dereference.
> >=20
> > The real bug is probably in the caller of this function, which is
> > passing it a NULL state pointer, but this patch at least keeps my
> > machine from oopsing when this occurs.
>=20
> My fear is that papering over this makes the root cause harder to find.
>=20
> Cc: Harry, Alex
>=20
>=20
> BR,
> Jani.
>=20
>=20

I'm happy to help track down the root cause. Display drivers are
somewhat outside my wheelhouse though.

Maybe we can throw a WARNING when this happens? I'd just like it to not
crash my machine.


> >=20
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2184855
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gp=
u/drm/display/drm_dp_mst_topology.c
> > index 38dab76ae69e..87ad406c50f9 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -3404,7 +3404,8 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_to=
pology_mgr *mgr,
> > =20
> >  	/* Skip failed payloads */
> >  	if (payload->vc_start_slot =3D=3D -1) {
> > -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, s=
kipping part 2\n",
> > +		drm_dbg_kms(state ? state->dev : NULL,
> > +			    "Part 1 of payload creation for %s failed, skipping part 2\n",
> >  			    payload->port->connector->name);
> >  		return -EIO;
> >  	}
>=20

--=20
Jeff Layton <jlayton@kernel.org>
