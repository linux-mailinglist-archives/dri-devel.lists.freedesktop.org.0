Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AA39D252E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 12:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963BE10E1A5;
	Tue, 19 Nov 2024 11:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdWAtMRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2578F10E1A5;
 Tue, 19 Nov 2024 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732017466; x=1763553466;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=njwqTv216Nh7sQOF2AJsDJMzweIrmHMNCLz3rbvWM4g=;
 b=ZdWAtMRBZFNf7fS+je18zBanB3zgOiWGd8nLRPMNHCcQILmHnH5AwjXg
 L/V9Y1BEuEh3pFCdYdWTvdEsZIYksNFKXcEEpPqO/kkJlROUZQLNOVKvk
 vefENikklQyTdfs4s/MH23nVvk/z2Oj4OubhDjAnRhhVsy7MvLDO+8Gw7
 vbhDP87f5mCEGWiiRrvI9MonhgZtWFWriyMngSdeV2ykDAfq4BqeAIM26
 DSuy9QO2q6/NH+ILcz+nibhv8Agx7fAttrJmlr1XK8ChpCO3xuKPyjS/b
 znOFlAmsOgL2dZChpghnFByK9Pm7z9a2Yhjamrpw5AhIveJ9YEVF/ezcZ A==;
X-CSE-ConnectionGUID: xujoiIk6ReC2/aQCn47Q+A==
X-CSE-MsgGUID: yi+HkJZKTVih+JWW4md2ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35918297"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="35918297"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:57:32 -0800
X-CSE-ConnectionGUID: bbc6AsfgQkCK24LasoiELA==
X-CSE-MsgGUID: uWu2HWb8QDqLEe9UjEfyNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94368891"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:57:28 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ec16da8d-6e1b-4774-93d6-594bc30e2b78@amd.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-14-matthew.brost@intel.com>
 <ec16da8d-6e1b-4774-93d6-594bc30e2b78@amd.com>
Subject: Re: [RFC PATCH 13/29] drm/xe/mmap: Add mmap support for PCI memory
 barrier
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 boris.brezillon@collabora.com, airlied@gmail.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Michal Mrozek <michal.mrozek@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 19 Nov 2024 13:57:25 +0200
Message-ID: <173201744524.36213.9384132621937199725@jlahtine-mobl.ger.corp.intel.com>
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

Adding Michal from the compute userspace team for sharing references to
the code.

Quoting Christian K=C3=B6nig (2024-11-19 12:00:44)
> Am 19.11.24 um 00:37 schrieb Matthew Brost:
> > From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >
> > In order to avoid having userspace to use MI_MEM_FENCE,
> > we are adding a mechanism for userspace to generate a
> > PCI memory barrier with low overhead (avoiding IOCTL call
> > as well as writing to VRAM will adds some overhead).
> >
> > This is implemented by memory-mapping a page as uncached
> > that is backed by MMIO on the dGPU and thus allowing userspace
> > to do memory write to the page without invoking an IOCTL.
> > We are selecting the MMIO so that it is not accessible from
> > the PCI bus so that the MMIO writes themselves are ignored,
> > but the PCI memory barrier will still take action as the MMIO
> > filtering will happen after the memory barrier effect.
> >
> > When we detect special defined offset in mmap(), We are mapping
> > 4K page which contains the last of page of doorbell MMIO range
> > to userspace for same purpose.
>=20
> Well that is quite a hack, but don't you still need a memory barrier=20
> instruction? E.g. m_fence?

I guess you refer on the userspace usage directions? Yeah, the
userspace definitely has to make sure that the write actually propagated
to the PCI bus before they can assume the serialization to happen on the
GPU. I think the userspace folks should be able to explain how exactly
the orchestrate that. Michal, can you or somebody else share the respective
lines of code in the userspace driver?

At this time, the userspace only enables this on X86, but could also
support other more exotic platforms via libpciaccess.

> And why don't you expose the real doorbell instead of the last (unused?) =

> page of the MMIO region?

Doorbells are a complete red herring here.=20

Chosen page just happens to be a full 4K MMIO page where any writes coming =
over
PCI bus get dropped (and reads return zero) by the GPU. Such dummy (from CP=
U point
of view) 4K MMIO page allows doing a CPU write that generates a PCI bus tra=
nsaction,
where the transaction itself is essentially a NOP. But as the transaction f=
alls into
the MMIO address range, it will trigger a serialization of the incoming tra=
ffic in
the GPU side, before being ignored.

Regards, Joonas
