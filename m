Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1579B7351AE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 12:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290CC10E1D3;
	Mon, 19 Jun 2023 10:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09310E1D3;
 Mon, 19 Jun 2023 10:12:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DD9AD6606E98;
 Mon, 19 Jun 2023 11:12:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687169558;
 bh=EgauzNe1Ens0L1BRbIqkdQ5RED+j+1AtnVp4JcQLx74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oVih7nRnmoh4MXMMNfQ1X2ncSVSxgK+znKYMoyaV9fZ8dfpL1zuXWrp8BVB1nPbJS
 AeGj3bFCPSw5xYzzXtR+5I54Ev8Z9XgQS+4h71o3osANC0sMY1lhB86OeMkYR5o0CR
 InHNbXl/qO6o//+yFu5VVoDxyDDCGDb6zUDCJrVLgGIYND+xP1EAUgs46I1mQV47Z6
 k0Txy/ocwxgCN+TpxZkvwHNNkktyug8wYMuSdUcP5dHfflF3+6Y90fEr8UGqtvt88Z
 b0PW/CKzbmjc80DfWqubnC4dkAaT781iRrGFcuGWQazCPV+DLsvUh47+yAYBfOYMle
 qCY8S+wSgfOBw==
Date: Mon, 19 Jun 2023 12:12:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= (Intel)" <thomas_os@shipmail.org>
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Message-ID: <20230619121234.4a826f53@collabora.com>
In-Reply-To: <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
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
 felix.kuehling@amd.com, francois.dugast@intel.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On Mon, 19 Jun 2023 10:59:16 +0200
Thomas Hellstr=C3=B6m (Intel) <thomas_os@shipmail.org> wrote:

> >>>>      =20
> >>>>> +/**
> >>>>> + * DOC: Overview
> >>>>> + *
> >>>>> + * This component mainly abstracts the retry loop necessary for lo=
cking
> >>>>> + * multiple GEM objects while preparing hardware operations (e.g. =
command
> >>>>> + * submissions, page table updates etc..).
> >>>>> + *
> >>>>> + * If a contention is detected while locking a GEM object the clea=
nup procedure
> >>>>> + * unlocks all previously locked GEM objects and locks the contend=
ed one first
> >>>>> + * before locking any further objects.
> >>>>> + *
> >>>>> + * After an object is locked fences slots can optionally be reserv=
ed on the
> >>>>> + * dma_resv object inside the GEM object.
> >>>>> + *
> >>>>> + * A typical usage pattern should look like this::
> >>>>> + *
> >>>>> + *	struct drm_gem_object *obj;
> >>>>> + *	struct drm_exec exec;
> >>>>> + *	unsigned long index;
> >>>>> + *	int ret;
> >>>>> + *
> >>>>> + *	drm_exec_init(&exec, true);
> >>>>> + *	drm_exec_while_not_all_locked(&exec) {
> >>>>> + *		ret =3D drm_exec_prepare_obj(&exec, boA, 1);
> >>>>> + *		drm_exec_continue_on_contention(&exec);
> >>>>> + *		if (ret)
> >>>>> + *			goto error;
> >>>>> + * =20
> >>>> Have you considered defining a drm_exec_try_prepare_obj_or_retry()
> >>>> combining drm_exec_prepare_obj() and drm_exec_continue_on_contention=
()?
> >>>>
> >>>> #define drm_exec_try_prepare_obj_or_retry(exec, obj, num_fences) \
> >>>>           ({ \
> >>>>                   int __ret =3D drm_exec_prepare_obj(exec, bo, num_f=
ences); \
> >>>>                   if (unlikely(drm_exec_is_contended(exec))) \
> >>>>                           continue; \
> >>>>                   __ret; \
> >>>>           })
> >>>>
> >>>> This way the following pattern
> >>>>
> >>>> 		ret =3D drm_exec_prepare_obj(&exec, boA, 1);
> >>>> 		drm_exec_continue_on_contention(&exec);
> >>>> 		if (ret)
> >>>> 			goto error;
> >>>>
> >>>> can be turned into something more conventional:
> >>>>
> >>>> 		ret =3D drm_exec_try_prepare_obj_or_retry(&exec, boA, 1);
> >>>> 		if (ret)
> >>>> 			goto error; =20
> >>> Yeah, I was considering that as well. But then abandoned it as to
> >>> complicated.
> >>>
> >>> I really need to find some time to work on that anyway. =20
> > I've been playing with drm_exec for a couple weeks now, and I wanted
> > to share something I hacked to try and make the API simpler and
> > more robust against misuse (see the below diff, which is a slightly
> > adjusted version of your work). =20
>=20
> It would be good if we could have someone taking charge of this series=20
> and address all review comments, I see some of my comments getting lost,=
=20
> we have multiple submitters and I can't find a dri-devel patchwork entry=
=20
> for this.

My bad, I wasn't intending to submit a new version. I just added a
diff to show what I had in mind. This being said, it'd be great if we
could make some progress on this series, because we have quite a few
drivers depending on it now.

>=20
> >
> > In this version, the user is no longer in control of the retry
> > loop. Instead, it provides an expression (a call to a
> > sub-function) to be re-evaluated each time a contention is
> > detected. IMHO, this makes the 'prepare-objs' functions easier to
> > apprehend, and avoids any mistake like calling
> > drm_exec_continue_on_contention() in an inner loop, or breaking
> > out of the drm_exec_while_all_locked() loop unintentionally. =20
>=20
> In i915 we've had a very similar helper to this, and while I agree this=20
> newer version would probably help make code cleaner, but OTOH there also=
=20
> are some places where the short drm_exec_while_all_locked() -likeblock=20
> don't really motivate a separate function. Porting i915 to the current=20
> version will take some work, For=C2=A0 the xe driver both versions would =
work=20
> fine.

Note that the drm_exec_until_all_locked() helper I introduced is taking
an expression, so in theory, you don't have to define a separate
function.

	drm_exec_until_all_locked(&exec, {
		/* inlined-code */
		int ret;

		ret =3D blabla()
		if (ret)
			goto error;

		...

error:
		/* return value. */
		ret;
	});

This being said, as soon as you have several failure paths,
it makes things a lot easier/controllable if you make it a function,
and I honestly don't think the readability would suffer from having a
function defined just above the user. My main concern with the original
approach was the risk of calling continue/break_if_contended() in the
wrong place, and also the fact you can't really externalize things to
a function if you're looking for a cleaner split. At least with
drm_exec_until_all_locked() you can do both.

Regards,

Boris
