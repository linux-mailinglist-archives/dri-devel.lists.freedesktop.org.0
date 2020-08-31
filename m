Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F992577FD
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CC26E096;
	Mon, 31 Aug 2020 11:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C534A6E096;
 Mon, 31 Aug 2020 11:13:37 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id a26so7985435ejc.2;
 Mon, 31 Aug 2020 04:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uiq1cUbeSmf2nROOprhl6mdhCamogzxlqoFdXIf/qZc=;
 b=RHtLyhrBolt+TqeMaC05hisXL+7NqI+w+tPDmltM/9ec6jphOiFza+z7K0gIL6yaE3
 0TveumY7Dam8sD+gksH0BTTvluilSvEsvFcdrGEyJ0MCYIWeb2/D4eDHILXHeBSQeb0E
 Mx5Cme7LUSDXCwmNFXq3mExTd3LYHLVjc5joIz1oJz0DyaPosdVj+Ibg/mQna0Mj9q0j
 FYNK/G8X/XlcLssTORZlw9ii31FZ8fzcKx/XtKDsY4c4/1HOLJum4LbOYVa8EOXIAy0M
 lqqv99GcvoDCNw2cQDEfLvuKEs0r7EWZ40iu89PrSRZywO/4YfaF9yCz7JG//icpcbnA
 csYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uiq1cUbeSmf2nROOprhl6mdhCamogzxlqoFdXIf/qZc=;
 b=V8/yyBXVimG/FuaFK/hbI8aFpndqKpa+dAT2mr2qfbqTU9Fky7lWadzIrpemicTE+x
 X7HVG0PP8RefQpLXNeYvs30qjfJ2y6QtQ5A21Cp3bbmesl6BDi2O41JP7HALH2zq+0EP
 kNU1DTVsFSo7NLB3VvBUxNHskVVG3+OLZBZxWCyjcNeFyX/rByHmmh2nDITIXGRDR60g
 cm7e1jk0k852oPdH+tv+HUvXaG8NQDblWiGqyokvMq5XczpnKEBUP3TUlI/cO7GMVpq1
 Sj3rRd5Ub8nDXE8PPygPOLWhk4nrc3NYi/14NxcAq7lrHAAa3+Y4vzM7xoqNe7mOMXqM
 7PKw==
X-Gm-Message-State: AOAM533eymbV0glZVTutHo1rcgihy0AG7djCJDpiw3E7KVWvZu3tIN5U
 PfiUP/4Sz+QaJClifOyRAhDGU5HawJ72LA==
X-Google-Smtp-Source: ABdhPJyAruYaY1SfCiv4fAG8Io2yH/p+frp4A4m4mXAV4OCTvuDbkVMW0zkXM9YEDu4/QZMqfL8glA==
X-Received: by 2002:a17:906:3993:: with SMTP id
 h19mr663058eje.111.1598872416458; 
 Mon, 31 Aug 2020 04:13:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id q13sm1747540edr.27.2020.08.31.04.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 04:13:35 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:13:34 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 07/17] pwm: lpss: Always update state and set update bit
Message-ID: <20200831111334.GE1688464@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-8-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200830125753.230420-8-hdegoede@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============0398778679=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0398778679==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline


