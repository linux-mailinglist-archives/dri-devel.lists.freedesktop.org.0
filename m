Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832EDC6C426
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 02:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA18110E21B;
	Wed, 19 Nov 2025 01:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SP4LfY1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB6F10E21B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 01:35:18 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-3437af8444cso6574043a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 17:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763516118; x=1764120918; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zs/dwUydWhNQ3xB5pbgWRyDUzvf3IvljLzh3ebv5mDk=;
 b=SP4LfY1Nj7EsP8FVvV7S0nLp4vSVmIi6WtAckWuDr5o0/SOkURgVJbnAzvhvYO88CA
 fEqbAfYQwAT4f0b8fwqp4vTVVMn/3z9H6c1C/1+hFrVTClfPH0AA/2vNSh7XL06hrGBt
 xoP8YSjVOxbBW8dxNbMXK+0v0NapAFNQUbHMZ0spRPFlmTRH5Xsi8BW4evpow1WO5Il3
 72Hedfjq7tYXJLbn5gLMch8spNEQMk5QUgnp05mxn2r5P3IvK/qdTYlpKfivqtC6Kvao
 FLrwEi2nmMGHQViUgqi16pWdK6f+Kcud3JxthgihZdZ5SQQ+4GvMOv47IwvUPI+2+Dbm
 qCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763516118; x=1764120918;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zs/dwUydWhNQ3xB5pbgWRyDUzvf3IvljLzh3ebv5mDk=;
 b=TClnuHASqyfjwj7S7lsgurNKnCRW6VQQVnVzVhv0QL02aPeHRw7qgmevh5C0blj7ZJ
 LvmkMXWhyQCirFA94TgjVWCerUtcrWJENmv9RCscYaUkdVshJvyrGuMet8N9jRXEKlp8
 HHQLYyfC6bGWeLk33vzZ5fDGFgA7KGTfgHaaXsf2v2IT+578wscrNsNcz1aI/pSyBYlm
 SyAzcrvgTYjH6npSoJTSbp09G8oU5T/98nqSinPp3H/WNcDN7XvZuQ/3I4wRd/4tN/Xf
 X2s7TNqUpefyRls9Ily5D1CHRjAwzWn5sudkgfTGq7OGGzR8IRanoin9spV+wGQEtHnQ
 LMtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxHzkcys+YATugcP5Gu7ANghjD0lZBl3SWj7F0H2k5GHwdgOYTOWBlJhVdAoHZPqY+lUxIqhVgZ9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV7ZWpH1K9UFeinamMMbkVUJ0QL9yBWuXzfrsoRdwjw/QxRHem
 K5RRMYOoT05FsP7BRloNSu5yr1gynq6W5udqeYwxj6rJm03qouHJXuH8
X-Gm-Gg: ASbGnct9T3sRyL/M3RW+gbc1UFu4NOKF0TLdZ/JodfI58o7rEGuC3NivfTs0hcsR40H
 NeikFHs8LAERhmouaLIwt97YlVew818UMuaSPbXbS+vEHHzYFFGPvELGQSTsMQI7xsltbsEX5Nt
 KalztQRm4XiIioxvaAxmtXfg4vhxbWyp6HLAwn56p2c/IIC0FJor+bSv/9r+2/yUVUlrZo1ZNv8
 pMXz67xl7bMG+EgoioQV3rTv9itExCKtEUHxBnujsbeqZ6XlZrVXU+xVK3FQKoXcD0TXivRwvwN
 vniQWqVYFBvGahzYB35dWHqTnxFjE5H/iiNs2r34FcsYlRHclG3lTsaRswlXe2jMW+9eQre8YnK
 kqlpRKT/sM+X54DsbAKmlUD452AwPOGNPSo9gS507hWv97idOAGGh+3oXT/8bUISJ2+dClArzBt
 oSxOAWp0h2QUN1NuqwFr164Q==
X-Google-Smtp-Source: AGHT+IFUja3/j3EoVg79fastISz1kS2CRT1ZWS1NK7BvrEoAPMWebw9Qo1+2OQ1pKE6G+mdOAAP4CA==
X-Received: by 2002:a17:90b:3a45:b0:32b:9750:10e4 with SMTP id
 98e67ed59e1d1-343fa74fc58mr20924125a91.27.1763516117776; 
 Tue, 18 Nov 2025 17:35:17 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-345bc25fffasm728132a91.14.2025.11.18.17.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 17:35:16 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 1C63F437DEF5; Wed, 19 Nov 2025 08:35:15 +0700 (WIB)
Date: Wed, 19 Nov 2025 08:35:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com
Subject: Re: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
Message-ID: <aR0e0rgrdXWIo8nI@archie.me>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7NG7/GLbwQ6+GyNO"
Content-Disposition: inline
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
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


--7NG7/GLbwQ6+GyNO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 01:18:10PM -0700, Jim Cromie wrote:
> hello all,
>=20
> commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
>=20
> added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
> debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
> mapped its bits to classes named "DRM_UT_*", and effected the callsite
> enablements only on updates to the sys-node (and underlying >control).
>=20
> Sadly, it hit a CI failure, resulting in:
> commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")
>=20
> The regression was that drivers, when modprobed, did not get the
> drm.debug=3D0xff turn-on action, because that had already been done for
> drm.ko itself.
>=20
> The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
> in both drm.ko (ie core) and all drivers.ko meant that they couldn't
> fundamentally distinguish their respective roles.  They each
> "re-defined" the classmap separately, breaking K&R-101.
>=20
> My ad-hoc test scripting helped to hide the error from me, by 1st
> testing various combos of boot-time module.dyndbg=3D... and
> drm.debug=3D... configurations, and then inadvertently relying upon
> those initializations.
>=20
> This series addresses both failings:
>=20
> It replaces DECLARE_DYNDBG_CLASSMAP with
>=20
> - `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
>   `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
>   the classmap so USE can use it.
>=20
> - `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
>   create a linkage to the classmap defined elsewhere (ie drm.ko).
>   These users can then find their "parent" and apply its settings.
>=20
> It adds a selftest script, and a 2nd "sub-module" to recapitulate
> DRM's multi-module "subsystem" use-case, including the specific
> failure scenario.
>=20
> It also adds minor parsing enhancements, allowing easier construction
> of multi-part debug configurations.  These enhancements are used to
> test classmaps in particular, but are not otherwize required.

What commit/tree this series is based on?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--7NG7/GLbwQ6+GyNO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaR0exgAKCRD2uYlJVVFO
o2hqAP9JIsHiw0TSJg1pW0e4Xips9yEj2FH7p7nP4ehEsL+1NwD+Pmi/0eq3gpEV
f7h988/+aMniaCsrVH8kEUCHA38UTAs=
=pou0
-----END PGP SIGNATURE-----

--7NG7/GLbwQ6+GyNO--
