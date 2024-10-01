Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F356B98B1A9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 03:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33C610E5B0;
	Tue,  1 Oct 2024 01:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AfBvX/Dh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA9F10E5B0;
 Tue,  1 Oct 2024 01:10:35 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-719b17b2da1so3580609b3a.0; 
 Mon, 30 Sep 2024 18:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727745035; x=1728349835; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FvdIF2VgQWMoeFl6FMayPLRYZwY2PqqjPnhpbnh1x7I=;
 b=AfBvX/DhK7C/EHSLBMRziORXWHf+hN30GsZGS5BXJoNuemr0FyO71ce1m0wmeWzyf+
 nBI3u9IA9ldudIE3FxnAkYbesaDyUb4vUc9Z/J/W9KHabqJidp7dSchD6Q8+wry7AdZp
 eikKv4P8c7oikJYD0Cyj1AA/PQK7ErqvRDs1RBZY0m2q+uLeLCCb6KZliP8ohHp7sfsB
 5LrD4tgf635Fjl7Klxficv5MY/XO3Uralh/7BLDP5jTB1JCG134FX2hqwuIl17SSUpUW
 Q5TOlVD0Iqkjv2vLIVN7osu2o8Q+OuANNNCaCQtEnGAD+fxwurSkfSzT/nXHfhVuAe8B
 p4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727745035; x=1728349835;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvdIF2VgQWMoeFl6FMayPLRYZwY2PqqjPnhpbnh1x7I=;
 b=HBOWbtq9+jnLNdhgMkUuKXakcug8PyH2KjaJyqmOygbR6nIOZcxPxQaa2un6HIQN8n
 Fc44ib+BYcO5yazELvKGxnF2MUPnEcOKfa3Syj+80YV+fGZNME8nhR3V/M3FANmemu+8
 QlK1qm/J3Nttz35kOi+MbpxjTBsJJ4E/LOgVXjO5+zpJPYbWYWGAbgN1KJg0tUuJNjad
 u/5WYLumppUzr0T5cFJDBxU+lANxp3AtV3TqfprCdLjtn2k7TS34zcjWYI2PDJfAGVsk
 rc7WZTnxn8O4+erIEkA7vB5RpQFoUz37q9yWE0r6+FeT3ORXOMbqcSDPwiO/A7fAZSc9
 Kpgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpiCi9aq24peLA8kSzp6yZiehp2zgDzZ/qg1Az4HpJIrCNRW8nU+fOsdBOiHDRnWXQBMakdONrDKM=@lists.freedesktop.org,
 AJvYcCWUcVt5/fb881UVKr5+Qk4FuYHK9mlQSWJy6HmobjL10Z2JrzgXy1Nm+iHf3PY90rLqz9amKlD+9UJT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuKcHj+kwAtnuVUc5fC07hcx0Kdu0TvsjmK1ntDRdZfUgWUnW5
 70koZ0CLBFgfyK9p+ZMqRf29JWRjBU5TMHaCm0TcRHbE+ZD6mbku
X-Google-Smtp-Source: AGHT+IFTZYQuANSJgzSP6qownfZtm4a/W8hkuc2taZdmJPd2TwcsGnJaZRAPmx9ZgrAd8UvhecAJSg==
X-Received: by 2002:a05:6a00:399e:b0:719:1f10:d1c9 with SMTP id
 d2e1a72fcca58-71b25effee7mr19083355b3a.2.1727745035146; 
 Mon, 30 Sep 2024 18:10:35 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71b26515e40sm6909155b3a.117.2024.09.30.18.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 18:10:34 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 70166451B098; Tue, 01 Oct 2024 08:10:31 +0700 (WIB)
Date: Tue, 1 Oct 2024 08:10:31 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 11/11] Documentation: document adreno preemption
Message-ID: <ZvtMB14Yx5m3TzFJ@archie.me>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-11-7b6e1ef3648f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="N9PoR4/hp1IPn/XU"
Content-Disposition: inline
In-Reply-To: <20240926-preemption-a750-t-v6-11-7b6e1ef3648f@gmail.com>
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


--N9PoR4/hp1IPn/XU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 11:16:53PM +0200, Antonino Maniscalco wrote:
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +:orphan:

Why don't this be added to toctree in Documentation/gpu/index.rst?

> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +MSM Preemtion
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
s/Preemtion/Preemption/


> +This mechanism can be used by the kernel to switch between rings. Whenev=
er a
> +submission occurs the kernel finds the highest priority ring which isn't=
 empty
> +and preempts to it if said ring is not the one being currently executed.=
 This is
> +also done whenever a submission completes to make sure execution resumes=
 on a
> +lower priority ring when a higher priority ring is done.

Do you mean that the kernel finds highest priority ring possible that is not
empty? What if all these 4 rings are empty?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--N9PoR4/hp1IPn/XU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZvtMAgAKCRD2uYlJVVFO
owMHAP4ltJaCW82+9wro8f+8pORaq1s0Q0x94xkoLn07LbFABwEA470XBQpKJiVO
BAaXK0VvHjFWK/2uc+OvsgYu6QucvAM=
=sjyz
-----END PGP SIGNATURE-----

--N9PoR4/hp1IPn/XU--
