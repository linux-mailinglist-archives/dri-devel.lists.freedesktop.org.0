Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24185793ABE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDB810E60E;
	Wed,  6 Sep 2023 11:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA72010E60A;
 Wed,  6 Sep 2023 11:09:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F091D660576C;
 Wed,  6 Sep 2023 12:09:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693998573;
 bh=wtMi2Jo89LF3SAKhqo51VzspsnaHwlPHkoAaD3w7JIo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KDIPYh1mU3KC5nDqqCPwRLOoIDLbkdVI8sY69NgwfEuBOc35gqviRpN2uYG254VIK
 tZ6xqICd5pAQ2tLUV2BBqIljPoCb3C096D32aKU7vBQ7kHQ5wWd+5eb7CmGBvKtDtm
 17OlKP8/rALjnUX4aHGm2veHRcur1izSTDZk/h4AYIXQwx1RpIVNSK3L+ltU0GBBrd
 V8qJjeYwwTAvpbCJ+tngAy9IDszvGYEBrJ48iJnKErYEzyZo3+Ht/Om/qyF+b9Psfn
 9T585s7O/87zJQScSYTeZLdpVONyfaPcDrG/cJhar0VovdRZnogQpLW6hvl1Knohnt
 e8/oPAPIF365Q==
Date: Wed, 6 Sep 2023 13:09:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] Documentation/gpu: VM_BIND locking document
Message-ID: <20230906130929.74e3c6cc@collabora.com>
In-Reply-To: <1a2965a4-943f-0ba7-b082-155d75b94d59@linux.intel.com>
References: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
 <ZPeGld0mBwbWptV9@cassiopeiae>
 <4e7a2b2e-1ab5-09b6-b2de-9b2a82a8a32e@linux.intel.com>
 <1c6cbf97-7e85-a48f-9e6a-ed716ab5b05d@redhat.com>
 <1a2965a4-943f-0ba7-b082-155d75b94d59@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Oak Zeng <oak.zeng@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Sep 2023 10:32:24 +0200
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:


> >>>> +Introducing external (or shared) buffer objects
> >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> +
> >>>> +Since shared buffer objects may be shared by multiple gpu_vm's they
> >>>> +can't share their reservation object with a single gpu_vm, but=20
> >>>> will rather
> >>>> +have a reservation object of their own. The shared objects bound to=
 a
> >>>> +gpu_vm using one or many
> >>>> +gpu_vmas are therefore typically put on a per-gpu_vm list which is
> >>>> +protected by the gpu_vm lock. One could in theory protect it also=20
> >>>> with
> >>>> +the ``gpu_vm->resv``, but since the list of dma_resvs to take is=20
> >>>> typically
> >>>> +built before the ``gpu_vm->resv`` is locked due to a limitation in
> >>>> +the current locking helpers, that is typically not done. Also see
> >>>> +below for userptr gpu_vmas.
> >>>> +
> >>>> +At eviction time we now need to invalidate *all* gpu_vmas of a shar=
ed
> >>>> +object, but we can no longer be certain that we hold the gpu_vm's
> >>>> +dma_resv of all the object's gpu_vmas. We can only be certain that =
we =20
> >>> I need to think a bit more about locking of extobj and evicted=20
> >>> object tracking
> >>> in the case of processing 'drm_gpuva_ops' directly through callbacks=
=20
> >>> within the
> >>> fence signalling critical path as mentioend in [1].
> >>>
> >>> In order to support that, we'd need to protect extobjs with a=20
> >>> separate lock,
> >>> and while iterating extobjs to acquire the dma-resv lock drop the=20
> >>> lock within
> >>> the loop before we actually acquire the dma-resv lock. Maple tree=20
> >>> supports that
> >>> already and this can be fully done within the GPUVA manager; no need=
=20
> >>> for the
> >>> driver to care about that. =20
> >>
> >> So do I understand correctly that this because you want to update the=
=20
> >> gpuvm state while operations are progressing asynchronously?
> >>
> >> If so, I wonder whether that could really be done? For example to=20
> >> allocate enough memory for page-tables etc, you need to know the=20
> >> details of the operations at IOCTL execution time, and to know the=20
> >> details you need to know the state from the previous operation? =20
> >
> >
> > Right, sync and async bind can't run fully concurrently, but you could=
=20
> > "inject" a
> > sync one between two async ones such that the sync ones executed from=20
> > the IOCTL
> > directly while async execution is stalled meanwhile. This would be=20
> > possible because
> > the actual drm_gpuva_ops would be calculated within the async=20
> > execution path rather
> > than in the IOCTL. But yes, page-table management must be desinged to=20
> > support that.

FWIW, the panthor driver is designed this way (note that I'm not
supporting GEM eviction yet, so there might be subtleties I missed).

>=20
> OK, well one of the main motivations for Xe is to be able to pipeline=20
> interleaving binds and execs if needed, like so:
>=20
> - Bind vmas for scene 1.
> - Submit scene 1.
> - Unbind vmas for scene 1.
> - Bind vmas for scene 2.
> - Submit scene 2.
> - Unbind vmas for scene 2.
>=20
> And being able to *submit* all of the above while the async binding of=20
> vmas for scene (step 1) has not yet completed.
> I can't really see how this could be done, while obeying dma-fence=20
> rules, unless state is updated synchronously while submitting?

The idea in this case is to detect when a GPU job dependency is a
VM_BIND out-fence, turn drm_sched_fence->parent into an
xxx_vm_bind_job_fence object that's holding the GEM that's about to be
mapped (AFAICT, we don't need to do anything for unmap operations), and
then add our GPU job fence to this BO. This should not only guarantee
that the GEMs we depend on are mapped before the GPU job is executed
(the fence wait does that), but also that such yet-to-be-mapped GEMs
won't be evicted just after they've been mapped and before the GPU had
a chance to execute (unless I'm missing something, adding our GPU job
fence to the BO being targeted by a pending VM_BIND(async,map) operation
solves this problem).
