Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE67363C0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 08:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381CD10E25F;
	Tue, 20 Jun 2023 06:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A9510E25E;
 Tue, 20 Jun 2023 06:47:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 38F566606F23;
 Tue, 20 Jun 2023 07:47:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687243628;
 bh=0TT/70u6EJFMsxbYh7XTY8VA6PAj4oaCda1q7LxyPFQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D0JGzn+Ut+Jivasz2yNNDjkZo8oFtrFmSyWkJgLFgSxfb5PhhUbxShDtaoYGDNSnP
 3bNCaQeYpizSUJZxq0nYz3QVr63lgXgwKDVtaZ3lKJ/KqxlwU0engMQyy+mLBAFunA
 vzmIjcmIxBvVMjXiUZYi8VSe6hZJtlz8Mz3dt9htygaYiOv5a4q5G/95vSzKFMs93+
 pMKYLEHhy5ob6riHHDHuPymXzBeG6jY3cTbKilJjOZEu5I4CsgKI+3/AyJzdTrEMNf
 IuH/ySEUy0t7Hz2953RhyiYZsT1qqsBuJGav6dHYfIzo9YrHS4Bpo5+5M8pvx2WNB3
 wUT2XBDZCOrLg==
Date: Tue, 20 Jun 2023 08:47:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Message-ID: <20230620084704.154b95e2@collabora.com>
In-Reply-To: <20230619142923.74c21fca@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
 <20230619121234.4a826f53@collabora.com>
 <26c94e6a-9458-7aeb-8e6f-85838bac43ca@amd.com>
 <20230619142923.74c21fca@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Brost <matthew.brost@intel.com>, arunpravin.paneerselvam@amd.com,
 "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= \(Intel\)" <thomas_os@shipmail.org>,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, felix.kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Jun 2023 14:29:23 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Mon, 19 Jun 2023 12:44:06 +0200
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>=20
> > Am 19.06.23 um 12:12 schrieb Boris Brezillon: =20
> > > [SNIP]
> > > Note that the drm_exec_until_all_locked() helper I introduced is taki=
ng
> > > an expression, so in theory, you don't have to define a separate
> > > function.
> > >
> > > 	drm_exec_until_all_locked(&exec, {
> > > 		/* inlined-code */
> > > 		int ret;
> > >
> > > 		ret =3D blabla()
> > > 		if (ret)
> > > 			goto error;
> > >
> > > 		...
> > >
> > > error:
> > > 		/* return value. */
> > > 		ret;
> > > 	});
> > >
> > > This being said, as soon as you have several failure paths,
> > > it makes things a lot easier/controllable if you make it a function,
> > > and I honestly don't think the readability would suffer from having a
> > > function defined just above the user. My main concern with the origin=
al
> > > approach was the risk of calling continue/break_if_contended() in the
> > > wrong place, and also the fact you can't really externalize things to
> > > a function if you're looking for a cleaner split. At least with
> > > drm_exec_until_all_locked() you can do both.   =20
> >=20
> > Yeah, but that means that you can't use return inside your code block=20
> > and instead has to define an error label for handling "normal"=20
> > contention which is what I'm trying to avoid here. =20
>=20
> Sorry, didn't pay attention to this particular concern. Indeed, if you
> want to return inside the expression, that's a problem.

Sorry, that's wrong again. Had trouble focusing yesterday...

So, returning directly from the expression block should be perfectly
fine. The only problem is breaking out of the retry loop early and
propagating the error, but that's no more or less problematic than it
was before. We just need the drm_exec_retry_on_contention() helper you
suggested, and a drm_exec_stop() that would go to some local
__drm_exec_stop label.

	int ret =3D 0;

	ret =3D drm_exec_until_all_locked(exec, ({
		...
		ret =3D drm_exec_prepare_obj(exec, objA, 1);
		drm_exec_retry_on_contention(exec);
		if (ret)
			drm_exec_stop(exec, ret);
		...

		ret =3D drm_exec_prepare_obj(exec, objB, 1);
		drm_exec_retry_on_contention(exec);
		if (ret)
			drm_exec_stop(exec, ret);

		0;
	}));

Which is pretty close to the syntax you defined initially, except for
the '0;' oddity at the end, which is ugly, I admit.
