Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA8969C97
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBF710E500;
	Tue,  3 Sep 2024 11:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fe1u3SX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757DD10E4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:58:26 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42bb885f97eso25899275e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725364705; x=1725969505; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E/ikXDun6/kV0dBrypUTxAftwyQ7HrFKU2RTsfBg4qY=;
 b=Fe1u3SX7m8SZPKz4g6ibJMyh8S7zCegrztcaWZIyRQr3KAT3cfFDvpJeyzhmpSKupZ
 r9gxiSKQjiqxkzFbcEPjnq2xl9zBi7OTZYiSROJGYi56sXDw87hLBQfDFpPcfx7lxQDU
 vnTat+3TZPUoghnos6wc9GV0QHHazg5IZMd5wBa0GOuAxeS0Ux3YtDSslRUcEct9v/uy
 CJkW7JGUKYYg7Ty8eGBRNm0UCkopDO0m/92xlEaJF9sroxoexYGsBxE0d0NgUZjbE/vv
 Jid8Av2xtZ0SeqV97v0rcafwzsL+/kw2E8Gpl97cdwQvc/cWAFkiApsLe4iovkCEPr0n
 Eexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364705; x=1725969505;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/ikXDun6/kV0dBrypUTxAftwyQ7HrFKU2RTsfBg4qY=;
 b=FxGOiCbY0r/dftFBIBjKgBkqDL/eWqkcZnrqTu7XoMRYvylDOaxvI987iMfkBpwCxg
 Xm/tp/RH57ZxIfNwOULsj6cIf6M+9EdW9YANLK+H17CiaBlv/B+2dCN5ZRgruqDilbj6
 BvccLrL0ikyYQMRrkR3CEgt5dzl8QYVbiWAWdcQAOCbHEQLHqnicEFCEUFwvFEIbsJSB
 FWEWQOshEa1AWMLirHgKTfRSjp1xpuZYee9/6eWQNrIKNL8H0NOJVLKMzyp5EdKeXuvo
 4AWO3osM3TMdCOF3GrlEBwzOobIQlXXUxzW/qScYd9768BBpM6HYFl4IGspwWOoAeGIi
 IVMg==
X-Gm-Message-State: AOJu0Yw1ytOE/uf58YpiKSJcTZ+4mSkNLtN030cfLPWkNzMG8TFf8u4T
 gJiSMxgoidOSZFMOa5SyBE7PR+g+sJoQHK8T8Nd2wRSm4O9BQsTE
X-Google-Smtp-Source: AGHT+IE8NoCbJoNsfast/3oP+6wh3R4mL261axzF/IM/dsLTQiLlydbRjKC4G/ccesA+EZ6MSXTy3w==
X-Received: by 2002:a05:600c:4e92:b0:426:63bc:f031 with SMTP id
 5b1f17b1804b1-42bbb5402a4mr76343345e9.1.1725364704117; 
 Tue, 03 Sep 2024 04:58:24 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374cf7e2dbfsm4107627f8f.37.2024.09.03.04.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:58:23 -0700 (PDT)
Date: Tue, 3 Sep 2024 13:58:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 kernel test robot <dan.carpenter@linaro.org>,
 Thierry Reding <treding@nvidia.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: fix potential uninitialized variable use
Message-ID: <dejyfvxyi6fibvld3rdlxf2m4xws7shxvhhkokp6y2jk2djltz@reoqqwov4jg4>
References: <20240902161317.2437148-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kgblfn5izdqlwhm4"
Content-Disposition: inline
In-Reply-To: <20240902161317.2437148-1-jani.nikula@intel.com>
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


--kgblfn5izdqlwhm4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2024 at 07:13:17PM GMT, Jani Nikula wrote:
> It's likely either output->drm_edid or output->ddc is non-NULL, but
> avoid the uninitialized variable usage anyway.
>=20
> Reported-by: kernel test robot <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/ZtXLyXxew7z6H2bD@stanley.mountain
> Fixes: 98365ca74cbf ("drm/tegra: convert to struct drm_edid")
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/tegra/output.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Do you want to apply this or should I? In the former case:

Acked-by: Thierry Reding <treding@nvidia.com>

--kgblfn5izdqlwhm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbW+d4ACgkQ3SOs138+
s6FNGQ/+IHH/FthuDhCd5cNxYrmVXEpQi7CqHoeE7/QTMmkYNrPJfGr4C3beq2JS
2eDsoWBci59dsJ5yY+x71WQv4kkO+tcRufUI2KKfupkSOiDkArAINwGlM1AVEcWR
XpBRfwOskVGuBEAtjYPqX8t/hj73JbnywozhneII4f9qNnmNrZecwswfKk1Aywp/
+X9yr3KrVqKN6N52uLpU2RmJQAgyT9bxEjkhl6gb0bIKmaxAf8TUDdedPQmarOjL
nberLfERuGF46qfOAssxqBJlg9sL4LmuxUarGNTwTOqctPjG7znQzQBEGFykeae9
omCrDafN2A6CulXS2445jtsfQlnwBrdlIrfgVKverc9fCQ8LHVC658mJDMeQ2XtW
Dgik0OpguM6/6V95CZBkphgnjyUCq+ZpvgeGSzM9Lb4uUjeIyEK6sq7gNGkSrz44
xwcz//d53l5Y6OgGQUfuQS2tl64rq0BFFkL5FgpX8fWLW2oQK7iq4kiuI+Zg+rBQ
nuIVSw2XC358T6xsaEq3NqJg2i9hvY5w3grQb7Ky8pfCIOzUGEFT0ksfinLLZnun
qjtug6lZ/GUFL9+dFs7j3NA1hDHhW6nB5OhtULGj34moFkWhPx2VFHkR7UaxhEuN
RrJyGd8cpnBxUlk6Y/88sgerpNolO/39mgaclZDM5f3QC6HdY10=
=apaP
-----END PGP SIGNATURE-----

--kgblfn5izdqlwhm4--
