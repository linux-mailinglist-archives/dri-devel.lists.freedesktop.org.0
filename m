Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83710B29CCF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 10:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA31210E3F7;
	Mon, 18 Aug 2025 08:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0Pox8SE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41B410E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 08:54:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3b9e4147690so2657287f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755507275; x=1756112075;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yzToNQB1ac48NZYa/jSZx0h1+/4yVpTKx5PmVgwy9lw=;
 b=0Pox8SE7b8Owd6pyh/KJMEc1rVmPlf52R1BYxt3/LZsqlVzXvQx/9I4TLWdZQjk94e
 O8Inxo17SLtb26zfZfLAZldJnbnpO9JBjp+cDFPUjVYvS4a4kGrL4/WC6h1xjBx/DiP0
 elIRMTCW7A8iLDy2T8DpFqv41WUskQKogMUyK/CjawJeSBWAH1tIC0yDI72tuU3Dgly4
 6bH4uveU/vwqstnA1lAbgnDa9aimljEIqAECa70dPFlbRZOGNfRvk+CwtnwGC3oF5bON
 CY8cmR8J2wOwUV461QgafgedHjWq0wsmhVD8r/Jjz0CQzhbOEbk7Jxrw5uXcKPJGX8UE
 iuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755507275; x=1756112075;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yzToNQB1ac48NZYa/jSZx0h1+/4yVpTKx5PmVgwy9lw=;
 b=aYkr3LWgLFqyHl8keKxQXnutW3SsNnamPHMzByxoBbHv7zJEfV7PAuyEWOaTMNOssk
 AVvRhF4+Uw2fq3xxxj/D1aRRI3j+jGxi40s0onzMyiLvEO1+IixAnRIEcB3afUmNyWqw
 bNxGJIJwpGhCydsCxSpLvZS0iZqHmV98+D6Ha/6EZv0ep+qa69FFuiBHaMu2RjZqMDSl
 pWFwXkKcaY4m/jGizWzfqCSD3tAurCkp6HMp+6VjJUKG7+8t9ovKDBNNkaDmul9QwynF
 opTwXEENJ4VlsdCfq4oDTH5nB+ZGvJVoaXGsnnnswJZ0sTm3lU5z94NqtCu4IwixfHkq
 YpNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/cstY9KAZvUF+esGeG1Ed1eEz8x/+9qjDcYSSl72HlO0Orp2dNC0nQukJBsiPyFzi8U1dLDhdXjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkK8foV/Fp8NVd3RbmRwnY7i7J5soHPiovG0pU7A5/oH8f5Yn/
 vG5l66TF9oq3mpvfT5ZTZUW00wegZo1keFewXpH+mUOfNMuFu1yTND+uU72Ds+eZ6Qc=
X-Gm-Gg: ASbGncsYVZ+EMhddM9N7WUeoVBunPhVM1yaDp1mv+BKVquFEDj+e0f07Ce3M7vWVt6z
 X00FyAafhb4Sg6Jik5GJvNfiHl8iZy/9IeKaPC0Ya35N7Q+HcUML+T71C+girmXgZCPjxAX+B0z
 YmDNfKCCRdYA+q/ZJxtoEIBe7pZ9FR62LxnhwI7jWIK/RG9O0rcYaGFbbOMzWLn9vjQ9PPZX3H6
 XKSOg+3NhQEBFcmxAWuo/HEfppgZXYEEggUwESZ+SeR7FL48ZOPITGFymJZlVpC610BA2B4n1j4
 N7CWFZlAS6rvcrFIzB1SYJyk6A4e5Kc/DTi8fvpz3pzfIBfi2AszkXBwtTDSl7RMH7H4abg7yUd
 hTRnFuEVS8A+9H3eyqW3Wi6AyDefkv/eMglLBNp50uVwVNgUVfPJrB1lss+TC27wIJbMP7sDNax
 w=
X-Google-Smtp-Source: AGHT+IEjb/2Ecpb+kxAH67VL36yellRdOhcyrwFdMWOILwnY1/hcnVkn+GO8YTuvm1LTkn3PqL6oYw==
X-Received: by 2002:a05:6000:3110:b0:3b7:8d2a:b33c with SMTP id
 ffacd0b85a97d-3bc68b89bb2mr5015330f8f.18.1755507274964; 
 Mon, 18 Aug 2025 01:54:34 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3bb67c902dbsm11987438f8f.47.2025.08.18.01.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 01:54:34 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:54:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: FLAVIO SULIGOI <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
