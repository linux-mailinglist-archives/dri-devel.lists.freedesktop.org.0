Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34010A223BB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 19:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D610B10E85B;
	Wed, 29 Jan 2025 18:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IU8qPtFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DD210E85B;
 Wed, 29 Jan 2025 18:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738174716; x=1769710716;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=FIvhfA97CqIv+VwGUL8TQLityxikP0omlWge/hERTDA=;
 b=IU8qPtFaKLU/PlJMfP9/ESNGeUg3oH3EGNjgzzBxInXZv4gyzHieSsO3
 j8CXAd+4fQNg4e6pBEl8xp2rZcuAugd+g/NAp/ravm+Lp8zSMHU9VeFa5
 wNbi4G+lNoIvjnzEqgibUM+RhQMdg0yO5ElouZcyaHAglmJ6jNZhjRAA+
 ZfEI6QrZUYAUPWRT2udObj/nmR3YFXk9Rkq/g4zSN6G/PDS1z0+EAJdyg
 t+MZD+tl49aFIggTl4l0zJMp296wgdFh1+Si6UvuX8AFhngv4S7tEyVxf
 bmp5nryi9guTmeH2NaL6r8qAjrpExVD0DkLdl54fe/vP5n9BTLCIeWyNf g==;
X-CSE-ConnectionGUID: ycEylMF7ScOtfuR44wBBMw==
X-CSE-MsgGUID: KCgGG4NITMSnQOTlTGjzOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37948239"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="37948239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 10:18:35 -0800
X-CSE-ConnectionGUID: qko+9qVzTtOF6PoA+T/YrQ==
X-CSE-MsgGUID: bRMIKNYcSceZaQIq2b13eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="114137080"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.126])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 10:18:32 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <39142118-2f55-4ecb-bc7b-50705afaf4c8@amd.com>
References: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
 <2eadfcd7-5cbd-4f3c-86aa-7e5a50df01d8@amd.com>
 <173813781464.9444.9979122540723604978@jlahtine-mobl.ger.corp.intel.com>
 <39142118-2f55-4ecb-bc7b-50705afaf4c8@amd.com>
Subject: Re: [PATCH 13/26] RFC drm/xe/eudebug: userptr vm pread/pwrite
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Simona Vetter <simona@ffwll.ch>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 20:18:28 +0200
Message-ID: <173817470871.73308.11950290138742433654@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Christian K=C3=B6nig (2025-01-29 12:33:52)
> Am 29.01.25 um 09:03 schrieb Joonas Lahtinen:
> > Quoting Christian K=C3=B6nig (2024-12-20 14:56:14)
> >> Am 20.12.24 um 12:31 schrieb Mika Kuoppala:
> >>> Implement debugger vm access for userptrs.
> >>>
> >>> When bind is done, take ref to current task so that
> >>> we know from which vm the address was bound. Then during
> >>> debugger pread/pwrite we use this target task as
> >>> parameter to access the debuggee vm with access_process_vm().
> >>>
> >>> This is based on suggestions from Thomas, Joonas and Simona.
> >> Yeah that looks much saner to me. I still have a couple of comments on
> >> the general approach, but I'm going to write that up after my vacation.
> > I see you've had some issues with mail servers, so just pinging here to
> > see if any replies have got lost.
>=20
> No, I'm just overworked and have like 10 things I need to take care of=20
> at the same time :(

Ack.

> > Would be great to reach a consensus on the high level details before
> > spinning off further series addressing the smaller items.
>=20
> I would say that attaching debug metadata to the GPU VMA doesn't look=20
> like the best design, but if you just do that inside XE it won't affect=20
> any other part of the kernel.

It just grew out of convenience of implementation on the side of VM_BIND.

The other alternative would be to maintain a secondary load map in the
kernel in a separate data structure from GPU VMA.

I was actually going to suggest such thing as a common DRM thing: GPU VMA
metadata interface or parallel "GPU loadmap" interface. It'd allow for
userspace tooling to more easier go from GPU EU IP to a module that
was loaded at that address. Kind of a step 0 towards backtrace for GPU.

Can you elaborate on what your concern is with the VMA metadata
attachment?

> My other concern I have is using ptrace_may_access, I would still try to =

> avoid that.
>=20
> What if you first grab the DRM render node file descriptor which=20
> represents the GPU address space you want to debug with pidfd_getfd()=20
> and then either create the eudebug file descriptor from an IOCTL or=20
> implement the necessary IOCTLs on the DRM render node directly?
>=20
> That would make it unnecessary to export ptrace_may_access.

We're prototyping this. At this point there are some caveats recognized:

1. There is a limitation that you don't get a notification when your
target PID opens a DRM client, but GDB or other application would have
to keep polling for the FDs. I'll have to check with the team how that
would fit to GDB side.

2. Debugging multiple DRM clients (to same GPU) under one PID now
requires separate debugger connections. This may break the way the debugger
locking is currently implemented for the discovery phase to prevent parallel
IOCTL from running. Will have to look into it once we have a working
prototype.

3. Last but not the least, we'll have to compare which LSM security
modules and other conditions checked on the pidfd_getfd() paths for
access restrictions.

Reason for using ptrace_may_access() was to have a clear 1:1 mapping
between user being allowed to ptrace() a PID to control CPU threads and
do debugger IOCTL to control GPU threads. So if user can attach to a PID
with GDB, they would certainly also be able to debug the GPU portion.

If there is divergence, I don't see a big benefit in going to
pidfd_getfd(). We're all the same not even exporting ptrace_may_access()
and YOLO'ing the access check by comparing euid and such which is close
to what ptrace does, but not exactly the same (just like pidfd_getfd()
access checks).

However I believe this would not be a fundamental blocker for the
series? If this would be the only remaining disagreement, I guess we
could just do CAP_ADMIN check initially before we can find something
agreeable.

Regards, Joonas

>=20
> Regards,
> Christian.
>=20
> >
> > Regards, Joonas
> >
> >> Regards,
> >> Christian.
>
