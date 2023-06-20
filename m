Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE46736791
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 11:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C5510E29F;
	Tue, 20 Jun 2023 09:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED56810E29F;
 Tue, 20 Jun 2023 09:20:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1BEBC6606F8A;
 Tue, 20 Jun 2023 10:20:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687252836;
 bh=JViCwxLmhr546PGu90fAM7323UFdyHu/DNgW3ueXdYQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JjTJcLINyxhTc4bqJIkOV6/OVvQUiu3dNzz5SEk5fabxC1RhjHd4iVI42r+C/MUJn
 6e1Q8x+xRynwQ88wE8/r23EhdWn5EoRJv2OKP77sDA3N/ze60xoBkMG/RhaT21RDXL
 iQR7B8UUuahSXWvul5Bjw3lI9X7p2qzNIB7Q7yGS6jutoZTaKUJgbn+HEySQscK2Jf
 lX5P0gYWN7Vhmkv3ZGz8kENZlYZDSBliuPD75vovhw79Aif7vxgigqR1unf6+UEbkE
 xCoa07g0F7Fwlhmb9NCqyygdPVgh5KFfCmDYPRDv+xkgfE9ACVej9JmtpA9jhLAvwg
 s1spzZ+FKH0Zg==
Date: Tue, 20 Jun 2023 11:20:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Message-ID: <20230620112032.3c8091d7@collabora.com>
In-Reply-To: <01ad928e-a900-fc5e-901c-8fe2639d711a@gmail.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
 <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
 <08169925-eb0b-bc79-e6f1-1eaa26198f5e@gmail.com>
 <20230620102817.6570f521@collabora.com>
 <ee7987a4-a9ad-e667-9ac5-c06b42cf36f1@gmail.com>
 <20230620110948.461e4359@collabora.com>
 <01ad928e-a900-fc5e-901c-8fe2639d711a@gmail.com>
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
Cc: matthew.brost@intel.com, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, felix.kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Jun 2023 11:14:51 +0200
Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:

> Am 20.06.23 um 11:09 schrieb Boris Brezillon:
> > On Tue, 20 Jun 2023 10:44:26 +0200
> > Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:
> > =20
> >> Am 20.06.23 um 10:28 schrieb Boris Brezillon: =20
> >>> On Tue, 20 Jun 2023 10:12:13 +0200
> >>> Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>    =20
> >>>>> I think Boris's suggestion of having this through a common
> >>>>> DRM_EXEC_FLAG_ALLOW_DUPLICATES flag fits well. =20
> >>>> No, again. The only driver which should accept duplicates is radeon,=
 for
> >>>> all other drivers especially new ones duplicates should probably be
> >>>> rejected.
> >>>>
> >>>> We only allow this for radeon because it is already UAPI, could be t=
hat
> >>>> we need to do this for amdgpu as well but I really hope we don't nee=
d this. =20
> >>> Just want to describe the use case we have: we support submission in
> >>> batch (several jobs passed to the submit ioctl) with a
> >>> submit-all-or-nothing model: if any of the job description is passed
> >>> wrong args or causes an allocation error, we fail the whole group. In
> >>> the submission path, we want to prepare GEMs for all jobs. That means
> >>> adding enough fence slots for the number job finished fences. Given n=
ot
> >>> all jobs will access the same set of BOs, I thought I could use
> >>> duplicates support to make my life easier, because otherwise I have to
> >>> collect all BOs upfront, store them in a temporary array, and keep
> >>> track of the number of fence slots needed for each of them. I guess
> >>> the other option would be to over-estimate the number of slots and ma=
ke
> >>> it equal to num_jobs for all BOs. =20
> >> Sounds pretty much what amdgpu is doing as well, but question is why
> >> don't you give just one list of BOs? Do you really want to add the
> >> fences that fine grained? =20
> > Actually, we don't give a list of BOs at all, we pass a VM, and lock
> > all BOs attached to the VM (similar to what Xe does). And, as all other
> > drivers being submitted recently, we use explicit sync, so most of
> > those VM BOs, except for the imported/exported ones, will be given a
> > BOOKKEEP fence.
> >
> > The reason we need support for duplicates is because we also have
> > implicit BOs (like the HWRT object that's shared by the
> > geometry/fragment queues to pass data around), and those can be passed
> > to multiple jobs in a given batch and require special synchronization
> > (geometry job writes to them, fragment job reads from them, so we have
> > a reader/writer sync to express). I can of course de-duplicate upfront,
> > by parsing jobs and creating an array of BOs that need to be acquired
> > over the whole submission, but that's still one extra-step I'd prefer
> > to avoid, given the dma_resv framework allows us to figure it out at
> > lock time. I can also just deal with the EALREADY case in the driver
> > directly, it's not like it's super complicated anyway, just thought
> > other drivers would fall in the same situation, that's all. =20
>=20
> Well as long as you just need to ignore EALREADY, that should be trivial=
=20
> and doable.

Oh, yeah, that's all I need really. We probably don't want to add the
GEM object a second time in the array though, hence the goto
reserve_fences in my proposal when EALREADY is returned.

>=20
> What radeon needs is to keep EALREADY BOs in a separate container=20
> because we need to double check their properties to not break the UAPI.
>=20
> I strongly think that this shouldn't be needed by any other driver.
>=20
> Going to add a flag to ignore EALREADY which can be set during exec init.

Thanks!
