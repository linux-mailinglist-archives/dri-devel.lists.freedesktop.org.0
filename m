Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB904D3B417
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 18:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C759F10E4D4;
	Mon, 19 Jan 2026 17:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7Kh/x2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D5410E4D4;
 Mon, 19 Jan 2026 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768843467; x=1800379467;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qk3XuufPPEIck/9A121yktRTMzQ3kk4TF/duoWERK0Q=;
 b=A7Kh/x2FeOZ0vfi0QpXM+KbS9sCp87IyGIm85l0+nB69n9TZivGxJK4C
 MJysZX0YmjdiMH/5WahD1ZcDfZMtzEI9c2a3jf55UOw6JlLBuN2jDEC57
 Hyat/tdD6JTYOi88nVgUBCFQT1K0rnPEbxxp7qFAqZ4s9Zf+Ie6Yq/3I9
 8sIwmRjkBTHPfv8c32OlvxaH0tAWM+K9ex9uvcYZaWnn8Z8eFNNTiDPzx
 N6WXDuH+fVQuWMhOKROp7YxTLJTH63CAPhzQztKbxnRGcQo5zLN0AhzP/
 HkBj5M0Hr+ICU2ANQ+I8ct5M0W0o86Df9sXBIUQEXc6ZeBIaMgeiPdoM9 Q==;
X-CSE-ConnectionGUID: dzV2vQddQ3Wisz1EQKSO9A==
X-CSE-MsgGUID: MowJw698RIuhdsugiP0BDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70107686"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="70107686"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 09:24:26 -0800
X-CSE-ConnectionGUID: cCp8cmdLTFaKiKQxa3/2oQ==
X-CSE-MsgGUID: 4scyjDTQQq6KHTJ1sXWYZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="243499496"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.32])
 ([10.245.244.32])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 09:24:19 -0800
Message-ID: <9679639cc7d9c2a27c5529484546faa65013f261.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/4] dma-buf: document revoke mechanism to invalidate
 shared buffers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann
 <kraxel@redhat.com>,  Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu	
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Lucas De Marchi	 <lucas.demarchi@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Kevin Tian	 <kevin.tian@intel.com>, Joerg
 Roedel <joro@8bytes.org>, Will Deacon	 <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Alex Williamson	 <alex@shazbot.org>,
 linux-media@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 	linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, 	virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, 	linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Date: Mon, 19 Jan 2026 18:24:16 +0100
In-Reply-To: <20260119162424.GE961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <f115c91bbc9c6087d8b32917b9e24e3363a91f33.camel@linux.intel.com>
 <20260119075229.GE13201@unreal>
 <9112a605d2ee382e83b84b50c052dd9e4a79a364.camel@linux.intel.com>
 <20260119162424.GE961572@ziepe.ca>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2026-01-19 at 12:24 -0400, Jason Gunthorpe wrote:
> On Mon, Jan 19, 2026 at 10:27:00AM +0100, Thomas Hellstr=C3=B6m wrote:
> > this sounds like it's not just undocumented but also in some cases
> > unimplemented. The xe driver for one doesn't expect move_notify()
> > to be
> > called on pinned buffers, so if that is indeed going to be part of
> > the
> > dma-buf protocol,=C2=A0 wouldn't support for that need to be advertised
> > by
> > the importer?
>=20
> Can you clarify this?
>=20
> I don't see xe's importer calling dma_buf_pin() or dma_buf_attach()
> outside of tests? It's importer implements a fully functional looking
> dynamic attach with move_notify()?
>=20
> I see the exporer is checking for pinned and then not calling
> move_notify - is that what you mean?

No it was if move_notify() is called on a pinned buffer, things will
probably blow up.

And I was under the impression that we'd might be pinning imported
framebuffers but either we don't get any of those or we're using the
incorrect interface to pin, so it might not be a big issue from the xe
side. Need to check this.

In any case we'd want to support revoking also of pinned buffers moving
forward, so question really becomes whether in the mean-time we need to
flag somehow that we don't support it.

Thanks,
Thomas


>=20
> When I looked through all the importers only RDMA obviously didn't
> support move_notify on pinned buffers.
>=20
> Jason

