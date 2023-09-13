Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A779E0BC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 09:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C100410E054;
	Wed, 13 Sep 2023 07:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6891010E054;
 Wed, 13 Sep 2023 07:19:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A478A66072BB;
 Wed, 13 Sep 2023 08:19:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694589562;
 bh=qRz9tPhMotdbCCNrMsna8quRbeFGkC6nsVVFqUDbq5E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kzf9uz3R9ZeHfByQCDLX+j6OfkcOmaGBKFw8y+VeZTyNV819pX+DinMWSGl+wOIaL
 9jOTZ637ZmNnITFEYNr2HukkhIXs8zsfd4jYhICL2260ACg9Wi20LQ44Nr9eWFlZu3
 4JbeWHUPWFUaKM84K2A+GTGEf2G1aqzXhprOVqoGjzgT84xiLs4KZPYkCVp4Tr+4YS
 pBjOvrH7q61KvUrjRDa9sXgobr/IyAt8/e0W0mY7Eo7BwhpchRaLqXLJZ3ar3YxrSR
 6z4NHprWHg56Wy7gP46fAhFdzf7BoxIsI4thnwGjr4FjY4TfUfTrcU+ntlNi/jvfNA
 P0dJv7jKQk6fA==
Date: Wed, 13 Sep 2023 09:19:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <20230913091918.62c06a30@collabora.com>
In-Reply-To: <CAPM=9tyf4m6gtUQ0BCraf0gB06_pxXV8gpQQsvWjeJnczmJkQQ@mail.gmail.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <20230913090311.5eeb026a@collabora.com>
 <CAPM=9tyf4m6gtUQ0BCraf0gB06_pxXV8gpQQsvWjeJnczmJkQQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Sep 2023 17:05:42 +1000
Dave Airlie <airlied@gmail.com> wrote:

> On Wed, 13 Sept 2023 at 17:03, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Tue, 12 Sep 2023 18:20:32 +0200
> > Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> > =20
> > > > +/**
> > > > + * get_next_vm_bo_from_list() - get the next vm_bo element
> > > > + * @__gpuvm: The GPU VM
> > > > + * @__list_name: The name of the list we're iterating on
> > > > + * @__local_list: A pointer to the local list used to store alread=
y iterated items
> > > > + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_n=
ext_cached_vm_bo()
> > > > + *
> > > > + * This helper is here to provide lockless list iteration. Lockles=
s as in, the
> > > > + * iterator releases the lock immediately after picking the first =
element from
> > > > + * the list, so list insertion deletion can happen concurrently. =
=20
> > >
> > > Are the list spinlocks needed for that async state update from within
> > > the dma-fence critical section we've discussed previously? =20
> >
> > Any driver calling _[un]link() from its drm_gpu_scheduler::run_job()
> > hook will be in this situation (Panthor at the moment, PowerVR soon). I
> > get that Xe and Nouveau don't need that because they update the VM
> > state early (in the ioctl path), but I keep thinking this will hurt us
> > if we don't think it through from the beginning, because once you've
> > set this logic to depend only on resv locks, it will be pretty hard to
> > get back to a solution which lets synchronous VM_BINDs take precedence
> > on asynchronous request, and, with vkQueueBindSparse() passing external
> > deps (plus the fact the VM_BIND queue might be pretty deep), it can
> > take a long time to get your synchronous VM_BIND executed... =20
>=20
> btw what is the use case for this? do we have actual vulkan
> applications we know will have problems here?

I don't, but I think that's a concern Faith raised at some point (dates
back from when I was reading threads describing how VM_BIND on i915
should work, and I was clearly discovering this whole VM_BIND thing at
that time, so maybe I misunderstood).

>=20
> it feels like a bit of premature optimisation, but maybe we have use case=
s.

Might be, but that's the sort of thing that would put us in a corner if
we don't have a plan for when the needs arise. Besides, if we don't
want to support that case because it's too complicated, I'd recommend
dropping all the drm_gpuvm APIs that let people think this mode is
valid/supported (map/remap/unmap hooks in drm_gpuvm_ops,
drm_gpuvm_sm_[un]map helpers, etc). Keeping them around just adds to the
confusion.
