Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841F8E34AE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 15:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AC26E40D;
	Thu, 24 Oct 2019 13:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6926E40D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 13:48:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l10so25748157wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 06:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EZ0gauJbDLm6nT++pFl8IpdBYl9f3/pCB6BsG6ZimpU=;
 b=JhZLjFTDezImXLC4HDUWyIhA4PotherHW8l14ziqQKUPRdGilplTvGGCpjPv+HyyMu
 tQYX5dj+ZMI2CdL3omIAvLzEZSbTv5YrVO+a2SnkUX3cI4MCJCtyBFsFsUQXPLXFUaqg
 x7d+t297Dk/e3tUzfeLsW5NO8IR95cPyKoytu++FcOM9zs+yAjlYkImznPVb/8jwqZtd
 92R0sCq3t4rJAT01I2haipt2kdnfH1SB1pbWaYNy8rXrojCMZ3+HIZCaDDRc1pAPVfyl
 A34lVN887mdSpVDx/aU/vwCyn9vgpqtt3LxTp+vai/e8Qx12CuHw+XGjljdVmDVLVOZM
 1zsQ==
X-Gm-Message-State: APjAAAW9jg7syEp3Rk2M+LnwyT59PEx0icAp1Wb9UM+XVWt+PiJHG7Zn
 DdlPCID9OTVxfVMrQv7Q+b8=
X-Google-Smtp-Source: APXvYqwkpODXAwasjgKLcXY1OWtr0pF5zM9bczif2plmipl0NDD3sP2jDlEomkFXqJnFmDE1VZZEJA==
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr4017887wrj.268.1571924882363; 
 Thu, 24 Oct 2019 06:48:02 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v81sm1532612wmg.4.2019.10.24.06.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 06:47:57 -0700 (PDT)
Date: Thu, 24 Oct 2019 15:47:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
Message-ID: <20191024134756.GC2924027@ulmo>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20191024115016.GA2924027@ulmo>
 <55ab29ad-da9b-c178-4480-dc6edb09b3e4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <55ab29ad-da9b-c178-4480-dc6edb09b3e4@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EZ0gauJbDLm6nT++pFl8IpdBYl9f3/pCB6BsG6ZimpU=;
 b=IEj0umb7V/DNnn74s4u91JW4cJLZwnBTLzrk3vURlFx/ucbL1ugoCEj0hdXqyZ5tAe
 R33iEMU2BnKysT7s/Fqw1e2/we0KMBz+Du+kN+s4PNkxc88QUSyPTkWGlNsFvboBH+M9
 7lINu6cB7BNmLb9hi2WVXeMZ3fwB689CC1B6vkngaUusziM3wqIgH+bY4DngvULcRYZS
 mHqE2G/wvVmWJeq5wAV9ytt9ONhwJvTItVr3Ghf9yhnAr5+nnp2Q/VnE1pQDoYY5s4MR
 WWz7EQ/SZVYGEDnyXX0YMIyVoOHku9nVa9kS2Z6U2R5K3UnLjVAKwtziY5YfhyZSWJAL
 oISw==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1786862421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1786862421==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 04:35:13PM +0300, Dmitry Osipenko wrote:
> 24.10.2019 14:50, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sun, Jun 23, 2019 at 08:37:41PM +0300, Dmitry Osipenko wrote:
> >> On ARM32 we don't want any of the clients device to be backed by the
> >> implicit domain, simply because we can't afford such a waste on older
> >> Tegra SoCs that have very few domains available in total. The recent I=
OMMU
> >> support addition for the Video Decoder hardware uncovered the problem
> >> that an unfortunate drivers probe order results in the DRM driver probe
> >> failure if CONFIG_ARM_DMA_USE_IOMMU=3Dy due to a shortage of IOMMU dom=
ains
> >> caused by the implicit backing. The host1x_client_register() is a comm=
on
> >> function that is invoked by all of the relevant DRM drivers during the=
irs
> >> probe and hence it is convenient to remove the implicit backing there,
> >> resolving the problem.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/gpu/host1x/bus.c | 19 +++++++++++++++++++
> >>  1 file changed, 19 insertions(+)
> >=20
> > I don't really want to do this in a central place like this. If we
> > really do need this, why can't we do it in the individual drivers?
>=20
> Why do you want to duplicate the same action for each driver instead of
> doing it in a single common place?

I don't mind doing it in a common place in particular, I just don't want
to do this within the host1x bus infrastructure. This is really a policy
decision that should be up to drivers. Consider the case where we had a
different host1x driver (for V4L2 for example) that would actually want
to use the DMA API. In that case we may want to detach in the DRM driver
but not the V4L2 driver.

Thierry

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xq4kACgkQ3SOs138+
s6FNag//dCQTLu7oPNT3zc3b6EaUkms9Hy4DuTeMGzeKtu+qZRIc8UeavqaUk+1h
XydJK/GxuftWAPot/ZAPPeczZe5hWM7621VwYhCnArmwZkCmcxgiUDNy2hjgmtmZ
K7PjUUhwLHAvckWHxwfaYy8Fd2m+nK2ALvppph7FNsAxfZrZ28KjEGIFx96mGwdv
/uoZt6jlhjvmEk0C5xRI8CGjZSCUy3/HO8j1oTLiE21ErxreCqAUZNXCKC6otQad
5NsRhzYIQA+SUiFx9a/OcvN9weYTk+9T1+6zm6zwxY1lWdMbsqztu8Ucm8Mt6OYC
20wB2GhKJjEZJrcXGf58CfHrsc8Iv5HzB2ozwVQAZjj3GptZZyTA0xNiJYin5Qso
9bTMICJqwwn2XLjKW/4+mqdZtd1/2fbJ3MOqYAwkCPC5PH/97NNN5RpcrQCYzvPF
XCBUuYA86v4T6o1j0NeooKfPFUiPjIfHbyPigPs9Eb5BzMtcxqh3F3VTVZ0tpcZ0
jl9ZbFNUQs690Zwc6MLTXePx58TwWU3GqHR+zcCEgn+1y7sTiZ9ePzDHuKGN8pnC
xpaur5WtxLu28PS2Q6Uu4o+TD1Ey/Ifc1JJlmyoEzHHsdgOfNPIWPs3MYAZS+Nro
IK8LIOje6av2v2hf1Jelpm/PbtIYOLFV2iFgDxofZy/bEoG0Xfg=
=FCO/
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--

--===============1786862421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1786862421==--
