Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E86BA14E17
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 12:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE2A10E2FC;
	Fri, 17 Jan 2025 11:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xiqiJ7jT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4AC10E2FC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 11:01:06 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so18335395e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 03:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737111665; x=1737716465;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HNaq/qpjM+Lp+y1QAqrM2LmodIggJiHYYuMdBVJwh54=;
 b=xiqiJ7jTxJCrz58tFbyIHsl+Xnu9Q+D8OBhkZWaW8vDHPT6OTSRQ2I8p80VsxcRnnC
 VVS/wjlowGeX4f1vvGrYHlE7ugv5ZMtuFzaxIckMstDvtkXko06bMENmW33vM2J3OzWP
 0nwcFFSybUDlkqgWd/Q2x8jKBGSa7duC5IzeV2wbFM5tLd7i1k3TedNXb91r9mW0w5W+
 PVDYIkP2VUoNrQlHRpfEU9nKaXmVb+yZvt6djlvKp7zulrWgXP8SeIEz1BmzkVvV3Rle
 tEvUEE0aD74TYSOHNzIVEbJxcDBIO/+C/3FMnT/rdZXZNQsK/u/ww6Ut3LcULy5PtTRL
 Y1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111665; x=1737716465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNaq/qpjM+Lp+y1QAqrM2LmodIggJiHYYuMdBVJwh54=;
 b=eAtihT/+PqcYg4Zps8RwsFfKYyiFOXuSPBF9mVnwCbj+5brUO+PnRHiVMf6ED47UJt
 J9ni1MbUUIqpr9DToRARVKE+r61PM96aDQWI7ms5gXGZp4hgYn6q9GXXMzp/9ksooVjV
 qePEyB2m9LBrLLPUzI+sUhuj4lpOseuHQKkPa0RrxnjyKFW6rDJxNGcKLzAh2xG+eru3
 ZsySHEVUAiVciLcCFWvLyxHWvb0YJvW5JQTi6KxU7ci4sZJp1RwmzQTcj/paYzOOTYtY
 Yf8ml3v+wgehVOLd19YGO/ok/PTcgkegQeNkUffAW5X6+HYAAPU1JRN6070rYpATH/Dl
 sYmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPUlZO0el8MA2pDblVdrpj9zS0MlxQYqixxaDptmMI8qiK5YxhirOce88VmRnaaAugEJPLSD9xC2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT3eBZs9mghgtc3QEXX1OMcuRDACa1f0OzVThMlDkpLDkm4QRB
 q58X8RsGmTgaK2fE576Ama3AgS2OOIY1WIIJiB+NlZ2yLM/aQqgTE9An3W9Bn6Q=
X-Gm-Gg: ASbGncuINI9OfuWUrmZBsMHdTWmnB0+HQKU4G3c8MY7CvEzqLHL8SZHbBfW0dpx6HOL
 qFHjNDTzm7TVYC1lqG1zjOpTG5JWkFp3nMPr23rmUFsT3AywxjPGOA5fYt041MZXW5PnpWtVzX1
 n7KfCemwhiQrcG3ky22AmuYVgIujUPUyT5vVyityi3bozo7VUxqbKpMjZnu2ja/DzUZZJpsBnT4
 2SXGHoWgUEWKqFSGn/bDu7mo91FX0IeJu3TrlUHiMGKgaWsPP2+mcqg8VM7Gz8ef4PVCSMZLXs8
 5UzCtvMkMT6qjSJgxyRmIAo=
X-Google-Smtp-Source: AGHT+IEML3YLVc6aK+BsZs3AFs2wEYS42V9mqmB5eZF+lE5eeBoX5rHulP/VYNNxiaDHN/mhhuhdVQ==
X-Received: by 2002:a05:600c:4589:b0:436:f960:3428 with SMTP id
 5b1f17b1804b1-4389144fbd4mr21807815e9.29.1737111664221; 
 Fri, 17 Jan 2025 03:01:04 -0800 (PST)
Received: from localhost
 (p200300f65f0afb0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f0a:fb04::1b9]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c0f02c07sm75499565e9.0.2025.01.17.03.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 03:01:03 -0800 (PST)
Date: Fri, 17 Jan 2025 12:01:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, stable@vger.kernel.org,
 ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <jwnn3zov3akpnqzbk5lss3r6q4yupj6indmmapwvh6hadcdycg@pvquyntsvqpe>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <2025011244-backlit-jubilance-4fa1@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6l77qy42ykife323"
Content-Disposition: inline
In-Reply-To: <2025011244-backlit-jubilance-4fa1@gregkh>
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


--6l77qy42ykife323
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
MIME-Version: 1.0

On Sun, Jan 12, 2025 at 10:06:42PM +0100, Greg KH wrote:
> That's fine, the issue is that you are the only ones with "duplicate"
> commits in the tree that are both tagged for stable, every release.

Isn't a solution as easy as teaching your tooling not to create/accept
commits on -next with Cc: stable? This way folks intending to push a
change will notice it should go to the fixes branch. And if only
afterwards you notice this is a critical fix that should get backported
at least the commit that takes more time entering mainline doesn't have
the stable tag.

Maybe additionally make sure that Fixes: and revert notices only point
to commits that are an ancestor.

If I understand the problem correctly, this should make the stable
maintainers happy.

Best regards
Uwe

--6l77qy42ykife323
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeKOGoACgkQj4D7WH0S
/k41Owf/S1vWxe2kwIlsEQ1rjx5Iq00xhXeww7qBszp/kl/zoaCQMwrspFprc8KD
ItZchxCeJobqEcp30DsK4XervntQL12eEjbWoYWLZbHHaeTrcWHPclY3XQu8KrvH
15qz8i+Qe7smi2cFpNaqBQ0Fs3t1jO8U72QjulN2szzZN4yFAfCri9H/Hbq7ZkZg
OBdhlJWtwzMpS9h+JQbiCKqIfTTPJzExxEd533ypdEo95X5NPAkO49kU2c0zBxfz
7QROWA39IY7qr62HsB9at6lCjf2t5bZitrTixUvLk9Rt8YIV3gBNDcz0OZ2oEGiX
oOFGAHwDZ8TP3uBhSVZ5JKvI2/dHiA==
=dUfV
-----END PGP SIGNATURE-----

--6l77qy42ykife323--
