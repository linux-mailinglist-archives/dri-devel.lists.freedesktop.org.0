Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8780A735569
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 13:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6985210E1EA;
	Mon, 19 Jun 2023 11:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B32710E1E9;
 Mon, 19 Jun 2023 11:05:07 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A072D6606EF9;
 Mon, 19 Jun 2023 12:05:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687172706;
 bh=4LHp5MVHCXODGTOfil1qvQ6SuQH/Cyp5O008gr6r8D4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NTMKfk0+QXYodRtLWIuMU5jyKK0xYGArxbB4uqmPXY/Whgik8lbwXqg53GA9gUoht
 sxiXKwS+wXKiS3mHJBontdOh6JyJ4gZFivOqArHWWVXpLEPp4FHnsmxZWiJFkbT2c9
 blOKoYPD7dznHtmjGKgWOgRs0eYhwCV4ZXbFRc3lqsM1qjTPg+e+14BoFgYn8yX/gY
 3uJ8BIA+mz2jjS6WE/FuTu6fq8/7RwQtH7bpqS81vYH13ucNuXuuwsrO6UAvMiPUEO
 78IGtuHAW+hY58/M0/p3OYTtwk5KJ775S9JgkYJhdPaQgKxQ8BFq3kFS9JA2X3iOLX
 NHooAxeCP+njA==
Date: Mon, 19 Jun 2023 13:05:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Message-ID: <20230619130502.13e53b5e@collabora.com>
In-Reply-To: <26c94e6a-9458-7aeb-8e6f-85838bac43ca@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
 <20230619121234.4a826f53@collabora.com>
 <26c94e6a-9458-7aeb-8e6f-85838bac43ca@amd.com>
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

On Mon, 19 Jun 2023 12:44:06 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 19.06.23 um 12:12 schrieb Boris Brezillon:
> > [SNIP]
> > Note that the drm_exec_until_all_locked() helper I introduced is taking
> > an expression, so in theory, you don't have to define a separate
> > function.
> >
> > 	drm_exec_until_all_locked(&exec, {
> > 		/* inlined-code */
> > 		int ret;
> >
> > 		ret =3D blabla()
> > 		if (ret)
> > 			goto error;
> >
> > 		...
> >
> > error:
> > 		/* return value. */
> > 		ret;
> > 	});
> >
> > This being said, as soon as you have several failure paths,
> > it makes things a lot easier/controllable if you make it a function,
> > and I honestly don't think the readability would suffer from having a
> > function defined just above the user. My main concern with the original
> > approach was the risk of calling continue/break_if_contended() in the
> > wrong place, and also the fact you can't really externalize things to
> > a function if you're looking for a cleaner split. At least with
> > drm_exec_until_all_locked() you can do both. =20
>=20
> Yeah, but that means that you can't use return inside your code block=20
> and instead has to define an error label for handling "normal"=20
> contention which is what I'm trying to avoid here.
>=20
> How about:
>=20
> #define drm_exec_until_all_locked(exec)=C2=A0=C2=A0=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __drm_exec_retry: if (drm_exe=
c_cleanup(exec))
>=20
>=20
> #define drm_exec_retry_on_contention(exec)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(drm_exec_is_cont=
ended(exec)))=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto __drm_exec_retry
>=20
>=20
> And then use it like:
>=20
> drm_exec_until_all_locked(exec)
> {
>  =C2=A0=C2=A0=C2=A0 ret =3D drm_exec_prepare_obj(exec, obj);
>  =C2=A0=C2=A0=C2=A0 drm_exec_retry_on_contention(exec);
> }

That would work, and I was about to suggest extending my proposal with
a drm_exec_retry_on_contention() to support both use cases. The only
downside is the fact you might be able to break out of a loop that has
local variables, which will leak stack space.

>=20
> The only problem I can see with this is that the __drm_exec_retry label=20
> would be function local.

You can use local labels [1] to make it local to a block (see my
version, just need to rename the retry label into __drm_exec_retry). I
checked, and this is used elsewhere in the kernel (like in
linux/wait.h, which is a core feature), so it should be safe to use.

[1]https://gcc.gnu.org/onlinedocs/gcc/Local-Labels.html
