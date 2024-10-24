Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A89AE51A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 14:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F76310E928;
	Thu, 24 Oct 2024 12:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QqvklLaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5F110E928
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729773564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5+OQwY4zc6vEVXiNONtzig1xHIyHH/SoXYN3nuyooEc=;
 b=QqvklLaHUJgksniBgPIYPOn7rFm4jCWTKQiECOD8yQPnPTqci0455nOTNWVl9FPUkCxRP8
 osvurnZRdgmJbCXKvmbtX8bh1o18qLq/VzCZ1fXmIqT5jhG8XY5K/4/GEy1sUSjZxVTK1W
 nbvaAZYhVMvJmj1lyNAUQ/p91WVr22w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-EA-p8q9_M3SlZXaAD2ueeQ-1; Thu, 24 Oct 2024 08:39:22 -0400
X-MC-Unique: EA-p8q9_M3SlZXaAD2ueeQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4316e2dde9eso8863335e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 05:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729773561; x=1730378361;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+OQwY4zc6vEVXiNONtzig1xHIyHH/SoXYN3nuyooEc=;
 b=JT+CnJYzz69B2VlFy6kHbZC1fj0oNYM590lhPEH1hyly//atXb1YbsKz0BJkEDIP3H
 lsu2g/cuhGAFHpNxv4AHz4UErCw8vAnLJbDL2uAov147IfdnaQjk6BVL2xxKVuK+7Dyh
 24m8jwsKHeJ1le8/o7s2oR1TTjc7TG+uAW7suet4g52wYx6Sv52SX0PJ/ZikL7FRZokQ
 t1YVF2aIiea6WazWzRJg4MSAX3JwJqLUhM/MvhvAHIT0NbX4I3HZYDPGvvqk5QR9lJGb
 Rep0V2Kd65atz5HJ7M9/V9v45gLf6+3ed4+B7EudqbXbivwQAleUAW5kgP90w/FxIHPk
 q8SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJgVNU701ZPfO2ha9qFv/PoirIHttgVoFgwB1abBArGtrT+Qlzk4U5snUq//I2RAGuZHY74CtnOxQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzGDXjKQX4v5i8Q+sb2D1TMWzY7jd0LbWk8QPDdLBPusuLoUsu
 bwjvKNSmrbAeERemAO8gsnIqGWEQPygCvraxfILjWWdu3DAdCrZuHvLOixdR9Sjm9qdoNhbAs1q
 zF0wTkKZtf5XpFGQ5/fthdjEZgpEaJBItewZ5wN2OBSzAvIi7n6fxFmqYJLTvr36PGQ==
X-Received: by 2002:a05:600c:3b90:b0:431:6083:cd30 with SMTP id
 5b1f17b1804b1-431841eb1f4mr58630645e9.6.1729773561432; 
 Thu, 24 Oct 2024 05:39:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP4Yt2lWKfiLXUwD5pyhyM9nEq+ovGX7LSbAtjKqBgqeoGKgURQHRk8nXBv2l3UL8PbfGW5A==
X-Received: by 2002:a05:600c:3b90:b0:431:6083:cd30 with SMTP id
 5b1f17b1804b1-431841eb1f4mr58630405e9.6.1729773561037; 
 Thu, 24 Oct 2024 05:39:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b5706c3sm16232465e9.34.2024.10.24.05.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 05:39:20 -0700 (PDT)
Date: Thu, 24 Oct 2024 14:39:20 +0200
From: Maxime Ripard <mripard@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: Requirements to merge new heaps in the kernel
Message-ID: <20241024-nondescript-pogona-of-chemistry-fa4ab4@houat>
References: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
 <CANDhNCoLgzy=CPBWjBKLiJzRdnf=SS3AgtFJNB-CBYAo=UEQJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ebb7ftwkuirg3orl"
Content-Disposition: inline
In-Reply-To: <CANDhNCoLgzy=CPBWjBKLiJzRdnf=SS3AgtFJNB-CBYAo=UEQJA@mail.gmail.com>
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


--ebb7ftwkuirg3orl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Requirements to merge new heaps in the kernel
MIME-Version: 1.0

On Tue, Oct 22, 2024 at 09:19:05AM -0700, John Stultz wrote:
> On Tue, Oct 22, 2024 at 1:38=E2=80=AFAM Maxime Ripard <mripard@redhat.com=
> wrote:
> >
> > I wanted to follow-up on the discussion we had at Plumbers with John and
> > T.J. about (among other things) adding new heaps to the kernel.
> >
> > I'm still interested in merging a carve-out driver[1], since it seems t=
o be
> > in every vendor BSP and got asked again last week.
> >
> > I remember from our discussion that for new heap types to be merged, we
> > needed a kernel use-case. Looking back, I'm not entirely sure how one
> > can provide that given that heaps are essentially facilities for
> > user-space.
> >
> > Am I misremembering or missing something? What are the requirements for
> > you to consider adding a new heap driver?
>=20
> It's basically the same as the DRM subsystem rules.
> https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requireme=
nts
> ie: There has to be opensource user for it, and the user has to be
> more significant than a "toy" implementation (which can be a bit
> subjective and contentious when trying to get out of a chicken and egg
> loop).

Ok, so I'm definitely misremembering things then, I thought there was
another requirement in addition to that one. Thanks :)

Maxime

--ebb7ftwkuirg3orl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxo/9wAKCRAnX84Zoj2+
djn1AX9LL8SXF/jq+RdIeQMizkxZVAraKRt3f6b5NqqRYhNV1s73O/AM40KqrjPO
PitAa1wBgOVgiPLyWZpw+VK+HqDje4x7HEncok93cPDEPDddu+TgaH7x4+CblDWy
zUOH8A1wEA==
=M20y
-----END PGP SIGNATURE-----

--ebb7ftwkuirg3orl--

