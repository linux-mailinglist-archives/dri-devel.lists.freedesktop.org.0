Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B6DE5E4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 10:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E90989B70;
	Mon, 21 Oct 2019 08:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142CE89B70
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 08:04:13 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so7478059wrr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 01:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0R6hYQCAcLoT64sVDkMzTSSNL5nIYJYWBk6ri71BMcE=;
 b=T3LGyYwBfi3U52dONQFBwWW5Ck45TldwAYmTHpMuhzeWXbGp9wH7R/ynt6jG3yG7qK
 yDOEB0T31IvWFP1Cv7rf53rlsxl1/2dEkrJ+e/56zszgJBCiIbrGbbCMO2xvRYSTNrXu
 7KG6HUhE7Y0As8EFWSmtzh7Lcxtm5Wtr4jbvkTGZXR08FNDItK/qvYBPbf3h+LpGfTz4
 d2q0tYz6sEHsTLMjgJyu2gtUf0IYvJo0BAcCxZQh9FTh+F+jNrFg0vL3YrOgC3fXmzY2
 1D+FpLYL4uvZvJ79MeL/CPfUXZzGNnRCJojgdRYV/2f0S3Ri81Mj2RnEo/n1Jqb65lo3
 Z6PA==
X-Gm-Message-State: APjAAAU9Ioe4gDmKiBkSIO+WkhYeZeJbAQ1vBU7oEOHbwF7DhB5EAg04
 U0B/0H5H1Ueb0ePbzArqwNXpbjfs
X-Google-Smtp-Source: APXvYqyPgK+rwDG6u3mbR7MIhjIKU7XxCAEOkS6Y4e4PH5Ex+JHZ/NWvc6mJLX9d+ZogJkxEc7XJSQ==
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr19318683wro.378.1571645051490; 
 Mon, 21 Oct 2019 01:04:11 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id i3sm10179012wrw.69.2019.10.21.01.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 01:04:10 -0700 (PDT)
Date: Mon, 21 Oct 2019 10:04:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 07/15] drm/dp: Do not busy-loop during link training
Message-ID: <20191021080408.GB1118266@ulmo>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-8-thierry.reding@gmail.com>
 <602a722d8c6a49f907e9f6e76c5d02cc05d5142a.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <602a722d8c6a49f907e9f6e76c5d02cc05d5142a.camel@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0R6hYQCAcLoT64sVDkMzTSSNL5nIYJYWBk6ri71BMcE=;
 b=MYEfLAtw+hzHhC2sunvoVzXnZPPwqCGR261PvF2kOUl0Q2UkXJnDeGlC/Lm856qdJJ
 DtGqSiBPZn5uoKbrHJYCgkwYNQjikcqmhRMbJkyKeSsvBEB0NjYmYb/r1Q7QHyziQqdk
 G9+pmA3AQRD3y4YDen02W7lxJNUSmyVs+m7AiFM1TU4YWVSjY5TDL3/HRLeaICfpD/pY
 qf1LDWm16Ipgb4TTA9to519Nv5gfAPW9xv/mONHixV2a7yHsN3ynjSg9NyuGu8ndZpDP
 5lOa/E7v85PxkQHplqndwMrwnpukdfxAyKH21mJ8s/8Va8dd8Ax7/kW3RLbUqTxCZ/64
 nCuA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0139532157=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0139532157==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 05:31:19PM -0400, Lyude Paul wrote:
