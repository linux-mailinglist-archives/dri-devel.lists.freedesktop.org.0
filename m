Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261AC7922E3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 15:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D9410E504;
	Tue,  5 Sep 2023 13:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D9310E504
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693919797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D2e15mZf8wc2pLJFSqPYfWYyT02HvCbecy8nwwwpEzE=;
 b=IhrC9ZAtAN/UH53QeUJbaDLgoc7ZZyCySvjjnc+E7uudKMrKTA8dUbuoQgtzTWpNx7ofSB
 q2fq8p3ytw7wPwYLnUVjv65eptyJvwsAmF2UTYKYV5EpqXM+V+BkN4JJt2hp6LVx/5z/In
 tnmgSyYeEy+uKfT4iFKaj3tLoubTGOA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-f2s4f63XM2GfFEl0_qccsA-1; Tue, 05 Sep 2023 09:16:36 -0400
X-MC-Unique: f2s4f63XM2GfFEl0_qccsA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-76ef8b91a84so152836885a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 06:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693919795; x=1694524595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D2e15mZf8wc2pLJFSqPYfWYyT02HvCbecy8nwwwpEzE=;
 b=MbJsih9e4hLkVM7AhS69yUbDzVMIl4QKlZ8DeMIhNCb8rOCOhmFtbtkCBU0B6+Yupj
 99vCd2ZYCmOcuHKrmuQhTlHdd1i6oRxxw7ECXG/q27grTiW9okbbRRu8tDQD+UrsAeXe
 Qu5p7PHSI+TYyyugB++p5Nuw+C4AZxg26dNR9NeKj5gmi6Tw6nFKXuGTHgkxbFrXvbP1
 XbeaIyBPhe8KtcDCRrxXKZm3aI+GaLFopV8dZk9gmg6bZmM5hUA8KEL2K6077GatyyfV
 8+vzFu4cCnTv47ycIVaBtJPgLbYi/gzjlgFHbZIdjGgo8kI79Wq5qY+LdV86Bs3ZnbSu
 0o6w==
X-Gm-Message-State: AOJu0Yz/u3Ua1NKOIwX9dkXG+uNikSaGOPzc742U02wIP52/+/XFoTL+
 vbaRE07XYGKrwGosG3xmH/KMpicY85R0ypYVtP+WveUCUUKdRwgHpfo7uhBg1qB48Hms1DVwTsE
 Xf6Rhe9QMOA9T+0NDZtxCaA1oV19T
X-Received: by 2002:a05:620a:394c:b0:76e:f686:cad8 with SMTP id
 qs12-20020a05620a394c00b0076ef686cad8mr21139152qkn.13.1693919795670; 
 Tue, 05 Sep 2023 06:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXLjjut/BFEx7KZ+dSJuY/sFNWQK39O7TBGPi5Ws98D45ermySX54qU/N+vi0/bAj3mHB+FA==
X-Received: by 2002:a05:620a:394c:b0:76e:f686:cad8 with SMTP id
 qs12-20020a05620a394c00b0076ef686cad8mr21139123qkn.13.1693919795352; 
 Tue, 05 Sep 2023 06:16:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ou15-20020a05620a620f00b0076c94030a2esm4055947qkn.114.2023.09.05.06.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 06:16:34 -0700 (PDT)
Date: Tue, 5 Sep 2023 15:16:32 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/tests/drm_exec: Add a test for object
 freeing within drm_exec_fini()
Message-ID: <h4sw3wafjeuf46cvedvqy33q7rnbl7ghoango53hsewcgxnbwk@satazuly25lr>
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-3-thomas.hellstrom@linux.intel.com>
 <vz5bvqnxk5n73dxhbsps77i7aqa3nk5vnytnkszlx3ty7klaz3@gllrfksqstwu>
 <7116926a-af9a-9a14-b6df-a7f4442d90a5@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wsoatwpusmvowrve"
Content-Disposition: inline
In-Reply-To: <7116926a-af9a-9a14-b6df-a7f4442d90a5@linux.intel.com>
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


