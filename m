Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9AF8D5032
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 18:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C390710E5BF;
	Thu, 30 May 2024 16:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CEWV/WKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC8E10E313;
 Thu, 30 May 2024 16:54:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so1022014f8f.1; 
 Thu, 30 May 2024 09:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717088066; x=1717692866; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v9zqU8JnmYAjrDHWI6QwaCI3aTg0IhkQKhlHefZwcxU=;
 b=CEWV/WKAxkp8mRqqjRtRqFuojspB3YDO9PnCecA91hxTkXWXGXlmTmjwXNdw+zYqRy
 TyW/ZdFye5mAwOLgnW2qE+2AG7kUuPMyqROdqHMMjMhFDpGqE1swm6SPzoDjqmvMjb+v
 JsJ7cXJXQTuu5d2AB6OwE+GUpGuxsSCgBS3ZnZz5bD5kA3CFV4Humt+MompmVbsGlwv2
 zrWDbUZQkkEfGvfNOuVGuchV/ajMoqgiO2SLyPP3OzjJCYKqnXe11j7eBguBOgPMYCwP
 fhxSYX6utUPXp7OjfoO4KmsPhKcq/I9i8BNphYbIJetIRnWem3NavK6RWOUKSUenpsiC
 KaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717088066; x=1717692866;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v9zqU8JnmYAjrDHWI6QwaCI3aTg0IhkQKhlHefZwcxU=;
 b=OL1N843Wn8wssT8Z0/a2ExNB9TSGUjVp1k8L65BLOZwzvZyHC4VS2dbcUxFXZQLEdw
 t+3hc/CZ2aX/mqNjuVaLRcKJkapi+ChpDF3nQwR+NbDgzEZNSpV6h2QCUHPZ8/6cIEWO
 nOvAqw3MXi8v40pi+fJ6tJ6I6lCIN+bgncFEfjHC4YQ9bqnJ8AYfCQStrDVLrgj2bzd4
 +wDZ6p6HJDUKVWXIm4+MxGqn0I/f/EMWbNi71/MZ+4UjblZ/92438w8WUFgsz0vs4Nah
 GQXnCqkOPMTVUfgJOjNTqf3jhin3/KNLlFEwveZCfvpWrYdRyFsZqnu6s5C96ljR+eaf
 5tvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIyDAQkNYT/KnOOd8rpwZ1xa8xHsCLdbrJGKDl0vGX7kER/YhSdSiRgrAZPmlAyViwWro2teKFP47BlUdcNPG3rNGFjoDlw1Ow+jZtvAsU
X-Gm-Message-State: AOJu0YwMnYcroXhSFS51pmov7BeHfMPQkAHVjRwgk15ce0F46dSlJobB
 RoGBMNqcp2i8tJMELhKJzspaM1I8Xnrz2jEVSSJN9Cc9O7RN6Xos
X-Google-Smtp-Source: AGHT+IFEfBLTzmjmcG32USMXfmcuN3/ok4lb789rZYIugWZrptHh8T6N9Opj4wdIck7hY3jhiBhxzg==
X-Received: by 2002:adf:ec45:0:b0:355:21d:ab9d with SMTP id
 ffacd0b85a97d-35dc00c70a6mr1886123f8f.65.1717088066020; 
 Thu, 30 May 2024 09:54:26 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dcbb0965dsm1626683f8f.91.2024.05.30.09.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 09:54:25 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=357c9420193d77c21cae851122d418a2d2433a7d1bb8c98af37a194714df;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Thu, 30 May 2024 18:54:24 +0200
Message-Id: <D1N4X37C55M8.PW8BXBL6ZHN4@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 <freedreno@lists.freedesktop.org>, "Rob Clark" <robdclark@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Sean Paul"
 <sean@poorly.run>, "Marijn Suijten" <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
Cc: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
 <swboyd@chromium.org>, <quic_jesszhan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
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

--357c9420193d77c21cae851122d418a2d2433a7d1bb8c98af37a194714df
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 8, 2024 at 1:04 AM CEST, Abhinav Kumar wrote:
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mes=
a"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.
>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Irrespective of whether we want to allow Python as a build dependency or
not, it already is since v6.10-rc1, so in the meantime I'm going to
apply this to drm-misc-fixes to unbreak things.

If we decide that we don't want the extra dependency we need revert the
whole generation infrastructure.

Thierry

--357c9420193d77c21cae851122d418a2d2433a7d1bb8c98af37a194714df
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYr0EACgkQ3SOs138+
s6H0qA//VtOBk1k9qHZdQF+5oC1HaKmclp+MFecexS2w1fOic7SRCaXXaVe+yLTh
d+rY3ge9/sxGxL8vBHnpDPty4yg37cu77XbF0GntvjvB81PWoIqazUK3fX45qHTF
B67gyZDV/5HvLQXSk8XjAodp1yoMBcBSxiCgm9WM3oYbwrs6iI5mBrbWQX0WLX3A
o+2X+XppsqlTlXBnFPHtWQS+DoxMPXTbKC8IotqP6Oi0YHthDAC0L8urYJgJa/VY
vXHImnoJoFJkP9z1H3uoHOFE7kaVNK0WNoNPejHPls7Rr9AkCMhWKBmzOfOVMw/t
Lv0hVK03TrDTu4jZYUL15yqHRR9MZrVgwYeaTbxNHriHBFZMIkATWS6gu43bnXDI
Sj4PXeuttsi0MQHBrE184IkjGC/VQ4gC3pxuuurqAVs5uaXICwb8DYU2fkaIiIdr
lWnyZZwmmWkzaDd1T7w7mF149Mid+kHrueNJFAigRjGE02BNZzXnjCfKLoyYgeom
EIDx6QAUSyV1qSAjfG1J8dV4Ag6joFiBAdsO8yk7teOtaH8JuPWQauoPC7Q+7BF7
89UgDVkWPjJUuaktWqyPhUPpcINzJ7IQZ8sF2DdgPkq+Z9vbCP/jZs0VEVSpMF6d
DStI+QzysQhcpHFpT7DqaR7ryeMbS1/AtHkkKgaXJP2mKXmXyoU=
=eLTd
-----END PGP SIGNATURE-----

--357c9420193d77c21cae851122d418a2d2433a7d1bb8c98af37a194714df--
