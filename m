Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51591779E3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 16:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84106EA87;
	Tue,  3 Mar 2020 15:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535A66EA87
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:05:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so4767998wrn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 07:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P0oanW/aj9biRR6heJOwVLxuRoTamE31AH/jyKH3/pQ=;
 b=vFk8k4p7fecN18EgVtFJLRXjFVTvpKb2ePDskpn8SlLoJTUXKQGmWCV0Puw5H24XNl
 pbGOkT9fShrn7kL/4Oe+Yzy8Mdp3EE1Dhy62GdbIhhvEoOGnn3ndPigQHIIs1aIe+HIo
 fQi9DuFQTIfHkRW6LN20AaojKKnrH05kJNWg+/xNL2iL+dYsCSMSl2tSc6vNZG4OY0sE
 C7GSFJoKt7/TOHhedEh8aK058GueqCVcIZ0GaXU62k8JxXQUcWBSIImEmlApjwoKTSfa
 SQkkDrr1CYbpl/RG7WMLb3e8fYD5bp6vLtlSbScF0Yf57rW91bD08jC3O7Z/LfvY9d50
 PQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P0oanW/aj9biRR6heJOwVLxuRoTamE31AH/jyKH3/pQ=;
 b=sit9y9MaQ9O9v7qBAcrWSHRWOJ9F/vgkZRJan996c6Wg1Y5CZud5tDnnh3iKbBivOm
 YcbA0dl155Pfk9W81JnYUpAhv0Ci7090P2GthOcfgoUGdqx2Xak/EeH6+zrtAOdzxkU2
 G7PrZ0a1HHr1QwcgyTG6haz8Hb5Hc46Keao+SZk9tUOuBrzCjJEbpWNkD+ROx4CCZyaD
 58JoNSv9+r9ej36NtYTWQcHpclI+VklSe2EG3vO/FX2FTU4zq3v9RaaeXnYXRlCA4fnK
 qzZMqQvMdlRPQqpZtsEU+lvJoBhl44eMc5So6G98MEKUbL6TS4Wy9RpLY5ZPjr2g0vS5
 s6XA==
X-Gm-Message-State: ANhLgQ1ypThuym0okRpgninYPDID6hIp2/raS8x9BHh0QhzTicGcnt8r
 kvRoWIpeGQhcHJh8U5giCzo=
X-Google-Smtp-Source: ADFU+vugdsGzgFN+OaMSh8GIdbOBTqJTbFY7Bf1RcbOY5iayw+k3mjf04T7pjf9FZyUA7ZWrmlCGLQ==
X-Received: by 2002:adf:fc81:: with SMTP id g1mr6194455wrr.410.1583247920880; 
 Tue, 03 Mar 2020 07:05:20 -0800 (PST)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
 by smtp.gmail.com with ESMTPSA id f3sm4230061wml.24.2020.03.03.07.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 07:05:19 -0800 (PST)
Date: Tue, 3 Mar 2020 16:05:18 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 28/33] drm/panel-simple: Fix dotclock for Sharp LQ150X1LG11
Message-ID: <20200303150518.GB2856480@ulmo>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-29-ville.syrjala@linux.intel.com>
 <c9f756da-ba54-bfd6-87e4-4e52e3e7cecd@axentia.se>
 <20200303142031.GA2856480@ulmo>
 <eacb0bee-730e-edea-3c60-88dcdc67f604@axentia.se>
MIME-Version: 1.0
In-Reply-To: <eacb0bee-730e-edea-3c60-88dcdc67f604@axentia.se>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: Thierry Reding <treding@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1296864104=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1296864104==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 02:57:45PM +0000, Peter Rosin wrote:
>=20
> On 2020-03-03 15:20, Thierry Reding wrote:
> > On Mon, Mar 02, 2020 at 10:53:56PM +0000, Peter Rosin wrote:
> >> On 2020-03-02 21:34, Ville Syrjala wrote:
> >>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >>>
> >>> The currently listed dotclock disagrees with the currently
> >>> listed vrefresh rate. Change the dotclock to match the vrefresh.
> >>>
> >>> Someone tell me which (if either) of the dotclock or vreresh is
> >>> correct?
> >>
> >> TL/DR; I do not care if you change the refresh rate or the dotclock.
> >>
> >> The whole entry for that panel in simple-panel is dubious. The panel
> >> is really an LVDS panel (capable of both VESA/Jeida RGB888, selectable
> >> with the SELLVDS pin).  With Jeida you can, as usual, omit the 4th
> >> data channel and use the panel with RGB666. In either case, you need
> >> an LVDS signal and nothing else...
> >>
> >> The panel can also rotate the picture 180 degrees using the RL/UD pin.
> >>
> >> These options are of course not expressed in the simple panel driver
> >> (and we have always used fixed signals for those pins in our designs,
> >> IIRC). As far as I'm concerned, the panel can be removed from
> >> simple-panel. Our device trees are nowadays correctly expressing the
> >> hardware with an LVDS encoder between the RGB output and the panel
> >> and points to the panel-lvds driver for the panel.
> >=20
> > How do you make sure that you always bind against the correct driver? If
> > it matches simple-panel and panel-lvds, it's not deterministically going
> > to pick the right one. Well, it may actually be deterministic on Linux,
> > but perhaps only by accident.
>=20
> You are probably right that it's fragile, but no problems so far. That
> said, I did wonder why the panel-lvds driver "wins" over simple-panel for
>=20
> 	compatible =3D "sharp,lq150x1lg11", "panel-lvds";
>=20
> I figured it was by design and didn't spend too much time thinking about
> it. Maybe I should have?

It's most likely because panel-lvds.o is linked into the kernel before
panel-simple.o and the first match wins. You may want to move the entry
to panel-lvds to make this a little more robust.

Thierry

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5ecisACgkQ3SOs138+
s6EqQg//WQs3/pUCCU/R7DC5MiqHZj7bO64hFy0oq37j9i9m91B6jedODTNukp3D
UrlM74NqJ/jcRtcdcyUoa/xpt4/aMRp5k2lASbr9hIqHsHb3O5t0jLt27PdD7IRL
Y0bUZ0AadlTjmDnAev23A7iyqX9dE5Xwk8jYNaaSMpBfe/CJWPmCyspkiSI0ib55
bvv1tarf+Qg8CkKVonUZpT6MMfxKLo5LUABUpeXL1xNVvzApc1z0SXclODdGq5lf
mD2AMUpjk6JqRX+JnkuG/q65A+Ymqlxm69VNINiGWruhn5QYq+j2Ykib6bVnbpSG
o93m8tYWcSmuTbTYiBSB4Ia5y+05261cTRdg60m2L4Gxjo380r3JKctCGN4qqz4M
poPAK6mxs40EfF3Em+IYvTAJ0XEAIdonIw7X4P8emG3EmolEe9JIX8H7/WZeVTNM
Ma6C9hpDqOqDPs6NkQRS0MylCF9ysG4DgRt0FkksQ1uzLLThzycfBgPyYiIOWQ6m
8q0f4T4bxSEcVwSL/6klyzqEcd6PCMt2HMXjE4OYG52OWF2u2YbiMYBjcGSWjkWg
3mo2Ceq5M5x142i6jv7O4aNR3spo7Qmq7fwrD142lE3/5fYzIP5yqccbP0bCgmWl
bwMUn7z2N3AsPjmiNcfonm6MXIHzJi7Z4WZmIwSjeNxKB6hjhRw=
=amCa
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--

--===============1296864104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1296864104==--
