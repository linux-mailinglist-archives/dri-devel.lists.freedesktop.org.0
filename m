Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207BEB4AD52
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 14:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5122310E6E7;
	Tue,  9 Sep 2025 12:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DQ5830uk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102A710E6D5;
 Tue,  9 Sep 2025 12:05:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45dd7b15a64so36467055e9.0; 
 Tue, 09 Sep 2025 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757419519; x=1758024319; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TJJaPEleZITaeSOtKLMBvC0bgAajGB4pctihAlmgOU0=;
 b=DQ5830ukpVXjsy9zDUVSHN6L22RLfmtBKNf/jPjqpYNZK3jyuR5V92thAbeidHf09w
 6M9QW4yKaolGkneeutwXQim8fSgEdpkLphFPV4DPOtRr2xEjurORaFfnLctvrDhxx7AO
 OSHJxct5D4b/QLVzy18hPijv06EC0flB2y0+DN2QWYVSuL4z7BgOXlZAX8T3AAWVOSAA
 KXVs0AXWWdIVXho1Y+k6UI8Scv0TCNZOp0LapeUWB3I//4Jap3sg+yxMXdiNiawnTSYj
 v/vakykwxeGdaCjeO7Ba+1DTkUpBUu66apYnWCOSnBX2mwvM3x0/vbQlGrtzlluKEDlR
 R+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757419519; x=1758024319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJJaPEleZITaeSOtKLMBvC0bgAajGB4pctihAlmgOU0=;
 b=YzcW42dRFJ25uNWojY7iG04jQXJJkiVokMy53kqlff6Nt0V+UqpQPgW/lXE6h2SC9x
 /i4O4fJ/Ka6U9De1U/lfmd5ArGVE2SNo5JYumv3o+t9mvxRT4wIzC4WUnMmU+xWTkQJG
 OZobQ08+MdgwIBSY+FX8cSuaDl3nYaWIFTVTzFXR898+mXhd2CA7+pAwaiEQff6nuBCy
 b3xM9TkYk5ECrOye0qOwakV3MpMtiQ87tr2m2fQUCaK0f1+TBwAz5nvHgSV+XYVDvkIf
 RHeSThTAuFTYDDAfzkzKH4CvNevCWtwr+06mVW78vTKliV7tztySI9D7q0KzjJ5hgCnP
 Azww==
X-Forwarded-Encrypted: i=1;
 AJvYcCW31vr7gPeA8YMKODjwY0OXIJf7i+TZa7YE+Uvxcvl4d99LnjKPhaPtOpElFP7umaB7JZdig1H0ug==@lists.freedesktop.org,
 AJvYcCX29Xr+9QbvzAfAQdvR8eHgPq+i0hA/wP+saAdpDQTP2Q4wKqTAc78A/csv+mtKGBzilgVMgMm4/kw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycf8ujWQQn7we5/AI7MOPYaaw+fs7NqAoUoiakVRwLLTnDmB0+
 bOGXm8v6lveuT+QUF/ixU0L9qKTLR8tndbs7io3tpHd4MoiN7I447fAv
X-Gm-Gg: ASbGncssJuWjclIMfOkhnPaShWXTR4jkobCdb0xOimVm+RWbH/gYMTGcDMdP4YAeK2Q
 acp8dM2/ELj4GoprQTNgUUZXeM1TqdZ2NK9hK3HOolcaXcOxA3Rpr860GdDx+P91jSo1hyQjB0s
 QCHxgi7fKO86OPLNXyyA4kvoPrj7IXndioHX/HMwpS+FX5nrjwkmfzOWhfuKq2tO5MwhO5UU+By
 teIJDS8yeZ1GoTdxiyxTpBbyFn+ZG/dZpdDuxgpqmTvWebumAqFhItypa5VCHOaPd11LEIclanX
 vvDYgN6Pwb4zXAgBj51/4r59ZlPGOVt5o/pyk2/Jnk2iBhJ7tgVz3CYBWRAedeTpiK92wqe2Ajg
 N59L5UnF+cBAhAyxRpHhBaGwOQV3BV5Hw61PhkQM+4RnmL3yOADdY1czKX9DdQ3b87C4+xvRPol
 IaVUtxUYSrt+UrZmE6aEc=