--wsoatwpusmvowrve
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 02:32:38PM +0200, Thomas Hellstr=F6m wrote:
> Hi,
>=20
> On 9/5/23 14:05, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Sep 05, 2023 at 10:58:31AM +0200, Thomas Hellstr=F6m wrote:
> > > Check that object freeing from within drm_exec_fini() works as expect=
ed
> > > and doesn't generate any warnings.
> > >=20
> > > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/tests/drm_exec_test.c | 47 ++++++++++++++++++++++++=
+++
> > >   1 file changed, 47 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/=
tests/drm_exec_test.c
> > > index 563949d777dd..294c25f49cc7 100644
> > > --- a/drivers/gpu/drm/tests/drm_exec_test.c
> > > +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> > > @@ -170,6 +170,52 @@ static void test_prepare_array(struct kunit *tes=
t)
> > >   	drm_gem_private_object_fini(&gobj2);
> > >   }
> > > +static const struct drm_gem_object_funcs put_funcs =3D {
> > > +	.free =3D (void *)kfree,
> > > +};
> > > +
> > > +/*
> > > + * Check that freeing objects from within drm_exec_fini()
> > > + * behaves as expected.
> > > + */
> > > +static void test_early_put(struct kunit *test)
> > > +{
> > > +	struct drm_exec_priv *priv =3D test->priv;
> > > +	struct drm_gem_object *gobj1;
> > > +	struct drm_gem_object *gobj2;
> > > +	struct drm_gem_object *array[2];
> > > +	struct drm_exec exec;
> > > +	int ret;
> > > +
> > > +	gobj1 =3D kzalloc(sizeof(*gobj1), GFP_KERNEL);
> > > +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj1);
> > > +	if (!gobj1)
> > > +		return;
> > > +
> > > +	gobj2 =3D kzalloc(sizeof(*gobj2), GFP_KERNEL);
> > > +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj2);
> > > +	if (!gobj2) {
> > > +		kfree(gobj1);
> > > +		return;
> > > +	}
> > > +
> > > +	gobj1->funcs =3D &put_funcs;
> > > +	gobj2->funcs =3D &put_funcs;
> > > +	array[0] =3D gobj1;
> > > +	array[1] =3D gobj2;
> > > +	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
> > > +	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
> > > +
> > > +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> > > +	drm_exec_until_all_locked(&exec)
> > > +		ret =3D drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
> > > +					     1);
> > > +	KUNIT_EXPECT_EQ(test, ret, 0);
> > > +	drm_gem_object_put(gobj1);
> > > +	drm_gem_object_put(gobj2);
> > > +	drm_exec_fini(&exec);
> > It doesn't look like you actually check that "freeing objects from
> > within drm_exec_fini() behaves as expected." What is the expectation
> > here, and how is it checked?
>=20
> Hm. Good question, I've been manually checking dmesg for lockdep splats. =
Is
> there a way to automate that?

I'm not familiar with the drm_exec API, but judging by the code I'd
assume you want to check that gobj1 and gobj2 are actually freed using
kfree?

If so, I've used tested for that by creating a waitqueue and completing
it from the free function. You won't be certain that you have gone
through kfree, but you'll know that drm_gem_object_funcs.free will have
been called which is what you actually care about I think?

So something along those lines would work I think:

struct test_gem_object {
	struct drm_gem_object base;
	wait_queue_head_t freed_wq;
	bool freed_done;
};

void free_test_gem_object(struct drm_gem_object *obj)
{
	struct test_gem_object *test_obj =3D
		container_of(obj, struct test_gem_object, base)

	test_obj->freed_done =3D true;
	wake_up(&test_obj->freed_wq);
};

static const struct drm_gem_object_funcs put_funcs =3D {
	.free =3D free_test_gem_object,
}

static void test_early_put(struct kunit *test)
{
	struct test_gem_object *gobj1;
	...
	gobj1 =3D kunit_kzalloc(test, sizeof(*gobj1), GFP_KERNEL);
	...
	gobj1->base.funcs =3D &put_funcs;
	...
	array[0] =3D &gobj1->base;

	drm_exec_fini(&exec);

	ret =3D wait_event_interruptible_timeout(gobj1->freed_wq, gobj1->freed_don=
e,
                                               msecs_to_jiffies(TIMEOUT_MS)=
);
	KUNIT_EXPECT_GT(test, ret, 0);
}

I guess?

Maxime

--wsoatwpusmvowrve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPcqMAAKCRDj7w1vZxhR
xVNUAQCfEq4Dq8DBI0yebooCQEDDo17XNmTsm75piiH0dfYVZAD/cphORcnbYH6c
H4dfONcH0Z6zfTWALrZ8jH4m0ivE3gY=
=R4A7
-----END PGP SIGNATURE-----

--wsoatwpusmvowrve--

