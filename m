Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654EDA68E5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 14:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47688938F;
	Tue,  3 Sep 2019 12:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E9E8938C;
 Tue,  3 Sep 2019 12:50:10 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id j4so35498633iog.11;
 Tue, 03 Sep 2019 05:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SKfhF1MpHwww/fX2tQllUKhsKLgL/Go0OoYIGIy2WZk=;
 b=k3tee6WTellAAkoK8X/HVejMLaUowa+sfKgoMNKckWux4iuFTPZRzPC8NZRFuGBsU7
 aq8maglrIvS+K4WWBulwIDwcb731GSR8upr5Tpdt5tZP6MfZDESVkWYRQsY4dxVrCYGd
 kyrisF+P2dZFhjUddnok23gaXYsdzWUqX6EPlqro9XrjUDS7aq3DiB8zFQD88hEy7A8Z
 WjnRLS7r2gKNWAup19lMz4I4qdArPIpnoLIXH6T1B/rUz4AAiGU268laZPVhge/LHEXX
 l6VZMeVpT0iU6b+LSTHdBhWWxOZVU0h8IFAIr/ntKzjwpDwqmQ6SxFNjGjOtVq1M4euk
 YCNg==
X-Gm-Message-State: APjAAAWZ9qq0wAfJekIlC6NJAvZ80QLGSplxgvS7xfaikFisuRgGqddP
 92OMDI7hjKu4K79GibsaMXQ=
X-Google-Smtp-Source: APXvYqz695b/2HygsAfknHRbGOoPh69tDwvEX3MBOc2m0Ra4x3pKQQKob3aeyNlZe2OPcUym1ZO/vg==
X-Received: by 2002:a6b:6010:: with SMTP id r16mr39828359iog.124.1567515010065; 
 Tue, 03 Sep 2019 05:50:10 -0700 (PDT)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id k24sm14162757ioj.39.2019.09.03.05.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 05:50:09 -0700 (PDT)
Date: Tue, 3 Sep 2019 08:50:29 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/vkms: Reduce critical section in vblank_simulate
Message-ID: <20190903125029.6jctvqvwoq2yzyka@smtp.gmail.com>
References: <20190719152314.7706-1-daniel.vetter@ffwll.ch>
 <20190719152314.7706-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20190719152314.7706-3-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SKfhF1MpHwww/fX2tQllUKhsKLgL/Go0OoYIGIy2WZk=;
 b=R0alH1O4/bUkBVc8ydTSadIDytxx28eDJFBg2wtuoVYRMZsMJ25WmMR6m3c6ncHfM/
 0bOLqQ/m9eFB9fybzVHdYUvNO3jS0+NpWKtz3GBWse9n5LStT3ulqMzo80OuMgtOJouG
 lBc8LFjZOUohUOwZPI/SCF8bLJeQM4E1Qy7HHcxA4y9jTqi2X3ABb14QTRMQ8Ukb5MPJ
 7uH/540gnlpj0jIPgVX8tv4bPmLkWOWH/M8EdLLXzD17aD3q/H+CjuHp/xQcndmzxGVn
 T7hv83wDLcqA/lSOGS8/RNOqbl6l73g0MMlzEgSfttzQa91BjkgQliyczCtRN5USR6FE
 7IIA==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: multipart/mixed; boundary="===============0971651684=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0971651684==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yarmh4qjkc74q7rn"
Content-Disposition: inline


--yarmh4qjkc74q7rn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for this patch! It looks good for me.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

