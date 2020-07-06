Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87404216771
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E806E5D3;
	Tue,  7 Jul 2020 07:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392006E1F9;
 Mon,  6 Jul 2020 10:51:53 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id e8so18214753pgc.5;
 Mon, 06 Jul 2020 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=R/RUPCaSPqzoFwBjt5s1qtV4yHRYyUYf0BU1jozcpBU=;
 b=AwSit3Gf5PYGY93Tmt+Kj7h2kTByWoVXR81moWArdR2ge4xAna+YOKUPxH+tLQb9bR
 jyqAuOnY7kjQvo+HZJG3RZnt5NLWZEKwBYoctlk2WLLnWOv5mlQ8yf2gmu+YcYIgVICE
 5Y6f4RN015nD7DvyubGQt+dKlb6K9vnCjaFvz8EBFg+jHWDDbR95ZZTEhvSc1x5MKRaS
 2wK7ouj/aNaZ4wQGaoN/D1ThobsjB8kSrAIcjyYxlux6AACrOi5ftT417K+xRdVAfb7h
 QNrSRnC4yJxZwkqkwhKI7tWguUjJwpmI3TinyGmrFLwAuEG3yo+IjbhRHifFTHuSPMRo
 kUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=R/RUPCaSPqzoFwBjt5s1qtV4yHRYyUYf0BU1jozcpBU=;
 b=YAVi5+dRn9/QMEmPkOn5cgXIaZ2DZYpv/4RHifdSkDKOzPNDdUgiiWSOS/8akbFlnR
 RW0jfWG+DSWKLgjuVshd4alOid8DUVpNsKS/I8yNQY/2/SpNRTAvjA0NCJecWr/zxAVO
 QiJ/dbmll2tNZsTFKVf9jxL93LrWgi1ng4YvHv1R1/YdoLznmGMk5M5hIUACg4U1XPKW
 dXuLIJr0PoY3EWVoj3tUXh3tAj13gy0ql1XfRBkQ30nuu80OVTEIlj2Uwc47Sbfyi0ck
 loIu3Ca3GS4Xon/jPRSRBvR601oEZ7gPBiRjGnRaCTodbkB7fmTa95/dzH0ZZAxzC6dm
 eg7A==
X-Gm-Message-State: AOAM5324iDQjkdV8iRIVthqjCmSKfqAPfBtqYR2zWn3ZHd60nRevgX83
 y2w3jQbnvF5XPBR+n1iTfIQ=
X-Google-Smtp-Source: ABdhPJzo2KxljopNGnnYYgVtn6J6oNotuUUuKIWxrB4m4Qan2wouJie6csZ3xM0wnNm954jMLKNnNg==
X-Received: by 2002:aa7:96d1:: with SMTP id h17mr15164848pfq.141.1594032712827; 
 Mon, 06 Jul 2020 03:51:52 -0700 (PDT)
Received: from blackclown ([103.88.82.87])
 by smtp.gmail.com with ESMTPSA id a16sm19112710pgj.27.2020.07.06.03.51.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Jul 2020 03:51:52 -0700 (PDT)
Date: Mon, 6 Jul 2020 16:21:38 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [Proposal] drm: amd: Convert logging to drm_* functions with
 drm_device parameter
Message-ID: <20200706105138.GA10722@blackclown>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1150866790=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1150866790==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hii Maintainers,
	I recently came across this list of janatorial tasks
for starters on DRM subsystem [1]. One of the tasks is replacing
conventional dmesg macros (like dev_info(), dev_warn() and dev_err())
with DRM dmesg macros [2]. And I need your input whether the
conversions to DRM dmesg macros are worth it or not.
I would like to start working on this task if this needs the change.

Thank you,
Suraj Upadhyay.

[1] https://dri.freedesktop.org/docs/drm/gpu/todo.html.
[2] https://dri.freedesktop.org/docs/drm/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-paramater


--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8DAjEACgkQ+gRsbIfe
745WZw//YOzOBQIp/VcMTmvfWL5OMXrDiO1HUDdlbKkXY9udgjpKya2Wd2KOaZ8y
bzONIfbS8u4uizmAUXktdrZRpCIkOAGQuCReHUzzfDNHWyTBlQHkXn5gSFyIq+Er
qprmLOVEgXNRRvniO6iQ41RqmdgihzMqPW5XGR3NuVeG8bw3DC56C/7W/kKjK4kL
jOLc3DDzH2G+n0gxFCSV5uCSk2XIese21nvCx+xS3ohsOTtCCggM0SH/xZ9WTaPi
zCuXJKN3ItLqseba/4b5kB23oWFM/nZPzvPkeEv1xzN8u3QFJgVKh7Rc06+mKvWp
DD6V4d+YYTspxnVsyga/uB+LWCB2JA/o4Wa9SZl49vy4R32lZJKilMdGcOrjNIUQ
m/YPeu6rpFUluPMnxGB+Shlrn3iHjBC6NQdV52lTFAoExt5pCZN1v/35QZWFrCPN
RlFxDHjMffSstnwdKHua6nGfxe+MPscvlp3B9NAVrTlBPBNckLU3hzzTCgRxg4Wo
a1FvlCO90AvZ5BVllnZQUhjiz5lvwlphvjnpuuD6ziYZeKrqOO0r1Tvqd1HipE6F
ovvf6fHhnQleMHumiy1g9uChAHkS9oxvrKqBVjYEBhaN4bjUUf9huSEXaoP2y7qb
5Ql8JdkqzhK2cxUbnvnZMya9dsiZPhG8e7rkR2TTsq8B5FxfYqc=
=fw+t
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

--===============1150866790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1150866790==--