> On Tue, 2019-10-15 at 16:35 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Use microsecond sleeps for the clock recovery and channel equalization
> > delays during link training. The duration of these delays can be from
> > 100 us up to 16 ms. It is rude to busy-loop for that amount of time.
> >=20
> > While at it, also convert to standard coding style by putting the
> > opening braces in a function definition on a new line.
> >=20
> > v2: use correct multiplier for training delays (Philipp Zabel)
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 30 ++++++++++++++++++------------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 8f2d7c4850ca..ad2671d2ee8f 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -120,33 +120,39 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8
> > link_status[DP_LINK_STATUS_SI
> >  }
> >  EXPORT_SYMBOL(drm_dp_get_adjust_request_pre_emphasis);
> > =20
> > -void drm_dp_link_train_clock_recovery_delay(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE]) {
> > -	int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -			  DP_TRAINING_AUX_RD_MASK;
> > +void drm_dp_link_train_clock_recovery_delay(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +	unsigned int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > +					DP_TRAINING_AUX_RD_MASK;
>=20
> Did you mean to put this conversion from signed to unsigned in the previo=
us
> patch?

It doesn't really belong in the previous patch, though I guess it might
be better in the subsequent patch where the new interval helper is used
=66rom this function.

Thierry

>=20
> > =20
> >  	if (rd_interval > 4)
> > -		DRM_DEBUG_KMS("AUX interval %d, out of range (max 4)\n",
> > +		DRM_DEBUG_KMS("AUX interval %u, out of range (max 4)\n",
> >  			      rd_interval);
> > =20
> >  	if (rd_interval =3D=3D 0 || dpcd[DP_DPCD_REV] >=3D DP_DPCD_REV_14)
> > -		udelay(100);
> > +		rd_interval =3D 100;
> >  	else
> > -		mdelay(rd_interval * 4);
> > +		rd_interval *=3D 4 * USEC_PER_MSEC;
> > +
> > +	usleep_range(rd_interval, rd_interval * 2);
> >  }
> >  EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_delay);
> > =20
> > -void drm_dp_link_train_channel_eq_delay(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE]) {
> > -	int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -			  DP_TRAINING_AUX_RD_MASK;
> > +void drm_dp_link_train_channel_eq_delay(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +	unsigned int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > +					DP_TRAINING_AUX_RD_MASK;
> > =20
> >  	if (rd_interval > 4)
> > -		DRM_DEBUG_KMS("AUX interval %d, out of range (max 4)\n",
> > +		DRM_DEBUG_KMS("AUX interval %u, out of range (max 4)\n",
> >  			      rd_interval);
> > =20
> >  	if (rd_interval =3D=3D 0)
> > -		udelay(400);
> > +		rd_interval =3D 400;
> >  	else
> > -		mdelay(rd_interval * 4);
> > +		rd_interval *=3D 4 * USEC_PER_MSEC;
> > +
> > +	usleep_range(rd_interval, rd_interval * 2);
> >  }
> >  EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
> > =20
> --=20
> Cheers,
> 	Lyude Paul
>=20

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2tZngACgkQ3SOs138+
s6GbUA//QvQzfx5eW7cOqMtRt49pCZNWf2X5OlCq2k7clI+V/ZOqRGmdW1JIsJ2m
ekeIiWrS1gUK0BRCPtEwoUSzzm6kqLa1/QQezdimFyAsCNctgzPABWwAYX432DsC
A0a5/mU7uv6K+tYT3HLxt1IFGJwRJDznbAcK/xTbI87LsVnp+eKdIgea6XbduhZZ
3fNrhoPXt50DKYlGizdkZRx5t+c9BoPxbfUZPlJra/mu+dYZBTE5tI4ENehYugMm
v1XiEyhpegGvfnrTIVqrvx2eXMxqJofkT2hHBWGjEJbtcToaN1t1rqJG/RYxwKiu
lWdUBcAj8C1e9RNgAHe00foSbYEonuiILjrnCV6x3Kxj95prFr6u+aELwlDNdybi
CUpbQViEWEld9DWhHrMfV0vuAb6Rpky14nVbGFzLrhgDcQiIXTY8LOlNTNRTOxOB
9p2wdQkwzYdhzf8vR/Th4URo2w3gcTwgsikygmMSqni6y/b/nN/PDZY9WEM6yE56
YMjWH7dcmZcWsrMxneSANYOnz9wcmrEFEuz1LXs2ttlnn0ERnNH0QNR3FR633xIx
FATQwbqNfSncRxZWFYImvbQsvfIbkp1Hy5Wuco2d5pJtdsn8wGzfhIPQ3BdUOyvu
L6tS+GZ7Kf63GX01BYBeWAq/IEPvI8ITjsZwrqWApQF0xtNWZnM=
=EAzw
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--

--===============0139532157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0139532157==--