X-Google-Smtp-Source: AGHT+IGJt/kHoOhyd1R5FYpboV58myFjIQXREXQETTfojzheEATLY8DvoxHcNcE3VmNhRHGpbLliLQ==
X-Received: by 2002:a05:600c:a41c:b0:459:e002:8b1e with SMTP id
 5b1f17b1804b1-45dd5b79577mr81027595e9.13.1757419519123; 
 Tue, 09 Sep 2025 05:05:19 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45deab47e5dsm60831755e9.2.2025.09.09.05.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 05:05:17 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:05:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: Support devfreq for Tegra
Message-ID: <rvfjkkpsqvk3uedaahzhwrao7bgnxvbn7hdm6goa2bn6co7ctk@2hbiwwvn6y2j>
References: <20250831-gk20a-devfreq-v1-1-c25a8f1169a8@gmail.com>
 <4f3d9122f3fe552f94827b83a7dce5d3bbdc23e2.camel@redhat.com>
 <CALHNRZ-h2ee5pyOx2YDDBDQzFnXxDFX5EzhjX5+DT25UbKj1MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cdjsce2jvxkluvvg"
Content-Disposition: inline
In-Reply-To: <CALHNRZ-h2ee5pyOx2YDDBDQzFnXxDFX5EzhjX5+DT25UbKj1MQ@mail.gmail.com>
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


--cdjsce2jvxkluvvg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] drm/nouveau: Support devfreq for Tegra
MIME-Version: 1.0

On Sat, Sep 06, 2025 at 08:01:27PM -0500, Aaron Kling wrote:
[...]
> I should note that I have only actively tested this on gm20b and
> gp10b. I am currently unable to get nouveau running on any gk20a
> device I own. I am trying to target consumer devices such as the
> shield tablet, which use the android bootloader. I can boot the kernel
> just fine and tegra-drm works as well, however when nouveau tries to
> probe, it hangs the first time it tries to access a register. I have
> not yet been able to figure out why.

These types of hangs typically indicate that the hardware is not powered
on, not clocked or in reset. It's odd that it would hang during register
access on gk20a because nothing significant has changed in any of the
related drivers, as far as I know.

One thing that you could try is passing the clk_ignore_unused and
pd_ignore_unused command-line parameters when booting the kernel. If it
works with those, try finding out which one of them is causing things to
break to narrow down what we need to fix.

Thierry

--cdjsce2jvxkluvvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjAF/sACgkQ3SOs138+
s6FTGw/9EoD51gi3P/LrfowkOW2gN53NQoOq+eqYt6MV3CQCUoHAzyl/Q2IwhZ/W
ArhKDqjc/8ssSziWctieThin9SnhkG01Qh79MAMO3L7lFH69vlb/9lBKsn85kwjV
N37+MzOKjnb45j/sjE9KuTeQ0pzKi29FwULMy219cprbpX00AePRKMRoDvRS7frd
IHzk+g/9ZsVKaJ4SW7+LceIouaRyvzeKRLI3y8J8M4OBWbFx+DrGmGRGXKPWkKS2
2I1wJVvB9d+Lm7c/jPki/w3AvIM6JiHvG6ADEKZT8t5W5ud/cHTDXG5jE6dvSsVi
/uBUqMVoVjRjKB1LC864WECYp1w8of6cKXIn9sGSFslyWr5NIdHGollgLxpJnsso
jEPmWQM8Od3JStic3kOxrbPebBQpHhsFOCvkM1W8RqURSW2ociYYih3xquP39WIp
xNU1IDlAmJVk/mfbuO+/lJnRGYog6XJdTaUHEe26hm3CAAdngFa/+uhMRFQJtrUH
PPdho5Ulvz3FRJcy6bpaq9hNbv2JD9gmug9z+eH+RBL+vjf746/86a22jlAbuEa2
txcQag50dQ74ajcU/5SeLip/4tAQgf+ZCMID0ya7zLE6aufRZ6GGqw9jMljaieql
2IPVywytpMpGUXjaJUgI495vF1XJ1S1lnaCCxO3zqD+C27oaR8M=
=4aBF
-----END PGP SIGNATURE-----

--cdjsce2jvxkluvvg--
