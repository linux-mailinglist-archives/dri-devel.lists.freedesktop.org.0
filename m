Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBDA79E060
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 09:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0465110E039;
	Wed, 13 Sep 2023 07:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752D810E039;
 Wed, 13 Sep 2023 07:03:16 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E9886607326;
 Wed, 13 Sep 2023 08:03:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694588594;
 bh=s/7HacCX0xGqIGUfT+a571cZYihdeAyXlozHSLyLovw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gueWZCpFSELP2GjG8g78iBgvnZgS12lJTmqxaWbQQcOaNCywcqYBaCfwAVtTJPg/T
 KtMrArPxoFvbv2AO+/QP3r7VlYxBSE5OdnY5QMkFeBUS2r2wmn1NkkYrBKOXyP8yvt
 wVne0QR2NWPTXqR+HEih//MV8e2O9favQHq1yEvijNLH6N4Tm4pi3emvif0Un8omrn
 V0QeZQzdz8JgSVjOoFTULmbIacsfh14IcrRTIzPa0l0diPmNX2XccAVzbcQBp0UGP6
 DY4Cdes2w9ca8y+y2OgGm1X+HxHMbCjpQ3XwcuxvF22cphedQLkImNExvxQPncT9hh
 HxXU82RnoP62g==
Date: Wed, 13 Sep 2023 09:03:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <20230913090311.5eeb026a@collabora.com>
In-Reply-To: <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023 18:20:32 +0200
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> > +/**
> > + * get_next_vm_bo_from_list() - get the next vm_bo element
> > + * @__gpuvm: The GPU VM
> > + * @__list_name: The name of the list we're iterating on
> > + * @__local_list: A pointer to the local list used to store already it=
erated items
> > + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_=
cached_vm_bo()
> > + *
> > + * This helper is here to provide lockless list iteration. Lockless as=
 in, the
> > + * iterator releases the lock immediately after picking the first elem=
ent from
> > + * the list, so list insertion deletion can happen concurrently. =20
>=20
> Are the list spinlocks needed for that async state update from within=20
> the dma-fence critical section we've discussed previously?

Any driver calling _[un]link() from its drm_gpu_scheduler::run_job()
hook will be in this situation (Panthor at the moment, PowerVR soon). I
get that Xe and Nouveau don't need that because they update the VM
state early (in the ioctl path), but I keep thinking this will hurt us
if we don't think it through from the beginning, because once you've
set this logic to depend only on resv locks, it will be pretty hard to
get back to a solution which lets synchronous VM_BINDs take precedence
on asynchronous request, and, with vkQueueBindSparse() passing external
deps (plus the fact the VM_BIND queue might be pretty deep), it can
take a long time to get your synchronous VM_BIND executed...

Now, maybe the solution is something different, with early VM state
update for everyone (creation of to-be-[un]mapped drm_gpuva entries,
some of them being shadowed by already existing drm_gpuva that's
encoding the currently mapped region), and VM state patching when a
synchronous VM_BIND kicks in (we need to patch the previously queued
requests too, so they always have enough resources for the map/unmap
operations to succeed).
