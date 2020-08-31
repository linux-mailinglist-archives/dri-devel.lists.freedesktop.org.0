Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDAF257A6E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 15:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714D989FEC;
	Mon, 31 Aug 2020 13:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D329F6E10A;
 Mon, 31 Aug 2020 13:31:34 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id l17so4040711edq.12;
 Mon, 31 Aug 2020 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aPqzHsM5MKsZpXEj+wl1ipe3o/zyPGbG+W4tvZQDabg=;
 b=VB2nX2Fkx5H+tT3R7ir0Ee5/3bfVK1+AdyrctM3WkZ9DGroXdeNfTn5zXfs0/iRfF8
 M1AdgQq8zfe8cFy+idyfWN2IznZa2/ehdUvDlu0gm4yiSa++ymoTyo/2Vq123Sa1TOD4
 Veb0LzJ67Yz16V3SXIeuvSTFqOgdW7NaksHPagXdUJAZ4584wI324BlfGNO6tGhjXeNS
 baPYCBy+Cghnm5h96VChaKCY5Nk3SumpfdU2dtVjygAhPi5zvBmUxBOkJdMjDooPz917
 M9IOXLLGTRBP9074lJmoEYSHVsKvv1u4ZcYtg19VsD7QJ4AmHRFmE/ZidPIoxgQ1Hlxp
 aR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aPqzHsM5MKsZpXEj+wl1ipe3o/zyPGbG+W4tvZQDabg=;
 b=d6SPxcO/tl9scqf9YyMb0wnsvSfWRLaq+nkVzcikJy6Eak5QtcsItOI8SrFOGmAGoZ
 Rsjdh2VDrVvVATWMa2sV58NqxBdaRlcKeHq0+spd48GtiaAD8tc/q7m0tPwP3yNd5xxz
 o0TWDJSpj+wUBhzz1ikQ/DHhHgv5lPV1CxVvwpPGkYAZkfbu8c14W9UN0zMQmpwAAUop
 c/E3ZCTJBqf5+GZB3xEub3KPGU5IPDfvJm0zh1NKdp+/V8ov9iwOVuS77ujsnl+vn4wX
 DELC417YrvHyJsGDOO1a3l2ll6YDiU6apxjuR4FgAwz5OVuBAVm4iobg14OZnBRGUara
 R9rg==
X-Gm-Message-State: AOAM532HZMd0CE3j4R3hUgrnqS/sNqIp1JMB84cKShZ8L0XKMCXFKLux
 9Ao8OHZPSawCBFn9delSLRc=
X-Google-Smtp-Source: ABdhPJwlL1RLvYdrkuhWTvnYwa2FN8xl7HMLKZbajad908u3apivBTfKuRrihh2hDD2cykCK/TpV2Q==
X-Received: by 2002:a50:c909:: with SMTP id o9mr1288875edh.148.1598880693434; 
 Mon, 31 Aug 2020 06:31:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id k1sm2099888eji.20.2020.08.31.06.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 06:31:32 -0700 (PDT)
Date: Mon, 31 Aug 2020 15:31:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 07/17] pwm: lpss: Always update state and set update bit
Message-ID: <20200831133130.GJ1689119@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-8-hdegoede@redhat.com>
 <20200831111334.GE1688464@ulmo>
 <ac7375d0-f59b-cc9e-576a-91969d0d7cfb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ac7375d0-f59b-cc9e-576a-91969d0d7cfb@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1343427933=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1343427933==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qD3brAgIG4LbUq6d"
Content-Disposition: inline


--qD3brAgIG4LbUq6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 01:26:46PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 8/31/20 1:13 PM, Thierry Reding wrote:
> > On Sun, Aug 30, 2020 at 02:57:43PM +0200, Hans de Goede wrote:
> > > This commit removes a check where we would skip writing the ctrl regi=
ster
> > > and then setting the update bit in case the ctrl register already con=
tains
> > > the correct values.
> > >=20
> > > In a perfect world skipping the update should be fine in these cases,=
 but
> > > on Cherry Trail devices the AML code in the GFX0 devices' PS0 and PS3
> > > methods messes with the PWM controller.
> > >=20
> > > The "ACPI / LPSS: Resume Cherry Trail PWM controller in no-irq phase"=
 patch
