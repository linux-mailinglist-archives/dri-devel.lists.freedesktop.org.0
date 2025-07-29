Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CDEB14E18
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 15:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDE710E21D;
	Tue, 29 Jul 2025 13:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CMw3OH5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD4610E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:07:57 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-32e14ce168eso61342691fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 06:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753794475; x=1754399275; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MBe2c0lwAQ20+tn4Yt0NFFbBlv0wC7hPqoyYxcY01+c=;
 b=CMw3OH5lWpFpZySJypRQjYA8U6B5c7p3wjC/d5AEqWuP5gC1aTpec9vOfRlT8/xrK4
 1N03ibaUcI3bLlgPskHoxjfyzE+obH+4HPyxZrMQKm28ajV9mhDQEn7u6H9zhgSlBBi1
 9R7U1VQYmGRVKWMCXKCXo9QyE57izK7EJD/o6HicK+1zRQHHWuF+CsFNbkBID5gxYlou
 zBG2hIt3meSP2e3q49ZkCj+QnEz/d6O2vRn1/boiXixkVpZxnNboKwFBabnyBSMgjJBz
 FjeP9ONLyZ6FiigPhoK0esRjp5yG4HI52ZS4KBWZxhpMUZq/qCrtGc+lSc5xM4SV4Gwk
 /P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753794475; x=1754399275;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBe2c0lwAQ20+tn4Yt0NFFbBlv0wC7hPqoyYxcY01+c=;
 b=DdtmwEpuUKR3kGAvHE3JRdvqgSDcBwiJviyx+kKwUmHs0I4xHgvukBd2pzcTa7TNfe
 t5E8Bq6mjZWmDBJ4nj9YVjgMLC7tzRZO0iSbTuOVEPEOkiGl5mflmqgMMZrHsVr5NxtR
 YmSdFj0qMo31So6FrEqGZC8xwaU4U/ZZmHRcrwgta7985SuxUl4lIwxSx2Q+slMyCLc+
 105syQHSIvvnCAmX+3Z++LtV6EsmQnbBt6AripMiWzFO41Z6wV0iL2MlEokSchM2LqFY
 tarjHYPNITThrRHBlXKsEkHahqCXWS9+j/URvnSYeCJ7jZN4vgfEbySIICFlfCU4ioYA
 l7bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUeSd0fGGs/3UV5d0LMYy058xoz0sXfD2nbq+0U0AnCRVmYgtsrCXY/llyrzrqLUOejHhUO7Df3v4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxovT+KkwYjjp/tyRoyy5X0TGSdnOmgOdwbvUu0ubwX7onl1iKB
 t39Sx0W8RlxkYVZD4a4s0Y4dcSVLY1HxYqZrNevro7bilgnfTjDQJumN
X-Gm-Gg: ASbGncsMsTSOjn/1aq87nYfhsU/r/CaWoSMH/dEpsUnDq2uaRIHYUpX6d+nli2gNfIC
 OxaOoRhtn5n3OwAj+Plee8fI9IKnHuc2Yu5K8TE3u3zvZA5F84psUEDXKINsBFhbSYZ1vZEdYNd
 QOQEJGdc2pKPv2f2TPq+pmCc+FroFNb4JU13OEXRxrmQv8B5WKGE1gGzuCNpeCq8VND4c0rvh7J
 HTIAiFcxLCSke/9eeOQzs9yiM+Hc/i0N1oROG0yT/D0v9fyjbWH+3BsJLuukT1nUHjOuNgR3BAl
 DtO+OPTpiwKAhEToRfcMJcOF4h6vFK7Ev1G801fpP7D5sZvnRmbI33ufHGx2dm+Hj333RT2H+bU
 4FtbB1rTNKX5+IB+y6Vc574td5F0qDfayWCDYPjl3QlK0P1qsteNblhJz4bA=
X-Google-Smtp-Source: AGHT+IEOLM70tlkReLeYdoB11Jx9OgwXfRo2bd1DL3h+FQZIBragJKJj7iLvkRL8wVB4DF7MiS1gKA==
X-Received: by 2002:a2e:a98a:0:b0:32a:74db:fe73 with SMTP id
 38308e7fff4ca-331ee733b68mr57359851fa.28.1753794475059; 
 Tue, 29 Jul 2025 06:07:55 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f40a2f3esm16323231fa.34.2025.07.29.06.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 06:07:54 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:07:52 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sitronix/st7571-i2c: Remove unneeded semicolon
Message-ID: <aIjHqAB1Kkq6Zino@gmail.com>
References: <20250729042620.2057603-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kNrapcqmsUN3Vipw"
Content-Disposition: inline
In-Reply-To: <20250729042620.2057603-1-nichen@iscas.ac.cn>
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


--kNrapcqmsUN3Vipw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 12:26:20PM +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
>=20

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

--kNrapcqmsUN3Vipw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmiIx6EACgkQiIBOb1ld
UjL9/g//RPodx9Aa1+1YVipIoqc7kS3ym5tzMJIo407F6n0l0yXfK8Obvnm6xxhQ
b68Cjeg0RPG3P8cZM1Qahe6WDa/P+hm0XtbFKbwbuMoqT5TuZtfbGH2M/tUp7z8M
ZxZQG9fpw7k1aZX8VhhqCFi64BIF+TgM/LxFFuUTkRFefc382M7I1hKrIvQZvhTG
RWOqEIVKViY71YuWEfO4y/Y4iS87HofbAWNwZaJA2jDtxjnRFSxXhNAqCLqD2CA9
2Q8a0d1w7M6PbmV5/V6tZmfE8+jB0pkpe4DpY8Sx991P4CDYOXCLsTfm/sqvCfnH
bCpRgJahNEYaMP47MwYYrGDTMzR8qQU4xAKDZrXSpSBkUhr3GGRAze5TucIjuP1e
vSCxMVQWZf+GZRigH3xim0crlNlsFQ/3WA30sdK2I/l1DGI34u+BFSSH0RDaZwJ1
Rhk09kJmgQ1C2mIDwjaLGhgzU6DsvUp2Zh81WKc53tME/wpRCUqQutN+D9Jfrz/q
EW94tq8aZVsuyXKWEyMzrRG3DvajjLZGjJMSeGJn/FG4A2woiaTCBRY/CNb/4j4E
pC2UA38NtcT2O/0UQmKClKYRcdOoH3uxlGTWRMrgbbEOYqESIT03X5wmOcCZoDFN
6bSFdF7vN5ge6/iTepuSdDqQJU0rcLCb9GnyEjflL3J+dIfCpnY=
=FwcT
-----END PGP SIGNATURE-----

--kNrapcqmsUN3Vipw--
