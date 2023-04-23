Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075B86EBC2D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 02:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219AD10E28B;
	Sun, 23 Apr 2023 00:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7675410E28B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 00:34:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB0BC60B59;
 Sun, 23 Apr 2023 00:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611E7C433D2;
 Sun, 23 Apr 2023 00:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682210097;
 bh=JNSlUkMUb/vTZyPvFPK9GDKgh29Sk76KROilX21N1bY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=N8LfNmHhurMgegU++0cdfW0n9sl4pIgFJCEbK5J8QG5KYJDfHRup03GgvqtCqsVYt
 uM4+5Nd67bNhprWPpCHs6RBLEFIJ9murSI53svGg+je+LzOHvwj7yJmn8smFOgcIvv
 NY+bQad5oRgKwomjbeEr7dMqtdx9qaiTg+DJY1lTRhvifNoiu42unWvTEDMMMLqSfV
 v1ZL1Z0Q3b5yRfaNXLg793YVQWZjCrRDbezSsxtDpm7gYe8LNua91bhyHudu0XtXds
 MCKS5GwNA+iP+fIXZ0uqoHTqcQ5krbahT5k2jrM4bfGfqlIiZENnva9Hlqhep4KDx+
 UdB/dtpcTvMUA==
Message-ID: <04cc52e7458cbd22c0ef9d092aabca3ea5403074.camel@kernel.org>
Subject: Re: [PATCH v2] drm: use mgr->dev in drm_dbg_kms in
 drm_dp_add_payload_part2
From: Jeff Layton <jlayton@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 22 Apr 2023 20:34:55 -0400
In-Reply-To: <87o7nkypmo.fsf@intel.com>
References: <20230419112447.18471-1-jlayton@kernel.org>
 <87o7nkypmo.fsf@intel.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 (3.48.0-1.fc38) 
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

On Wed, 2023-04-19 at 16:21 +0300, Jani Nikula wrote:
> On Wed, 19 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
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
>=20
> Thanks,
>=20
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>=20
>
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

Thanks for the reviews!

I finally had this happen again today, and I can confirm that this does
prevent the oops. GNOME rearranged my screen layout after the error, but
the box stayed up and running.=20
--=20
Jeff Layton <jlayton@kernel.org>