> > > earlier in this series stops the GFX0._PS0 method from messing with t=
he PWM
> > > controller and on the DSDT-s inspected sofar the _PS3 method only rea=
ds
> > > from the PWM controller (and turns it off before we get a change to d=
o so):
> > >=20
> > >      {
> > >          PWMB =3D PWMC /* \_SB_.PCI0.GFX0.PWMC */
> > >          PSAT |=3D 0x03
> > >          Local0 =3D PSAT /* \_SB_.PCI0.GFX0.PSAT */
> > >      }
> > >=20
> > > The PWM controller getting turning off before we do this ourselves is
> > > a bit annoying but not really an issue.
> > >=20
> > > The problem this patch fixes comes from a new variant of the GFX0._PS=
3 code
> > > messing with the PWM controller found on the Acer One 10 S1003 (1):
> > >=20
> > >      {
> > >          PWMB =3D PWMC /* \_SB_.PCI0.GFX0.PWMC */
> > >          PWMT =3D PWMC /* \_SB_.PCI0.GFX0.PWMC */
> > >          PWMT &=3D 0xFF0000FF
> > >          PWMT |=3D 0xC0000000
> > >          PWMC =3D PWMT /* \_SB_.PCI0.GFX0.PWMT */
> > >          PWMT =3D PWMC /* \_SB_.PCI0.GFX0.PWMC */
> > >          Sleep (0x64)
> > >          PWMB &=3D 0x3FFFFFFF
> > >          PWMC =3D PWMB /* \_SB_.PCI0.GFX0.PWMB */
> > >          PSAT |=3D 0x03
> > >          Local0 =3D PSAT /* \_SB_.PCI0.GFX0.PSAT */
> > >      }
> > >=20
> > > This "beautiful" piece of code clears the base-unit part of the ctrl-=
reg,
> > > which effectively disables the controller, and it sets the update flag
> > > to apply this change. Then after this it restores the original ctrl-r=
eg
> > > value, so we do not see it has mucked with the controller.
> > >=20
> > > *But* it does not set the update flag when restoring the original val=
ue.
> > > So the check to see if we can skip writing the ctrl register succeeds
> > > but since the update flag was not set, the old base-unit value of 0 is
> > > still in use and the PWM controller is effectively disabled.
> > >=20
> > > IOW this PWM controller poking means that we cannot trust the base-un=
it /
> > > on-time-div value we read back from the PWM controller since it may n=
ot
> > > have been applied/committed. Thus we must always update the ctrl-regi=
ster
> > > and set the update bit.
> >=20
> > Doesn't this now make patch 6/17 obsolete?
>=20
> No, there is no guarantee we will get any changes soon after resume,
> so we must restore the state properly on resume, before 5.17
> we were just blindly restoring the old ctrl reg state, but
> if either the freq-div or the duty-cycle changes, we should
> also set the update bit in that case to apply the new freq-div/
> duty-cycle.

Hm... I didn't realize the driver was already saving/restoring context
before this. And from a quick look through the subsystem it looks like
I've done a pretty poor job of enforcing the "no context save/restore
=66rom PWM drivers" rule. There are some cases that have had this support
since before we realized that this is problematic, but I think at least
pwm-img is newer than that and should never have had that code either.

> This actually also helps with that case since patch 6/17 uses
> pwm_lpss_prepare and this makes pwm_lpss_prepare set the
> update but unconditionally.
>=20
> Also on resume we most do the set the enable bit vs set
> the update bit in the right order, depending on the
> generation of the SoC in which the PWM controller is
> embedded. 6/17 fixes all this by resume, by treating
> resume as a special case of apply() taking all the
> steps apply does.

As I mentioned earlier this works only under the assumption that the
suspend/resume order is correct. And that's possibly true for LPSS. It
won't work in the general case, though, because a backlight could end up
suspending/resuming completely out of sync with the rest of the display
pipeline and that's not something that we want.

I would expect that on i915 you also do have a controlled call sequence
that LPSS is part of, so I would expect that some consumer would
eventually call pwm_apply_state() and then any new settings would get
applied. Yes, that may perhaps be not immediately at the point where the
LPSS resumes, but it should be exactly at the point where the consumer
wants to enable it and therefore the only point where you can expect it
to make sense to enable the PWM.

Anyway, if this really turns out to be the only way to make this work I
can't object to it. But if you do rely on this, perhaps just make a
mental note that this can lead to sequencing problems that you may
potentially run into at some point.

Thierry

--qD3brAgIG4LbUq6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M+7AACgkQ3SOs138+
s6HLbg/6AyaDGIE21Hd2kKR7CDTpT5efxrkOKlOS4Yg4EM+qelfF8m1qy7QxRw9o
9Fn3ka65YyfUJh0Mj6Ehei1LGrPjb2g4NPHj5ZB7u2AfUR4GFkFlRA+BgYxFiSZD
lDll4js7IYQz0TW7dQRs4Gcc8aM9YsFQcEJxw8FBWx4J6BtYYHtlY3qQqavg6yJB
hpoCp6UF+7YnGat98RznOeKv9yPXaPMlaiq79uNuRWx54h6qisKhFhHCIR6DUzRC
rbrugmGcpgo4pTSJAI8I6lGpFmh9SpgkCpGD48qGUttZEBRo+BmczVHPl7NfGxBk
/IWY/FhBF9DLJJrnrPVNs49lU9NpCdGaH3jzy7cSASzedaohuGGGylMh42nN3hdN
y1+uQD5AnxWKcXVPCC/7z+YtLC+N3beyJ+5yiWPY8j3HEdgeqP8TpGTZRZN8rMn9
catqW83SLzGk0FftHSQ3z6rR4v0qHU4kZEMF8I8n4ECdw4PWmMwNpysgFPnoiQ8T
POWvSKp8Htc7x3gOS0THiqdLpFl3EFXXqzLTbu6LKe8W+uDFcvF15xUDfX+sdbhy
YxG2fjPThhWDteTlVBACY/3/G3VX/QzTVPJMHhu/nP52H8y5PNtdlO75ZqVxJZJR
GC4FCJMrW0/dUTMbEPk6I9jKaxXW3qYig5xdQBn3hZmzE0kSdBw=
=/Vi0
-----END PGP SIGNATURE-----

--qD3brAgIG4LbUq6d--

--===============1343427933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1343427933==--
