Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61B379397E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C2210E5E6;
	Wed,  6 Sep 2023 10:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F3610E5E6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 10:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693994825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=/RQY8EhQSYV947okEcMf9SCXpiOLyQ4TKDc7ZGfngFs=;
 b=WIY4bIPfnwaTIiNRUud1Aybk9Oca8mql7NNj/bseTvAIiCYIp9MXZXYmxdB0AKDkNQBLDQ
 jRsDjmKXbmqEyr7t6KnpLuGl0YP31ppkrz1GgX8oysTAr5Es68fz0g2S90FF2tiklNEkSq
 y46FcoAtF0ZcMG/yG0+dANBNKvHWejk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-KBruLV-iNOOGhyuuzXv8Hg-1; Wed, 06 Sep 2023 06:07:04 -0400
X-MC-Unique: KBruLV-iNOOGhyuuzXv8Hg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-76dbec0d84eso318439185a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 03:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693994823; x=1694599623;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/RQY8EhQSYV947okEcMf9SCXpiOLyQ4TKDc7ZGfngFs=;
 b=dtVP5z0stQk+HN0IbVkCCX/1te9pZN7jalqaWV9KjLiWhuCxQU5SXuZp62F1eDK2Tk
 4J/htuCIWjd75wJNdBLzSlsqssXJHDUPX5BjzH+62FQDRJJOzZt+0sIlazqtA+dfFElU
 OlqY0wvC23rYOEyOndlBpgtswMisbAk7dwwmB3FF/RHS7yuDNdmsNR4aRIkFVdJGXZn/
 VzR4NAEB0csaZTSCOjvxKWkr3+O6e7wm46fIM7LlPo5vIr6EMiQfEbdpSJpeIfqHOiav
 m3sCMdQJ4wGJEIPnO3Cuw/P7AOKsDTtTfFHWpRy0Ys3hOm8E0ZHU4meg3PFjtoF+3LSI
 KF/Q==
X-Gm-Message-State: AOJu0YzTb+nNn6hcSc8o3G/o7aR0bM6iRnwd6vTJJRtuCVlGHxp5CPM7
 RWXINQskD0D9NCkRuqZlD9GzW7EiJS2RI27TwEhWLxKO++kp4yKpuNzKzwaq68d/w07scYaf+Mz
 rNQdi5j36gNWz7+PZsdBftJ6Vi4Hy
X-Received: by 2002:a05:620a:450e:b0:767:d0c:9ec1 with SMTP id
 t14-20020a05620a450e00b007670d0c9ec1mr18790047qkp.59.1693994823232; 
 Wed, 06 Sep 2023 03:07:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER6lA3GZ2HJx02uZDFzEvMD289KltLM2voUWuDrrPLQUuyA++SmLKTw5IhFvw4+QV3T8+bMw==
X-Received: by 2002:a05:620a:450e:b0:767:d0c:9ec1 with SMTP id
 t14-20020a05620a450e00b007670d0c9ec1mr18790022qkp.59.1693994822882; 
 Wed, 06 Sep 2023 03:07:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 oo20-20020a05620a531400b00767f14f5856sm4822652qkn.117.2023.09.06.03.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 03:07:02 -0700 (PDT)
Date: Wed, 6 Sep 2023 12:07:00 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/tests/drm_exec: Add a test for object
 freeing within drm_exec_fini()
