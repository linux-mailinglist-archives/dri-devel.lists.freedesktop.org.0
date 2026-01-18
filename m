Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6FAD39721
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 15:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E4B10E2CE;
	Sun, 18 Jan 2026 14:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hP6EF4ql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99C110E2CB;
 Sun, 18 Jan 2026 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768746552; x=1800282552;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0+eaeMN1EHDT+lkQ4GIUQ4W12gE3E7ctCy4zVXTxlPk=;
 b=hP6EF4qlFgUINJkL2wEWjnpQchlqDrmCV5hr8bn0J7Uo+tKFnsaVtLe5
 js9HqIZiQAm6dGmfPqM1uEZ0/rtrljDFMYUHZi2VRnXNk+HOM11u7qe5t
 2lxaYRRbnw1VNY6qoJ0KTMO38YSxMVt9mGtQatwQwPmu64kdxPLVG1cnv
 nHs2WHeRfDrgNGNJNhphBhglK+hwquVfgPkGRjoVCnsDFlYaE3kagKKQv
 dEJXnzoTBc0V0gfhzHKXhS85NNHAGPA+1QVjEoxU21WjztschKfCzyPao
 UdxJbF89U36/gogfK8j1f3Wr4Cf3dr9TctJREiXANulNL2cYXMOtl/jNb Q==;
X-CSE-ConnectionGUID: rx6aeg53S+SZ7mJG2RPdNA==
X-CSE-MsgGUID: p2cv+WlqT0q0Vm43RpUTAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70146416"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="70146416"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 06:29:12 -0800
X-CSE-ConnectionGUID: nCY8yfQeS1CtWSbdd073Iw==
X-CSE-MsgGUID: VxUvo3fYR72cV06gEahrOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="205447268"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.5])
 ([10.245.244.5])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 06:29:04 -0800
Message-ID: <8bc75706c18c410f9564805c487907aba0aab627.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/4] dma-buf: Document revoke semantics
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann
 <kraxel@redhat.com>,  Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu	
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Lucas De Marchi	 <lucas.demarchi@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian
 <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Alex Williamson
 <alex@shazbot.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 iommu@lists.linux.dev, kvm@vger.kernel.org
Date: Sun, 18 Jan 2026 15:29:02 +0100
In-Reply-To: <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
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

On Sun, 2026-01-18 at 14:08 +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>=20
> Document a DMA-buf revoke mechanism that allows an exporter to
> explicitly
> invalidate ("kill") a shared buffer after it has been handed out to
> importers. Once revoked, all further CPU and device access is
> blocked, and
> importers consistently observe failure.

See previous comment WRT this.

>=20
> This requires both importers and exporters to honor the revoke
> contract.
>=20
> For importers, this means implementing .invalidate_mappings() and
> calling
> dma_buf_pin() after the DMA=E2=80=91buf is attached to verify the exporte=
r=E2=80=99s
> support
> for revocation.

Why would the importer want to verify the exporter's support for
revocation? If the exporter doesn't support it, the only consequence
would be that invalidate_mappings() would never be called, and that
dma_buf_pin() is a NOP. Besides, dma_buf_pin() would not return an
error if the exporter doesn't implement the pin() callback?

Or perhaps I missed a prereq patch?

Thanks,
Thomas

