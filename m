Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D0DA20AE0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 14:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0638810E28B;
	Tue, 28 Jan 2025 13:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NJYVn7sX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4D010E28B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738069368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oodYKvxUNFsCTFAanBPwxkTbixj54TmcCinXiwdG1sc=;
 b=NJYVn7sXTr7at47UN+MIxPXsKx7hcOUu1I/XJaYm0RsaiOGPAYnF+TSRkYuO49AXi53CLY
 pCBGXAvFFAvskD32jbvmnXNyGyDL3SrVttxfxyE5BJDtx2uytZHjq55Xe7bhuPnqD1gf+Q
 jrXBpIhPlY6zMqp+jq8OuNlP4VAzz44=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-c9OZuj-PPnS-tdJ1nnXbWQ-1; Tue, 28 Jan 2025 08:02:46 -0500
X-MC-Unique: c9OZuj-PPnS-tdJ1nnXbWQ-1
X-Mimecast-MFC-AGG-ID: c9OZuj-PPnS-tdJ1nnXbWQ
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6d8860ab00dso89229946d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 05:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738069366; x=1738674166;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oodYKvxUNFsCTFAanBPwxkTbixj54TmcCinXiwdG1sc=;
 b=RmeGUbGM+y0JaURGJjJr6UjVCkwfDpIvIlGoPVAxly2gzJKGyZ2UjEG5o83Fvqwvvt
 q7xlVwWJ53wA7FbL7nTHfSxIAKLtFBHucqw2ScQ846PFmuQSUuOcqMmSS6aLA32q4Kms
 MPeMbbeB6ZwnWW6U7s6yMmNgoeCygRJHhBFNgo11ddfUwrbQ9u+7PZkL/PlJicBV7XzH
 GzvnvvuDkie09L0ihZMTVYtfL2TypduL3MyVD6SLmb2ufu9U8XRfF3K+ZfGAycPFDQlN
 ATqHVC8qYyzPRIIPnvX0NJ+duRNEwz3ngh+RdMj36gc00bMSjyrWbw3t0vGFRMeMWXSb
 IXyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGpXNl1RQ7fbnLx+d5WD6UhJQAKMdUv5pgOXUAVfqx2WTOnusYIEJxF9vpUILvK0GHhD+IVsj6tMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxXA6qc68uFRFnRcAmEtYyKweAfVbm97EvTn4l2APaUcRuTHBK
 f+Two42kaQHbhaqOKcN4/Y1EE6z6/WIfG43PXHnFpmiQrqXv448pOoeewWH72UKGEDNdz5OD5qn
 7vqeRhvcGYlNVySuxXmy2Jt0Nzgun6beqWEhmHgkoLHK8/3AbceSLQU7/TyOzDXfOkw==
X-Gm-Gg: ASbGncugzhxg9K/IFJRcjNASRa8uNBRMOzmjVb6+zziZaYO0gNet8ejUDD869LdmBxR
 tzdlrDjNDoXfMSipQZ7r3dwxsIJicSWc5zaum64yphYZtKUkB/c4bNisa8MosDFYUo3948YAHxr
 AyODX89w6GDwlfM/owuO7joy1LhN4BXGn0amgx0Y5HYqPeDJ2VRRTPa/F61LM13k7dSpP0agaQv
 c1lQVrzuoqbnOv+t6nQFsBIW2Y0FgRe+jy0UW6UriFQVVKgTZHIJSpTjwt80+TxgbSUgjONk+EV
 Hg==
X-Received: by 2002:a05:6214:1312:b0:6d3:f1ff:f8d6 with SMTP id
 6a1803df08f44-6e1b21dd1a8mr515957536d6.40.1738069365933; 
 Tue, 28 Jan 2025 05:02:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG74qMxHmpqIvfDEvBlHr0mowM+wIcCWTJFUEyHI9MoT/uQSWKb7Lkr30VZvE8sk2nB6SFvBw==
X-Received: by 2002:a05:6214:1312:b0:6d3:f1ff:f8d6 with SMTP id
 6a1803df08f44-6e1b21dd1a8mr515957046d6.40.1738069365497; 
 Tue, 28 Jan 2025 05:02:45 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e20525e3dbsm45169586d6.67.2025.01.28.05.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 05:02:44 -0800 (PST)
Date: Tue, 28 Jan 2025 14:02:42 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update drm/rcar-du maintainers
Message-ID: <b7ifg5jr5bsuj4dfcgyx4a2oaub4hxq5picxbho7bbl5634woe@wfwyd6k7eacd>
References: <20250128-rcar-du-maintainers-v2-1-4a3860a3e1ef@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="j3flvmbnmk55qa6y"
Content-Disposition: inline
In-Reply-To: <20250128-rcar-du-maintainers-v2-1-4a3860a3e1ef@ideasonboard.com>
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


--j3flvmbnmk55qa6y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] MAINTAINERS: Update drm/rcar-du maintainers
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 02:14:43PM +0200, Tomi Valkeinen wrote:
> Update drm/rcar-du maintainer entries:
>=20
> * Add myself as drm/rcar-du maintainer.
> * Update Laurent's email to include +renesas.
> * Switch Kieran from a maintainer to reviewer.
> * Change rcar-du to be under drm-misc umbrella.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--j3flvmbnmk55qa6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5jVcgAKCRAnX84Zoj2+
dlO7AYCQZDiLhoNK3olJFcuMqvlmcf39WDuiq/0soxNhjEQWggrdFC4ibJiPYnJd
V730Z5YBfjvjqXXr1B9GqU1iXVyEMNTNMydLfYoZkXalkLxWKpfWzHh4eMKMFT3+
C0fJxPgEgg==
=wc4o
-----END PGP SIGNATURE-----

--j3flvmbnmk55qa6y--

