Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7939EAC24
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 10:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7AA10E853;
	Tue, 10 Dec 2024 09:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2zYjaB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7186510E849;
 Tue, 10 Dec 2024 09:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733823221; x=1765359221;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:date:message-id;
 bh=uiJSYhsMkhrtcrx4xUvSwptITiekNJGtqKuEgrR35KQ=;
 b=l2zYjaB37CRByoyMtYIWZQscocRLe3mNzyi/aoTefxGhqlw6mI/pPWSB
 p9URsMvUuBYt8oJND52PgUc2zmNHxHcloE0/D2MSdR1JZLYKYX+Zv5sa/
 nSoMGUnabsPKfhkSvbC9HeDIxifT+jKh6EdQF3MT4I+DdfBSvVy0bOZe4
 OmzAxT61bJrUoh/iJ8QGgEW7JzadYP44vqm2z7CCiqRwvGVXYLLn5ZPS9
 UZEyVjnBxHrkJbC7x1JdMHKNwT6wtJVouxqCfzYtBW49bWt3vWFsNi5uq
 EAxan3/3mza10xV1tUm2cqnmhLvN+SPB9WdpP6ud2+/61d7agTL3wdt6H w==;
X-CSE-ConnectionGUID: 3i9xE9LXTC2hTriBw5eVsQ==
X-CSE-MsgGUID: BHghU22nQiahvGtzWRAiGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37942970"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="37942970"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:33:40 -0800
X-CSE-ConnectionGUID: HUjq2qIMReiVzDIrC+D+OA==
X-CSE-MsgGUID: r/mkXWyhSDCb+77g5KxIQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95826050"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:33:36 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Linux MM <linux-mm@kvack.org>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 10 Dec 2024 11:33:33 +0200
Message-ID: <173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.10
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

Quoting Christian K=C3=B6nig (2024-12-09 17:42:32)
> Am 09.12.24 um 16:31 schrieb Simona Vetter:
> > On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian K=C3=B6nig wrote:
> >> Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
> >>> From: Andrzej Hajda <andrzej.hajda@intel.com>
> >>>
> >>> Debugger needs to read/write program's vmas including userptr_vma.
> >>> Since hmm_range_fault is used to pin userptr vmas, it is possible
> >>> to map those vmas from debugger context.
> >> Oh, this implementation is extremely questionable as well. Adding the =
LKML
> >> and the MM list as well.
> >>
> >> First of all hmm_range_fault() does *not* pin anything!
> >>
> >> In other words you don't have a page reference when the function retur=
ns,
> >> but rather just a sequence number you can check for modifications.
> > I think it's all there, holds the invalidation lock during the critical
> > access/section, drops it when reacquiring pages, retries until it works.
> >
> > I think the issue is more that everyone hand-rolls userptr.
>=20
> Well that is part of the issue.
>=20
> The general problem here is that the eudebug interface tries to simulate =

> the memory accesses as they would have happened by the hardware.

Could you elaborate, what is that a problem in that, exactly?

It's pretty much the equivalent of ptrace() poke/peek but for GPU memory.
And it is exactly the kind of interface that makes sense for debugger as
GPU memory !=3D CPU memory, and they don't need to align at all.

> What the debugger should probably do is to cleanly attach to the=20
> application, get the information which CPU address is mapped to which=20
> GPU address and then use the standard ptrace interfaces.

I don't quite agree here -- at all. "Which CPU address is mapped to
which GPU address" makes no sense when the GPU address space and CPU
address space is completely controlled by the userspace driver/application.

Please try to consider things outside of the ROCm architecture.

Something like a register scratch region or EU instructions should not
even be mapped to CPU address space as CPU has no business accessing it
during normal operation. And backing of such region will vary per
context/LRC on the same virtual address per EU thread.

You seem to be suggesting to rewrite even our userspace driver to behave
the same way as ROCm driver does just so that we could implement debug memo=
ry
accesses via ptrace() to the CPU address space.

That seems bit of a radical suggestion, especially given the drawbacks
pointed out in your suggested design.

> The whole interface re-invents a lot of functionality which is already=20
> there=20

I'm not really sure I would call adding a single interface for memory
reading and writing to be "re-inventing a lot of functionality".

All the functionality behind this interface will be needed by GPU core
dumping, anyway. Just like for the other patch series.

> just because you don't like the idea to attach to the debugged=20
> application in userspace.

A few points that have been brought up as drawback to the
GPU debug through ptrace(), but to recap a few relevant ones for this
discussion:

- You can only really support GDB stop-all mode or at least have to
  stop all the CPU threads while you control the GPU threads to
  avoid interference. Elaborated on this on the other threads more.
- Controlling the GPU threads will always interfere with CPU threads.
  Doesn't seem feasible to single-step an EU thread while CPU threads
  continue to run freely?
- You are very much restricted by the CPU VA ~ GPU VA alignment
  requirement, which is not true for OpenGL or Vulkan etc. Seems
  like one of the reasons why ROCm debugging is not easily extendable
  outside compute?
- You have to expose extra memory to CPU process just for GPU
  debugger access and keep track of GPU VA for each. Makes the GPU more
  prone to OOB writes from CPU. Exactly what not mapping the memory
  to CPU tried to protect the GPU from to begin with.

> As far as I can see this whole idea is extremely questionable. This=20
> looks like re-inventing the wheel in a different color.

I see it like reinventing a round wheel compared to octagonal wheel.

Could you elaborate with facts much more on your position why the ROCm
debugger design is an absolute must for others to adopt?

Otherwise it just looks like you are trying to prevent others from
implementing a more flexible debugging interface through vague comments abo=
ut
"questionable design" without going into details. Not listing much concrete
benefits nor addressing the very concretely expressed drawbacks of your
suggested design, makes it seem like a very biased non-technical discussion.

So while review interest and any comments are very much appreciated, please
also work on providing bit more reasoning and facts instead of just claiming
things. That'll help make the discussion much more fruitful.

Regards, Joonas