Message-ID: <b5eaqvccx7iitverhenjozczpvgrehcznl2k2c43t6qlnn4sf4@wzkzsntne5mt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b3p2wfg2aaam75px"
Content-Disposition: inline
In-Reply-To: <5d25d6ea-3a96-3be1-3742-7e3c1b417d14@linux.intel.com>
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
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--b3p2wfg2aaam75px
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 03:42:58PM +0200, Thomas Hellstr=F6m wrote:
> Hi, Maxime
>=20
> On 9/5/23 15:16, Maxime Ripard wrote:
> > On Tue, Sep 05, 2023 at 02:32:38PM +0200, Thomas Hellstr=F6m wrote:
> > > Hi,
> > >=20
> > > On 9/5/23 14:05, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Tue, Sep 05, 2023 at 10:58:31AM +0200, Thomas Hellstr=F6m wrote:
> > > > > Check that object freeing from within drm_exec_fini() works as ex=
pected
> > > > > and doesn't generate any warnings.
> > > > >=20
> > > > > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.c=
om>
> > > > > ---
> > > > >    drivers/gpu/drm/tests/drm_exec_test.c | 47 +++++++++++++++++++=
++++++++
> > > > >    1 file changed, 47 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/=
drm/tests/drm_exec_test.c
> > > > > index 563949d777dd..294c25f49cc7 100644
> > > > > --- a/drivers/gpu/drm/tests/drm_exec_test.c
> > > > > +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> > > > > @@ -170,6 +170,52 @@ static void test_prepare_array(struct kunit =
*test)
> > > > >    	drm_gem_private_object_fini(&gobj2);
> > > > >    }
> > > > > +static const struct drm_gem_object_funcs put_funcs =3D {
> > > > > +	.free =3D (void *)kfree,
> > > > > +};
> > > > > +
> > > > > +/*
> > > > > + * Check that freeing objects from within drm_exec_fini()
> > > > > + * behaves as expected.
> > > > > + */
> > > > > +static void test_early_put(struct kunit *test)
> > > > > +{
> > > > > +	struct drm_exec_priv *priv =3D test->priv;
> > > > > +	struct drm_gem_object *gobj1;
> > > > > +	struct drm_gem_object *gobj2;
> > > > > +	struct drm_gem_object *array[2];
> > > > > +	struct drm_exec exec;
> > > > > +	int ret;
> > > > > +
> > > > > +	gobj1 =3D kzalloc(sizeof(*gobj1), GFP_KERNEL);
> > > > > +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj1);
> > > > > +	if (!gobj1)
> > > > > +		return;
> > > > > +
> > > > > +	gobj2 =3D kzalloc(sizeof(*gobj2), GFP_KERNEL);
> > > > > +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj2);
> > > > > +	if (!gobj2) {
> > > > > +		kfree(gobj1);
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	gobj1->funcs =3D &put_funcs;
> > > > > +	gobj2->funcs =3D &put_funcs;
> > > > > +	array[0] =3D gobj1;
> > > > > +	array[1] =3D gobj2;
> > > > > +	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
> > > > > +	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
> > > > > +
> > > > > +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> > > > > +	drm_exec_until_all_locked(&exec)
> > > > > +		ret =3D drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
> > > > > +					     1);
> > > > > +	KUNIT_EXPECT_EQ(test, ret, 0);
> > > > > +	drm_gem_object_put(gobj1);
> > > > > +	drm_gem_object_put(gobj2);
> > > > > +	drm_exec_fini(&exec);
> > > > It doesn't look like you actually check that "freeing objects from
> > > > within drm_exec_fini() behaves as expected." What is the expectation
> > > > here, and how is it checked?
> > > Hm. Good question, I've been manually checking dmesg for lockdep spla=
ts. Is
> > > there a way to automate that?
> > I'm not familiar with the drm_exec API, but judging by the code I'd
> > assume you want to check that gobj1 and gobj2 are actually freed using
> > kfree?
>=20
> Actually not. What's important here is that the call to drm_exec_fini(),
> which puts the last references to gobj1 and gobj2 doesn't trigger any
> lockdep splats, like the one in the commit message of patch 3/3. So to ma=
ke
> more sense, the test could perhaps be conditioned on
> CONFIG_DEBUG_LOCK_ALLOC. Still it would require manual checking of dmesg()
> after being run.

I'm not aware of something to check on lockdep's status when running a
kunit test, but I'm not sure anyone is expected to look at the dmesg
trace when running kunit to find out whether the test succeeded or not.

It looks like there was an attempt at some point to fail the test if
there was a lockdep error:
https://lore.kernel.org/all/20200814205527.1833459-1-urielguajardojr@gmail.=
com/

It doesn't look like it's been merged though. David, Brendan, do you
know why it wasn't merged or if there is a good option for us there?

At the very least, I think a comment after the call to drm_exec_fini to
make it clear that the error would be in the kernel logs, and a better
one on the test definition to explicitly say what you want to make sure
of, and how one can check it's been done would be great.

Maxime

--b3p2wfg2aaam75px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPhPRAAKCRDj7w1vZxhR
xfKrAP9GJQ9krwMWKBfn+oS/xcJcENfMR2hgY8v24XvFjdc2tQD8CrK6MAaFADhH
vRBoO3UJcLAhsnt7EihZYwy1JZ/tGws=
=xOIu
-----END PGP SIGNATURE-----

--b3p2wfg2aaam75px--

