Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FE3736AC2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2970810E2D0;
	Tue, 20 Jun 2023 11:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2396B10E2D0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:18:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B922611DE;
 Tue, 20 Jun 2023 11:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8DDC433C8;
 Tue, 20 Jun 2023 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687259899;
 bh=cRhhBqxvWmE6la62/0+k2ECsEtVUo5haBglpJjpZp1k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=aFxq3rpWhHqXpEgvQUURHP4Pqw3a68nrfJygn0dOiwawt/iOOht2SA5+zxNdHfe0A
 m1HwBOnW6/0FVfmdBbCnYnCxUJdSv6iyxVsEm0DDA+LwgdhPTj8V6GrRov+Heh8tqd
 yfeiCl21fla6s4oZnFpX6nBMUt8sfiwZS4enw0d75XmwilGzCt9gQMvjm2WfLxhb8q
 qrYW2+DGV3oZKXW5V3kO2mWoK2pXq8LT1k7LUcqRY2B1kIjORoH99VjDY4ce5lTQMK
 mS4FMAabp62gYt5henuoub1lIWXfVwqKHLHGirysuGELb8u5dmXfzlq/oGo7jPbBTC
 21bGy2N1C+1AQ==
Message-ID: <4400e47d6555ed773d1e9cab5566c03429d43ae9.camel@kernel.org>
Subject: Re: [PATCH v2] drm: use mgr->dev in drm_dbg_kms in
 drm_dp_add_payload_part2
From: Jeff Layton <jlayton@kernel.org>
To: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 20 Jun 2023 07:18:17 -0400
In-Reply-To: <d0b9654c756069a6f0edcca6f4d410f7af592784.camel@redhat.com>
References: <20230419112447.18471-1-jlayton@kernel.org>
 <d0b9654c756069a6f0edcca6f4d410f7af592784.camel@redhat.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
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

I've noticed that this patch is not included in linux-next currently.

Can I get some confirmation that this is going to be included in v6.5?
Currently, I've been having to rebuild Fedora kernels to avoid this
panic, and I'd like to know there is a light at the end of that tunnel.

Thanks,
Jeff

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

--=20
Jeff Layton <jlayton@kernel.org>
