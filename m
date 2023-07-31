Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4E76963F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C35810E27B;
	Mon, 31 Jul 2023 12:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5F910E27B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690806335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r9Nem70VXhscURRFjHneA41GuFGnyv7f4oehhBxRwX0=;
 b=Xcd9+UQDaKHHgkp4umVySZ7vqIWq/XaYWzPqLY+Ct5MsjtgETI1DcgKEMPGLF1egsw/upr
 C2DlDL+GXB2u/TEbBrLx5pJJsTZ/V9ovu+y0At3Y71F5UzQTAyTHXTKSeHpFl7UTVhi23O
 XX/8o1wq1Ch0RG1nm2WDlaUpxOn8FGw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-vsnHQlduP6mP33qCHbNu4A-1; Mon, 31 Jul 2023 08:25:34 -0400
X-MC-Unique: vsnHQlduP6mP33qCHbNu4A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-317a84a3ebeso233620f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 05:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690806333; x=1691411133;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9Nem70VXhscURRFjHneA41GuFGnyv7f4oehhBxRwX0=;
 b=CGB5opxLGNsD7QMgrAUyjuEE1POcz0Spla8IRgZTN/Ow/qO9IFyQ/mj9ec22uxgNfd
 q1BfQwXSJie8ieBf95ZE8Ue+3sdaEa/HcWDAjBveWpeX8G2EyOfFeFTuJK5nJxzMDUxJ
 gRXO9nHqLbBfNz/AAjf6sZV21HEMwdLooahedF15vObG48h9+Jo5xU2QpDpb4c65ETKm
 KxIwVx3BEIyJ92oLaBF8LM+UZDEIKN7lwX16+BJCTnw46AJGInlwW6tMhw1Wcp7H9GwW
 +mgTqgNXHVP/YXVgISHpyYnzu1Q1D5uMn8BYaU85dRgUafSDZfWMLOYpqLoixnHN3E/9
 q2Zw==
X-Gm-Message-State: ABy/qLaF6YgUVvacehLY/v9OwptzE6U1u+/uX0FAEFXsMHzk4nxHaOKS
 ObF44VEDDbCNHFmUcUQX26V6sjtQ1e7Az+vMDTi6kJAgEhOnmlpxu9cOLe3qePOZqYxsDP/XhIr
 zJKTWFY67oLbINiO8R6YvMZMH97BR
X-Received: by 2002:a05:6000:114b:b0:313:f38d:555f with SMTP id
 d11-20020a056000114b00b00313f38d555fmr7112714wrx.24.1690806332968; 
 Mon, 31 Jul 2023 05:25:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHx80N2/wUbfKTNv4zGnM4S2+hrXff5qVGFoGEHAp0JaDNziiiHN9CnzWS3Kj1c9layamOFGg==
X-Received: by 2002:a05:6000:114b:b0:313:f38d:555f with SMTP id
 d11-20020a056000114b00b00313f38d555fmr7112694wrx.24.1690806332663; 
 Mon, 31 Jul 2023 05:25:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5005000000b00311d8c2561bsm12877033wrt.60.2023.07.31.05.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:25:32 -0700 (PDT)
Date: Mon, 31 Jul 2023 14:25:32 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
Subject: Re: [PATCH] drm/tests: Alloc drm_device on drm_exec tests
Message-ID: <y6yyaridklxq5oepptjl4utwbruvmmloksjbbclnmf5eybbs3p@6xrbtgow2enq>
References: <20230727192259.237935-1-arthurgrillo@riseup.net>
 <2qt3go2ark5swawiponvvrlnq6tdxtyivaif2svzba4ajoo2zm@bhuv2qsjtytm>
 <591114cb-88f7-0a43-f2ba-8ab5836571c9@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mgu6nzhvnm6ezdu3"
Content-Disposition: inline
In-Reply-To: <591114cb-88f7-0a43-f2ba-8ab5836571c9@riseup.net>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 tales.aparecida@gmail.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, boris.brezillon@collabora.com, dakr@redhat.com,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mgu6nzhvnm6ezdu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 28, 2023 at 02:43:14PM -0300, Arthur Grillo Queiroz Cabral wrot=
e:
> >>  drivers/gpu/drm/tests/drm_exec_test.c | 36 +++++++++++++++++++++------
> >>  1 file changed, 29 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/t=
ests/drm_exec_test.c
> >> index 727ac267682e..df31f89a7945 100644
> >> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> >> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> >> @@ -12,11 +12,31 @@
> >> =20
> >>  #include <drm/drm_exec.h>
> >>  #include <drm/drm_device.h>
> >> +#include <drm/drm_drv.h>
> >>  #include <drm/drm_gem.h>
> >> +#include <drm/drm_kunit_helpers.h>
> >> =20
> >>  #include "../lib/drm_random.h"
> >> =20
> >> -static struct drm_device dev;
> >> +static struct device *dev;
> >> +static struct drm_device *drm;
> >> +
> >> +static int test_init(struct kunit *test)
> >> +{
> >> +	dev =3D drm_kunit_helper_alloc_device(test);
> >> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> >> +
> >> +	drm =3D __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm),=
 0,
> >> +						  DRIVER_MODESET);
> >> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void test_exit(struct kunit *test)
> >> +{
> >> +	drm_kunit_helper_free_device(test, dev);
> >> +}

Also, I just pushed changes that make the call to
drm_kunit_helper_free_device unnecessary.

Maxime

--mgu6nzhvnm6ezdu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMeoOwAKCRDj7w1vZxhR
xdY3AQCH4kRnXrQ45TnlgXd0Pzq4rAd/RJbO6o9tMspRrcOn7AD+IWFNEtWTFnF+
8IhWfN9hl8j35dNPhuzhf4BwnEBz8wI=
=zh8o
-----END PGP SIGNATURE-----

--mgu6nzhvnm6ezdu3--

