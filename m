Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD9A6A2B8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 10:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2E10E158;
	Thu, 20 Mar 2025 09:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aAVWEd7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EAF10E158
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742463239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Xnc4UUNyeBQpV5hSNxcMbVbiGERYrZYYe0TGe1JdNE=;
 b=aAVWEd7tfKI9ERf8J7SpHl5gOE0j+pz1oUNQFFQ+psLntlIFzjZuhf6kyWUz2Ycns2+Ene
 M20jKImnEsZYU0mNi+UqDBSJRJyNGiGxaG5D8IUbIFn5WfEL165U4GhGYORx8LGb2odEBV
 8a3AwFzjc1BuWzkyMa2fpAtTwKwgfuA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-fYo_QmO2MRuWR7LbGX4n_A-1; Thu, 20 Mar 2025 05:33:58 -0400
X-MC-Unique: fYo_QmO2MRuWR7LbGX4n_A-1
X-Mimecast-MFC-AGG-ID: fYo_QmO2MRuWR7LbGX4n_A_1742463237
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf172ff63so2673625e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 02:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742463237; x=1743068037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Xnc4UUNyeBQpV5hSNxcMbVbiGERYrZYYe0TGe1JdNE=;
 b=T2Pujc8cBzFjHHcN1uTLpLzfaW9ZORz/P3eo+PCheHz/zg+EC0YM+9FgwRyQ5bj4pT
 MJ5PaH2TLranDpE6kjsViZK3h/L6ViyGMoRL5vIk1dhSp1GyucEIcmSTo8dG86GfcXm1
 2A7M//k6YKQx01zHZzg+WlYyr6OaxJmg516PQHckkv4xSPS/n6tTLSDl1A45306hsbac
 qGxzBHe7Ts7teBK1lxKBi5K49y8Ns69kWwD94RkWpMh4QGfbyaQDzmN0o8ttyMts7laS
 VBTt9oVLynE5YbxF0+8MqYgMT+48NfhQZ/nWDfa98gSzxcNdxWhApFaZoKvFffS23KC+
 u1Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjg9Z40/LCH3F+9Ol3EUpNN9aW3eFfG5Zt2z84rrf257ukvmT+SgQeorZKMrBk3CQ/6A+kNgXRCNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXZp2WkgDItJA9TxQbdDL71w+d7C6az8NZ7fjJvUrzWZFgJlIt
 jrDJcw1PJpT5w6ZHkyxg6jH68WqrByOQPdxOy6Pa8HogurHVL3pWE7ip6jIPZMU+bK2etffbwD6
 iTAeiHblPrOlQ2+2JuUmv82iI86vJL9g3ammlLPU8bSqtN44FpodMT6CAAZaaWKpqQg==
X-Gm-Gg: ASbGnct3BeBLvArkMC0eaCchWR/y5J6Gbonmj4wmJpP14nRv+6iRRJx8HbJtm/6WqU8
 cWQO2VO3IKY5ZSOzoXs8RubFcld2UZh8ETvd1ANl57l23cVBz7J8mixJUmUfFO05T5A6ndj8uVH
 X2SBHfnrxPs38jVb+vBcDNyVJLulY1JT+BadKrUX8MEmSKlaM2EP+eifVEu7YdfufeF+3sOiyGx
 RwtqAGUwcZxwYJ+LiWkoLA65UgcMgzlpITp5FVb0V96SjEcaacT/+dPVNt4rnBgoJk=
X-Received: by 2002:a05:6000:1885:b0:391:4743:6db1 with SMTP id
 ffacd0b85a97d-399739bf10fmr6651481f8f.20.1742463236891; 
 Thu, 20 Mar 2025 02:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPpSkFOxbE+tXOvReWNS5OBVcYoKWflVXQ10gRz+qPFJPFGFwqlvluV+HuBcPhSJpAfd+0TQ==
X-Received: by 2002:a05:6000:1885:b0:391:4743:6db1 with SMTP id
 ffacd0b85a97d-399739bf10fmr6651449f8f.20.1742463236433; 
 Thu, 20 Mar 2025 02:33:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975bdfsm22915181f8f.49.2025.03.20.02.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 02:33:55 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:33:55 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Helen Koike <koike@igalia.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 helen.fornazier@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: DRM CI
Message-ID: <20250320-benevolent-quokka-of-cubism-c1c0ce@houat>
References: <20250319-greedy-sturgeon-from-avalon-ac758f@houat>
 <ab1d875c-7a1e-47a3-b786-85fb46c42bb2@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jrcipsmej7nqsnv2"
Content-Disposition: inline
In-Reply-To: <ab1d875c-7a1e-47a3-b786-85fb46c42bb2@igalia.com>
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


--jrcipsmej7nqsnv2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: DRM CI
MIME-Version: 1.0

Hi,

On Wed, Mar 19, 2025 at 02:39:59PM -0300, Helen Koike wrote:
> Hi Maxime,
>=20
> On 19/03/2025 11:11, Maxime Ripard wrote:
> > Hi,
> >=20
> > At last Plumbers, we agreed with Dave that a good first step to ramp up
> > CI for DRM trees would be to enable build and kunit testing in the main
> > DRM tree.
> >=20
> > I played around with it last week and wrote a good first iteration of
> > the gitlab-ci file.
> >=20
> > https://gitlab.freedesktop.org/mripard/gitlab/-/blob/main/.gitlab-ci.ym=
l?ref_type=3Dheads
>=20
> How about improving and using the current DRM-CI instead of creating a
> new one?

Thanks for the suggestion, and I did try. I don't think it's a good
option though, at first at least.

There's several layers to it:

  - The most important one is I don't really see much to share at this
    point, really. The containers creation is a good example of
    something useful, reusable, and that I did use. However, drm-ci uses
    different defconfigs, its own set of hardcoded compilers, etc.

    I guess we could try to improve and consolidate it, but for a script
    that simple, I don't think it's worth it.

    Similarly, I don't think it makes sense to try to come up with a
    super generic implementation of kunit, when there's only one user.

    That, of course, can and should be reevaluated as we test more
    features and the script does indeed become more complicated.

  - We discussed it during the thread with Linus, but I also don't think
    a one-size-fits-all approach is going to work. drm-ci at the moment
    has plenty of reasonable policies, but which people are still going
    to have different opinions on. Like, whether you want to
    aggressively update IGT or mesa. Or whether or not you are willing
    to disable KASAN to accomodate db410c and db820c. The choices made
    in drm-ci so far are reasonable, but choosing something else is just
    as reasonable. That's why I thought at the time that providing
    common scripts to include is a better way forward than a gitlab-ci
    file everybody is supposed to use.

  - To some extent, the complaints Rob had last week about drm-ci
    expectations not being updated fast enough in drm-misc are related
    as well. It could also easily be solved by drm/msm having the
    gitlab-ci script and its expectations in a separate repo, under the
    msm maintainers control. And then it could go as fast as they want,
    under their terms, without creating any impedance mismatch with the
    rest of DRM.

Maxime

--jrcipsmej7nqsnv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9vg/QAKCRAnX84Zoj2+
diZEAX9J0Om/EvqWgcbrBd4fHvaJ3nbdhOXPhvX25pmhAy9CiOm8K7HiMmCq3vok
eX0blZgBfRLG158y8p81GEauPfgwH2Rf/HPlD5De6duI4xZkFMiu8NODA924PxPF
63odaN+FlQ==
=gSjs
-----END PGP SIGNATURE-----

--jrcipsmej7nqsnv2--

