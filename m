Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02827387F6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 16:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25E910E4A0;
	Wed, 21 Jun 2023 14:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B408810E49E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 14:53:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 07E0A6606F95;
 Wed, 21 Jun 2023 15:53:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687359213;
 bh=3qWmWajxAtJ1rjuJPxbMRSUA56lMgLxV8O0kOyRxVyc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d3WlqNHH6URd0+xfB4SaJWwVaKFiNIetnoJxK6Wv2IO59I/JtVHpirn+02haTlBQw
 RooofN0BWvemTZpV/jcx8RZ6+fhPY+VGtZkjjxH2bVM2bz8GyWK+odXwAE+A0pTh6A
 oM++ZbzX0AVYns8iPFlDPeoZA0lzcamxmL9Ajfnp9rZHVp1zlWIeZ/K4htuBZmX5BR
 ljFIQfcgBrn5vDTPXeRyCA+9+WyIBniIByHFTP4APGewtjB+7a7lEOWs5LubkAZNZA
 2MmoonsAVWPnR1k3yrWjxhfZvmQhCt3qqNKte7CEGwir8bel2YT8gJAHfDKNWGtXm8
 Xd+vEbLKjEPGw==
Date: Wed, 21 Jun 2023 16:53:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v6] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Message-ID: <20230621165330.29870beb@collabora.com>
In-Reply-To: <3d269410-e9ee-6cf5-8c22-5fb916ff75b2@amd.com>
References: <20230619071921.3465992-1-boris.brezillon@collabora.com>
 <dca9af00-271b-168d-c5f5-e6a662be38dc@amd.com>
 <20230621161808.24262cdd@collabora.com>
 <3d269410-e9ee-6cf5-8c22-5fb916ff75b2@amd.com>
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
 Sumit Semwal <sumit.semwal@linaro.org>,
 Donald Robson <donald.robson@imgtec.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jun 2023 10:41:22 -0400
Luben Tuikov <luben.tuikov@amd.com> wrote:

> On 2023-06-21 10:18, Boris Brezillon wrote:
> > Hello Luben,
> >=20
> > On Wed, 21 Jun 2023 09:56:40 -0400
> > Luben Tuikov <luben.tuikov@amd.com> wrote:
> >  =20
> >> On 2023-06-19 03:19, Boris Brezillon wrote: =20
> >>> drm_sched_entity_kill_jobs_cb() logic is omitting the last fence popp=
ed
> >>> from the dependency array that was waited upon before
> >>> drm_sched_entity_kill() was called (drm_sched_entity::dependency fiel=
d),
> >>> so we're basically waiting for all dependencies except one.
> >>>
> >>> In theory, this wait shouldn't be needed because resources should have
> >>> their users registered to the dma_resv object, thus guaranteeing that
> >>> future jobs wanting to access these resources wait on all the previous
> >>> users (depending on the access type, of course). But we want to keep
> >>> these explicit waits in the kill entity path just in case.
> >>>
> >>> Let's make sure we keep all dependencies in the array in
> >>> drm_sched_job_dependency(), so we can iterate over the array and wait
> >>> in drm_sched_entity_kill_jobs_cb().
> >>>
> >>> We also make sure we wait on drm_sched_fence::finished if we were
> >>> originally asked to wait on drm_sched_fence::scheduled. In that case,
> >>> we assume the intent was to delegate the wait to the firmware/GPU or
> >>> rely on the pipelining done at the entity/scheduler level, but when
> >>> killing jobs, we really want to wait for completion not just scheduli=
ng.
> >>>
> >>> v6:
> >>> - Back to v4 implementation
> >>> - Add Christian's R-b
> >>>
> >>> v5:
> >>> - Flag deps on which we should only wait for the scheduled event
> >>>   at insertion time
> >>>
> >>> v4:
> >>> - Fix commit message
> >>> - Fix a use-after-free bug
> >>>
> >>> v3:
> >>> - Always wait for drm_sched_fence::finished fences in
> >>>   drm_sched_entity_kill_jobs_cb() when we see a sched_fence
> >>>
> >>> v2:
> >>> - Don't evict deps in drm_sched_job_dependency()   =20
> >>
> >> Hmm, why is this in reverse chronological order?
> >> It's very confusing. =20
> >=20
> > Dunno, that's how I've always ordered things, and quick look at some
> > dri-devel patches [1][2] makes me think I'm not the only one to start
> > from the latest submission.
> >=20
> > [1]https://lkml.org/lkml/2023/6/19/941
> > [2]https://lore.kernel.org/dri-devel/cover.1686729444.git.Sandor.yu@nxp=
.com/T/#t
> >  =20
> >> =20
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> Suggested-by: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>> Reviewed-by: "Christian K=C3=B6nig" <christian.koenig@amd.com>   =20
> >>
> >> These three lines would usually come after the CCs. =20
> >=20
> > Again, I think I've always inserted those tags before the Cc, but I can
> > re-order things if you prefer. Let me know if you want me to send a v7
> > addressing the Cc+changelog ordering. =20
>=20
> No, it's not necessary for this patch, but in the future I'd rather follow
> chronological ordering for the versions, and in the Cc list. It's similar
> to how the patch description follows (narrative text) and to how we reply
> back to emails, and prevalently in the kernel log in drm ("git log" should
> suffice).
>=20
> Reading in chronological progression builds a narrative, a picture, in on=
e's
> mind and makes it easy to see justifications for said narrative, or see r=
easons
> to change the narrative.
>=20
> That is, one can make a better decision knowing the full history, rather =
than
> only the latest change.
>=20
> (And in fact when I read the version revision list, my eyes skip over v[X]
> and just read down, so I was wondering why and how Christian R-B the patch
> in v2, and it wasn't until I actually saw that they were ordered in rever=
se
> chronological order, which was in fact v6--listed first, which I'd assumed
> was listed last.)
>=20
> Do you have access or do you know who is pushing this patch to drm-misc-f=
ixes?

I can push it.