Subject: Re: EXTERNAL: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
Message-ID: <5i6t3eoockbq6kgu4n2jq2gcrzt2mmippc5oeobmfcah6zzf6r@jp6nqsgnbifv>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
 <PH0PR22MB37899F7A6262C599400AF912FA4FA@PH0PR22MB3789.namprd22.prod.outlook.com>
 <lv6otiqcqa434anam2gx4czhh3jac4stlkl6w5aasqlb5c2ohj@mzvf4gc2bxsz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="muofh3xiwo3yopfe"
Content-Disposition: inline
In-Reply-To: <lv6otiqcqa434anam2gx4czhh3jac4stlkl6w5aasqlb5c2ohj@mzvf4gc2bxsz>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--muofh3xiwo3yopfe
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: EXTERNAL: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
MIME-Version: 1.0

Hello,

On Tue, Jul 29, 2025 at 10:17:20PM +0200, Uwe Kleine-K=F6nig wrote:
> [Updating Daniel's email address as the linaro one stopped working]
>=20
> Hello,
>=20
> On Mon, Jul 07, 2025 at 03:44:25PM +0000, FLAVIO SULIGOI wrote:
> > > the first patch of this series is what I really care about: There are
> > > hardly any drivers left that use pwm_apply_args(). When all of them a=
re
> > > converted to not use it any more, I intend to drop that function.
> > >=20
> > > The 2nd patch is just a change that I noticed while editing the driver
> > > that is IMHO nice. If you don't agree and only apply the first patch,=
 I
> > > won't argue. It's an alternative approach to what Daniel Thompson did=
 in
> > > commit 7ee6478d5aa9 ("backlight: mp3309c: Fully initialize
> > > backlight_properties during probe").
> >=20
> > I've tested your patches on my board and all is ok.
>=20
> @Flavio:
> A Tested-by in this reply to the cover letter is understood by b4 (which
> is the tool most maintainers use to apply patches from the mailing
> list). So there wouldn't have been a need to reply to each mail
> individually.
>=20
> @backlight maintainers:
> This patch didn't make it into next yet, I guess it's too late for
> 6.17-rc1 now?

Confirmed, it didn't make it into 6.17-rc1. In next (and also v6.17-rc1)
we have:

$ git grep pwm_apply_args next/master
next/master:drivers/video/backlight/mp3309c.c:          pwm_apply_args(chip=
->pwmd);
next/master:include/linux/pwm.h:static inline void pwm_apply_args(struct pw=
m_device *pwm)
next/master:include/linux/pwm.h:         * PWM users calling pwm_apply_args=
() expect to have a fresh config
next/master:include/linux/pwm.h:         * pwm_apply_args().

so this patch series is the single stopper before I can remove
pwm_apply_args().

Can we please get this into next for 6.18-rc1?

Looking at
https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git I see
that the branches merged regularily into next (for-backlight-next +
for-backlight-fixes) still points to 6.16-rc1 and 6.10-rc1 respectively.
If that means I should better take this series (or at least the first
patch) through my tree, please tell me.

Best regards
Uwe

--muofh3xiwo3yopfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmii6kUACgkQj4D7WH0S
/k5rzgf+KEnuQYMq2SabE/BY/wyuF9VF4syK7d72kCDkixmZjqmu1r7iYVsU+8jq
7/IZ1zQPMOcpV5Rnj95HffihEaM+WvkuE9N3md2D1c7IHMB36HVKQaLkZ9IoT8LN
olUV+W6oMSiAkCRn5b/bnVzhe2xwjX02hrzQLyyEJjWa8LubFQ95fT2tFohjeDcG
MPQF+fHEGjZTHXFMwWA7lv+Fozut+k8E6rMLEVtLVfGr5mYCMkIpBUC5BVKa4tYS
dqbW9FqyW7gXry8+RIJSYAxGT2wxaSi1dknjgacPgZ/nOBlnZdUobyXNhTS8zsgt
7yTEBjqwIGBVy/6OgADbGlCjZLyrQw==
=jQuo
-----END PGP SIGNATURE-----

--muofh3xiwo3yopfe--
