Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE406F08F5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 18:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043FC10E00D;
	Thu, 27 Apr 2023 16:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97E910E00D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 16:01:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E75DF6109A;
 Thu, 27 Apr 2023 16:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925A4C433EF;
 Thu, 27 Apr 2023 16:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682611306;
 bh=1Bgza/4uPsYCy5eT6JwQzCQ4JiSUqYPkXew3bWD3hwc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=QLow74rlEHQtFQtzBAoUiYLM9bpEvQ+9jIVaCJT0rKtS0i49bYsaml9v4f+w9iieY
 8xRetbBbvsizjRQ2BAHXTPrSAK6+IwabJeXzUyJ/r458ND8QWQG0sZhFOraPO2xfG6
 CHf3uceonGw/ej0OqQwaYl3yRYgliIyPM6Huj2LOvMnfyWiUS5Glwt/Vj1h1oCnMcp
 4fU3wmeyjb+vd6FsTFgP0diBamf0VSdzbOY0dmbg4nSqrM2V4AGevxci2QNcT0MJk+
 co3KhKYJcEJyjFgvdSY2pGmQbEbg4QAYltNMkh/u9RFKvn6RPYYELPyBWVvFzAgGzQ
 3t8NIuVwl3BhQ==
Message-ID: <9656b75354112dbb1ba671297358b41a28ce91f1.camel@kernel.org>
Subject: Re: [PATCH v2] drm: use mgr->dev in drm_dbg_kms in
 drm_dp_add_payload_part2
From: Jeff Layton <jlayton@kernel.org>
To: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Thu, 27 Apr 2023 12:01:44 -0400
In-Reply-To: <d0b9654c756069a6f0edcca6f4d410f7af592784.camel@redhat.com>
References: <20230419112447.18471-1-jlayton@kernel.org>
 <d0b9654c756069a6f0edcca6f4d410f7af592784.camel@redhat.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-04-19 at 16:54 -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Thanks!
>=20
> On Wed, 2023-04-19 at 07:24 -0400, Jeff Layton wrote:
> > I've been experiencing some intermittent crashes down in the display
> > driver code. The symptoms are ususally a line like this in dmesg:
> >=20
> >     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port 00=
0000006d3a3885: -5
> >=20
> > ...followed by an Oops due to a NULL pointer dereference.
> >=20
> > Switch to using mgr->dev instead of state->dev since "state" can be
> > NULL in some cases.
> >=20
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2184855
> > Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > I've been running this patch for a couple of days, but the problem
> > hasn't occurred again as of yet. It seems sane though as long as we can
> > assume that mgr->dev will be valid even when "state" is a NULL pointer.
> >=20
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gp=
u/drm/display/drm_dp_mst_topology.c
> > index 38dab76ae69e..e2e21ce79510 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -3404,7 +3404,7 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_to=
pology_mgr *mgr,
> > =20
> >  	/* Skip failed payloads */
> >  	if (payload->vc_start_slot =3D=3D -1) {
> > -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, s=
kipping part 2\n",
> > +		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, ski=
pping part 2\n",
> >  			    payload->port->connector->name);
> >  		return -EIO;
> >  	}
>=20

Thanks! BTW, I've had a couple more of these events in the last few
days:

[20199.446159] amdgpu 0000:30:00.0: [drm] Failed to create MST payload for =
port 00000000556eb455: -5
[20199.508379] [drm] DM_MST: stopping TM on aconnector: 000000001c0c0284 [i=
d: 86]
[20200.064417] [drm] DM_MST: starting TM on aconnector: 000000001c0c0284 [i=
d: 86]

The patch prevents an Oops, but GNOME seems to decide that a different
monitor is primary and moves all of the windows on the desktop around (I
have 2 monitors). Mostly this seems to happen when I walk away from the
machine for a bit, so I suspect it's associated with the display going
to sleep.

At one point, Wayne said he might know the root cause of this. If there
are patches that you need help testing, I can do that. I'm having to
build my own kernels anyway until this patch makes it into the distros.
--=20
Jeff Layton <jlayton@kernel.org>
