Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419168CB20A
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 18:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5114210E16A;
	Tue, 21 May 2024 16:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="2ePbt1cS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CC010E16A;
 Tue, 21 May 2024 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716308299;
 bh=bA0tI6GGwwdaer6m/e4cegaAzkbPrHmQiPYZHjJJzSU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2ePbt1cSLye6Jut4LJ0iwx44sKk10UDJ0K45HFlR+YX01ZdJ2OJMQL6bPnCbWCCJx
 nTpvL4+zoaCMwbbjDu5Zz3iyUbz8xlNJr/vbYwOPPdm6OADtHRFTfzKVM3+F6psMqP
 ED6Db6iBbhIfUibCyhCTgC7ZmR/sgEu0zzFmXed1M5Sj4mUqcCNHaelaz6qNyB4Vyi
 fJm6lqYE3YE53jAlwer7wlKeh7laXL7qCLulSYCCsD+s8xcFmI6UxKD0vYPrUa8/ii
 6m1Z9p0/4XnxTv0kNMmZ5MWt5gOuTP+3RtOVJnjqedeZ45rQq2LhVRW5EBVIqRBbNi
 zqtoKAx+wZwlw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A7BE5378001E;
 Tue, 21 May 2024 16:18:18 +0000 (UTC)
Date: Tue, 21 May 2024 18:18:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 Koenig= <christian.koenig@amd.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 0/2] drm: Fix dma_resv deadlock at drm object pin time
Message-ID: <20240521181817.097af5e1@collabora.com>
In-Reply-To: <t64xneene7m7x2akecvrmr44yottiicy2mle7e5fimg7vacb4n@n4cjdf7g3nlp>
References: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
 <84a5f7b6-d20a-4c69-83a8-d8394fea2b68@suse.de>
 <20240502135941.136ad639@collabora.com>
 <20240502140012.68e88831@collabora.com>
 <d520ea1b-e399-4c3d-8546-87c68e480cbc@suse.de>
 <t64xneene7m7x2akecvrmr44yottiicy2mle7e5fimg7vacb4n@n4cjdf7g3nlp>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 May 2024 19:16:21 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Hi Boris and Thomas,
>=20
> On 02.05.2024 14:18, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 02.05.24 um 14:00 schrieb Boris Brezillon: =20
> > > On Thu, 2 May 2024 13:59:41 +0200
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > >  =20
> > > > Hi Thomas,
> > > >=20
> > > > On Thu, 2 May 2024 13:51:16 +0200
> > > > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > >  =20
> > > > > Hi,
> > > > >=20
> > > > > ignoring my r-b on patch 1, I'd like to rethink the current patch=
es in
> > > > > general.
> > > > >=20
> > > > > I think drm_gem_shmem_pin() should become the locked version of _=
pin(),
> > > > > so that drm_gem_shmem_object_pin() can call it directly. The exis=
ting
> > > > > _pin_unlocked() would not be needed any longer. Same for the _unp=
in()
> > > > > functions. This change would also fix the consistency with the se=
mantics
> > > > > of the shmem _vmap() functions, which never take reservation lock=
s.
> > > > >=20
> > > > > There are only two external callers of drm_gem_shmem_pin(): the t=
est
> > > > > case and panthor. These assume that drm_gem_shmem_pin() acquires =
the
> > > > > reservation lock. The test case should likely call drm_gem_pin()
> > > > > instead. That would acquire the reservation lock and the test wou=
ld
> > > > > validate that shmem's pin helper integrates well into the overall=
 GEM
> > > > > framework. The way panthor uses drm_gem_shmem_pin() looks wrong t=
o me.
> > > > > For now, it could receive a wrapper that takes the lock and that'=
s it. =20
> > > > I do agree that the current inconsistencies in the naming is
> > > > troublesome (sometimes _unlocked, sometimes _locked, with the versi=
on
> > > > without any suffix meaning either _locked or _unlocked depending on
> > > > what the suffixed version does), and that's the very reason I asked
> > > > Dmitry to address that in his shrinker series [1]. So, ideally I'd
> > > > prefer if patches from Dmitry's series were applied instead of
> > > > trying to fix that here (IIRC, we had an ack from Maxime). =20
> > > With the link this time :-).
> > >=20
> > > [1]https://lore.kernel.org/lkml/20240105184624.508603-1-dmitry.osipen=
ko@collabora.com/T/ =20
> >=20
> > Thanks. I remember these patches. Somehow I thought they would have been
> > merged already. I wasn't super happy about the naming changes in patch =
5,
> > because the names of the GEM object callbacks do no longer correspond w=
ith
> > their implementations. But anyway.
> >=20
> > If we go that direction, we should here simply push drm_gem_shmem_pin()=
 and
> > drm_gem_shmem_unpin() into panthor and update the shmem tests with
> > drm_gem_pin(). Panfrost and lima would call drm_gem_shmem_pin_locked().=
 IMHO
> > we should not promote the use of drm_gem_shmem_object_*() functions, as=
 they
> > are meant to be callbacks for struct drm_gem_object_funcs. (Auto-genera=
ting
> > them would be nice.) =20
>=20
> I'll be doing this in the next patch series iteration, casting the pin fu=
nction's
> drm object parameter to an shmem object.
>=20
> Also for the sake of leaving things in a consistent state, and against Bo=
ris' advice,
> I think I'll leave the drm WARN statement inside drm_gem_shmem_pin_locked.

Sure, that's fine.