On 07/19, Daniel Vetter wrote:
> We can reduce the critical section in vkms_vblank_simulate under
> output->lock quite a lot:
>=20
> - hrtimer_forward_now just needs to be ordered correctly wrt
>   drm_crtc_handle_vblank. We already access the hrtimer timestamp
>   without locks. While auditing that I noticed that we don't correctly
>   annotate the read there, so sprinkle a READ_ONCE to make sure the
>   compiler doesn't do anything foolish.
>=20
> - drm_crtc_handle_vblank must stay under the lock to avoid races with
>   drm_crtc_arm_vblank_event.
>=20
> - The access to vkms_ouptut->crc_state also must stay under the lock.
>=20
> - next problem is making sure the output->state structure doesn't get
>   freed too early. First we rely on a given hrtimer being serialized:
>   If we call drm_crtc_handle_vblank, then we are guaranteed that the
>   previous call to vkms_vblank_simulate has completed. The other side
>   of the coin is that the atomic updates waits for the vblank to
>   happen before it releases the old state. Both taken together means
>   that by the time the atomic update releases the old state, the
>   hrtimer won't access it anymore (it might be accessing the new state
>   at the same time, but that's ok).
>=20
> - state is invariant, except the few fields separate protected by
>   state->crc_lock. So no need to hold the lock for that.
>=20
> - finally the queue_work. We need to make sure there's no races with
>   the flush_work, i.e. when we call flush_work we need to guarantee
>   that the hrtimer can't requeue the work again. This is guaranteed by
>   the same vblank/hrtimer ordering guarantees like the reasoning above
>   why state won't be freed too early: flush_work on the old state is
>   called after wait_for_flip_done in the atomic commit code.
>=20
> Therefore we can also move everything after the output->crc_state out
> of the critical section.
>=20
> Motivated by suggestions from Rodrigo.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 927dafaebc76..74f703b8d22a 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -16,17 +16,18 @@ static enum hrtimer_restart vkms_vblank_simulate(stru=
ct hrtimer *timer)
>  	u64 ret_overrun;
>  	bool ret;
> =20
> -	spin_lock(&output->lock);
> -
>  	ret_overrun =3D hrtimer_forward_now(&output->vblank_hrtimer,
>  					  output->period_ns);
>  	WARN_ON(ret_overrun !=3D 1);
> =20
> +	spin_lock(&output->lock);
>  	ret =3D drm_crtc_handle_vblank(crtc);
>  	if (!ret)
>  		DRM_ERROR("vkms failure on handling vblank");
> =20
>  	state =3D output->composer_state;
> +	spin_unlock(&output->lock);
> +
>  	if (state && output->composer_enabled) {
>  		u64 frame =3D drm_crtc_accurate_vblank_count(crtc);
> =20
> @@ -48,8 +49,6 @@ static enum hrtimer_restart vkms_vblank_simulate(struct=
 hrtimer *timer)
>  			DRM_DEBUG_DRIVER("Composer worker already queued\n");
>  	}
> =20
> -	spin_unlock(&output->lock);
> -
>  	return HRTIMER_RESTART;
>  }
> =20
> @@ -85,7 +84,7 @@ bool vkms_get_vblank_timestamp(struct drm_device *dev, =
unsigned int pipe,
>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> =20
> -	*vblank_time =3D output->vblank_hrtimer.node.expires;
> +	*vblank_time =3D READ_ONCE(output->vblank_hrtimer.node.expires);
> =20
>  	if (WARN_ON(*vblank_time =3D=3D vblank->time))
>  		return true;
> --=20
> 2.22.0
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--yarmh4qjkc74q7rn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1uYZQACgkQWJzP/com
vP9+hA/+KlJu2cW+Qi84gCDTbQhtlHO2k0hRdE6YTPytQy6qVaUH+Cmz7H+2RGJH
QT7lgoeCg8WqyBJrCEYRQWYZtm4mBHml+GQ2ZlkIA5L43vjlWiOFhH29l8+T+/ML
rHTJ9VCRPWXXp3z4qBLb+KynMA8Mf46SKMINq9k2SAb/R6HXIENdwAWmvwS4sluS
0kxCP30/BwcgbMvL+s7+K/pS34/mzug5lZOkkS2LwZW8md2dMKrt1zIfEgCLGqDD
ncLxx/scKDR3LTvwsye+YgnVZN2TmUnt7pkyy+GSBgoncZ5VbgGIinKfj9WNF2GB
9rPHyjJIAfivucDdIm6BVV8V1ONjtiEYOgFzJ1gDmajqPnwYUi1i4qTWPgAxNn5B
+5mSj1Wh2vBom6569Jn0/dj+K4OM5wn5YW2x41/t1Zc/7DtLRj2rjm5FURPALRWu
3qu+zOxQUro7g/FYKbP0DA5kXC/x5ulh+Rg7Ug8emCDNNV7onyG2gFeBuJVHCPyr
dc+hrxjkgjCV82Hgv3pp3gUkAt8Xn7BbNVeK0XCMj18cerz5jhE7hNj0+rqBbP/P
163+bK0fGkUCcTsmuF/rL1gQBWP/bX+WLjtQkCXE2dr8pU0EZp1U0npG65nkg2DA
OAYZ23kWEc1nSdzIz9jF13zlJobDI7PhwjcfQ99V4aiAc5MfTgo=
=HLgx
-----END PGP SIGNATURE-----

--yarmh4qjkc74q7rn--

--===============0971651684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0971651684==--
