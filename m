Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C644990EB30
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 14:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04D010E05C;
	Wed, 19 Jun 2024 12:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F2LPeKbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C03210E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 12:34:52 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f9b523a15cso3277995ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 05:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718800491; x=1719405291; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=izLEjKclWmIAjHC4MNPzF0kEUXBzIGhUDyI33snqJIc=;
 b=F2LPeKbi9gOv7K8+K8sHCw+/EMNO7EQGlXh/f0pBnF5Qnvag5NKhIsEmRUM+uyaD6g
 7MLv6R+2Acofj1QwihxpoH37XeI7gn5gsqVEpS/G6qykQF0rcASw+7RhUjHrt/sy2S2v
 h3vdrsAhUQPsEa5TYm1dAPLx+2JYECnq/LRvZhJ1A/RzT9a92lQ3EYhq0UZx9ymK6UM+
 f2PHyCFyXG2HxnbDJHAnw8ZXyKF6s9eOW5DtaOfB2Q3QGHzzoCjizkhoCni5Mq0oyGep
 g7MWhQPQbQHLUwLfphrINavJVuu/j6quP2BVFbgcgivh6ZqcDeX0Tr5pgVlOUvsf8k4A
 UnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718800491; x=1719405291;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=izLEjKclWmIAjHC4MNPzF0kEUXBzIGhUDyI33snqJIc=;
 b=M5VDl/SoXrhyR5fEhdxMHUEYl7lomE9cJ360WoN8i2CVx3ZRif0249CvWGOjLSW4gm
 iwsNnGwBOpTN0fhIRdCc5ixT8+tXFmSNicduv0ZyJFrprwsyW4T21VxPZ7RkxgRMzB+Y
 YrMDM+WxUzAubplTuHS0unVv9tvjsyEEU1y0ojgpvlLaEI9cZvpVSrQRUumgReEZg6Va
 URuknm+D0hSt0b/+It7YCRzmPEDfDrkjGExoaYPpm503T4g7EhyHVxL+7hn2k7mPVmRJ
 0dU5jycwzpFFtYZWovzl96hyGH5l/ZeDKrH6evj4aOD3YDsuGuw6EbHCo+vU+1a48PLo
 Wz6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdi0/815dss206bN3tE/CRWVeLs0tn34ndq6S419PngiNEBLNNHmT3Wm6Bng0Xn6Z7CGumTNW1JltuqzbgNHEbefV6x7LzXMEitrs8jzvx
X-Gm-Message-State: AOJu0YybMnAoXjjP4UDLk68IfvMRDobVZnpyLD1vh69KtTmHdAbWLueV
 25s561mFE61rMt/D8xkTNWR/SPf2ErtRk64YC3bmr0NXbiqgGLtP
X-Google-Smtp-Source: AGHT+IEcB9hqDiOaiiqXDcdkruBbV/uMxC4QPzGwEbCe7v1uupCHq+Ap/o3FdsOBJyDISnfA+bQ6nQ==
X-Received: by 2002:a17:902:e80d:b0:1f9:b19b:4281 with SMTP id
 d9443c01a7336-1f9b19b46admr18456575ad.33.1718800491391; 
 Wed, 19 Jun 2024 05:34:51 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f1ac4bsm115511095ad.227.2024.06.19.05.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 05:34:50 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id AE04C190E115C; Wed, 19 Jun 2024 19:34:48 +0700 (WIB)
Date: Wed, 19 Jun 2024 19:34:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v11 7/7] Documentation: dmaengine: Document new dma_vec API
Message-ID: <ZnLQaBQrV7KhxOeC@archie.me>
References: <20240618100302.72886-1-paul@crapouillou.net>
 <20240618100302.72886-8-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="P+G0VMb+YrutxSpB"
Content-Disposition: inline
In-Reply-To: <20240618100302.72886-8-paul@crapouillou.net>
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


--P+G0VMb+YrutxSpB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 12:03:02PM +0200, Paul Cercueil wrote:
> Document the dmaengine_prep_peripheral_dma_vec() API function, the
> device_prep_peripheral_dma_vec() backend function, and the dma_vec
> struct.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--P+G0VMb+YrutxSpB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZnLQaAAKCRD2uYlJVVFO
o62HAP9Sf4C2GxRgQTiPvegZlarJtrtpsHOKgq1BhJIuokVeCgEA3Sb4DkOK66Dj
J768fmI0av+lWGHkQD9s9mkd4Y3TcAc=
=Ys7t
-----END PGP SIGNATURE-----

--P+G0VMb+YrutxSpB--
