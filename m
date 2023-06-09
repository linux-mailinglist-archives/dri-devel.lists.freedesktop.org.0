Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB586729C6B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 16:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B333110E059;
	Fri,  9 Jun 2023 14:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15E410E059
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 14:10:12 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C3E9E66028F5;
 Fri,  9 Jun 2023 15:10:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686319810;
 bh=fEKB2Dc+bAcIYrc9tq0hrHYONPS84sVAn04kvwj4XNk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RVUdXs8nHUitWFJUilsjXfW+FdIdItyNbSb70cR69deCUG9Ib5wFHlojBNazxjlsq
 Y1zcT3NHIw9JFnpJ4TNwG71fjJoo7dNHOtf2At68uzyTY5iYFfBidRDfY2woe77t/W
 0g5z2LDgKg0knFMjITtjHyWFqDO04xqo44DoiTkH0MwMDFm2lFR+yDs/T+Xkg+glty
 PGCkfY9uCyGM2OGpOZKwtBmRXybWPb3Uf65FoiB/+LbluWjFD1Brxtt48yqbNRf0kA
 3K+qRKHuoxmgdFJDDNR/Q3VLAItEk1JARFCu8kCWbAuhS+jDahGW8Nxj/k0/7wkn//
 dsy4sHVHH/l5Q==
Date: Fri, 9 Jun 2023 16:10:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH] drm/sched: Wait for the currently popped dependency
 in kill_jobs_cb()
Message-ID: <20230609161006.7992a477@collabora.com>
In-Reply-To: <bec5582e-2172-cb01-c8b2-283b9aab414a@amd.com>
References: <20230608065551.676490-1-boris.brezillon@collabora.com>
 <bec5582e-2172-cb01-c8b2-283b9aab414a@amd.com>
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Christian,

On Fri, 9 Jun 2023 13:53:59 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 08.06.23 um 08:55 schrieb Boris Brezillon:
> > If I understand correctly, drm_sched_entity_kill_jobs_cb() is supposed
> > to wait on all the external dependencies (those added to
> > drm_sched_job::dependencies) before signaling the job finished fence.
> > This is done this way to prevent jobs depending on these canceled jobs
> > from considering the resources they want to access as ready, when
> > they're actually still used by other components, thus leading to
> > potential data corruptions.
> >
> > The problem is, the kill_jobs logic is omitting the last fence popped
> > from the dependencies array that was waited upon before
> > drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
> > so we're basically waiting for all dependencies except one.
> >
> > This is an attempt at fixing that, but also an opportunity to make sure
> > I understood the drm_sched_entity_kill(), because I'm not 100% sure if
> > skipping this currently popped dependency was intentional or not. I can=
't
> > see a good reason why we'd want to skip that one, but I might be missing
> > something.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Frank Binns <frank.binns@imgtec.com>
> > Cc: Sarah Walker <sarah.walker@imgtec.com>
> > Cc: Donald Robson <donald.robson@imgtec.com>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > ---
> > Stumbled across this issue while working on native dependency support
> > with Donald (which will be posted soon). Flagged as RFC, because I'm
> > not sure this is legit, and also not sure we want to fix it this way.
> > I tried re-using drm_sched_entity::dependency, but it's a bit of a mess
> > because of the asynchronousity of the wait, and the fact we use
> > drm_sched_entity::dependency to know if we have a clear_dep()
> > callback registered, so we can easily reset it without removing the
> > callback. =20
>=20
> Well yes, that's a known problem. But this is really not the right=20
> approach to fixing this.
>=20
> Trying to wait for all the dependencies before killing jobs was added=20
> because of the way we kept track of dma_fences in dma_resv objects.=20
> Basically adding exclusive fences removed all other fences leading to a=20
> bit fragile memory management.

Okay.

>=20
> This handling was removed by now and so the workaround for waiting for=20
> dependencies is not really necessary any more, but I think it is still=20
> better to do so.
>=20
> The right approach of getting this waiting for dependencies completely=20
> straight is also not to touch entity->dependency in any way, but to stop=
=20
> removing them from the XA in drm_sched_job_dependency(). Otherwise you=20
> don't catch the pipeline optimized ones either.

Do you want me to post a v2 doing that, or should I forget about it?
If we decide to keep things like that, it might be good to at least
add a comment explaining why we don't care.

Regards,

Boris
