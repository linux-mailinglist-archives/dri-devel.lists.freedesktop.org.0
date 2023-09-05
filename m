Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D46792267
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 14:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789A610E4D4;
	Tue,  5 Sep 2023 12:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE4210E4D4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693915539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0dkZ1KJZsepLQqUtQEDB/h8zOJwM8DEby+OzwiVGCZk=;
 b=Cuf4onTN+XY82VJmdCVW7M+W5MlC726QaIlHv9KBWzRkiRIbanrAbnyWUNP97TZDSYGy5n
 psFcIW94g3Y2kjVKExAOyEUfjmgvTjpEuvfYq6ARSLXQqtASf0hFZ64e3qpQO8cEjrlMt5
 SttlbUila5OxF3g7wo80tk3Wqs7fboI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-qlssRuo1P2SAiJIKdmyCTQ-1; Tue, 05 Sep 2023 08:05:38 -0400
X-MC-Unique: qlssRuo1P2SAiJIKdmyCTQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-64bf507a8d4so26185316d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 05:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693915537; x=1694520337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dkZ1KJZsepLQqUtQEDB/h8zOJwM8DEby+OzwiVGCZk=;
 b=Yxt4QLBhIUa/5SQF911oSm2CwqlpdzOuOeML9aYHXd6VFLDver3aanim2gX1BQKLiM
 tdAHTczD0BuM9DuhYfNc6rVRVxinT0QtDUdLTtg/MrtJE+V1QNv3buF/aXWzYAVysESw
 VKvxyZvnrTlHASVJdyV1g7+M64Iae3pZ6MRy1oYLygM0aSDPKWo0HT5B6q/YTjsi0x1j
 JYrkE3tQYZWY8jjsf5Vly+D7ep25dg9aV8ptZDFdAG8O9IuwcasZM57TTY70fFQP/6zQ
 NqJd7l5ZY5uMh7a4NUUL27TJLlo4bM42ifBEueBDGPuNHaDDKkUzBWXWYSqOVa1YUTPd
 kvKQ==
X-Gm-Message-State: AOJu0Yz3tNrUUW+tk7NBCkEknPp5bMBEMdXCSRcrYR+VWw1zKZAJ1PZA
 rxJYRCJxYZKWn+z/LVVL4CJkP1AXZvSLYC04xlsweqsDmt//sEFIkj7i+3dOiEZFu/LUxf1Pq+u
 qrVtOT2M4ZIGni1kKOg6YVsCoE5J0xYrbqgiJ
X-Received: by 2002:a0c:e043:0:b0:64f:5261:55e0 with SMTP id
 y3-20020a0ce043000000b0064f526155e0mr12886164qvk.47.1693915537714; 
 Tue, 05 Sep 2023 05:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaRw1lL/3YxzGgDeWiMq/eRSqI/4SgOwVXbGqoDEjPbHbhO5iri59oTqXrgTS7zP2KmVYyEg==
X-Received: by 2002:a0c:e043:0:b0:64f:5261:55e0 with SMTP id
 y3-20020a0ce043000000b0064f526155e0mr12886144qvk.47.1693915537356; 
 Tue, 05 Sep 2023 05:05:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a0cda0f000000b005dd8b9345b4sm4368500qvj.76.2023.09.05.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 05:05:36 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:05:35 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/tests/drm_exec: Add a test for object
 freeing within drm_exec_fini()
Message-ID: <vz5bvqnxk5n73dxhbsps77i7aqa3nk5vnytnkszlx3ty7klaz3@gllrfksqstwu>
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n7wfbhuyrvxllxfy"
Content-Disposition: inline
In-Reply-To: <20230905085832.2103-3-thomas.hellstrom@linux.intel.com>
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n7wfbhuyrvxllxfy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 05, 2023 at 10:58:31AM +0200, Thomas Hellstr=F6m wrote:
> Check that object freeing from within drm_exec_fini() works as expected
> and doesn't generate any warnings.
>=20
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/tests/drm_exec_test.c | 47 +++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/test=
s/drm_exec_test.c
> index 563949d777dd..294c25f49cc7 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -170,6 +170,52 @@ static void test_prepare_array(struct kunit *test)
>  	drm_gem_private_object_fini(&gobj2);
>  }
> =20
> +static const struct drm_gem_object_funcs put_funcs =3D {
> +	.free =3D (void *)kfree,
> +};
> +
> +/*
> + * Check that freeing objects from within drm_exec_fini()
> + * behaves as expected.
> + */
> +static void test_early_put(struct kunit *test)
> +{
> +	struct drm_exec_priv *priv =3D test->priv;
> +	struct drm_gem_object *gobj1;
> +	struct drm_gem_object *gobj2;
> +	struct drm_gem_object *array[2];
> +	struct drm_exec exec;
> +	int ret;
> +
> +	gobj1 =3D kzalloc(sizeof(*gobj1), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj1);
> +	if (!gobj1)
> +		return;
> +
> +	gobj2 =3D kzalloc(sizeof(*gobj2), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj2);
> +	if (!gobj2) {
> +		kfree(gobj1);
> +		return;
> +	}
> +
> +	gobj1->funcs =3D &put_funcs;
> +	gobj2->funcs =3D &put_funcs;
> +	array[0] =3D gobj1;
> +	array[1] =3D gobj2;
> +	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec)
> +		ret =3D drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
> +					     1);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	drm_gem_object_put(gobj1);
> +	drm_gem_object_put(gobj2);
> +	drm_exec_fini(&exec);

It doesn't look like you actually check that "freeing objects from
within drm_exec_fini() behaves as expected." What is the expectation
here, and how is it checked?

Maxime

--n7wfbhuyrvxllxfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPcZjwAKCRDj7w1vZxhR
xaONAQDDD1LtuG0RN+97ROcrQpv6w4AEjkYLmVmzQZ/tM1KSGAEAwB3k3Er1eN9M
/Shg30CE3pS4o9Yhydjqot1zPCQ+ZAs=
=bvap
-----END PGP SIGNATURE-----

--n7wfbhuyrvxllxfy--