--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 02:57:43PM +0200, Hans de Goede wrote:
> This commit removes a check where we would skip writing the ctrl register
> and then setting the update bit in case the ctrl register already contains
> the correct values.
>=20
> In a perfect world skipping the update should be fine in these cases, but
> on Cherry Trail devices the AML code in the GFX0 devices' PS0 and PS3
> methods messes with the PWM controller.
>=20
> The "ACPI / LPSS: Resume Cherry Trail PWM controller in no-irq phase" pat=
ch
> earlier in this series stops the GFX0._PS0 method from messing with the P=
WM
> controller and on the DSDT-s inspected sofar the _PS3 method only reads
> from the PWM controller (and turns it off before we get a change to do so=
):
>=20
>     {
>         PWMB =3D PWMC /* \_SB_.PCI0.GFX0.PWMC */
>         PSAT |=3D 0x03
>         Local0 =3D PSAT /* \_SB_.PCI0.GFX0.PSAT */
>     }
>=20
> The PWM controller getting turning off before we do this ourselves is
> a bit annoying but not really an issue.
>=20
> The problem this patch fixes comes from a new variant of the GFX0._PS3 co=
de
> messing with the PWM controller found on the Acer One 10 S1003 (1):
>=20
>     {
>         PWMB =3D PWMC /* \_SB_.PCI0.GFX0.PWMC */
>         PWMT =3D PWMC /* \_SB_.PCI0.GFX0.PWMC */
>         PWMT &=3D 0xFF0000FF
>         PWMT |=3D 0xC0000000
>         PWMC =3D PWMT /* \_SB_.PCI0.GFX0.PWMT */
>         PWMT =3D PWMC /* \_SB_.PCI0.GFX0.PWMC */
>         Sleep (0x64)
>         PWMB &=3D 0x3FFFFFFF
>         PWMC =3D PWMB /* \_SB_.PCI0.GFX0.PWMB */
>         PSAT |=3D 0x03
>         Local0 =3D PSAT /* \_SB_.PCI0.GFX0.PSAT */
>     }
>=20
> This "beautiful" piece of code clears the base-unit part of the ctrl-reg,
> which effectively disables the controller, and it sets the update flag
> to apply this change. Then after this it restores the original ctrl-reg
> value, so we do not see it has mucked with the controller.
>=20
> *But* it does not set the update flag when restoring the original value.
> So the check to see if we can skip writing the ctrl register succeeds
> but since the update flag was not set, the old base-unit value of 0 is
> still in use and the PWM controller is effectively disabled.
>=20
> IOW this PWM controller poking means that we cannot trust the base-unit /
> on-time-div value we read back from the PWM controller since it may not
> have been applied/committed. Thus we must always update the ctrl-register
> and set the update bit.

Doesn't this now make patch 6/17 obsolete?

Thierry

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M214ACgkQ3SOs138+
s6HyQA//Zwteh6ZasvMpgdOFoCOqkNNdUxkzeajsfMOU4r10Pct+JMdgrO00IMHU
kA/i5QzOtv4OC6h2t9U3OgDtgmY0CogC2nPDaoXv8KJu2zLja14rC5q1W7UDc3pX
aoBmVcpV+YdKBUvVVRBDNpPsUK4UkXNgECs2k3RUfr5lFLeNtklzoItLh/cgYD10
bt9+p5NnXGxwFWL1uSQef1dcGq/4MM6p7V+fS/xX+rMNoCEQMWfGhCJTX8N4172v
h7G5rdAGLzhRPthHpA/yRiWjM/+lLNmjKzlu1O0Iso9K2CYxzE5MDFkuinaTUMiY
kS6h53tjittvDFDdDPuXWHDFqO0oBjVSGjnl+OjZyAeWBPND0fr86e2xtPcJIDA4
DGoiuo0egkl0aaAZCZR1+h6k0Wt0ZPzfj1vUrShq13wbqG8ecdPcR3nlMaOCISXp
pr/NjfRvgtefjMES3FnKWFHZJBJFMMC/t+/ZNqOfbqVputSpd5KplEepoQuRjaSA
6BkGixZ2jQckDfOX1ic8q7BxuExoPOMpOZj/XDP7z1jnaYlZyEVB/5dA1daf7Wwj
05YImBmCuutqfQY8Qe5B31KYSmynXkaU2CQIQyjlc9qW+L0AFvY9jXQhLEiLpX9v
Ty0yRAYBGU/6X6MKLBw+ZoMG2eWxz3BoOrOXEuua1JBBj9sXBx0=
=qh5h
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--

--===============0398778679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0398778679==--
