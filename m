Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A913273662A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 10:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83A110E298;
	Tue, 20 Jun 2023 08:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3119210E181;
 Tue, 20 Jun 2023 08:28:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C9726606ED1;
 Tue, 20 Jun 2023 09:28:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687249700;
 bh=KV0aMbZjzD7Nnaiq31E4JdBnDZLpTTIU8Z7POsf55Fk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AfhUNI41WUX4krV4FSYL64GUueU0+NwqWK+1jssSseTAVm9UM2BA6lNGHpc5L93St
 A3w2TtJZWOYg0HnMKt3Q8OgjBoNMJJ8hEQAqdIF7sGwMrqdFyaTZLYkeVTa20/o1T5
 vyQdPaplzlzYehePexyXHddAHl62ssn4S63fJyaW+xp7FUlONjaDAwGGq5K78QiPcv
 QlmEqMi/O1Oz4sAFAqbBhLO0ReJs8t++LqLNewaJrawFw8zoLRxhWgB6NN0w6CrzvB
 6vtAAh1Ak/xRfZ0G6ZO8RPQ8H1h1gtKxny9a1nLwViC84F11KKSUycp//G2YHSrDNY
 SpE3DCkp82PnQ==
Date: Tue, 20 Jun 2023 10:28:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Message-ID: <20230620102817.6570f521@collabora.com>
In-Reply-To: <08169925-eb0b-bc79-e6f1-1eaa26198f5e@gmail.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
 <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
 <08169925-eb0b-bc79-e6f1-1eaa26198f5e@gmail.com>
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

On Tue, 20 Jun 2023 10:12:13 +0200
Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:

> > I think Boris's suggestion of having this through a common=20
> > DRM_EXEC_FLAG_ALLOW_DUPLICATES flag fits well. =20
>=20
> No, again. The only driver which should accept duplicates is radeon, for=
=20
> all other drivers especially new ones duplicates should probably be=20
> rejected.
>=20
> We only allow this for radeon because it is already UAPI, could be that=20
> we need to do this for amdgpu as well but I really hope we don't need thi=
s.

Just want to describe the use case we have: we support submission in
batch (several jobs passed to the submit ioctl) with a
submit-all-or-nothing model: if any of the job description is passed
wrong args or causes an allocation error, we fail the whole group. In
the submission path, we want to prepare GEMs for all jobs. That means
adding enough fence slots for the number job finished fences. Given not
all jobs will access the same set of BOs, I thought I could use
duplicates support to make my life easier, because otherwise I have to
collect all BOs upfront, store them in a temporary array, and keep
track of the number of fence slots needed for each of them. I guess
the other option would be to over-estimate the number of slots and make
it equal to num_jobs for all BOs.
