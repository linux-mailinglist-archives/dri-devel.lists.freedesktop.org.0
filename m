Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D343C7EE25D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 15:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAEB10E5DE;
	Thu, 16 Nov 2023 14:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263A310E5DE;
 Thu, 16 Nov 2023 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700143759; x=1731679759;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=spRh+yF57jjoBWHvWpo/Tq4zxr8/j2rt/0b9L5ABdn0=;
 b=c04tUKcLG+FMAhB4As/8mWt2dNimU5eCafQhNXsGAsJAdLEQ662cZ5KG
 c7uv3W1O53p5JgcWLXsf2dBIsWQWxRo6o1xKuz9eDxRDS7cX3E70AeJ4O
 0sTSxXQV/CBymkI4Z8lyNC7vJHNiiXl/9vOBLjbi2lGFBhXumMQ5GMgtm
 vWWDl18U2aQcTCAD71GF7MSstmtnDWg6a4iPXPWj2BadTRLQ4Rk08rcVh
 3NU5iZQj17Z5D6XMftNWcgdXUl6g1LVTgCzZTWr1ug4sLODIZ+8bQ20XA
 ctE+x/M61wwmHca6RcWESwLfeG+ERBlet5tDQjDNc3GCLC7k9YngPZY6H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12641892"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="12641892"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="6536734"
Received: from mcaspar-mobl1.ger.corp.intel.com (HELO [10.249.254.12])
 ([10.249.254.12])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:09:14 -0800
Message-ID: <a0ba3f8c70ec939842f06127486e1e99795f7e6a.camel@linux.intel.com>
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Date: Thu, 16 Nov 2023 15:09:11 +0100
In-Reply-To: <c129fa94-6456-4746-9477-737a0fb61f96@redhat.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <20231116104851.114bdb08@collabora.com>
 <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
 <c129fa94-6456-4746-9477-737a0fb61f96@redhat.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
 Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2023-11-16 at 15:02 +0100, Danilo Krummrich wrote:
> On 11/16/23 12:48, Thomas Hellstr=C3=B6m wrote:
>=20
> <snip>
>=20
> > > > +Locks used and locking orders
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +One of the benefits of VM_BIND is that local GEM objects share
> > > > the
> > > > gpu_vm's
> > > > +dma_resv object and hence the dma_resv lock. So even with a
> > > > huge
> > > > +number of local GEM objects, only one lock is needed to make
> > > > the
> > > > exec
> > > > +sequence atomic.
> > > > +
> > > > +The following locks and locking orders are used:
> > > > +
> > > > +* The ``gpu_vm->lock`` (optionally an rwsem). Protects how the
> > > > gpu_vm is
> > > > +=C2=A0 partitioned into gpu_vmas. It can also protect the gpu_vm's
> > > > list
> > > > of
> > > > +=C2=A0 userptr gpu_vmas. With a CPU mm analogy this would
> > > > correspond to
> > > > the
> > > > +=C2=A0 mmap_lock.
> > >=20
> > > I don't see any drm_gpuvm::lock field in Danilo's latest
> > > patchset,
> > > so,
> > > unless I missed one version, and this lock is actually provided
> > > by
> > > drm_gpuvm, I would mention this is a driver-specific lock. This
> > > comment
> > > applies to all the locks you describe here actually (mention
> > > which
> > > ones
> > > are provided by drm_gpuvm, and which ones are driver-specific).
> >=20
> > These will be needed also by gpuvm when implementing userptr vmas,
> > so I
> > can mention that drm_gpuvm is currently lacking a userptr
> > implementation, so "the locks described below are to be considered
> > driver-specific for now"
>=20
> Since Xe already implements userptr support, are you guys maybe
> interested
> in extending drm_gpuvm accordingly? :-)
>=20

I've been thinking of that but in that case that needs to happen after
the xe merge. Also we ofc need to clear it with the people who do
resource allocation on our side :)

Thanks,
Thomas

