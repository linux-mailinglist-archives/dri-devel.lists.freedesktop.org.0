Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058B6CF44F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3998C6E221;
	Tue,  8 Oct 2019 07:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFE56E221
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:52:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r5so18082253wrm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 00:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to;
 bh=RSVAzxvmOIv+u8w7CQ8RsCCLK+QmovemPwEtRxTysLo=;
 b=AZv8nyjVuQIF6VumuJ/3gHPTXmBc8az9dGN4DuEY+7iJDzgIrCbGYqfafzfWuF/9bS
 XFZRkJEsA+nYPsi60LEaZiF0TxrPPvgvoiTcEycboMe/+BFuxraCgCGNAzCUaIaCFFqk
 p0db46lCYU59lF/xprN5UeTe6pPf6yPo4JfYujowbbJIf8Ev/8jfxBsxR6CgMZIObWMk
 hEcie5RKpDuPo1/x5pEXUWkJLEKWc1DpTzzE/Tuqx3Bi+yLuDra97JKBxyVFPbyDhA+3
 eUsRE85zPHsCyIBER8lX24LELIbey1g/Cjdgaa6O+/MUntVZXbI2qtoHa/x+3QDUy6h2
 W2VA==
X-Gm-Message-State: APjAAAU3/1nrxaqPj0S5aJzZGWrsrhTYW3/pLc8qM/oK678YAi2zP1L6
 8Codc3h2WV0j5VYcqu21SKtEyxYGABu3bg==
X-Google-Smtp-Source: APXvYqzuuSSdYYlsNVqyMDCsB6JN4fi2sMHMoE67awuZoLCV6ZdfTcGiwKP2MzG9q5osSJFzZkq4iw==
X-Received: by 2002:adf:b3d2:: with SMTP id x18mr27133910wrd.264.1570521136240; 
 Tue, 08 Oct 2019 00:52:16 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r18sm2825999wme.48.2019.10.08.00.52.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 00:52:15 -0700 (PDT)
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
To: Keith Packard <keithp@keithp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <87y2xzqimw.fsf@keithp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <62e06d9c-64ec-17c5-d89c-70ef6ac8debc@baylibre.com>
Date: Tue, 8 Oct 2019 09:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87y2xzqimw.fsf@keithp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=RSVAzxvmOIv+u8w7CQ8RsCCLK+QmovemPwEtRxTysLo=;
 b=XztelgeksfcqOh4Msw6cnVQBxor65Sz0KZNnJzEFv9g3XdYVjtupvGpdWCIQ2BaY6U
 LGm/lX4Xf2yssfbrfiweAlJM0MbPnSzl4P4Xx/JRocLkJ+hsVe8Yp/1QN6WInEfjfrSt
 zXe5GCKcVk9ReO3bnlAaGl1i7K/6jr1plxopeWnPRsKA9KuvbB+0WdepLzLYeuM27A7E
 1aHlXoDG1baAC67h2KxZz/CC2kx7kAp22h+fjhSJ5wDVpcDxB3v25yoFswY/1+I22iMe
 w7vQxtDDjMFskqB0cOoWeSu/zIdbTeiXPA+kF6Q1D4G0syj5PofIkMRus7Kgsf7fJEBF
 JJeg==
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
Content-Type: multipart/mixed; boundary="===============0910986528=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0910986528==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="2mto5Wrj1H91ZjHRyujczdeMAZjbvNeHc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2mto5Wrj1H91ZjHRyujczdeMAZjbvNeHc
Content-Type: multipart/mixed; boundary="X7r27OvfAwq9Ca6BxxoAfoCyWLfAWpuKY";
 protected-headers="v1"
From: Neil Armstrong <narmstrong@baylibre.com>
To: Keith Packard <keithp@keithp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <62e06d9c-64ec-17c5-d89c-70ef6ac8debc@baylibre.com>
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
References: <87y2xzqimw.fsf@keithp.com>
In-Reply-To: <87y2xzqimw.fsf@keithp.com>

--X7r27OvfAwq9Ca6BxxoAfoCyWLfAWpuKY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 05/10/2019 18:09, Keith Packard wrote:
>=20
> During XDC this year, we heard a few presentations and had a lot of
> hallway talk about sharing code for driving DRM/KMS for display.
>=20
> I think the general consensus is that there is enough shared
> functionality between all of the various DRM/KMS clients that we can
> start thinking about building a library that deals with the complexity
> of DRM/KMS and can help take full advantage of the hardware.

Seeing the description, it seems to be a libdrm with steroids,
why libdrm doesn't handle all this already ?

Is there a plan to maybe use it as a foundation for projects like
wlroots or drm_hwcomposer for example ?

Neil

>=20
> I've started writing up some ideas, mostly just goals, but also some
> random thoughts about how this might work. This is all in the
> 'liboutput' project on freedesktop.org:
>=20
>         https://gitlab.freedesktop.org/xorg/liboutput
>=20
> I picked a spot in the 'xorg' namespace, not to confine this to X
> systems, but to reflect the goal that this be a library shared across
> all x.org-related projects, including Wayland compositors, EGL and
> Vulkan direct applications and the X server.
>=20
> All there is at this point is a README.md file; I'd like to generate
> some consensus on a direction for the project before we start writing
> any actual design documents.
>=20
> Please submit MRs to that repo, or respond to this email as you prefer.=

>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20



--X7r27OvfAwq9Ca6BxxoAfoCyWLfAWpuKY--

--2mto5Wrj1H91ZjHRyujczdeMAZjbvNeHc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAl2cQC8ACgkQd9zb2sjI
SdHhCQ//cbUz133sPfLuu/5fTaKVTtn5E1NEp8rN9+SQ4fsPY86xX/xSxZTr3HUD
ljDkmmf5QvSH9tkB3PQO6XU2uCyTh59d4yq+KvKEaAAXAmhkeseXQ6BTZPZVaSV7
iFTbKE+pITDiotshjtVMrl4a5l49BeI85MLR2x1uRh42e+G7Axxy8/WRhSbbNTmb
3C0hi7YtBwXCguTwXgIfbSCdQsvQ66yzNXv7Tj7zSozrpLJyq5cfi5ZAVFr81hFJ
ruAWQsgMyFaCn4gDXWVk3l/x3htzWFzULwBKuh3vXUsD12h99m8K3s7bw5pR2Tk1
xYlmQ9ZyuX5qlsdVEE+4oO5Y+Gx3vuNrWnVEKvt+w3R1oihTykIP3SzHYjUkn19F
2I0LfEPUwh2oSRC3fw1+56kt0SSg9igMwvIWyQnzStHZimFmWBdf9O3Ddz6h4aGF
IIcDiMcZ4y+/PXSqNnNwgoN4/BSe9VdqmD5849CFHhWVdaG6ivi9/4IuTCJrJKTX
ulzpBm5mgCrNnSm+juMXf7ZP0I0kTEEjvEYxa/ucFF3Jr9S7k8HsKkCUC4DHyXk/
ziDDXJxhMPB37JmS/cUv0whhSTgSx1e705+CcfPpyOFgoqy4oQ+lUT3JTaKftCwF
s3h2DgJQZzlCV2QYRTHcyQOT+D9p4cyoBEsNuFMe8axCGdJOyzE=
=soyj
-----END PGP SIGNATURE-----

--2mto5Wrj1H91ZjHRyujczdeMAZjbvNeHc--

--===============0910986528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0910986528==--
