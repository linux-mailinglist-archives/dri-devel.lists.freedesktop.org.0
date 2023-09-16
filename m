Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4F7A2B23
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 02:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2E410E6B4;
	Sat, 16 Sep 2023 00:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F2410E6B4;
 Sat, 16 Sep 2023 00:05:13 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68fc9e0e22eso2262206b3a.1; 
 Fri, 15 Sep 2023 17:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694822713; x=1695427513; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uBFU91Ab8Ty50yBCscF+Su8H4xiggY1DMOJHupjwHzg=;
 b=Gpvf3UXxTu/PnH0KuCmdqSVjYb9YOM062pMEITnAWoSgRYgPhArcDq54iLhcA+bZJ4
 flXXW2rxtFrsye+YmjCfauM3cS3hgvT+lqmaHvc+Yw5YsG12QQ3D4YCsr+hBcVAiGQfn
 N1tJ877eY6KVZGqpXG03g8zgc4OkGqSwZuaaQ4I06EEiq5VulphU8gWYr3ts8RjuChJB
 5xswhnV8b1YvL5TXGg96XKzWzDQTytkiyz5tMBrdbxBy8UNz3WQAdZvhjPOeAMmwgEV2
 EYWftvnTRMxobv5OoozBCO3UkvlCHCUJ2jgamL8HzPNF0nPlG2PBuNUUbh2hwOfsJ90G
 St5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694822713; x=1695427513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBFU91Ab8Ty50yBCscF+Su8H4xiggY1DMOJHupjwHzg=;
 b=dA5/PXjqs8EQdI7QfsID3Sc77hgqYyTOno3EaexvKRwGv7ujR9Na8qS0At0FAE6h9N
 QyCDFVb4zRy+YoONj9HHMPMCx3E/0BzDhrs9eBWt3jc+6ca0yNi6KlhRY7xbtqFJAMPm
 7TNLlMrZpZvgOf8VAl4otJNkOUxjaOSAeSxNkNjBArt+dslay2yyjgpKwlg/SXtsHzVS
 HBm5Y1klenX4QVF5KNbBTNjj8ApAyoCK9WZkRFe8vfUGJRQmsPjPoDn5/nRWcp1ptF7n
 JjqKpVcQImPClPLS1gGJsxPLiqpbM91/ggxB2zEKVNYT5XzAjxv8CuK0rNOB2W3tYzMP
 NLBQ==
X-Gm-Message-State: AOJu0YyRublX04zD8YIBp7JXXu5xEorBvIyd8ERD49EJig2/5pjDe+Av
 9xTv1RCB0rCJ455NZJ1ZbK4mjYPABAs=
X-Google-Smtp-Source: AGHT+IF0Gziwgjs8IBkPNW32gp0eqmvsqmMuvS0x7PTIdUhgCFb6Vt3ZXEPLS8yJVzATlvoLr0H0cw==
X-Received: by 2002:a05:6a00:1588:b0:68c:4e22:8f78 with SMTP id
 u8-20020a056a00158800b0068c4e228f78mr3528463pfk.25.1694822712935; 
 Fri, 15 Sep 2023 17:05:12 -0700 (PDT)
Received: from debian.me ([103.124.138.83]) by smtp.gmail.com with ESMTPSA id
 c5-20020aa78805000000b0068ff6d21563sm3569946pfo.148.2023.09.15.17.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 17:05:11 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 33456811F023; Sat, 16 Sep 2023 07:05:07 +0700 (WIB)
Date: Sat, 16 Sep 2023 07:05:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Tester47 <e598@gmx.com>
Subject: Re: Fwd: Kernel 6.6-rc1 fails to reboot or shutdown Ryzen 5825U
Message-ID: <ZQTxM0JdyV8mpxbt@debian.me>
References: <2bc62c07-2195-e378-c057-f28e8d4a6034@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Xh9/EH8MO3HbfOrP"
Content-Disposition: inline
In-Reply-To: <2bc62c07-2195-e378-c057-f28e8d4a6034@gmail.com>
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
Cc: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux TTY & Serial <linux-serial@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Xh9/EH8MO3HbfOrP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 02:03:00PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v6.5..v6.6 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217905
> #regzbot title: shutdown/reboot hang on Ryzen 5825U (stuck on amdgpu init=
ialization)
>=20

Fixing up commit range:

#regzbot introduced: v6.5..v6.6-rc1

--=20
An old man doll... just what I always wanted! - Clara

--Xh9/EH8MO3HbfOrP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQTxLQAKCRD2uYlJVVFO
o8rgAPwIzBXYXKeK6pcEOYV2weLfbQUqgqPF2jOk3Ec5KM6KWQD/bUH8Sr/mt0Fy
cMDw3XSd1I3kgWf0GonS0cLKCV7tpQ0=
=kMdp
-----END PGP SIGNATURE-----

--Xh9/EH8MO3HbfOrP--
