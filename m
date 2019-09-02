Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50522A5488
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 12:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8267689C09;
	Mon,  2 Sep 2019 10:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED8789C08
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 10:57:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q19so5263733wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 03:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mvIfIPm7vq3OP0xW9iuDS3fvRpO0h4sPiZ/j15hqF58=;
 b=anDYZyaFZ5BQ/5LkMxX3m0q6rjGvNdhfJ1KHR/+9V41QmWRghezXdccMqjZhI++CBE
 IMYoqB1o6mhqNISNmeXycpsqqh2i2w8ZfCYvDmJy9l9tH22J+mhkcV+Rn8IZcFGDwVUo
 8FYtTby9F7BCeLSBrfz0syEH8LmTzDAC0RUmXt0HMcxnqH1Y+u0BnfZCImSjWvsqE4XN
 zYrL2cnpdEHsFD9JB+CNnLRd7K/4chBdZvtdBj53mRXHP4PIYN27CGh9LgAZoA4KetZ+
 mc+zcjfMLRRj/kL+mIaFQsIGV+u0+UTLxpjy3H3C58CRlmKF2Ec+CDuFzbXhxeizo/sO
 knQw==
X-Gm-Message-State: APjAAAUmVWVANizC+nbbqyON37EiIHbsZoIMGPZAg/jVRWqp3CPQWrdy
 vp0ncVC+n+Fm5XBmvqIhMNq+SrxN
X-Google-Smtp-Source: APXvYqwesSTTBMb2waA98lfDGPT5O3oeS2NOrjKqciN90vEtZBsniQOLYG6eiSm1wLqzrX9e65FGdw==
X-Received: by 2002:a05:600c:2486:: with SMTP id
 6mr3570126wms.82.1567421860414; 
 Mon, 02 Sep 2019 03:57:40 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id w125sm31492491wmg.32.2019.09.02.03.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 03:57:38 -0700 (PDT)
Date: Mon, 2 Sep 2019 12:57:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 13/21] drm/dp: Do not busy-loop during link training
Message-ID: <20190902105736.GA19263@ulmo>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
 <20190805122350.8838-13-thierry.reding@gmail.com>
 <1565271207.3656.17.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1565271207.3656.17.camel@pengutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mvIfIPm7vq3OP0xW9iuDS3fvRpO0h4sPiZ/j15hqF58=;
 b=M+MILSHej/GA1FAOBZJt7mbO8788Ed/4bI9Io1TuWHkVX7SSG7KyRGLKlo+oWJJOVk
 1+5QtOnwX0+Tds5gwa6US92L4r5EEkLNfoAhXyiuQUgAlp/6NIEldwuN7dlT7POOuccB
 V95mf4ieXdxDXrK3s1MgUWgXygnSUE9Oq51UWBUDt3xuJRVznubSxAtuxlrz1GKsxbKq
 iCqV+JvpuvpTbJ9S6g4c8Hv+7eMw0qLuOOV/HShLq8i1IWyfF0SZcPKMcDg35btwQZDi
 JganlZ5uBNIrnRvkcCI0pjG9ovQVn8i9z7koDmf5MsgDSoyKAv/f+sq+rQFwmZvZep4i
 OCeg==
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
Content-Type: multipart/mixed; boundary="===============2003791103=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2003791103==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:33:27PM +0200, Philipp Zabel wrote:
> On Mon, 2019-08-05 at 14:23 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Use microsecond sleeps for the clock recovery and channel equalization
> > delays during link training. The duration of these delays can be from
> > 100 us up to 16 ms. It is rude to busy-loop for that amount of time.
> >=20
> > While at it, also convert to standard coding style by putting the
> > opening braces in a function definition on a new line.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 30 ++++++++++++++++++------------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_h=
elper.c
> > index 4112570dbe67..344f887fef2c 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -120,33 +120,39 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u=
8 link_status[DP_LINK_STATUS_SI
> >  }
> >  EXPORT_SYMBOL(drm_dp_get_adjust_request_pre_emphasis);
> > =20
> > -void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_=
CAP_SIZE]) {
> > -	int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -			  DP_TRAINING_AUX_RD_MASK;
> > +void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_=
CAP_SIZE])
> > +{
> > +	unsigned int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > +					DP_TRAINING_AUX_RD_MASK;
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
>=20
> rd_interval was in units of 4 ms.
>=20
> > +		rd_interval *=3D 4;
>=20
> This should be *=3D 4000 since the result is fed into usleep_range instead
> of mdelay.

Good catch! Fixed in v2.

>=20
> > +
> > +	usleep_range(rd_interval, rd_interval * 2);
> >  }
> >  EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_delay);
> > =20
> > -void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_=
SIZE]) {
> > -	int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -			  DP_TRAINING_AUX_RD_MASK;
> > +void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_=
SIZE])
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
> > +		rd_interval *=3D 4;
>=20
> Same as above.

Fixed in v2.

Thanks,
Thierry

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s9Z0ACgkQ3SOs138+
s6Gnpg//V7bNZsUXwSJo23PiPArO18JxpKX1ZvcKXFtKhuUBH+GLWsRLdZ2b/3YY
mx7o9wjdt39hwQfVuQguZV3E6NFaJyHV0qGhSWKIUNyyD93RW1NOumfSQxbtW4ve
Rbteew8dfmqpn30CWqomt9ZJf90KP2ROHa2bZfAUvlYm7UT4DhveADxqftvudNyu
9KkgLwyf8Bjk1224Iz0Z0bAbU2zCF3J56z7dOxob84H6CvFwC+Uicv+8FGW1zKsW
oid/ovJhREgG+BfVMGsHOdmGZp/KTMQbTXpjOk5b9JKarRqP24NA0uMJzW5Lg0KW
SuGh6cywjU6mAEMKJTJQQYr+IGMLcPR7MbiZsnV7P4eGNzLRC1L/nUJBlPKZtPll
u2RHsGWLVg3f7t7arClGZ2gXuIvKVOIErVAFwitomyxStYJE9FJAwa5kOEX1Lnks
0zuuAKkghfYxwKCsGMaavI+SOiu8homgAuR6EH9qBYV3h46wvvB4VhmISyMHZcVf
elYklmA74qULx8VjzaQcO5l+yQjjcVbYZ7cllMsUzl2ynPs4qMrsaskFkdzzubFf
hVHVSM/tCu3vNpLzRJkgHUzPC1EQlW+k6wofSfk1Yxa6ryn7thaeSmy3qVpA6tf4
YohO6Bua00WAaYA1ad4yz05TvLvdi5L54WyTBzFy+C7muiF5uis=
=Rmyj
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--

--===============2003791103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2003791103==--
